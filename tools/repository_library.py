"""Commit-pinned, non-executing source custody and dossier validation. Stdlib only."""
from __future__ import annotations

import argparse
import hashlib
import io
import json
import os
from pathlib import Path
import re
import shutil
import sys
import tempfile
from datetime import datetime, timezone
from urllib.request import Request, urlopen
import zipfile

SCHEMA = "repository-snapshot/v1"
COMMIT = re.compile(r"[0-9a-f]{40}\Z")
REPO = re.compile(r"https://github\.com/([A-Za-z0-9_.-]+)/([A-Za-z0-9_.-]+)\Z")


def digest(data):
    return hashlib.sha256(data).hexdigest()


def git_blob(data):
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()


def safe_path(value):
    if not isinstance(value, str) or not value or "\\" in value or value.startswith("/"):
        raise ValueError(f"Unsafe source path: {value!r}")
    parts = value.split("/")
    reserved = re.compile(r"(?:con|prn|aux|nul|com[1-9]|lpt[1-9])(?:\..*)?\Z", re.I)
    if any(p in ("", ".", "..") or p.lower() == ".git" or p.endswith((" ", "."))
           or any(ord(c) < 32 or c in '<>:"|?*' for c in p) or reserved.fullmatch(p)
           for p in parts):
        raise ValueError(f"Unsafe or nonportable source path: {value!r}")
    return value


def inside(root, path):
    root = Path(root).resolve()
    path = Path(path)
    resolved = path.resolve()
    if not resolved.is_relative_to(root) or resolved == root:
        raise ValueError(f"Path escapes its root: {path}")
    current = path.absolute()
    while current != root and current.is_relative_to(root):
        if current.is_symlink() or (hasattr(current, "is_junction") and current.is_junction()):
            raise ValueError(f"Linked filesystem component is not allowed: {current}")
        current = current.parent
    return resolved


def fetch(url, limit):
    req = Request(url, headers={"User-Agent": "Second-Brain-Repository-Library", "Accept": "application/vnd.github+json"})
    with urlopen(req, timeout=60) as response:
        data = response.read(limit + 1)
    if len(data) > limit:
        raise ValueError("Download exceeds configured size limit")
    return data


def parse_repo(url):
    match = REPO.fullmatch(url.rstrip("/"))
    if not match:
        raise ValueError("Use an exact public https://github.com/owner/repo URL")
    owner, repo = match.groups()
    if repo.endswith(".git"):
        repo = repo[:-4]
    safe_path(owner)
    safe_path(repo)
    return owner, repo


def source_inventory(tree):
    if tree.get("truncated"):
        raise ValueError("GitHub tree is truncated; full inventory cannot be established")
    items = {}
    folded = set()
    for row in tree["tree"]:
        path = safe_path(row["path"])
        if path.casefold() in folded:
            raise ValueError(f"Case-colliding path: {path}")
        folded.add(path.casefold())
        if row["type"] == "tree":
            continue
        if row["type"] not in ("blob", "commit"):
            raise ValueError(f"Unsupported tree entry: {path}")
        if row["mode"] not in ("100644", "100755", "120000", "160000"):
            raise ValueError(f"Unsupported Git mode: {path}")
        if not COMMIT.fullmatch(row["sha"]):
            raise ValueError("Invalid Git object identity")
        items[path] = row
    return items


def unpack_checked(payload, tree, target, policy):
    """Extract only verified blobs. Symlinks become inert files holding target bytes."""
    inventory = source_inventory(tree)
    if len(inventory) > policy["max_files"]:
        raise ValueError("File count exceeds policy")
    expected = {p: r for p, r in inventory.items() if r["type"] == "blob"}
    missing_external = [{"path": p, "kind": "submodule", "commit": r["sha"]}
                        for p, r in inventory.items() if r["type"] == "commit"]
    records = []
    seen = set()
    expanded = 0
    with zipfile.ZipFile(io.BytesIO(payload)) as archive:
        roots = {i.filename.split("/")[0] for i in archive.infolist()}
        if len(roots) != 1:
            raise ValueError("Archive must contain exactly one wrapper directory")
        safe_path(next(iter(roots)))
        if len(archive.infolist()) > policy["max_files"] * 3:
            raise ValueError("Excessive archive entry count")
        for item in archive.infolist():
            name = item.filename.partition("/")[2]
            if not name:
                continue
            safe_path(name.rstrip("/"))
            if item.is_dir():
                continue
            if name not in expected or name in seen:
                raise ValueError(f"Unexpected or repeated archive file: {name}")
            seen.add(name)
            expanded += item.file_size
            if expanded > policy["max_expanded_bytes"]:
                raise ValueError("Expanded archive exceeds policy")
            data = archive.read(item)
            row = expected[name]
            if git_blob(data) != row["sha"]:
                raise ValueError(f"Archive blob does not match pinned Git tree: {name}")
            path = inside(target, target / name)
            path.parent.mkdir(parents=True, exist_ok=True)
            with path.open("xb") as output:
                output.write(data)
            if data.startswith(b"version https://git-lfs.github.com/spec/v1\n"):
                missing_external.append({"path": name, "kind": "lfs-pointer"})
            records.append({"path": name, "bytes": len(data), "sha256": digest(data),
                            "git_blob_sha": row["sha"], "git_mode": row["mode"],
                            "representation": "inert-target-text" if row["mode"] == "120000" else "file"})
    if seen != set(expected):
        raise ValueError(f"Archive misses Git blobs: {sorted(set(expected) - seen)[:10]}")
    return sorted(records, key=lambda r: r["path"]), missing_external


