$ErrorActionPreference = 'Stop'
$repo = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$tempRoot = Join-Path ([IO.Path]::GetTempPath()) ('source-coverage-' + [guid]::NewGuid().ToString('N'))
$vault = Join-Path $tempRoot 'vault'
$sourceRoot = Join-Path $tempRoot 'sources'
try {
    New-Item -ItemType Directory -Force (Join-Path $vault 'tools'), (Join-Path $vault 'wiki/_outputs/semantic-ingest/fixture'), (Join-Path $sourceRoot 'raw/assets'), (Join-Path $sourceRoot 'research') | Out-Null
    Copy-Item -LiteralPath (Join-Path $repo 'tools/new-source-coverage-inventory.ps1') -Destination (Join-Path $vault 'tools/new-source-coverage-inventory.ps1')
    Set-Content -LiteralPath (Join-Path $sourceRoot 'raw/source.md') -Encoding UTF8 -Value '# Source'
    Set-Content -LiteralPath (Join-Path $sourceRoot 'raw/unknown.md') -Encoding UTF8 -Value '# Unknown'
    Set-Content -LiteralPath (Join-Path $sourceRoot 'raw/assets/document.pdf') -Encoding UTF8 -Value 'immutable fixture'
    $hiddenPath = Join-Path $sourceRoot 'raw/assets/hidden.txt'
    Set-Content -LiteralPath $hiddenPath -Encoding UTF8 -Value 'hidden fixture'
    (Get-Item -LiteralPath $hiddenPath).Attributes = (Get-Item -LiteralPath $hiddenPath).Attributes -bor [IO.FileAttributes]::Hidden
    Set-Content -LiteralPath (Join-Path $sourceRoot 'research/report.md') -Encoding UTF8 -Value '# Research'
    @'
# Sources

| Source | Type | Status |
|---|---|---|
| `raw/source.md` | Markdown | content-ingested |
| `raw/unknown.md` | Markdown | mystery-status |
| `raw/assets/` | Folder | inventory-only |
'@ | Set-Content -LiteralPath (Join-Path $vault 'wiki/sources.md') -Encoding UTF8
    @'
"canonical_source","semantic_decision"
"raw/source.md","new-claim"
"raw/assets/document.pdf","out-of-scope"
"research/report.md","pending"
'@ | Set-Content -LiteralPath (Join-Path $vault 'wiki/_outputs/semantic-ingest/fixture/decisions.csv') -Encoding UTF8

    $tool = Join-Path $vault 'tools/new-source-coverage-inventory.ps1'
    $sourceHash = (Get-FileHash -LiteralPath (Join-Path $sourceRoot 'raw/assets/document.pdf') -Algorithm SHA256).Hash
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $vault -SourceRoot $sourceRoot 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Split-root source coverage generation failed.' }
    $output = Join-Path $vault 'wiki/_outputs/source-coverage/source-inventory.csv'
    $rows = @(Import-Csv -LiteralPath $output -Encoding UTF8)
    if ($rows.Count -ne 5) { throw "Expected five inventory rows, found $($rows.Count)." }
    $registered = $rows | Where-Object source_path -eq 'raw/source.md'
    $unknown = $rows | Where-Object source_path -eq 'raw/unknown.md'
    $binary = $rows | Where-Object source_path -eq 'raw/assets/document.pdf'
    $research = $rows | Where-Object source_path -eq 'research/report.md'
    $hidden = $rows | Where-Object source_path -eq 'raw/assets/hidden.txt'
    if ($registered.coverage_status -ne 'content-ingested') { throw 'Exact source-register coverage was not preserved.' }
    if ($unknown.coverage_status -ne 'pending-review') { throw 'Unknown source-register status was promoted beyond review.' }
    if ($binary.source_kind -ne 'binary-library' -or $binary.coverage_status -ne 'inventory-only') { throw 'Out-of-scope decision was not kept inventory-only.' }
    if ($binary.coverage_ref -notlike 'wiki/_outputs/semantic-ingest/*') { throw 'Decision-ledger coverage did not override directory coverage.' }
    if ($research.source_kind -ne 'ai-research' -or $research.coverage_status -ne 'pending-review') { throw 'Pending decision was promoted beyond review.' }
    if (-not $hidden -or $hidden.coverage_ref -notlike 'wiki/sources.md:*') { throw 'Hidden source or split-root prefix coverage was omitted.' }
    if (@($rows | Where-Object source_path -match '^[A-Za-z]:|^/').Count) { throw 'Inventory leaked absolute source paths.' }
    if ((Get-FileHash -LiteralPath (Join-Path $sourceRoot 'raw/assets/document.pdf') -Algorithm SHA256).Hash -ne $sourceHash) { throw 'Inventory modified a source file.' }

    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $vault -SourceRoot $sourceRoot -Check 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Fresh source inventory did not pass check mode.' }
    $outputHash = (Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $vault -SourceRoot (Join-Path $tempRoot 'missing-sources') 2>&1 | Out-Null
    $invalidRootExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorActionPreference
    if ($invalidRootExit -eq 0) { throw 'Missing source root was accepted.' }
    if ((Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash -ne $outputHash) { throw 'Invalid source root changed the existing inventory.' }
    $emptySourceRoot = Join-Path $tempRoot 'empty-sources'
    New-Item -ItemType Directory -Force $emptySourceRoot | Out-Null
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $vault -SourceRoot $emptySourceRoot 2>&1 | Out-Null
    $emptyRootExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorActionPreference
    if ($emptyRootExit -eq 0) { throw 'Source root without raw or research was accepted.' }
    if ((Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash -ne $outputHash) { throw 'Empty source root changed the existing inventory.' }
    Set-Content -LiteralPath (Join-Path $sourceRoot 'raw/new-source.md') -Encoding UTF8 -Value '# New'
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $vault -SourceRoot $sourceRoot -Check 2>&1 | Out-Null
    $staleExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorActionPreference
    if ($staleExit -ne 2) { throw "Stale source inventory did not fail closed (exit $staleExit)." }
    Write-Host 'Source coverage tests passed.'
} finally {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}
