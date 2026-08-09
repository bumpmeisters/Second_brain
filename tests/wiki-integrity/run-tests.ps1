$ErrorActionPreference = 'Stop'
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'wiki-integrity.tests.ps1')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