def cleanup_stage(root, stage):
    # Only a tool-created temporary directory below this exact root is disposable.
    resolved = inside(root, stage)
    if resolved.parent != Path(root).resolve() or not resolved.name.startswith("capture-"):
        raise ValueError("Refusing cleanup outside owned capture staging")
    shutil.rmtree(resolved)


def capture(vault, args):
    policy_path = vault / "tools/config/repository-library-policy.json"
    policy_bytes = policy_path.read_bytes()
    policy = json.loads(policy_bytes)
    if policy["schema"] != "repository-library-policy/v1" or policy["source_root"] != "repositories":
        raise ValueError("Unsupported repository source policy")
    owner, repo = parse_repo(args.repo_url)
    if not COMMIT.fullmatch(args.commit):
        raise ValueError("An exact lowercase 40-character commit is required")
    if not args.authorization_ref.strip() or not args.selection_reason.strip():
        raise ValueError("Selection reason and task authorization provenance are required")
    selection_mode = getattr(args, "selection_mode", "direct")
    if selection_mode not in ("direct", "delegated"):
        raise ValueError("Selection mode must be direct or delegated")
    repo_id = f"{owner}--{repo}".lower()
    base = inside(vault, vault / "repositories" / repo_id)
    target = inside(vault, base / "snapshots" / args.commit)
    manifest_path = inside(vault, base / "manifests" / f"{args.commit}.json")
    if target.exists() or manifest_path.exists():
        raise ValueError("Snapshot or manifest already exists; verify it instead of overwriting")
    api = f"https://api.github.com/repos/{owner}/{repo}"
    metadata = json.loads(fetch(api, 2_000_000))
    if metadata.get("private") is not False:
        raise ValueError("V1 admits public repositories only; private custody needs a publication contract")
    commit = json.loads(fetch(f"{api}/git/commits/{args.commit}", 2_000_000))
    if commit["sha"] != args.commit:
        raise ValueError("Commit identity mismatch")
    tree = json.loads(fetch(f"{api}/git/trees/{commit['tree']['sha']}?recursive=1", 15_000_000))
    if tree["sha"] != commit["tree"]["sha"]:
        raise ValueError("Tree identity mismatch")
    archive_url = f"https://codeload.github.com/{owner}/{repo}/zip/{args.commit}"
    payload = fetch(archive_url, policy["max_archive_bytes"])
    staging_root = inside(vault, vault / ".tmp/repository-library")
    staging_root.mkdir(parents=True, exist_ok=True)
    stage = Path(tempfile.mkdtemp(prefix="capture-", dir=staging_root))
    try:
        files, unresolved = unpack_checked(payload, tree, stage, policy)
        manifest = {"schema": SCHEMA, "repository_id": repo_id,
                    "repository_url": f"https://github.com/{owner}/{repo}",
                    "commit": args.commit, "tree_sha": tree["sha"],
                    "acquired_at": datetime.now(timezone.utc).isoformat(),
                    "selection": {"status": "approved-for-static-review", "mode": selection_mode,
                                  "actor": "Rolf" if selection_mode == "direct" else "Codex under Rolf's delegated selection",
                                  "reason": args.selection_reason, "authorization_ref": args.authorization_ref},
                    "policy_sha256": digest(policy_bytes), "review_depth": args.review_depth,
                    "visibility": "public", "license": (metadata.get("license") or {}).get("spdx_id", "unknown"),
                    "archive_url": archive_url, "archive_sha256": digest(payload),
                    "archive_bytes": len(payload), "snapshot_path": target.relative_to(vault).as_posix(),
                    "file_count": len(files), "git_blobs_complete": True,
                    "external_payloads_complete": not unresolved, "external_payloads_missing": unresolved,
                    "limitations": ["Git history, dependencies and externally linked documentation are outside the snapshot.",
                                    "Symlink blobs, if present, are inert target text; executable modes are metadata only."],
                    "files": files}
        target.parent.mkdir(parents=True, exist_ok=True)
        manifest_path.parent.mkdir(parents=True, exist_ok=True)
        # Windows rename and exclusive manifest creation never replace admitted bytes.
        if target.exists() or manifest_path.exists():
            raise ValueError("Destination changed during capture")
        os.rename(stage, target)
        with manifest_path.open("x", encoding="utf-8", newline="\n") as output:
            json.dump(manifest, output, indent=2, ensure_ascii=False)
            output.write("\n")
        return {"status": "captured", "manifest": manifest_path.relative_to(vault).as_posix(),
                "commit": args.commit, "files": len(files), "external_payloads_missing": unresolved}
    finally:
        if stage.exists():
            cleanup_stage(staging_root, stage)


