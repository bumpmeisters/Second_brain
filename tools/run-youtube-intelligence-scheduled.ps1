param(
    [string]$VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
$runner = Join-Path $VaultRoot 'tools\youtube-intelligence.ps1'
if (-not (Test-Path -LiteralPath $runner -PathType Leaf)) {
    throw "YouTube intelligence runner not found: $runner"
}

& $runner scheduled-delta
if ($LASTEXITCODE -ne 0) {
    throw "YouTube intelligence scheduled delta failed with exit code $LASTEXITCODE."
}
