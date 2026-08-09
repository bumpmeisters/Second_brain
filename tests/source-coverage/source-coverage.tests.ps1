$ErrorActionPreference = 'Stop'
$repo = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$tempRoot = Join-Path ([IO.Path]::GetTempPath()) ('source-coverage-' + [guid]::NewGuid().ToString('N'))
$vault = Join-Path $tempRoot 'vault'
$sourceRoot = Join-Path $tempRoot 'sources'
try {
    New-Item -ItemType Directory -Force (Join-Path $vault 'tools'), (Join-Path $vault 'wiki'), (Join-Path $sourceRoot 'raw/assets'), (Join-Path $sourceRoot 'research') | Out-Null
    Copy-Item -LiteralPath (Join-Path $repo 'tools/new-source-coverage-inventory.ps1') -Destination (Join-Path $vault 'tools/new-source-coverage-inventory.ps1')
    Set-Content -LiteralPath (Join-Path $sourceRoot 'raw/source.md') -Encoding UTF8 -Value '# Source'
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
'@ | Set-Content -LiteralPath (Join-Path $vault 'wiki/sources.md') -Encoding UTF8

    $tool = Join-Path $vault 'tools/new-source-coverage-inventory.ps1'
    $sourceHash = (Get-FileHash -LiteralPath (Join-Path $sourceRoot 'raw/assets/document.pdf') -Algorithm SHA256).Hash
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $vault -SourceRoot $sourceRoot 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Split-root source coverage generation failed.' }
    $output = Join-Path $vault 'wiki/_outputs/source-coverage/source-inventory.csv'
    $rows = @(Import-Csv -LiteralPath $output -Encoding UTF8)
    if ($rows.Count -ne 4) { throw "Expected four inventory rows, found $($rows.Count)." }
    $registered = $rows | Where-Object source_path -eq 'raw/source.md'
    $binary = $rows | Where-Object source_path -eq 'raw/assets/document.pdf'
    $research = $rows | Where-Object source_path -eq 'research/report.md'
    $hidden = $rows | Where-Object source_path -eq 'raw/assets/hidden.txt'
    if ($registered.coverage_status -ne 'content-ingested') { throw 'Exact source-register coverage was not preserved.' }
    if ($binary.source_kind -ne 'binary-library' -or $binary.coverage_status -ne 'inventory-only') { throw 'Binary source default coverage is incorrect.' }
    if ($research.source_kind -ne 'ai-research' -or $research.coverage_status -ne 'inventory-only') { throw 'Research source default coverage is incorrect.' }
    if (-not $hidden) { throw 'Hidden source file was omitted from the inventory.' }
    if (@($rows | Where-Object source_path -match '^[A-Za-z]:|^/').Count) { throw 'Inventory leaked absolute source paths.' }
    if ((Get-FileHash -LiteralPath (Join-Path $sourceRoot 'raw/assets/document.pdf') -Algorithm SHA256).Hash -ne $sourceHash) { throw 'Inventory modified a source file.' }

    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $vault -SourceRoot $sourceRoot -Check 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Fresh source inventory did not pass check mode.' }
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
