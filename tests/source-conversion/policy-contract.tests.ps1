$ErrorActionPreference = "Stop"
$vault = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$validator = Join-Path $vault "tools\test-source-conversion-policy.ps1"
$policyPath = Join-Path $vault "tools\config\source-conversion-policy.json"
& $validator -PolicyPath $policyPath | Out-Null
$temp = Join-Path $vault ".tmp\policy-contract"
if (Test-Path $temp) { Remove-Item -Recurse -Force $temp }
New-Item -ItemType Directory -Force $temp | Out-Null
try {
  foreach ($case in @("root", "extension", "overwrite", "ocr", "mutation", "delete", "semantic", "pdf-pages", "pdf-timeout", "pdf-memory", "pdf-input", "pdf-output")) {
    $copy = Get-Content -Raw $policyPath | ConvertFrom-Json
    switch ($case) {
      "root" { $copy.approved_roots = @("raw/assets", "outside") }
      "extension" { $copy.eligible_extensions += ".exe" }
      "overwrite" { $copy.automatic_actions.overwrite_sidecars = $true }
      "ocr" { $copy.automatic_actions.run_ocr = $true }
      "mutation" { $copy.automatic_actions.modify_sources = $true }
      "delete" { $copy.automatic_actions.delete_files = $true }
      "semantic" { $copy.automatic_actions.semantic_ingest = $true }
      "pdf-pages" { $copy.pdf_limits.max_pages = -1 }
      "pdf-timeout" { $copy.pdf_limits.timeout_seconds = 0 }
      "pdf-memory" { $copy.pdf_limits.memory_mib = 0 }
      "pdf-input" { $copy.pdf_limits.max_input_bytes = 0 }
      "pdf-output" { $copy.pdf_limits.max_output_bytes = 0 }
    }
    $fixture = Join-Path $temp "$case.json"
    $copy | ConvertTo-Json -Depth 8 | Set-Content -Encoding UTF8 $fixture
    try { & $validator -PolicyPath $fixture | Out-Null; throw "Unsafe policy fixture unexpectedly passed: $case" }
    catch { if ($_.Exception.Message -like "Unsafe policy fixture unexpectedly passed*") { throw } }
  }
}
finally { if (Test-Path $temp) { Remove-Item -Recurse -Force $temp } }
Write-Host "Policy contract tests passed."
