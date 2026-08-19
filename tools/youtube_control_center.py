#!/usr/bin/env python3
"""Loopback-only control center for the YouTube intelligence pipeline."""

from __future__ import annotations

import argparse
import hashlib
import ipaddress
import json
import secrets
import sys
import threading
import urllib.parse
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Any

from youtube_intelligence import App, iso_utc


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8")


MAX_BODY_BYTES = 65_536


def loopback_host(value: str) -> str:
    if value.lower() == "localhost":
        return value
    try:
        if ipaddress.ip_address(value).is_loopback:
            return value
    except ValueError:
        pass
    raise argparse.ArgumentTypeError("Control center may bind only to localhost or a loopback IP")


class ControlCenterServer(ThreadingHTTPServer):
    daemon_threads = True

    def __init__(self, address: tuple[str, int], handler: type[SimpleHTTPRequestHandler], app: App, assets: Path):
        super().__init__(address, handler)
        self.app = app
        self.assets = assets
        self.session_token = secrets.token_urlsafe(32)
        self.mutation_lock = threading.Lock()


class Handler(SimpleHTTPRequestHandler):
    server: ControlCenterServer

    def __init__(self, *args: Any, **kwargs: Any):
        super().__init__(*args, directory=str(args[2].assets), **kwargs)

    def log_message(self, format_string: str, *args: Any) -> None:
        sys.stderr.write("control-center: " + format_string % args + "\n")

    def end_headers(self) -> None:
        self.send_header("Cache-Control", "no-store")
        self.send_header("X-Content-Type-Options", "nosniff")
        self.send_header("Referrer-Policy", "no-referrer")
        self.send_header("Content-Security-Policy", "default-src 'self'; style-src 'self'; script-src 'self'; connect-src 'self'; img-src 'self' data:")
        super().end_headers()

    def _json(self, payload: Any, status: int = HTTPStatus.OK) -> None:
        encoded = json.dumps(payload, ensure_ascii=False, indent=2).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(encoded)))
        self.end_headers()
        self.wfile.write(encoded)

    def _mutation_allowed(self) -> bool:
        content_type = self.headers.get("Content-Type", "").split(";", 1)[0].strip().lower()
        if content_type != "application/json":
            self._json({"status": "failed", "error": "application/json required"}, HTTPStatus.UNSUPPORTED_MEDIA_TYPE)
            return False
        if not secrets.compare_digest(self.headers.get("X-YT-Control-Token", ""), self.server.session_token):
            self._json({"status": "failed", "error": "invalid control token"}, HTTPStatus.FORBIDDEN)
            return False
        origin = self.headers.get("Origin")
        if origin:
            parsed = urllib.parse.urlparse(origin)
            try:
                if not parsed.hostname or not ipaddress.ip_address("127.0.0.1" if parsed.hostname == "localhost" else parsed.hostname).is_loopback:
                    raise ValueError
                if parsed.port != self.server.server_port:
                    raise ValueError
            except (ValueError, TypeError):
                self._json({"status": "failed", "error": "non-loopback origin rejected"}, HTTPStatus.FORBIDDEN)
                return False
        return True

    def _body(self) -> dict[str, Any]:
        length = int(self.headers.get("Content-Length", "0"))
        if length < 1 or length > MAX_BODY_BYTES:
            raise RuntimeError("Request body must be between 1 and 65536 bytes")
        payload = json.loads(self.rfile.read(length).decode("utf-8"))
        if not isinstance(payload, dict):
            raise RuntimeError("JSON object required")
        return payload

    def do_GET(self) -> None:  # noqa: N802
        parsed = urllib.parse.urlparse(self.path)
        try:
            if parsed.path == "/api/session":
                self._json({"token": self.server.session_token, "mutations_enabled": bool(self.server.app.policy["control_center"]["enabled"])})
                return
            if parsed.path == "/api/state":
                self._json(self.server.app.control_center_state())
                return
            if parsed.path == "/api/audit":
                month = urllib.parse.parse_qs(parsed.query).get("month", [""])[0]
                if not month:
                    raise RuntimeError("month query parameter required")
                self._json(self.server.app.adaptive_audit(month))
                return
            if parsed.path.startswith("/api/"):
                self._json({"status": "failed", "error": "unknown endpoint"}, HTTPStatus.NOT_FOUND)
                return
            if parsed.path == "/":
                self.path = "/index.html"
            super().do_GET()
        except Exception as exc:
            self._json({"status": "failed", "error": str(exc)}, HTTPStatus.BAD_REQUEST)

    def do_POST(self) -> None:  # noqa: N802
        if urllib.parse.urlparse(self.path).path != "/api/commands":
            self._json({"status": "failed", "error": "unknown endpoint"}, HTTPStatus.NOT_FOUND)
            return
        if not self._mutation_allowed():
            return
        try:
            body = self._body()
            command = body.get("command")
            app = self.server.app
            if command == "inspect-run":
                result = app.inspect_run(body["run_type"], body.get("channel_ids"), body.get("limit"))
                self._json(result)
                return
            command_id = str(body.get("command_id", ""))
            if not command_id or len(command_id) > 128:
                raise RuntimeError("Mutations require a bounded command_id")
            encoded = json.dumps(body, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")
            payload_hash = hashlib.sha256(encoded).hexdigest().upper()
            with self.server.mutation_lock:
                connection = app.connect()
                receipt = connection.execute("SELECT * FROM command_receipts WHERE command_id=?", (command_id,)).fetchone()
                connection.close()
                if receipt:
                    if receipt["payload_sha256"] != payload_hash:
                        raise RuntimeError("command_id was already used for a different payload")
                    self._json(json.loads(receipt["response_json"]))
                    return
                if command == "pause":
                    result = app.pause_pipeline(body.get("actor", "rolf"), int(body["expected_version"]))
                elif command == "resume":
                    result = app.resume_pipeline(body.get("actor", "rolf"), int(body["expected_version"]))
                elif command == "save-preferences":
                    result = app.save_preferences(body["weights"], float(body["open_discovery_share"]), body.get("actor", "rolf"), int(body["expected_version"]))
                elif command == "propose-configuration":
                    result = app.propose_configuration(body["proposal_type"], body["target_id"], str(body["proposed_value"]), body["rationale"], body.get("actor", "rolf"))
                elif command == "apply-configuration":
                    result = app.apply_configuration(body["proposal_id"], body.get("actor", "rolf"), body["expected_version"])
                elif command == "review-event":
                    result = app.record_review_event(body["event_type"], body["subject_type"], body["subject_id"], body.get("actor", "rolf"), body["text"], body.get("metadata"))
                elif command == "source-decision":
                    action = body["action"]
                    if action not in {"approve", "reject", "defer"}:
                        raise RuntimeError("source decision must be approve, reject, or defer")
                    result = app.record_review_event("override", "source", body["source_id"], body.get("actor", "rolf"), action, {"comment": body.get("comment", "")})
                elif command == "request-run":
                    result = app.request_run(body["manifest"]["run_type"], "manual-control-center", allow_disabled=False, inspected_manifest=body["manifest"])
                elif command == "execute-run":
                    result = app.execute_run(body["run_id"], bool(body.get("admit", False)))
                else:
                    raise RuntimeError(f"Unsupported command: {command}")
                connection = app.connect()
                with connection:
                    connection.execute("INSERT INTO command_receipts VALUES(?,?,?,?)", (command_id, payload_hash, json.dumps(result, ensure_ascii=False, sort_keys=True), iso_utc()))
                connection.close()
            self._json(result)
        except Exception as exc:
            self._json({"status": "failed", "error": str(exc)}, HTTPStatus.BAD_REQUEST)


def main() -> int:
    parser = argparse.ArgumentParser(description="Local YouTube intelligence control center")
    parser.add_argument("--vault-root", default=str(Path(__file__).resolve().parents[1]))
    parser.add_argument("--policy", default="tools/config/youtube-intelligence-policy.json")
    parser.add_argument("--host", type=loopback_host)
    parser.add_argument("--port", type=int)
    args = parser.parse_args()
    root = Path(args.vault_root).resolve()
    policy = Path(args.policy)
    if not policy.is_absolute():
        policy = root / policy
    app = App(root, policy)
    configured = app.policy["control_center"]
    host = args.host or loopback_host(str(configured["bind_host"]))
    port = args.port if args.port is not None else int(configured["port"])
    if not 1 <= port <= 65535:
        raise RuntimeError("port must be between 1 and 65535")
    assets = root / "tools/youtube-control-center"
    server = ControlCenterServer((host, port), Handler, app, assets)
    print(json.dumps({"status": "ready", "url": f"http://{host}:{server.server_port}", "mutations_enabled": bool(configured["enabled"])}, ensure_ascii=False), flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
