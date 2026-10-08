"""Isolated fixtures only: never access the real inbox or public network."""
import hashlib
import io
from pathlib import Path
import socket
import tempfile
import unittest
from unittest.mock import MagicMock, patch

import acquisition as acq


def digest(data):
    return hashlib.sha256(data).hexdigest()


class AcquisitionTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.vault = self.root / "vault"
        self.staging = self.root / "staging"
        self.vault.mkdir()
        self.staging.mkdir()

    def fixture(self, relative, data):
        target = self.vault / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
        return target

    def admitted(self, suffix=".pdf", data=b"%PDF-1.7\nfixture"):
        name = "fictional-company/run-1/report" + suffix
        destination = ("raw/assets/" if suffix == ".pdf" else "raw/imports/") + name
        self.fixture(destination, data)
        submission = {"input": name, "lane": "raw", "sha256": digest(data)}
        receipt = {**submission, "destination": destination, "status": "admitted"}
        return submission, receipt

    def ready(self, receipt, *, exists=True, sha=None):
        target = "wiki/_extractions/report.md"
        if exists:
            self.fixture(target, ("---\nsource_sha256: " + (sha or receipt["sha256"]) + "\n---\nText\n").encode())
        return {"source": receipt["destination"], "status": "ready", "intent": "ContentLevel", "target": target, "reason": "validated-sidecar"}

    def test_prepare_complete_copy_new_only(self):
        staged = self.staging / "fixture.pdf"
        data = b"%PDF-1.7\nfake"
        staged.write_bytes(data)
        submission = acq.prepare_inbox(staged, self.vault, "fictional-company/v1.pdf", digest(data))
        self.assertEqual(submission["input"], "fictional-company/v1.pdf")
        inbox = self.vault / "inbox/raw/fictional-company/v1.pdf"
        self.assertEqual(inbox.read_bytes(), data)
        staged.write_bytes(b"changed")
        self.assertEqual(inbox.read_bytes(), data)
        with self.assertRaises(acq.AcquisitionError):
            acq.prepare_inbox(staged, self.vault, submission["input"], digest(b"changed"))
        self.assertEqual(inbox.read_bytes(), data)
        self.assertFalse(list(self.vault.glob(".company-intelligence-transfer-*")))

    def test_prepare_rejects_traversal_and_hash(self):
        staged = self.staging / "fixture.md"
        staged.write_text("test")
        for relative in ("../escape.md", "C:/escape.md", "project/../../escape.md", "unprefixed.md", "project/NUL.md", "project/a.md:stream"):
            with self.subTest(relative=relative), self.assertRaises(acq.AcquisitionError):
                acq.prepare_inbox(staged, self.vault, relative, digest(b"test"))
        with self.assertRaises(acq.AcquisitionError):
            acq.prepare_inbox(staged, self.vault, "project/test.md", "0" * 64)
        self.assertFalse((self.vault / "inbox").exists())

    def test_admitted_binary_remains_blocked_until_verified_sidecar(self):
        submission, receipt = self.admitted()
        blocked = acq.reconcile_receipt(self.vault, submission, receipt)
        self.assertEqual(blocked["local_path"], receipt["destination"])
        self.assertEqual(blocked["readiness_status"], "blocked")
        ready = acq.reconcile_receipt(self.vault, submission, receipt, self.ready(receipt))
        self.assertEqual(ready["readiness_status"], "ready")
        self.assertEqual(ready["extraction_path"], "wiki/_extractions/report.md")

    def test_missing_or_stale_sidecar_does_not_become_ready(self):
        submission, receipt = self.admitted()
        for variant in ("missing", "stale"):
            readiness = self.ready(receipt, exists=variant != "missing", sha="0" * 64)
            actual = acq.reconcile_receipt(self.vault, submission, receipt, readiness)
            self.assertEqual(actual["readiness_status"], "blocked")
            self.assertIsNone(actual["extraction_path"])

    def test_inventory_readiness_and_other_source_rejected(self):
        submission, receipt = self.admitted()
        readiness = self.ready(receipt)
        for invalid in ({**readiness, "intent": "InventoryOnly"}, {**readiness, "source": "raw/assets/other/report.pdf"}, {**readiness, "target": "raw/assets/not-sidecar.md"}):
            with self.subTest(invalid=invalid), self.assertRaises(acq.AcquisitionError):
                acq.reconcile_receipt(self.vault, submission, receipt, invalid)

    def test_native_no_sidecar_and_explicit_block_preserved(self):
        submission, receipt = self.admitted(".html", b"<html>Example</html>")
        result = acq.reconcile_receipt(self.vault, submission, receipt)
        self.assertEqual(result["readiness_status"], "ready")
        readiness = {"source": receipt["destination"], "status": "blocked", "intent": "ContentLevel", "reason": "manual-review", "target": None}
        self.assertEqual(acq.reconcile_receipt(self.vault, submission, receipt, readiness)["readiness_status"], "blocked")

    def test_duplicate_reuses_only_exact_authorized_canonical_file(self):
        submission, receipt = self.admitted()
        quarantine = "inbox/_quarantine/duplicates/raw/" + submission["input"]
        self.fixture(quarantine, b"%PDF-1.7\nfixture")
        duplicate = {**receipt, "status": "quarantined-duplicate", "destination": quarantine}
        actual = acq.reconcile_receipt(self.vault, submission, duplicate)
        self.assertEqual(actual["local_path"], receipt["destination"])
        other = {**duplicate, "destination": quarantine.replace("fictional-company", "foreign-company")}
        with self.assertRaises(acq.AcquisitionError):
            acq.reconcile_receipt(self.vault, submission, other)
        self.fixture(receipt["destination"], b"different canonical version")
        with self.assertRaises(acq.AcquisitionError):
            acq.reconcile_receipt(self.vault, submission, duplicate)

    def test_changed_version_requires_distinct_path(self):
        submission, receipt = self.admitted()
        changed = b"%PDF-2.0\nnew version"
        staged = self.staging / "report-v2.pdf"
        staged.write_bytes(changed)
        new = acq.prepare_inbox(staged, self.vault, "fictional-company/run-1/report-v2.pdf", digest(changed))
        new_destination = "raw/assets/" + new["input"]
        self.fixture(new_destination, changed)
        new_receipt = {**new, "destination": new_destination, "status": "admitted"}
        self.assertNotEqual(acq.reconcile_receipt(self.vault, new, new_receipt)["sha256"], receipt["sha256"])
        self.assertEqual(acq.sha256_file(self.vault / receipt["destination"]), submission["sha256"])
        with self.assertRaises(acq.AcquisitionError):
            acq.reconcile_receipt(self.vault, new, {**new_receipt, "status": "quarantined-conflict"})

    def test_foreign_receipt_hash_or_destination_rejected(self):
        submission, receipt = self.admitted()
        variants = [
            {**receipt, "input": "other/run-1/report.pdf"},
            {**receipt, "sha256": "0" * 64},
            {**receipt, "lane": "research"},
            {**receipt, "destination": "../outside.pdf"},
            {**receipt, "destination": "raw/imports/" + submission["input"]},
            {**receipt, "destination": "raw/assets/other/report.pdf"},
        ]
        for variant in variants:
            with self.subTest(variant=variant), self.assertRaises(acq.AcquisitionError):
                acq.reconcile_receipt(self.vault, submission, variant)

    def test_containment_rejects_links(self):
        outside = self.root / "outside"
        outside.mkdir()
        link = self.vault / "linked"
        try:
            link.symlink_to(outside, target_is_directory=True)
        except OSError:
            self.skipTest("OS does not permit fixture symlinks")
        with self.assertRaises(acq.AcquisitionError):
            acq._contained(self.vault, "linked/file.pdf")

    def mocked_response(self, body, content_type="application/pdf", status=200, location=None, length=None):
        response = MagicMock()
        response.status = status
        response.read1.side_effect = io.BytesIO(body).read
        headers = {"Content-Type": content_type, "Content-Length": str(len(body)) if length is None else length, "Location": location}
        response.getheader.side_effect = lambda key: headers.get(key)
        return response

    def dns(self, host, port, **kwargs):
        ip = "127.0.0.1" if host == "internal.example" else "93.184.216.34"
        return [(socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP, "", (ip, port))]

    def download(self, responses, **kwargs):
        with patch.object(acq.socket, "getaddrinfo", side_effect=self.dns), patch.object(acq.socket, "socket") as sock, patch.object(acq.http.client, "HTTPConnection") as connection:
            connection.return_value.getresponse.side_effect = responses
            actual = acq.download_source("http://public.example/report.pdf", self.staging, "report.pdf", **kwargs)
            sock.return_value.connect.assert_called_with(("93.184.216.34", 80))
            return actual

    def test_download_success_and_no_overwrite(self):
        data = b"%PDF-1.7\nfixture"
        actual = self.download([self.mocked_response(data)])
        self.assertEqual(Path(actual["staged_path"]).read_bytes(), data)
        self.assertEqual(actual["sha256"], digest(data))
        with self.assertRaises(acq.AcquisitionError):
            self.download([self.mocked_response(b"%PDF-changed")])
        self.assertEqual(Path(actual["staged_path"]).read_bytes(), data)

    def test_download_private_redirect_rejected(self):
        response = self.mocked_response(b"", status=302, location="http://internal.example/secret")
        with self.assertRaisesRegex(acq.AcquisitionError, "non-public"):
            self.download([response])
        self.assertFalse(list(self.staging.iterdir()))

    def test_download_rejects_bad_magic_mime_size_partial_and_http(self):
        cases = [
            (self.mocked_response(b"<html>not PDF</html>"), {}),
            (self.mocked_response(b"%PDF-1.7", "text/html"), {}),
            (self.mocked_response(b"%PDF-1.7"), {"max_bytes": 3}),
            (self.mocked_response(b"%PDF-1.7", length="100"), {}),
            (self.mocked_response(b"%PDF-1.7", status=404), {}),
        ]
        for response, kwargs in cases:
            with self.subTest(kwargs=kwargs), self.assertRaises(acq.AcquisitionError):
                self.download([response], **kwargs)
            self.assertFalse(list(self.staging.iterdir()))

    def test_private_and_ambiguous_dns_rejected_before_connection(self):
        for ip in ("127.0.0.1", "10.1.2.3", "169.254.169.254", "::1", "fc00::1", "0.0.0.0", "224.0.0.1"):
            addresses = [(socket.AF_INET, socket.SOCK_STREAM, 6, "", ("93.184.216.34", 80)), (socket.AF_INET, socket.SOCK_STREAM, 6, "", (ip, 80))]
            with self.subTest(ip=ip), patch.object(acq.socket, "getaddrinfo", return_value=addresses), self.assertRaises(acq.AcquisitionError):
                acq._public_target("http://example.test/a")
        for url in ("file:///private", "http://localhost/a", "http://user:secret@example.test/a", "http://example.test/\r\ninjection"):
            with self.subTest(url=url), self.assertRaises(acq.AcquisitionError):
                acq._public_target(url)

    def test_streaming_limit_and_interruption_clean_staging(self):
        response = self.mocked_response(b"%PDF-1.7\n" + b"x" * 20)
        response.getheader.side_effect = lambda key: {"Content-Type": "application/pdf"}.get(key)
        with self.assertRaisesRegex(acq.AcquisitionError, "byte limit"):
            self.download([response], max_bytes=10)
        self.assertFalse(list(self.staging.iterdir()))
        interrupted = self.mocked_response(b"%PDF-1.7")
        interrupted.read1.side_effect = [b"%PDF-", ConnectionError("fixture disconnect")]
        with self.assertRaises(ConnectionError):
            self.download([interrupted])
        self.assertFalse(list(self.staging.iterdir()))

    def test_real_importer_backslashes_and_renamed_duplicate(self):
        submission, receipt = self.admitted()
        original_name = Path(submission["input"]).stem
        renamed = original_name + "-20260909-123456-123-a1b2c3d4-b1c2d3e4.pdf"
        quarantine = "inbox/_quarantine/duplicates/raw/" + str(Path(submission["input"]).with_name(renamed)).replace("\\", "/")
        self.fixture(quarantine, b"%PDF-1.7\nfixture")
        duplicate = {**receipt, "input": submission["input"].replace("/", "\\"), "destination": quarantine.replace("/", "\\"), "status": "quarantined-duplicate"}
        self.assertEqual(acq.reconcile_receipt(self.vault, submission, duplicate)["local_path"], receipt["destination"])


if __name__ == "__main__":
    unittest.main()
