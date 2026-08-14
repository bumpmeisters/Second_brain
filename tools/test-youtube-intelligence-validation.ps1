param(
    [string]$VaultRoot = ''
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not $VaultRoot) {
    $VaultRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
}
$resolver = Join-Path $VaultRoot 'tools\resolve-python-runtime.ps1'
$tests = Join-Path $VaultRoot 'tests\youtube-intelligence\youtube_intelligence_test.py'
$python = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $resolver -Purpose Agent -PathOnly
if ($LASTEXITCODE -ne 0 -or -not $python) {
    throw 'Unable to resolve the approved Agent Python runtime.'
}
& $python -B $tests
if ($LASTEXITCODE -ne 0) {
    throw "YouTube intelligence tests failed with exit code $LASTEXITCODE."
}
Write-Host 'YouTube intelligence validation passed.'
