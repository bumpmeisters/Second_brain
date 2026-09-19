"""Bounded public-source acquisition and exact existing-importer reconciliation.

No function invokes the global importer, conversion, or semantic ingest. Downloads
remain staging files until complete; original libraries are only read. Callers
must retain the submission and provide the exact receipt and ContentLevel result.
"""
from __future__ import annotations

import hashlib
import http.client
import ipaddress
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import socket
import ssl
import tempfile
import time
from urllib.parse import urljoin, urlsplit


class AcquisitionError(ValueError):
    """Acquisition evidence is unsafe, incomplete, or inconsistent."""


BINARY_EXTENSIONS = {".pdf", ".docx", ".pptx", ".xlsx"}
NATIVE_EXTENSIONS = {".txt", ".csv", ".json", ".yaml", ".yml", ".html", ".htm", ".md", ".markdown"}
CONTENT_TYPES = {
    ".pdf": {"application/pdf"},
    ".html": {"text/html", "application/xhtml+xml"},
    ".htm": {"text/html", "application/xhtml+xml"},
    ".txt": {"text/plain"}, ".md": {"text/plain", "text/markdown"},
    ".markdown": {"text/plain", "text/markdown"},
    ".csv": {"text/csv", "text/plain"}, ".json": {"application/json"},
    ".yaml": {"application/yaml", "text/yaml", "text/plain"},
    ".yml": {"application/yaml", "text/yaml", "text/plain"},
    ".docx": {"application/vnd.openxmlformats-officedocument.wordprocessingml.document"},
    ".pptx": {"application/vnd.openxmlformats-officedocument.presentationml.presentation"},
    ".xlsx": {"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"},
}


