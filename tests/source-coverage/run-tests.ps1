$ErrorActionPreference = 'Stop'
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'source-coverage.tests.ps1')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
