#!/usr/bin/env python3
"""Constrained, snapshot-first retrieval boundary for newsletter enrichment."""

from __future__ import annotations

import argparse
import hashlib
import http.client
import ipaddress
import json
import os
import re
import socket
import ssl
import subprocess
import sys
import tempfile
import time
import zlib
from datetime import datetime, timedelta, timezone
from pathlib import Path
from urllib.parse import parse_qsl, urljoin, urlsplit


ALLOWED_MIME_TYPES = {"text/html", "text/plain", "application/pdf", "application/xhtml+xml"}
SENSITIVE_QUERY_NAMES = {
    "access_token", "api_key", "auth", "authorization", "code", "credential",
    "email", "id_token", "jwt", "key", "password", "refresh_token", "session",
    "sid", "sig", "signature", "state", "token", "user",
}
MAX_RESOLVED_ADDRESSES = 8
CANDIDATE_ID_PATTERN = re.compile(r"^link-[a-z0-9][a-z0-9._-]{0,63}$")


class BoundaryViolation(RuntimeError):
    pass


class RetrievalTimeout(BoundaryViolation):
    pass


class TransportResponse:
    def __init__(self, status: int, headers: dict[str, str], body: bytes):
        self.status = int(status)
        self.headers = {str(key).lower(): str(value) for key, value in headers.items()}
        self.body = body


def sha256_bytes(value: bytes) -> str:
    return "sha256-" + hashlib.sha256(value).hexdigest()


def validate_gate(gate: dict) -> None:
    if gate.get("record_type") != "link_gate_decision":
        raise BoundaryViolation("retrieval requires a link_gate_decision")
    if gate.get("disposition") != "follow" or gate.get("budget_status") != "allocated":
        raise BoundaryViolation("retrieval requires an allocated follow gate")
    if gate.get("provenance", {}).get("navigation_performed") is not False:
        raise BoundaryViolation("gate provenance must prove that qualification performed no navigation")
    if not gate.get("candidate_id"):
        raise BoundaryViolation("gate candidate_id is required")


def validate_candidate(gate: dict, candidate: dict) -> str:
    if candidate.get("record_type") != "link_candidate":
        raise BoundaryViolation("retrieval requires a link_candidate")
    if candidate.get("candidate_id") != gate.get("candidate_id"):
        raise BoundaryViolation("gate and candidate identifiers do not match")
    if not CANDIDATE_ID_PATTERN.fullmatch(str(candidate.get("candidate_id", ""))):
        raise BoundaryViolation("candidate_id does not match the stable identifier grammar")
    if candidate.get("safety_status") != "safe":
        raise BoundaryViolation("only candidates that passed pre-navigation safety checks may be retrieved")
    url = candidate.get("canonical_url")
    if not isinstance(url, str) or not url:
        raise BoundaryViolation("candidate canonical_url is required")
    return url


def _is_public_address(value: str) -> bool:
    try:
        address = ipaddress.ip_address(value.split("%", 1)[0])
    except ValueError as error:
        raise BoundaryViolation(f"resolver returned an invalid address: {value}") from error
    return address.is_global


def _system_resolver(host: str, port: int) -> list[str]:
    try:
        answers = socket.getaddrinfo(host, port, type=socket.SOCK_STREAM)
    except socket.gaierror as error:
        raise BoundaryViolation(f"destination cannot be resolved: {host}") from error
    return sorted({answer[4][0] for answer in answers})


