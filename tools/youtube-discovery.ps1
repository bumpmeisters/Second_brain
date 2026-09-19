param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$runtime = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'resolve-python-runtime.ps1') -Purpose ScheduledTask -Json | ConvertFrom-Json
if (-not $runtime.executable) { throw 'YouTube discovery Python runtime could not be resolved.' }
& $runtime.executable (Join-Path $PSScriptRoot 'youtube_discovery.py') --vault-root $root @Arguments
exit $LASTEXITCODE
