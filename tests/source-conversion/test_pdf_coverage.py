"""Synthetic PDFs only. Optional backend doubles test the adapter, not its quality."""
import argparse
import hashlib
import importlib.util
import json
import os
import shutil
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[2]
SPEC = importlib.util.spec_from_file_location("source_converter", ROOT / "tools/source-to-markdown.py")
C = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = C
SPEC.loader.exec_module(C)


class PdfCoverageTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="pdf-contract-")
        self.root = Path(self.temp.name)
        self.source = self.root / "raw/assets/test.pdf"
        self.source.parent.mkdir(parents=True)

    def tearDown(self):
        self.temp.cleanup()

    def pdf(self, count=45, blank=()):
        from reportlab.pdfgen.canvas import Canvas
        canvas = Canvas(str(self.source))
        for n in range(1, count + 1):
            if n not in blank:
                canvas.drawString(40, 700, f"Unique evidence page {n} ENDMARKER-{n} " + "source text " * 5)
            canvas.showPage()
        canvas.save()

    def args(self, **overrides):
        args = vars(C.parse_args([]))
        args.update(backend="builtin", pdf_timeout_seconds=20)
        args.update(overrides)
        return argparse.Namespace(**args)

    def convert(self, **overrides):
        return C.convert_pdf_bounded(self.source, self.args(**overrides))

    def item(self):
        return C.InventoryItem(self.source, "raw", Path("test.pdf"), Path("raw/assets/test.pdf"),
                               ".pdf", self.source.stat().st_size, "2026-09-09", "document", "convert",
                               "wiki/_extractions/test.pdf.md", "")

    def doubles(self, slow=False, memory=False):
        directory = self.root / "doubles"
        directory.mkdir()
        converter = '''from types import SimpleNamespace
from pypdf import PdfReader
class MarkItDown:
 def convert(self, path):
  pages=PdfReader(path).pages
  assert len(pages)==1, "Adapter must preserve page identity"
  text=pages[0].extract_text()
  EXTRA
  return SimpleNamespace(text_content=text)
'''
        extra = "pass"
        if slow:
            extra = "\n  if 'ENDMARKER-2 ' in text:\n   import time; time.sleep(30)"
        if memory:
            extra = "allocation=bytearray(512*1024**2)"
        (directory / "markitdown.py").write_text(converter.replace("EXTRA", extra), encoding="utf8")
        package = directory / "docling"
        (package / "datamodel").mkdir(parents=True)
        (package / "__init__.py").write_text("")
        (package / "datamodel/__init__.py").write_text("")
        (package / "datamodel/base_models.py").write_text("class InputFormat:\n PDF='pdf'\n")
        (package / "datamodel/pipeline_options.py").write_text("class PdfPipelineOptions:\n def __init__(self, do_ocr=True): self.do_ocr=do_ocr\n")
        (package / "document_converter.py").write_text('''from types import SimpleNamespace
from pypdf import PdfReader
class PdfFormatOption:
 def __init__(self,pipeline_options): assert pipeline_options.do_ocr is False
class DocumentConverter:
 def __init__(self,format_options): assert 'pdf' in format_options
 def convert(self,path):
  pages=PdfReader(path).pages
  assert len(pages)==1
  text=pages[0].extract_text()
  return SimpleNamespace(document=SimpleNamespace(export_to_markdown=lambda:text))
''')
        return directory

    def test_default_all_pages_and_late_evidence(self):
        self.pdf()
        before = self.source.read_bytes()
        body, _, backend, cov = self.convert()
        self.assertEqual(C.parse_args([]).max_pdf_pages, 0)
        self.assertEqual((cov["pdf_pages_total"], cov["pdf_pages_processed"]), (45, 45))
        self.assertEqual(cov["pdf_coverage"], "complete")
        self.assertEqual(backend, "builtin")
        self.assertIn("ENDMARKER-45", body)
        self.assertEqual(before, self.source.read_bytes())

    def test_explicit_partial_pages(self):
        self.pdf()
        body, _, _, cov = self.convert(max_pdf_pages=40)
        self.assertNotIn("ENDMARKER-45", body)
        self.assertEqual(cov["pdf_pages_missing"], "41-45")
        self.assertEqual(cov["pdf_stop_reason"], "page-limit")

    def test_all_optional_routes_and_their_limits(self):
        self.pdf()
        doubles = self.doubles()
        with patch.dict(os.environ, {"PYTHONPATH": str(doubles)}):
            for backend, selected in [("markitdown", "markitdown"), ("docling", "docling"), ("auto", "markitdown"), ("pandoc", "builtin")]:
                with self.subTest(backend=backend):
                    body, _, actual, cov = self.convert(backend=backend)
                    self.assertEqual(actual, selected)
                    self.assertEqual(cov["pdf_coverage"], "complete")
                    self.assertIn("ENDMARKER-45", body)
                    _, _, _, cov = self.convert(backend=backend, max_pdf_pages=2)
                    self.assertEqual(cov["pdf_pages_missing"], "3-45")

    def test_auto_fallback_when_optional_libraries_unavailable(self):
        with patch.object(C, "backend_available", side_effect=lambda name: name == "builtin"):
            self.assertEqual(C.resolve_backend("auto", ".pdf"), "builtin")

    def test_late_blank_page_does_not_claim_searchable_text(self):
        self.pdf(blank=(44,))
        body, _, _, cov = self.convert()
        self.assertEqual(cov["pdf_coverage"], "complete")
        self.assertEqual(cov["pdf_pages_without_text"], "44")
        self.assertEqual(cov["pdf_text_quality"], "needs-review")
        self.assertIn("ENDMARKER-45", body)

    def test_scanned_placeholder_is_retained_and_quarantined(self):
        self.pdf(count=2, blank=(1, 2))
        args = self.args()
        created, failures, _ = C.write_conversions([self.item()], self.root, args)
        text = (self.root / self.item().target).read_text(encoding="utf8")
        self.assertEqual((created, failures), (1, []))
        self.assertIn("status: deferred-ocr", text)
        self.assertIn("pdf_pages_without_text: 1,2", text)

    def test_resource_limits_and_validation(self):
        self.pdf()
        _, _, _, cov = self.convert(pdf_max_input_bytes=1)
        self.assertEqual((cov["pdf_coverage"], cov["pdf_stop_reason"]), ("unknown", "input-limit"))
        _, _, _, cov = self.convert(pdf_max_output_bytes=400)
        self.assertEqual(cov["pdf_stop_reason"], "output-limit")
        self.assertGreater(cov["pdf_pages_processed"], 0)
        self.assertLess(cov["pdf_pages_processed"], 45)
        for key, value in [("max_pdf_pages", -1), ("pdf_memory_mib", 0), ("pdf_timeout_seconds", 0)]:
            with self.assertRaises(ValueError):
                self.convert(**{key: value})

    def test_timeout_keeps_completed_pages(self):
        self.pdf(count=2)
        doubles = self.doubles(slow=True)
        started = time.monotonic()
        with patch.dict(os.environ, {"PYTHONPATH": str(doubles)}):
            body, _, _, cov = self.convert(backend="markitdown", pdf_timeout_seconds=3)
        self.assertLess(time.monotonic() - started, 8)
        self.assertEqual(cov["pdf_stop_reason"], "timeout")
        self.assertEqual(cov["pdf_pages_processed"], 1)
        self.assertIn("ENDMARKER-1", body)
        self.assertEqual(cov["pdf_pages_missing"], "2-2")

    def test_memory_is_enforced_in_worker(self):
        self.pdf(count=1)
        doubles = self.doubles(memory=True)
        with patch.dict(os.environ, {"PYTHONPATH": str(doubles)}):
            _, _, _, cov = self.convert(backend="markitdown", pdf_memory_mib=128)
        self.assertNotEqual(cov["pdf_coverage"], "complete")
        self.assertIn(cov["pdf_stop_reason"], ["memory-limit", "worker-failed"])

    def test_corrupt_pdf_is_explicitly_unknown(self):
        self.source.write_bytes(b"not a PDF")
        _, _, _, cov = self.convert()
        self.assertEqual(cov["pdf_coverage"], "unknown")
        self.assertEqual(cov["pdf_stop_reason"], "conversion-error")

    def test_truncated_utf8_checkpoint_preserves_prior_page(self):
        self.pdf(count=2)
        class InterruptedWorker:
            def __init__(self, command, **kwargs):
                records = [{"total": 2}, {"backend": "builtin"},
                           {"page": 1, "text": "## Page 1\n\nkept", "empty": False}]
                Path(command[-1]).write_bytes(("\n".join(json.dumps(r) for r in records) + "\n").encode() + b'\xe2')
            def __enter__(self): return self
            def __exit__(self, *args): pass
            def wait(self, timeout=None):
                if timeout is not None: raise subprocess.TimeoutExpired("worker", timeout)
            def kill(self): pass
        with patch.object(C.subprocess, "Popen", InterruptedWorker):
            body, _, _, cov = self.convert()
        self.assertIn("kept", body)
        self.assertEqual((cov["pdf_pages_processed"], cov["pdf_stop_reason"]), (1, "timeout"))

    def test_pilot_marks_partial_result(self):
        self.pdf()
        args = self.args(max_pdf_pages=40, pilot_backends="builtin")
        self.assertEqual(C.run_pilot([self.item()], self.root, args), 0)
        reports = list(self.root.rglob("*.md"))
        self.assertTrue(any("review(partial/page-limit)" in p.read_text(encoding="utf8") for p in reports))

    def test_sidecar_audit_and_create_only(self):
        self.pdf()
        args = self.args(max_pdf_pages=40)
        C.write_conversions([self.item()], self.root, args)
        target = self.root / self.item().target
        before = target.read_bytes()
        audit = C.audit_markdown_file(target, self.root)
        self.assertIn("pdf-coverage-incomplete", audit.issues)
        self.assertNotEqual(audit.status, "ok")
        created, failures, _ = C.write_conversions([self.item()], self.root, self.args())
        self.assertEqual((created, failures), (0, []))
        self.assertEqual(target.read_bytes(), before)

    def test_complete_and_tampered_audit(self):
        self.pdf()
        C.write_conversions([self.item()], self.root, self.args())
        target = self.root / self.item().target
        self.assertEqual(C.audit_markdown_file(target, self.root).status, "ok")
        text = target.read_text(encoding="utf8")
        target.write_text(text.replace("## Page 45", "## Page 44"), encoding="utf8")
        self.assertIn("pdf-coverage-invalid", C.audit_markdown_file(target, self.root).issues)

    def test_powershell_readiness_complete_partial_and_legacy(self):
        self.pdf()
        C.write_conversions([self.item()], self.root, self.args())
        target = self.root / self.item().target
        registry = self.root / "registry.csv"
        registry.write_text('source,state,target,sha256\nraw/assets/test.pdf,green,wiki/_extractions/test.pdf.md,' + hashlib.sha256(self.source.read_bytes()).hexdigest(), encoding="utf8")
        script = self.root / "gate.ps1"
        script.write_text('param($Tools,$Vault)\nImport-Module Microsoft.PowerShell.Utility\n. (Join-Path $Tools "source-conversion-readiness.ps1")\nGet-SourceConversionReadiness -Source "raw/assets/test.pdf" -RegistryPath (Join-Path $Vault "registry.csv") -VaultRoot $Vault | ConvertTo-Json -Depth 5', encoding="utf8")
        def check():
            env = dict(os.environ)
            env.pop("PSMODULEPATH", None)  # Python normalizes Windows environment keys to uppercase.
            env["PSModulePath"] = str(Path(os.environ["SystemRoot"]) / "System32/WindowsPowerShell/v1.0/Modules")
            return json.loads(subprocess.check_output(["powershell.exe", "-NoProfile", "-File", str(script), str(ROOT / "tools"), str(self.root)], encoding="utf8", env=env))
        self.assertEqual(check()["status"], "ready")
        text = target.read_text(encoding="utf8")
        target.write_text(text.replace("pdf_coverage: complete", "pdf_coverage: partial"), encoding="utf8")
        self.assertEqual(check()["reason"], "pdf-coverage-incomplete")
        target.write_text(text.replace("pdf_coverage_version: 1", "old_coverage_version: 1"), encoding="utf8")
        self.assertEqual(check()["reason"], "pdf-coverage-unknown")
        target.write_text(text.replace("pdf_coverage: complete", "pdf_coverage: unknown").replace("pdf_pages_total: 45", "pdf_pages_total: -1"), encoding="utf8")
        self.assertEqual(check()["reason"], "pdf-coverage-unknown")

    def test_policy_runner_full_pdf_then_partial_and_no_regeneration(self):
        self.pdf()
        (self.root / "research/assets").mkdir(parents=True)
        (self.root / "tools/config").mkdir(parents=True)
        for name in ["run-vault-source-conversion.ps1", "run-source-extraction.ps1", "source-to-markdown.py",
                     "test-source-conversion-policy.ps1", "resolve-python-runtime.ps1"]:
            shutil.copyfile(ROOT / "tools" / name, self.root / "tools" / name)
        for name in ["source-conversion-policy.json", "python-runtime-contract.json"]:
            shutil.copyfile(ROOT / "tools/config" / name, self.root / "tools/config" / name)
        policy_path = self.root / "tools/config/source-conversion-policy.json"
        policy = json.loads(policy_path.read_text(encoding="utf-8-sig"))
        policy["backend"] = "builtin"
        policy_path.write_text(json.dumps(policy), encoding="utf8")
        manifest = self.root / "manifest.txt"
        manifest.write_text("raw/assets/test.pdf\n", encoding="utf8")
        env = dict(os.environ)
        env.pop("PSMODULEPATH", None)
        env["PSModulePath"] = str(Path(os.environ["SystemRoot"]) / "System32/WindowsPowerShell/v1.0/Modules")
        bootstrap = self.root / "run-fixture.ps1"
        bootstrap.write_text('param($Manifest)\nImport-Module Microsoft.PowerShell.Utility\n& (Join-Path $PSScriptRoot "tools/run-vault-source-conversion.ps1") -Mode Manifest -Manifest $Manifest', encoding="utf8")
        command = ["powershell.exe", "-NoProfile", "-File", str(bootstrap), str(manifest)]
        def run():
            result = subprocess.run(command, capture_output=True, env=env, timeout=60)
            self.assertEqual(result.returncode, 0, result.stdout.decode(errors="replace") + result.stderr.decode(errors="replace"))
            import csv
            with (self.root / "wiki/_outputs/source-conversions/source-conversion-registry.csv").open(encoding="utf-8-sig") as handle:
                return {r["source"]: r for r in csv.DictReader(handle)}
        rows = run()
        self.assertEqual(rows["raw/assets/test.pdf"]["state"], "green")
        full_target = self.root / rows["raw/assets/test.pdf"]["target"]
        full_bytes = full_target.read_bytes()
        self.assertIn(b"ENDMARKER-45", full_bytes)
        shutil.copyfile(self.source, self.source.with_name("partial.pdf"))
        manifest.write_text("raw/assets/partial.pdf\n", encoding="utf8")
        policy["pdf_limits"]["max_pages"] = 2
        policy_path.write_text(json.dumps(policy), encoding="utf8")
        rows = run()
        partial = rows["raw/assets/partial.pdf"]
        self.assertEqual((partial["state"], partial["pdf_pages_missing"]), ("amber", "3-45"))
        partial_target = self.root / partial["target"]
        before = partial_target.read_bytes()
        policy["pdf_limits"]["max_pages"] = 0
        policy_path.write_text(json.dumps(policy), encoding="utf8")
        run()
        self.assertEqual(partial_target.read_bytes(), before)
        self.assertEqual(full_target.read_bytes(), full_bytes)


if __name__ == "__main__":
    unittest.main(verbosity=2)
