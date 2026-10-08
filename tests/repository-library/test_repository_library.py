import importlib.util
import csv
import io
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
import zipfile

ROOT = Path(__file__).resolve().parents[2]
SPEC = importlib.util.spec_from_file_location("library", ROOT / "tools/repository_library.py")
lib = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(lib)
POLICY = json.loads((ROOT / "tools/config/repository-library-policy.json").read_text())


def powershell_environment():
    # Windows PowerShell fixtures must not import PowerShell 7 modules from the host runtime.
    environment = {key: value for key, value in os.environ.items() if key.casefold() != "psmodulepath"}
    system_root = next(value for key, value in environment.items() if key.casefold() == "systemroot")
    environment["PSModulePath"] = str(Path(system_root) / "System32/WindowsPowerShell/v1.0/Modules")
    return environment


def bundle(files):
    payload = io.BytesIO()
    tree = {"sha": "b" * 40, "truncated": False, "tree": []}
    with zipfile.ZipFile(payload, "w") as archive:
        for path, data, mode in files:
            archive.writestr("repo-commit/" + path, data)
            tree["tree"].append({"path": path, "type": "blob", "mode": mode, "sha": lib.git_blob(data)})
    return payload.getvalue(), tree


class CustodyTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="repository-library-test-")
        self.root = Path(self.temp.name).resolve()

    def tearDown(self):
        # TemporaryDirectory owns this exact directory; never a computed vault/source root.
        self.assertTrue(self.root.name.startswith("repository-library-test-"))
        self.assertEqual(self.root.parent, Path(tempfile.gettempdir()).resolve())
        self.temp.cleanup()

    def extract(self, files):
        payload, tree = bundle(files)
        return lib.unpack_checked(payload, tree, self.root, POLICY)

    def test_exact_bytes_and_executable_mode_are_preserved_without_execution(self):
        data = b"#!/bin/sh\r\necho do-not-run\r\n"
        rows, missing = self.extract([("hooks/start.sh", data, "100755")])
        self.assertEqual((self.root / "hooks/start.sh").read_bytes(), data)
        self.assertEqual(rows[0]["git_mode"], "100755")
        self.assertEqual(missing, [])

    def test_symlink_blob_is_inert_and_does_not_follow_target(self):
        rows, _ = self.extract([("link", b"../../outside", "120000")])
        self.assertFalse((self.root / "link").is_symlink())
        self.assertEqual(rows[0]["representation"], "inert-target-text")

    def test_lfs_payload_is_reported_missing(self):
        _, missing = self.extract([("image.png", b"version https://git-lfs.github.com/spec/v1\noid sha256:abc\n", "100644")])
        self.assertEqual(missing[0]["kind"], "lfs-pointer")

    def test_submodule_is_explicitly_unresolved(self):
        payload, tree = bundle([("README.md", b"hello", "100644")])
        tree["tree"].append({"path": "vendor/dependency", "type": "commit", "mode": "160000", "sha": "a" * 40})
        _, missing = lib.unpack_checked(payload, tree, self.root, POLICY)
        self.assertEqual(missing[0]["kind"], "submodule")

    def test_unsafe_windows_paths_are_rejected(self):
        for path in ("../escape", "/escape", "a\\b", "NUL.txt", "a:stream", ".git/config", "bad./file", "x/../y"):
            with self.subTest(path=path), self.assertRaises(ValueError):
                lib.safe_path(path)

    def test_case_collision_and_truncated_tree_fail(self):
        _, tree = bundle([("Readme.md", b"a", "100644"), ("README.md", b"b", "100644")])
        with self.assertRaises(ValueError):
            lib.source_inventory(tree)
        tree["truncated"] = True
        with self.assertRaises(ValueError):
            lib.source_inventory(tree)

    def test_blob_mismatch_and_missing_file_fail(self):
        payload, tree = bundle([("README.md", b"hello", "100644")])
        tree["tree"][0]["sha"] = "c" * 40
        with self.assertRaises(ValueError):
            lib.unpack_checked(payload, tree, self.root, POLICY)
        payload, tree = bundle([("README.md", b"hello", "100644")])
        tree["tree"].append({"path": "missing.md", "type": "blob", "mode": "100644", "sha": "a" * 40})
        with self.assertRaises(ValueError):
            lib.unpack_checked(payload, tree, self.root, POLICY)

    def test_expansion_limit(self):
        payload, tree = bundle([("README.md", b"hello", "100644")])
        with self.assertRaises(ValueError):
            lib.unpack_checked(payload, tree, self.root, {**POLICY, "max_expanded_bytes": 1})

    def captured_fixture(self):
        policy_path = self.root / "tools/config/repository-library-policy.json"
        policy_path.parent.mkdir(parents=True)
        policy_path.write_text(json.dumps(POLICY))
        payload, tree = bundle([("README.md", b"hello", "100644"), ("image.pdf", b"%PDF\0binary", "100644")])
        args = lib.argparse.Namespace(repo_url="https://github.com/owner/repo", commit="a" * 40,
                                      selection_reason="fixture", authorization_ref="test only", review_depth="deep-static")
        def download(url, limit):
            if "codeload" in url:
                return payload
            if "/git/commits/" in url:
                return json.dumps({"sha": args.commit, "tree": {"sha": tree["sha"]}}).encode()
            if "/git/trees/" in url:
                return json.dumps(tree).encode()
            return b'{"private":false,"license":{"spdx_id":"MIT"}}'
        with patch.object(lib, "fetch", side_effect=download):
            result = lib.capture(self.root, args)
        return args, result

    def test_capture_verify_no_overwrite_readiness_and_tamper_detection(self):
        args, result = self.captured_fixture()
        self.assertEqual(lib.verify(self.root, result["manifest"])["files"], 2)
        selection = json.loads((self.root / result["manifest"]).read_text())["selection"]
        self.assertEqual(selection["mode"], "direct")
        self.assertEqual(selection["actor"], "Rolf")
        with self.assertRaises(ValueError), patch.object(lib, "fetch", side_effect=AssertionError("no network on repeat")):
            lib.capture(self.root, args)
        source = f"repositories/owner--repo/snapshots/{args.commit}/README.md"
        self.assertEqual(lib.ready(self.root, source)["status"], "ready")
        binary = source.replace("README.md", "image.pdf")
        self.assertEqual(lib.ready(self.root, binary)["status"], "blocked")
        self.assertEqual(lib.ready(self.root, binary, "InventoryOnly")["status"], "ready")
        (self.root / source).write_bytes(b"changed")
        with self.assertRaises(ValueError):
            lib.verify(self.root, result["manifest"])
        with self.assertRaises(ValueError):
            lib.ready(self.root, source)

    def test_policy_change_fails_closed(self):
        _, result = self.captured_fixture()
        path = self.root / "tools/config/repository-library-policy.json"
        path.write_text(json.dumps({**POLICY, "max_files": 99}))
        with self.assertRaises(ValueError):
            lib.verify(self.root, result["manifest"])

    def test_binary_sidecar_requires_review_and_matching_source_hash(self):
        args, _ = self.captured_fixture()
        source = f"repositories/owner--repo/snapshots/{args.commit}/image.pdf"
        result = lib.ready(self.root, source)
        target = self.root / result["target"]
        target.parent.mkdir(parents=True)
        source_hash = lib.digest((self.root / source).read_bytes())
        def sidecar(status, content_hash):
            target.write_text(f'---\nsource: "{source}"\nsource_sha256: "{content_hash}"\nreview_status: {status}\n---\nReadable fixture\n')
        sidecar("draft", source_hash)
        self.assertEqual(lib.ready(self.root, source)["status"], "blocked")
        sidecar("reviewed", "0" * 64)
        self.assertEqual(lib.ready(self.root, source)["status"], "blocked")
        sidecar("reviewed", source_hash)
        self.assertEqual(lib.ready(self.root, source)["reason"], "manual-sidecar")

    def test_dossier_rejects_mismatched_commit_and_broken_evidence_link(self):
        args, result = self.captured_fixture()
        manifest = json.loads((self.root / result["manifest"]).read_text())
        (self.root / "wiki").mkdir()
        (self.root / "wiki/existing.md").write_text("# Existing")
        fields = dict(type="repository-analysis", status="reviewed", repository_id="owner--repo",
                      repository_url=args.repo_url, reviewed_commit=args.commit,
                      snapshot_path=manifest["snapshot_path"], manifest_path=result["manifest"],
                      description="Fixture", selection_reason="Fixture", topics=["testing"],
                      use_when="Testing", avoid_when="Real knowledge work", review_depth="deep-static",
                      coverage="One text file", outcome_verification="not-run", related_pages=["existing"],
                      created="2026-09-11", updated="2026-09-11")
        target = self.root / "repositories/owner--repo/owner--repo-analysis.md"
        def write_doc(link="README.md"):
            target.write_text("---\n" + "\n".join(f"{k}: {json.dumps(v)}" for k, v in fields.items()) +
                              f"\n---\n[Source](snapshots/{args.commit}/{link})\n")
        write_doc()
        self.assertEqual(lib.dossier(self.root, target.relative_to(self.root))["status"], "passed")
        fields["reviewed_commit"] = "b" * 40
        write_doc()
        with self.assertRaisesRegex(ValueError, "mismatch"):
            lib.dossier(self.root, target.relative_to(self.root))
        fields["reviewed_commit"] = args.commit
        write_doc("missing.md")
        with self.assertRaisesRegex(ValueError, "Unresolved dossier link"):
            lib.dossier(self.root, target.relative_to(self.root))

    @unittest.skipUnless(shutil.which("powershell.exe"), "Windows integration")
    def test_semantic_pipeline_enforces_repository_manifest_before_and_after_packaging(self):
        args, _ = self.captured_fixture()
        for name in ("new-semantic-ingest-package.ps1", "test-semantic-ingest-package.ps1", "repository_library.py",
                     "config/semantic-ingest-schema.json", "config/source-selection-policy.json"):
            shutil.copyfile(ROOT / "tools" / name, self.root / "tools" / name)
        quoted_runtime = sys.executable.replace("'", "''")
        (self.root / "tools/resolve-python-runtime.ps1").write_text(
            f"param($Purpose,[switch]$PathOnly)\nWrite-Output '{quoted_runtime}'\n")
        source = f"repositories/owner--repo/snapshots/{args.commit}/README.md"
        intake = dict(canonical_source=source, canonical_title="Fixture", package="P1", subtopic="fixture",
                      source_type="repository-snapshot", status="assigned-ready-for-package-review",
                      sha256=lib.digest((self.root / source).read_bytes()), cross_title_duplicate="false")
        with (self.root / "intake.csv").open("w", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=list(intake))
            writer.writeheader()
            writer.writerow(intake)
        def call(name, *arguments):
            return subprocess.run(["powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
                                   str(self.root / "tools" / name), *arguments], capture_output=True, text=True,
                                  env=powershell_environment())
        generated = call("new-semantic-ingest-package.ps1", "-PackageId", "P1", "-IntakeLedger", "intake.csv")
        self.assertEqual(generated.returncode, 0, generated.stdout + generated.stderr)
        subprocess.run(["git", "-C", str(self.root), "init", "--quiet"], check=True, capture_output=True)
        admission = f"repositories/owner--repo/manifests/{args.commit}.json"
        subprocess.run(["git", "-C", str(self.root), "add", "--", admission], check=True, capture_output=True)
        manifest = "wiki/_outputs/semantic-ingest/p1/package.json"
        before = call("test-semantic-ingest-package.ps1", "-Manifest", manifest, "-Profile", "Full", "-Json")
        self.assertNotIn("REPOSITORY_SOURCE_NOT_READY", before.stdout)
        self.assertNotIn("REPOSITORY_SOURCE_GATE_UNAVAILABLE", before.stdout)
        self.assertNotIn("PROTECTED_SOURCE_MODIFIED", before.stdout)
        self.assertTrue(before.stdout.strip().startswith("{"), before.stdout + before.stderr)
        (self.root / source).write_text("tampered fixture")
        after = call("test-semantic-ingest-package.ps1", "-Manifest", manifest, "-Profile", "Fast", "-Json")
        self.assertNotEqual(after.returncode, 0)
        self.assertIn("REPOSITORY_SOURCE_NOT_READY", after.stdout)
        rejected = call("new-semantic-ingest-package.ps1", "-PackageId", "P1", "-IntakeLedger", "intake.csv",
                        "-OutputDirectory", "wiki/_outputs/semantic-ingest/retry")
        self.assertNotEqual(rejected.returncode, 0)
        self.assertIn("Repository source gate failed", rejected.stderr)
        self.assertFalse((self.root / "wiki/_outputs/semantic-ingest/retry").exists())

    @unittest.skipUnless(shutil.which("powershell.exe"), "Windows integration")
    def test_powershell_gate_handles_single_blocked_and_mixed_batches(self):
        args, _ = self.captured_fixture()
        for name in ("assert-source-ingest-ready.ps1", "source-conversion-readiness.ps1", "repository_library.py", "set-file-transactional.ps1"):
            shutil.copyfile(ROOT / "tools" / name, self.root / "tools" / name)
        (self.root / "tools/config/source-conversion-policy.json").write_text(json.dumps({
            "approved_roots": ["raw"], "native_markdown_extensions": [".md"]}))
        quoted_runtime = sys.executable.replace("'", "''")
        (self.root / "tools/resolve-python-runtime.ps1").write_text(
            f"param($Purpose,[switch]$PathOnly)\nWrite-Output '{quoted_runtime}'\n")
        (self.root / "raw").mkdir()
        (self.root / "raw/legacy.md").write_text("# Synthetic legacy fixture")
        prefix = f"repositories/owner--repo/snapshots/{args.commit}/"
        def call(paths, intent="ContentLevel"):
            manifest = self.root / "readiness-input.txt"
            manifest.write_text("\n".join(paths))
            return subprocess.run(["powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
                                   str(self.root / "tools/assert-source-ingest-ready.ps1"), "-Manifest", str(manifest),
                                   "-Intent", intent, "-Json"], capture_output=True, text=True,
                                  env=powershell_environment())
        single = call([prefix + "README.md"])
        self.assertEqual(single.returncode, 0, single.stderr)
        self.assertEqual(json.loads(single.stdout)[0]["status"], "ready")
        blocked = call([prefix + "image.pdf"])
        self.assertEqual(blocked.returncode, 2, blocked.stdout + blocked.stderr)
        self.assertEqual(json.loads(blocked.stdout)[0]["status"], "blocked")
        mixed = call([prefix + "README.md", prefix + "image.pdf", "raw/legacy.md"])
        self.assertEqual(mixed.returncode, 2, mixed.stdout + mixed.stderr)
        self.assertEqual([row["status"] for row in json.loads(mixed.stdout)], ["ready", "blocked", "ready"])
        inventory = call([prefix + "image.pdf", "raw/legacy.md"], "InventoryOnly")
        self.assertEqual(inventory.returncode, 0, inventory.stderr)
        self.assertEqual(len(json.loads(inventory.stdout)), 2)
        for protected in (prefix + "README.md", f"repositories/owner--repo/manifests/{args.commit}.json"):
            path = self.root / protected
            original = path.read_bytes()
            (self.root / "find.txt").write_text("hello")
            (self.root / "replace.txt").write_text("changed")
            denied = subprocess.run(["powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
                                     str(self.root / "tools/set-file-transactional.ps1"), "-Path", protected,
                                     "-ExpectedSha256", lib.digest(original), "-FindTextFile", str(self.root / "find.txt"),
                                     "-ReplacementTextFile", str(self.root / "replace.txt")], capture_output=True,
                                    text=True, env=powershell_environment())
            self.assertNotEqual(denied.returncode, 0)
            self.assertIn("Protected repository source", denied.stderr)
            self.assertEqual(path.read_bytes(), original)
        (self.root / (prefix + "README.md")).write_text("tampered fixture")
        self.assertNotEqual(call([prefix + "README.md"]).returncode, 0)


if __name__ == "__main__":
    unittest.main()
