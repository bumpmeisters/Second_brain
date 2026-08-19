[CmdletBinding()]
param(
    [string]$VaultRoot = '',
    [string]$HostName = '',
    [int]$Port = 0
)

$ErrorActionPreference = 'Stop'
if (-not $VaultRoot) { $VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
$python = & (Join-Path $VaultRoot 'tools\resolve-python-runtime.ps1') -Purpose ScheduledTask -VaultRoot $VaultRoot -PathOnly
$arguments = @((Join-Path $VaultRoot 'tools\youtube_control_center.py'), '--vault-root', $VaultRoot)
if ($HostName) { $arguments += @('--host', $HostName) }
if ($Port -gt 0) { $arguments += @('--port', $Port) }
& $python @arguments
exit $LASTEXITCODE
