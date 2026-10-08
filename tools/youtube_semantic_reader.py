"""Read-only, package-bound transcript display; never a semantic-review receipt."""
import csv
import hashlib
import json
import re
import sqlite3


def read_source(app, package_manifest, run_manifest_sha256, source, line=1, offset=0,
                max_lines=80, max_chars=12000):
    if not (1 <= max_lines <= 200 and 1 <= max_chars <= 20000 and line >= 1 and offset >= 0):
        raise RuntimeError("Invalid read bounds: max-lines 1..200, max-chars 1..20000, line >=1, offset >=0")

    def exact_path(relative):
        path = app.inside_vault(relative)
        if path.relative_to(app.root).as_posix() != relative or not path.is_file():
            raise RuntimeError("Expected exact repository-relative file path")
        return path

    def hashed_bytes(path, expected):
        if not re.fullmatch(r"[0-9a-fA-F]{64}", expected or ""):
            raise RuntimeError("Invalid SHA-256")
        data = path.read_bytes()
        if hashlib.sha256(data).hexdigest().upper() != expected.upper():
            raise RuntimeError("SHA-256 mismatch")
        return data

    def one_row(path, key, value):
        with path.open(encoding="utf-8-sig", newline="") as handle:
            rows = [row for row in csv.DictReader(handle) if row.get(key) == value]
        if len(rows) != 1:
            raise RuntimeError("Source must occur exactly once in each package ledger and register")
        return rows[0]

    authority = app._require_l2_authority()
    # mode=ro cannot create/migrate operational state or clear a pause.
    connection = sqlite3.connect(app.db_path.as_uri() + "?mode=ro", uri=True)
    try:
        pause = connection.execute("SELECT state_value FROM system_state WHERE state_key='pipeline_pause'").fetchone()
    finally:
        connection.close()
    if not pause or pause[0] != "false":
        raise RuntimeError("Pipeline is paused or pause state is missing")
    package = json.loads(exact_path(package_manifest).read_text(encoding="utf-8-sig"))
    standing = package.get("standing_authority") or {}
    if package.get("schema_version") != "semantic-ingest/v1" or standing.get("authority_id") != authority["authority"]["authority_id"]:
        raise RuntimeError("Package standing authority mismatch")
    manifest_data = hashed_bytes(exact_path(standing["run_manifest"]), run_manifest_sha256)
    manifest = json.loads(manifest_data.decode("utf-8-sig"))
    if manifest.get("schema_version") != authority["authority"]["required_manifest_schema"] or not manifest.get("run_id"):
        raise RuntimeError("Invalid run manifest")
    manifested = manifest.get("captured_sources")
    if not isinstance(manifested, list) or not manifested:
        raise RuntimeError("Invalid captured source list")
    paths = set()
    for row in manifested:
        path = row.get("canonical_source", "")
        if path in paths or not path.startswith(authority["authority"]["source_prefix"]) or not re.fullmatch(r"[0-9a-fA-F]{64}", row.get("sha256", "")):
            raise RuntimeError("Invalid or duplicate manifested source")
        paths.add(path)
    matches = [row for row in manifested if row.get("canonical_source") == source]
    if len(matches) != 1 or not source.startswith(authority["authority"]["source_prefix"]):
        raise RuntimeError("Source is not exactly manifested within standing authority")
    expected_hash = matches[0].get("sha256", "").upper()
    decision = one_row(exact_path(package["decision_ledger"]), "canonical_source", source)
    intake = one_row(exact_path(package["intake_ledger"]), "canonical_source", source)
    register = one_row(exact_path(authority["policy"]["register_path"]), "canonical_source", source)
    if any(row.get("sha256", "").upper() != expected_hash for row in (decision, intake, register)):
        raise RuntimeError("Package/register source hash mismatch")
    if intake.get("package") != package.get("package_id"):
        raise RuntimeError("Intake package mismatch")
    provenance = {
        "decision_authority": "standing-policy", "authority_id": standing["authority_id"],
        "decision_actor": authority["authority"]["decision_actor"],
        "autonomy_level": authority["authority"]["required_autonomy_level"],
        "authority_policy_version": authority["policy"]["schema_version"],
        "authority_run_id": manifest["run_id"],
        "authority_manifest_sha256": run_manifest_sha256.upper(),
    }
    if any(decision.get(key) != value for key, value in provenance.items()):
        raise RuntimeError("Decision standing-authority provenance mismatch")
    if register.get("availability") != "available" or register.get("package") != package.get("package_id"):
        raise RuntimeError("Source is not available and assigned to this package")
    # Hash and decode the same bytes, so a replacement cannot change the displayed text after verification.
    content = hashed_bytes(exact_path(source), expected_hash).decode("utf-8-sig")
    lines = content.splitlines(keepends=True)
    if line > len(lines) + 1 or (line == len(lines) + 1 and offset != 0):
        raise RuntimeError("Read position is past EOF")
    if line <= len(lines) and offset >= len(lines[line - 1]):
        raise RuntimeError("Offset is outside original line")
    fragments, emitted = [], 0
    while line <= len(lines) and len(fragments) < max_lines and emitted < max_chars:
        text = lines[line - 1][offset:offset + max_chars - emitted]
        fragments.append({"line": line, "offset": offset, "text": text})
        emitted += len(text)
        offset += len(text)
        if offset == len(lines[line - 1]):
            line, offset = line + 1, 0
    eof = line == len(lines) + 1
    return {
        "status": "displayed", "run_id": manifest["run_id"], "package_id": package["package_id"],
        "canonical_source": source, "sha256": expected_hash,
        "run_manifest_sha256": run_manifest_sha256.upper(),
        "fragments": fragments, "emitted_characters": emitted, "total_lines": len(lines),
        "next_position": None if eof else {"line": line, "offset": offset}, "eof": eof,
        "semantic_review_proven": False,
    }
