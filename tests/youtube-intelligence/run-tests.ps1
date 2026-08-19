$ErrorActionPreference = 'Stop'
$vault = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$runtime = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $vault 'tools\resolve-python-runtime.ps1') -Purpose Agent -Json | ConvertFrom-Json
& $runtime.executable -m unittest discover -s (Join-Path $vault 'tests\youtube-intelligence') -p 'test_*.py' -v
if ($LASTEXITCODE -ne 0) { throw 'YouTube intelligence Python tests failed.' }
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $vault 'tests\youtube-intelligence\reconciliation.tests.ps1')
if ($LASTEXITCODE -ne 0) { throw 'YouTube reconciliation tests failed.' }
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $vault 'tests\clipping-intake\disposition-gate.tests.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Clipping disposition tests failed.' }
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $vault 'tests\source-conversion\source-inbox.tests.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Source inbox tests failed.' }
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $vault 'tests\youtube-intelligence\scheduled-task-contract.tests.ps1')
if ($LASTEXITCODE -ne 0) { throw 'YouTube scheduled-task contract tests failed.' }
Write-Host 'YouTube intelligence test suite passed.'