def load_manifest(vault, name):
    path = inside(vault, vault / name)
    manifest = json.loads(path.read_text(encoding="utf-8"))
    if manifest.get("schema") != SCHEMA or not COMMIT.fullmatch(manifest.get("commit", "")):
        raise ValueError("Unsupported or invalid manifest")
    owner, repo = parse_repo(manifest["repository_url"])
    identity = f"{owner}--{repo}".lower()
    expected = f"repositories/{identity}/manifests/{manifest['commit']}.json"
    snapshot = f"repositories/{identity}/snapshots/{manifest['commit']}"
    if path.relative_to(vault).as_posix() != expected or manifest["repository_id"] != identity or manifest["snapshot_path"] != snapshot:
        raise ValueError("Manifest, source path and repository identity disagree")
    selection = manifest.get("selection", {})
    if selection.get("status") != "approved-for-static-review" or not selection.get("authorization_ref"):
        raise ValueError("No recorded static-review selection authority")
    policy = vault / "tools/config/repository-library-policy.json"
    if manifest.get("policy_sha256") != digest(policy.read_bytes()):
        raise ValueError("Manifest policy differs from current policy; review compatibility explicitly")
    files = manifest["files"]
    paths = [safe_path(row["path"]) for row in files]
    if len(paths) != len(set(p.casefold() for p in paths)) or len(paths) != manifest["file_count"]:
        raise ValueError("Duplicate paths or invalid manifest count")
    return manifest


def verify(vault, name):
    manifest = load_manifest(vault, name)
    source = inside(vault, vault / manifest["snapshot_path"])
    expected = {row["path"]: row for row in manifest["files"]}
    actual = set()
    if not source.is_dir():
        raise ValueError("Snapshot directory is missing")
    for path in source.rglob("*"):
        inside(source, path)
        if path.is_file():
            name = safe_path(path.relative_to(source).as_posix())
            actual.add(name)
            row = expected.get(name)
            data = path.read_bytes()
            if not row or digest(data) != row["sha256"] or git_blob(data) != row["git_blob_sha"] or len(data) != row["bytes"]:
                raise ValueError(f"Unexpected or changed snapshot file: {name}")
    if actual != set(expected):
        raise ValueError(f"Missing snapshot files: {sorted(set(expected) - actual)[:10]}")
    return {"status": "passed", "files": len(actual), "commit": manifest["commit"],
            "external_payloads_complete": manifest["external_payloads_complete"]}


def frontmatter(path):
    text = path.read_text(encoding="utf-8-sig")
    match = re.match(r"\A---\r?\n(.*?)\r?\n---(?:\r?\n|$)", text, re.S)
    if not match:
        raise ValueError(f"Missing frontmatter: {path.name}")
    # Dossier contract intentionally uses flat YAML scalars plus JSON-compatible lists.
    fields = {}
    for line in match[1].splitlines():
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        key, sep, value = line.partition(":")
        if not sep or not re.fullmatch(r"[a-z_][a-z0-9_]*", key) or key in fields:
            raise ValueError("Use unique flat scalar frontmatter fields")
        value = value.strip()
        if value.startswith(('"', '[')):
            value = json.loads(value)
        fields[key] = value
    return fields, text[match.end():]


