$ErrorActionPreference = 'Stop'
$vault = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$runtime = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $vault 'tools\resolve-python-runtime.ps1') -Purpose Agent -Json | ConvertFrom-Json
& $runtime.executable -m unittest discover -s (Join-Path $vault 'tests\youtube-discovery') -p 'test_*.py' -v
if ($LASTEXITCODE -ne 0) { throw 'YouTube discovery Python tests failed.' }
Write-Host 'YouTube discovery read-only tests passed.'
