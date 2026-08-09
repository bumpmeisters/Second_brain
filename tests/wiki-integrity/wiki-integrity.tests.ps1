$ErrorActionPreference = 'Stop'
$repo = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$tempRoot = Join-Path ([IO.Path]::GetTempPath()) ('wiki-integrity-' + [guid]::NewGuid().ToString('N'))
try {
    New-Item -ItemType Directory -Force (Join-Path $tempRoot 'tools'), (Join-Path $tempRoot 'wiki/newsletters'), (Join-Path $tempRoot 'wiki/_outputs/newsletter-intelligence'), (Join-Path $tempRoot 'wiki/_outputs/source-conversions'), (Join-Path $tempRoot 'raw/assets'), (Join-Path $tempRoot 'research') | Out-Null
    Copy-Item -LiteralPath (Join-Path $repo 'tools/test-wiki-integrity.ps1') -Destination (Join-Path $tempRoot 'tools/test-wiki-integrity.ps1')
    Set-Content -LiteralPath (Join-Path $tempRoot 'raw/source.md') -Encoding UTF8 -Value '# Source'
    Set-Content -LiteralPath (Join-Path $tempRoot 'raw/assets/unreviewed.pdf') -Encoding UTF8 -Value 'fixture'
    Set-Content -LiteralPath (Join-Path $tempRoot 'research/report.md') -Encoding UTF8 -Value '# Research'
    @'
---
type: concept
status: active
sources:
  - raw/source.md
---
# Good Page
**Summary**: Fixture page.
'@ | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/good-page.md') -Encoding UTF8
    @'
---
type: source-register
status: active
sources: []
---
# Sources
**Summary**: Local source register linked to [[good-page]].
| Source | Status |
|---|---|
| `raw/source.md` | ingested |
| `research/report.md` | inventory-only |
| `wiki/_outputs/report.md` | generated output mentioning `raw/assets` |
'@ | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/sources.md') -Encoding UTF8
    @'
---
type: index
status: active
sources:
  - wiki/_outputs/newsletter-intelligence/identity-registry.json
updated: 2026-08-08
---
# Newsletter Dossiers
**Summary**: Fixture.
- **Selected canonical newsletters**: 0
- **Qualified streams represented**: 0
<!-- BEGIN GENERATED SELECTED DOSSIERS -->
| Newsletter | Streams | Issues analyzed | Coverage | Identity |
|---|---:|---:|---|---|
<!-- END GENERATED SELECTED DOSSIERS -->
'@ | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/newsletters/index.md') -Encoding UTF8
    '{"record_type":"newsletter_identity_registry","canonical_newsletters":[]}' | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/_outputs/newsletter-intelligence/identity-registry.json') -Encoding UTF8
    '"source","target"' | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/_outputs/source-conversions/source-conversion-registry.csv') -Encoding UTF8

    $lintTool = Join-Path $tempRoot 'tools/test-wiki-integrity.ps1'
    $cleanJson = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $lintTool -VaultRoot $tempRoot -Profile Fast -Json 2>&1 | Out-String
    if ($LASTEXITCODE -ne 0) { throw 'Clean fixture did not pass wiki integrity.' }
    $clean = $cleanJson | ConvertFrom-Json
    foreach ($rule in @('sources.coverage-tool', 'newsletter.generator')) {
        $finding = $clean.findings | Where-Object rule_id -eq $rule
        if (-not $finding -or $finding.severity -ne 'warning') { throw "Deferred integration was not reported as a warning: $rule" }
    }

    Add-Content -LiteralPath (Join-Path $tempRoot 'wiki/good-page.md') -Encoding UTF8 -Value 'C:/Users/example/outside.txt'
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $json = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $lintTool -VaultRoot $tempRoot -Profile Fast -Json 2>&1 | Out-String
    $ErrorActionPreference = $previousErrorActionPreference
    if ($LASTEXITCODE -ne 2 -or $json -notmatch 'source.absolute-path') { throw 'Absolute active source path did not fail closed.' }
    (Get-Content -LiteralPath (Join-Path $tempRoot 'wiki/good-page.md') -Encoding UTF8 | Where-Object { $_ -notmatch '^C:/Users/' }) | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/good-page.md') -Encoding UTF8

    Write-Host 'Wiki integrity tests passed.'
} finally {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}