def ready(vault, source, intent="ContentLevel"):
    path = inside(vault, vault / source)
    relative = path.relative_to(vault).as_posix()
    match = re.fullmatch(r"repositories/([^/]+)/snapshots/([0-9a-f]{40})/(.+)", relative)
    if not match:
        raise ValueError("Source is not in an admitted snapshot")
    identity, sha, file = match.groups()
    manifest = load_manifest(vault, f"repositories/{identity}/manifests/{sha}.json")
    row = next((r for r in manifest["files"] if r["path"] == file), None)
    data = path.read_bytes()
    if not row or digest(data) != row["sha256"] or git_blob(data) != row["git_blob_sha"]:
        raise ValueError("Source differs from manifest")
    text_readable = False
    try:
        text_readable = b"\0" not in data and bool(data.decode("utf-8-sig") or not data)
    except UnicodeDecodeError:
        pass
    if intent == "InventoryOnly" or text_readable:
        return {"source": relative, "status": "ready", "reason": "inventory-only" if intent == "InventoryOnly" else "verified-text", "target": None}
    slug = re.sub(r"[^a-z0-9]+", "-", Path(file).stem.lower()).strip("-") or "source"
    sidecar = vault / "wiki/_extractions" / (identity + "-" + slug + "-" + sha[:8] + "-" + hashlib.sha256(file.encode()).hexdigest()[:12] + ".md")
    if sidecar.exists():
        fields, body = frontmatter(sidecar)
        if fields.get("source") == relative and fields.get("source_sha256") == row["sha256"] and fields.get("review_status") == "reviewed" and body.strip():
            return {"source": relative, "status": "ready", "reason": "manual-sidecar", "target": sidecar.relative_to(vault).as_posix()}
    return {"source": relative, "status": "blocked", "reason": "Binary source needs an explicitly created and reviewed sidecar; no automatic snapshot conversion.", "target": sidecar.relative_to(vault).as_posix()}


def dossier(vault, path):
    docpath = inside(vault, vault / path)
    fields, body = frontmatter(docpath)
    required = ("type", "status", "repository_id", "repository_url", "reviewed_commit", "snapshot_path", "manifest_path",
                "description", "selection_reason", "topics", "use_when", "avoid_when", "review_depth", "coverage",
                "outcome_verification", "related_pages", "created", "updated")
    if any(not fields.get(key) for key in required):
        raise ValueError("Missing or empty dossier metadata")
    if fields["type"] != "repository-analysis" or fields["status"] != "reviewed" or fields["review_depth"] not in ("docs-only", "deep-static"):
        raise ValueError("Dossier is not a reviewed static analysis")
    manifest = load_manifest(vault, fields["manifest_path"])
    for key, other in (("repository_id", "repository_id"), ("repository_url", "repository_url"), ("reviewed_commit", "commit"), ("snapshot_path", "snapshot_path")):
        if fields[key] != manifest[other]:
            raise ValueError(f"Dossier/manifest mismatch: {key}")
    verify(vault, fields["manifest_path"])
    source_links = 0
    for target in re.findall(r"\]\(([^)]+)\)", body):
        if target.startswith(("https://", "http://", "#")):
            continue
        target = target.split("#")[0]
        from urllib.parse import unquote
        linked = inside(vault, docpath.parent / unquote(target))
        if not linked.exists():
            raise ValueError(f"Unresolved dossier link: {target}")
        if "/snapshots/" in linked.as_posix():
            result = ready(vault, linked.relative_to(vault).as_posix())
            if result["status"] != "ready":
                raise ValueError(f"Binary evidence not ready: {target}")
            source_links += 1
    if not source_links:
        raise ValueError("Dossier has no local source evidence links")
    for page in fields["related_pages"]:
        if not (vault / "wiki" / f"{safe_path(page)}.md").is_file():
            raise ValueError(f"Unknown related wiki page: {page}")
    return {"status": "passed", "source_links": source_links, "commit": manifest["commit"],
            "limitation": "Structure and custody checks do not validate the analysis's semantic conclusions."}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--vault-root", type=Path, default=Path(__file__).resolve().parent.parent)
    commands = parser.add_subparsers(dest="command", required=True)
    cap = commands.add_parser("capture")
    for name in ("repo-url", "commit", "selection-reason", "authorization-ref"):
        cap.add_argument("--" + name, required=True)
    cap.add_argument("--review-depth", choices=("docs-only", "deep-static"), default="deep-static")
    cap.add_argument("--selection-mode", choices=("direct", "delegated"), default="direct")
    ver = commands.add_parser("verify")
    ver.add_argument("--manifest", required=True)
    dos = commands.add_parser("dossier")
    dos.add_argument("--path", required=True)
    rd = commands.add_parser("ready")
    rd.add_argument("--source", action="append", required=True)
    rd.add_argument("--intent", choices=("ContentLevel", "InventoryOnly"), default="ContentLevel")
    args = parser.parse_args()
    vault = args.vault_root.resolve()
    try:
        if args.command == "capture":
            result = capture(vault, args)
        elif args.command == "verify":
            result = verify(vault, args.manifest)
        elif args.command == "dossier":
            result = dossier(vault, args.path)
        else:
            result = [ready(vault, source, args.intent) for source in args.source]
        print(json.dumps(result, ensure_ascii=False, indent=2))
        if isinstance(result, list) and any(r["status"] == "blocked" for r in result):
            return 2
        return 0
    except (ValueError, OSError, KeyError, zipfile.BadZipFile) as exc:
        print(json.dumps({"status": "failed", "error": str(exc)}, ensure_ascii=False))
        return 2


if __name__ == "__main__":
    sys.exit(main())