def default_resolver(host: str, port: int, timeout_seconds: float) -> list[str]:
    try:
        result = subprocess.run(
            [sys.executable, str(Path(__file__).resolve()), "--resolve-only", host, str(port)],
            capture_output=True,
            text=True,
            timeout=timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired as error:
        raise RetrievalTimeout("DNS resolution timed out") from error
    if result.returncode != 0:
        raise BoundaryViolation("destination cannot be resolved")
    try:
        return list(json.loads(result.stdout))
    except (TypeError, ValueError) as error:
        raise BoundaryViolation("resolver returned invalid output") from error


def resolve_public_target(url: str, resolver=default_resolver, timeout_seconds: float = 5) -> tuple[object, list[str]]:
    parsed = urlsplit(url)
    if parsed.scheme not in {"http", "https"} or not parsed.hostname:
        raise BoundaryViolation("only absolute HTTP(S) targets are allowed")
    if parsed.username is not None or parsed.password is not None:
        raise BoundaryViolation("credential-bearing targets are forbidden")
    query_names = {name.lower() for name, _ in parse_qsl(parsed.query, keep_blank_values=True)}
    if query_names & SENSITIVE_QUERY_NAMES:
        raise BoundaryViolation("sensitive query parameters are forbidden")
    try:
        explicit_port = parsed.port
    except ValueError as error:
        raise BoundaryViolation("destination port is invalid") from error
    expected_port = 443 if parsed.scheme == "https" else 80
    if explicit_port is not None and explicit_port != expected_port:
        raise BoundaryViolation("nonstandard destination ports are forbidden")
    port = explicit_port or expected_port
    try:
        literal = ipaddress.ip_address(parsed.hostname.split("%", 1)[0])
        addresses = [str(literal)]
    except ValueError:
        addresses = list(resolver(parsed.hostname, port, timeout_seconds))
    if not addresses or len(addresses) > MAX_RESOLVED_ADDRESSES:
        raise BoundaryViolation("destination returned an invalid number of addresses")
    if not all(_is_public_address(address) for address in addresses):
        raise BoundaryViolation("destination resolves to a non-public address")
    return parsed, addresses


class PinnedHTTPTransport:
    """HTTP/1.1 transport that connects only to an already validated address."""

    def request(self, url: str, resolved_addresses: list[str], timeout_seconds: float, max_wire_bytes: int) -> TransportResponse:
        parsed = urlsplit(url)
        port = parsed.port or (443 if parsed.scheme == "https" else 80)
        last_error = None
        deadline = time.monotonic() + timeout_seconds
        def remaining_timeout():
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                raise RetrievalTimeout("retrieval timed out")
            return remaining
        for address in resolved_addresses:
            connection = None
            try:
                connection = socket.create_connection((address, port), timeout=remaining_timeout())
                connection.settimeout(remaining_timeout())
                if parsed.scheme == "https":
                    connection = ssl.create_default_context().wrap_socket(connection, server_hostname=parsed.hostname)
                connection.settimeout(remaining_timeout())
                target = parsed.path or "/"
                if parsed.query:
                    target += "?" + parsed.query
                host = parsed.hostname
                if parsed.port and parsed.port not in {80, 443}:
                    host += f":{parsed.port}"
                request = (
                    f"GET {target} HTTP/1.1\r\nHost: {host}\r\n"
                    "User-Agent: SecondBrainNewsletterRetrieval/1.0\r\n"
                    "Accept: text/html,text/plain,application/pdf,application/xhtml+xml\r\n"
                    "Accept-Encoding: gzip, deflate\r\nConnection: close\r\n\r\n"
                ).encode("ascii")
                connection.sendall(request)
                response = http.client.HTTPResponse(connection)
                response.begin()
                content_length = response.getheader("Content-Length")
                if content_length:
                    try:
                        if int(content_length) < 0 or int(content_length) > max_wire_bytes:
                            raise BoundaryViolation("declared response size exceeds the wire limit")
                    except ValueError as error:
                        raise BoundaryViolation("declared response size is invalid") from error
                body = response.read(max_wire_bytes + 1)
                if len(body) > max_wire_bytes:
                    raise BoundaryViolation("response exceeds the wire limit")
                headers = {key.lower(): value for key, value in response.getheaders()}
                return TransportResponse(response.status, headers, body)
            except (socket.timeout, TimeoutError) as error:
                raise RetrievalTimeout("retrieval timed out") from error
            except (OSError, ssl.SSLError, http.client.HTTPException) as error:
                last_error = error
            finally:
                if connection is not None:
                    connection.close()
        raise BoundaryViolation("connection failed for every validated address") from last_error


def _decode_bounded(body: bytes, encoding: str, maximum: int) -> bytes:
    normalized = encoding.lower().strip()
    if normalized in {"", "identity"}:
        if len(body) > maximum:
            raise BoundaryViolation("response exceeds the decompressed-size limit")
        return body
    if normalized == "gzip":
        decoder = zlib.decompressobj(16 + zlib.MAX_WBITS)
    elif normalized == "deflate":
        decoder = zlib.decompressobj()
    else:
        raise BoundaryViolation(f"unsupported content encoding: {encoding}")
    output = bytearray()
    try:
        for offset in range(0, len(body), 16384):
            remaining = maximum - len(output)
            output.extend(decoder.decompress(body[offset:offset + 16384], remaining + 1))
            if len(output) > maximum or decoder.unconsumed_tail:
                raise BoundaryViolation("response exceeds the decompressed-size limit")
        output.extend(decoder.flush(maximum - len(output) + 1))
    except zlib.error as error:
        raise BoundaryViolation("response compression is invalid") from error
    if len(output) > maximum:
        raise BoundaryViolation("response exceeds the decompressed-size limit")
    if not decoder.eof or decoder.unused_data:
        raise BoundaryViolation("compressed response is incomplete or contains trailing data")
    return bytes(output)


def _atomic_write(path: Path, content: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary = tempfile.mkstemp(prefix=path.name + ".", suffix=".tmp", dir=path.parent)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def _contained_path(root: Path, *parts: str) -> Path:
    path = root.joinpath(*parts).resolve()
    try:
        path.relative_to(root)
    except ValueError as error:
        raise BoundaryViolation("derived output path escapes staging") from error
    return path


def retrieve(
    gate: dict,
    candidate: dict,
    transport,
    resolver,
    staging_root,
    *,
    timeout_seconds: float = 20,
    max_wire_bytes: int = 5_000_000,
    max_decompressed_bytes: int = 10_000_000,
    max_redirects: int = 5,
) -> dict:
    validate_gate(gate)
    url = validate_candidate(gate, candidate)
    if timeout_seconds <= 0 or max_wire_bytes <= 0 or max_decompressed_bytes <= 0 or max_redirects < 0:
        raise BoundaryViolation("retrieval limits must be positive and bounded")
    deadline = time.monotonic() + timeout_seconds
    current = url
    visited = set()
    redirect_chain = []
    for _ in range(max_redirects + 1):
        if current in visited:
            raise BoundaryViolation("redirect loop detected")
        visited.add(current)
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            raise RetrievalTimeout("retrieval timed out")
        _, addresses = resolve_public_target(current, resolver, remaining)
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            raise RetrievalTimeout("retrieval timed out")
        try:
            response = transport.request(current, addresses, remaining, max_wire_bytes)
        except (socket.timeout, TimeoutError) as error:
            raise RetrievalTimeout("retrieval timed out") from error
        if response.status in {301, 302, 303, 307, 308}:
            location = response.headers.get("location")
            if not location:
                raise BoundaryViolation("redirect response has no location")
            redirect_chain.append(current)
            current = urljoin(current, location)
            continue
        if response.status in {401, 402, 403}:
            return _unavailable_record(gate, current, redirect_chain, "paywalled")
        if response.status != 200:
            return _unavailable_record(gate, current, redirect_chain, "unavailable")
        mime_type = response.headers.get("content-type", "").split(";", 1)[0].strip().lower()
        if mime_type not in ALLOWED_MIME_TYPES:
            raise BoundaryViolation(f"unsupported MIME type: {mime_type or 'missing'}")
        if len(response.body) > max_wire_bytes:
            raise BoundaryViolation("response exceeds the wire limit")
        content = _decode_bounded(response.body, response.headers.get("content-encoding", "identity"), max_decompressed_bytes)
        content_hash = sha256_bytes(content)
        staging = Path(staging_root).resolve()
        transaction_id = f"{gate['candidate_id']}-{content_hash[7:19]}"
        transaction_root = _contained_path(staging, "transactions", transaction_id)
        snapshot_path = _contained_path(transaction_root, "snapshot.bin")
        metadata_path = _contained_path(transaction_root, "fetch-record.json")
        completion_path = _contained_path(transaction_root, "complete.json")
        _atomic_write(snapshot_path, content)
        retrieved_at = datetime.now(timezone.utc)
        record = {
            "schema_version": "1.0",
            "record_type": "source_fetch",
            "candidate_id": gate["candidate_id"],
            "final_url": current,
            "redirect_chain": redirect_chain,
            "mime_type": mime_type,
            "wire_size": len(response.body),
            "decompressed_size": len(content),
            "content_hash": content_hash,
            "coverage": "full",
            "snapshot_path": str(snapshot_path),
            "completion_path": str(completion_path),
            "retrieved_at": retrieved_at.isoformat(),
            "expires_at": (retrieved_at + timedelta(days=7)).isoformat(),
        }
        _atomic_write(metadata_path, json.dumps(record, sort_keys=True, indent=2).encode("utf-8"))
        completion = {"candidate_id": gate["candidate_id"], "content_hash": content_hash, "fetch_record": str(metadata_path)}
        _atomic_write(completion_path, json.dumps(completion, sort_keys=True).encode("utf-8"))
        return record
    raise BoundaryViolation("redirect limit exceeded")


def _unavailable_record(gate: dict, final_url: str, redirect_chain: list[str], coverage: str) -> dict:
    return {
        "schema_version": "1.0",
        "record_type": "source_fetch",
        "candidate_id": gate["candidate_id"],
        "final_url": final_url,
        "redirect_chain": redirect_chain,
        "coverage": coverage,
        "retrieved_at": datetime.now(timezone.utc).isoformat(),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Retrieve one allocated newsletter link into bounded local staging.")
    parser.add_argument("--resolve-only", nargs=2, metavar=("HOST", "PORT"), help=argparse.SUPPRESS)
    parser.add_argument("--gate")
    parser.add_argument("--candidate")
    parser.add_argument("--staging-root")
    parser.add_argument("--timeout-seconds", type=float, default=20)
    parser.add_argument("--max-wire-bytes", type=int, default=5_000_000)
    parser.add_argument("--max-decompressed-bytes", type=int, default=10_000_000)
    arguments = parser.parse_args()
    if arguments.resolve_only:
        host, port = arguments.resolve_only
        print(json.dumps(_system_resolver(host, int(port))))
        return 0
    if not arguments.gate or not arguments.candidate or not arguments.staging_root:
        parser.error("--gate, --candidate, and --staging-root are required")
    with open(arguments.gate, "r", encoding="utf-8") as handle:
        gate = json.load(handle)
    with open(arguments.candidate, "r", encoding="utf-8") as handle:
        candidate = json.load(handle)
    record = retrieve(
        gate,
        candidate,
        PinnedHTTPTransport(),
        default_resolver,
        arguments.staging_root,
        timeout_seconds=arguments.timeout_seconds,
        max_wire_bytes=arguments.max_wire_bytes,
        max_decompressed_bytes=arguments.max_decompressed_bytes,
    )
    print(json.dumps(record, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
