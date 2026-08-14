param(
    [Parameter(Position = 0, Mandatory = $true)]
    [ValidateSet(
        'preflight', 'compliance-status', 'auth-status', 'oauth-preview', 'handoff-url',
        'clipper-inbox', 'clipper-find', 'clipper-associate', 'git-custody-check',
        'bootstrap-subscriptions', 'load-video-fixture', 'prepare-review', 'prepare-calibration',
        'decision-preview', 'decision-apply', 'sync-subscriptions',
        'discover-videos', 'live-weekly-test', 'retention-status', 'purge-preview', 'purge-apply',
        'revoke-preview', 'revoke-apply', 'backup'
    )]
    [string]$Command,

    [string]$VaultRoot = '',
    [string]$StateRoot = '',
    [string]$Policy = 'tools/config/youtube-intelligence-policy.json',
    [string]$Url = '',
    [string]$Note = '',
    [string]$HandoffId = '',
    [string]$Path = '',
    [string]$ExpectedSha256 = '',
    [string]$Fixture = '',
    [string]$Manifest = '',
    [string]$ClientSecrets = '',
    [string]$CalibrationSeed = '',
    [switch]$Confirm,
    [switch]$AllApi,
    [switch]$InAppBrowser,
    [switch]$NoCreateDrafts,
    [switch]$IncludeExisting
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not $VaultRoot) {
    $VaultRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
}
else {
    $VaultRoot = [IO.Path]::GetFullPath($VaultRoot)
}

$resolver = Join-Path $VaultRoot 'tools\resolve-python-runtime.ps1'
$script = Join-Path $VaultRoot 'tools\youtube_intelligence.py'
if (-not (Test-Path -LiteralPath $resolver -PathType Leaf)) {
    throw "Python runtime resolver not found: $resolver"
}
if (-not (Test-Path -LiteralPath $script -PathType Leaf)) {
    throw "YouTube intelligence implementation not found: $script"
}

$python = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $resolver -Purpose Agent -PathOnly
if ($LASTEXITCODE -ne 0 -or -not $python) {
    throw 'Unable to resolve the approved Agent Python runtime.'
}

$arguments = [Collections.Generic.List[string]]::new()
$arguments.Add('-B')
$arguments.Add($script)
$arguments.Add('--vault-root')
$arguments.Add($VaultRoot)
if ($StateRoot) {
    $arguments.Add('--state-root')
    $arguments.Add([IO.Path]::GetFullPath($StateRoot))
}
$arguments.Add('--policy')
$arguments.Add($Policy)
$arguments.Add($Command)

function Add-ValueArgument([string]$Name, [string]$Value) {
    if ($Value) {
        $arguments.Add($Name)
        $arguments.Add($Value)
    }
}

Add-ValueArgument '--url' $Url
Add-ValueArgument '--note' $Note
Add-ValueArgument '--handoff-id' $HandoffId
Add-ValueArgument '--path' $Path
Add-ValueArgument '--expected-sha256' $ExpectedSha256
Add-ValueArgument '--fixture' $Fixture
Add-ValueArgument '--manifest' $Manifest
Add-ValueArgument '--client-secrets' $ClientSecrets
Add-ValueArgument '--calibration-seed' $CalibrationSeed
if ($Confirm) { $arguments.Add('--confirm') }
if ($AllApi) { $arguments.Add('--all-api') }
if ($InAppBrowser) { $arguments.Add('--in-app-browser') }
if ($NoCreateDrafts) { $arguments.Add('--no-create-drafts') }
if ($IncludeExisting) { $arguments.Add('--include-existing') }

& $python @arguments
exit $LASTEXITCODE