def sha256_file(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for chunk in iter(lambda: stream.read(128 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _sha(value):
    if not isinstance(value, str) or not re.fullmatch(r"[0-9a-fA-F]{64}", value):
        raise AcquisitionError("Expected a SHA-256 digest")
    return value.lower()


def _relative(value):
    if not isinstance(value, str) or not value:
        raise AcquisitionError("Expected an exact relative path")
    value = value.replace("\\", "/")
    parts = value.split("/")
    if any(p in {"", ".", ".."} or ":" in p or p.endswith((" ", ".")) for p in parts):
        raise AcquisitionError("Unsafe relative path")
    if any(re.search(r'[<>"|?*\x00-\x1f]', p) for p in parts):
        raise AcquisitionError("Unsafe path characters")
    if any(re.fullmatch(r"(?i)(con|prn|aux|nul|com[1-9]|lpt[1-9])(?:\..*)?", p) for p in parts):
        raise AcquisitionError("Reserved path component")
    return PurePosixPath(value).as_posix()


def _contained(root, relative, *, must_exist=False):
    root = Path(root).resolve(strict=True)
    if not root.is_dir():
        raise AcquisitionError("Vault/staging root is not a directory")
    relative = _relative(relative)
    candidate = root.joinpath(*relative.split("/"))
    resolved = candidate.resolve(strict=must_exist)
    if not resolved.is_relative_to(root) or resolved == root:
        raise AcquisitionError("Path escapes its allowed root")
    # Even an in-vault link must not redirect one source namespace to another.
    if os.path.normcase(str(candidate)) != os.path.normcase(str(resolved)):
        raise AcquisitionError("Path is redirected by a symlink or junction")
    return resolved


def _source_input(value):
    value = _relative(value)
    if len(value.split("/")) < 2:
        raise AcquisitionError("Input requires a project prefix and filename")
    if Path(value).suffix.lower() not in BINARY_EXTENSIONS | NATIVE_EXTENSIONS:
        raise AcquisitionError("Source extension is not supported by the inbox contract")
    return value


def _publish_new(complete_file, destination):
    """Atomic no-replace publication: unlike replace(), link() cannot overwrite.

    The complete temporary file must be on the destination filesystem. The link
    is unlinked from staging afterwards, leaving an independent admitted file.
    """
    try:
        os.link(complete_file, destination)
    except FileExistsError as exc:
        raise AcquisitionError("Destination already exists; use a new source version") from exc


def _public_target(url):
    try:
        parsed = urlsplit(url)
        host = parsed.hostname
        port = parsed.port or (443 if parsed.scheme == "https" else 80)
    except ValueError as exc:
        raise AcquisitionError("Invalid source URL") from exc
    if parsed.scheme not in {"http", "https"} or not host or parsed.username or parsed.password:
        raise AcquisitionError("Only public HTTP(S) URLs without credentials are supported")
    if any(ord(char) < 33 for char in url) or "\\" in url or "%" in host:
        raise AcquisitionError("Malformed source URL")
    if host.rstrip(".").lower() == "localhost" or host.rstrip(".").lower().endswith(".localhost"):
        raise AcquisitionError("Local source URL is forbidden")
    addresses = socket.getaddrinfo(host, port, type=socket.SOCK_STREAM)
    if not addresses:
        raise AcquisitionError("Source hostname has no addresses")
    for _, _, _, _, address in addresses:
        ip = ipaddress.ip_address(address[0])
        if not ip.is_global or ip.is_multicast:
            raise AcquisitionError("Source hostname resolves to a non-public address")
    return parsed, addresses[0]


def _request(url, timeout):
    """Connect to the validated address directly, preventing a second DNS lookup."""
    parsed, address = _public_target(url)
    family, socktype, protocol, _, endpoint = address
    connection = http.client.HTTPConnection(parsed.hostname, parsed.port or (443 if parsed.scheme == "https" else 80), timeout=timeout)
    raw = socket.socket(family, socktype, protocol)
    try:
        raw.settimeout(timeout)
        raw.connect(endpoint)
        if parsed.scheme == "https":
            raw = ssl.create_default_context().wrap_socket(raw, server_hostname=parsed.hostname)
        connection.sock = raw
        connection._acquisition_socket = raw
        target = parsed.path or "/"
        if parsed.query:
            target += "?" + parsed.query
        connection.request("GET", target, headers={"User-Agent": "CompanyIntelligence/0.1", "Accept-Encoding": "identity"})
        return connection, connection.getresponse()
    except BaseException:
        raw.close()
        connection.close()
        raise


def download_source(url, staging_dir, filename, *, max_bytes=50 * 1024 * 1024, timeout=30):
    """Download a public source with redirect, byte, MIME and magic validation.

    timeout bounds socket operations and total streaming time; OS DNS resolution
    may outlast it. A complete result is published once, without replacement.
    """
    filename = _relative(filename)
    if "/" in filename or Path(filename).suffix.lower() not in CONTENT_TYPES:
        raise AcquisitionError("Download requires one supported filename")
    if not isinstance(max_bytes, int) or not 1 <= max_bytes <= 200 * 1024 * 1024:
        raise AcquisitionError("Invalid download byte limit")
    if not isinstance(timeout, (int, float)) or not 0 < timeout <= 120:
        raise AcquisitionError("Invalid download timeout")
    staging_dir = Path(staging_dir).resolve(strict=True)
    destination = _contained(staging_dir, filename)
    if destination.exists():
        raise AcquisitionError("Staged source already exists")
    current = url
    deadline = time.monotonic() + timeout
    suffix = Path(filename).suffix.lower()
    connection = response = None
    try:
        for redirects in range(6):
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                raise AcquisitionError("Download deadline exceeded")
            connection, response = _request(current, remaining)
            if response.status in {301, 302, 303, 307, 308}:
                location = response.getheader("Location")
                response.close()
                connection.close()
                if not location or redirects == 5:
                    raise AcquisitionError("Missing redirect destination or redirect limit exceeded")
                current = urljoin(current, location)
                continue
            break
        if response.status != 200:
            raise AcquisitionError(f"Download HTTP status {response.status}")
        content_type = (response.getheader("Content-Type") or "").split(";", 1)[0].strip().lower()
        if content_type not in CONTENT_TYPES[suffix]:
            raise AcquisitionError("Content type does not match source extension")
        if (response.getheader("Content-Encoding") or "identity").lower() != "identity":
            raise AcquisitionError("Compressed HTTP responses are not accepted")
        length = response.getheader("Content-Length")
        if length is not None and (not length.isdigit() or int(length) > max_bytes):
            raise AcquisitionError("Invalid or oversized response length")
        digest = hashlib.sha256()
        size = 0
        prefix = b""
        with tempfile.TemporaryDirectory(prefix=".download-", dir=staging_dir) as temp_dir:
            partial = Path(temp_dir) / "payload.part"
            with partial.open("xb") as stream:
                while True:
                    remaining = deadline - time.monotonic()
                    if remaining <= 0:
                        raise AcquisitionError("Download deadline exceeded")
                    # HTTPConnection may detach sock for Connection: close. Keep
                    # the original socket to apply the remaining wall deadline.
                    connection._acquisition_socket.settimeout(remaining)
                    chunk = response.read1(64 * 1024)
                    if time.monotonic() > deadline:
                        raise AcquisitionError("Download deadline exceeded")
                    if not chunk:
                        break
                    size += len(chunk)
                    if size > max_bytes:
                        raise AcquisitionError("Download byte limit exceeded")
                    prefix = (prefix + chunk)[:8]
                    digest.update(chunk)
                    stream.write(chunk)
                stream.flush()
                os.fsync(stream.fileno())
            if not size or (length is not None and size != int(length)):
                raise AcquisitionError("Empty or truncated source")
            if suffix == ".pdf" and not prefix.startswith(b"%PDF-"):
                raise AcquisitionError("Response is not a PDF")
            if suffix in BINARY_EXTENSIONS - {".pdf"} and not prefix.startswith(b"PK\x03\x04"):
                raise AcquisitionError("Response is not an Office Open XML archive")
            _publish_new(partial, destination)
        return {"staged_path": str(destination), "sha256": digest.hexdigest(), "url": current, "content_type": content_type, "size_bytes": size}
    finally:
        if response is not None:
            response.close()
        if connection is not None:
            connection.close()


def prepare_inbox(staged_path, vault_root, relative_input, expected_sha256):
    """Create one new complete inbox/raw/project/... file; never run the importer."""
    relative_input = _source_input(relative_input)
    expected_sha256 = _sha(expected_sha256)
    vault_root = Path(vault_root).resolve(strict=True)
    staged_path = Path(staged_path).resolve(strict=True)
    if not staged_path.is_file() or sha256_file(staged_path) != expected_sha256:
        raise AcquisitionError("Staged source hash mismatch")
    destination = _contained(vault_root, "inbox/raw/" + relative_input)
    if destination.exists():
        raise AcquisitionError("Inbox source already exists; reconcile it or choose a new version")
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination = _contained(vault_root, "inbox/raw/" + relative_input)
    # This temp is on the vault filesystem, outside inbox and protected sources.
    # Atomic hard-link publication prevents both partial scans and overwrite races.
    with tempfile.TemporaryDirectory(prefix=".company-intelligence-transfer-", dir=vault_root) as temp_dir:
        complete = Path(temp_dir) / "payload"
        with staged_path.open("rb") as source, complete.open("xb") as target:
            shutil.copyfileobj(source, target)
            target.flush()
            os.fsync(target.fileno())
        if sha256_file(complete) != expected_sha256:
            raise AcquisitionError("Staged source changed during transfer")
        _publish_new(complete, destination)
    return {"input": relative_input, "lane": "raw", "sha256": expected_sha256}


def reconcile_receipt(vault_root, submission, receipt, readiness=None):
    """Validate one exact receipt and retain blocked originals without using them.

    Native source text needs no binary sidecar. Explicit blocked readiness stays
    blocked for all types. Binary readiness must be a ContentLevel output object
    from assert-source-ingest-ready.ps1, with an existing matching sidecar.
    """
    source_input = _source_input(submission.get("input"))
    expected_sha = _sha(submission.get("sha256"))
    if submission.get("lane") != "raw" or receipt.get("lane", "raw") != "raw":
        raise AcquisitionError("Receipt lane differs from the authorized raw submission")
    if _relative(receipt.get("input")) != source_input or _sha(receipt.get("sha256")) != expected_sha:
        raise AcquisitionError("Receipt does not match the exact submission path and hash")
    binary = Path(source_input).suffix.lower() in BINARY_EXTENSIONS
    expected_path = ("raw/assets/" if binary else "raw/imports/") + source_input
    receipt_path = _relative(receipt.get("destination"))
    status = receipt.get("status")
    if status == "admitted":
        if receipt_path != expected_path:
            raise AcquisitionError("Receipt destination is not the exact policy destination")
    elif status == "quarantined-duplicate":
        expected_quarantine = PurePosixPath("inbox/_quarantine/duplicates/raw") / source_input
        actual_quarantine = PurePosixPath(receipt_path)
        if actual_quarantine.parent != expected_quarantine.parent:
            raise AcquisitionError("Duplicate receipt is outside its exact project quarantine")
        original_stem = expected_quarantine.stem
        if actual_quarantine.name != expected_quarantine.name and not re.fullmatch(
            re.escape(original_stem) + r"-\d{8}-\d{6}-\d{3}-[0-9a-f]{8}-[0-9a-f]{8}" + re.escape(expected_quarantine.suffix), actual_quarantine.name
        ):
            raise AcquisitionError("Duplicate receipt filename does not match importer renaming")
    else:
        raise AcquisitionError(f"Receipt has no admitted source: {status}")
    received = _contained(vault_root, receipt_path, must_exist=True)
    local = _contained(vault_root, expected_path, must_exist=True)
    if not received.is_file() or not local.is_file() or sha256_file(received) != expected_sha or sha256_file(local) != expected_sha:
        raise AcquisitionError("Receipt/original file hash mismatch")
    result = {"local_path": expected_path, "sha256": expected_sha, "extraction_path": None, "readiness_status": "blocked" if binary else "ready"}
    if readiness is None:
        return result
    if not isinstance(readiness, dict) or _relative(readiness.get("source")) != expected_path:
        raise AcquisitionError("Readiness source differs from admitted original")
    if readiness.get("intent") != "ContentLevel":
        raise AcquisitionError("ContentLevel readiness is required")
    if readiness.get("status") == "blocked":
        result["readiness_status"] = "blocked"
        return result
    if readiness.get("status") != "ready":
        raise AcquisitionError("Unknown readiness status")
    target = readiness.get("target")
    if binary and not target:
        return result
    if target:
        target = _relative(target)
        if not target.startswith("wiki/_extractions/") or not target.endswith(".md"):
            raise AcquisitionError("Extraction is outside the sidecar namespace")
        extraction = _contained(vault_root, target)
        if not extraction.is_file():
            result["readiness_status"] = "blocked"
            return result
        frontmatter = extraction.read_text(encoding="utf-8-sig").split("---", 2)
        match = re.search(r"(?m)^source_sha256:\s*([0-9a-fA-F]{64})\s*$", frontmatter[1]) if len(frontmatter) == 3 and not frontmatter[0].strip() else None
        if not match or match.group(1).lower() != expected_sha:
            result["readiness_status"] = "blocked"
            return result
        result["extraction_path"] = target
    result["readiness_status"] = "ready"
    return result
