[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Status', 'Activate', 'Restore')]
    [string]$Mode,
    [string]$TargetPath = (Join-Path $env:USERPROFILE '.codex\config.toml'),
    [string]$ProfilePath,
    [string]$StatePath
)

$ErrorActionPreference = 'Stop'
if (-not $ProfilePath) { $ProfilePath = Join-Path $PSScriptRoot 'config\newsletter-retrieval-profile.toml' }
$target = [IO.Path]::GetFullPath($TargetPath)
$profile = [IO.Path]::GetFullPath($ProfilePath)
if (-not $StatePath) { $StatePath = $target + '.newsletter-retrieval-state.json' }
$state = [IO.Path]::GetFullPath($StatePath)
foreach ($required in @($target, $profile)) {
    if (-not (Test-Path -LiteralPath $required -PathType Leaf)) { throw "Required file does not exist: $required" }
}
$utf8 = [Text.UTF8Encoding]::new($false)

function Get-FileSha256([string]$Path) {
    (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}
function Get-TextSha256([string]$Text) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { ([BitConverter]::ToString($sha.ComputeHash($utf8.GetBytes($Text)))).Replace('-', '').ToLowerInvariant() }
    finally { $sha.Dispose() }
}
function Write-AtomicUtf8([string]$Path, [string]$Text) {
    $directory = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $directory -PathType Container)) { throw "Parent directory does not exist: $directory" }
    $temporary = Join-Path $directory ('.' + [IO.Path]::GetFileName($Path) + '.' + [guid]::NewGuid().ToString('N') + '.tmp')
    try {
        [IO.File]::WriteAllText($temporary, $Text, $utf8)
        Move-Item -LiteralPath $temporary -Destination $Path -Force
    } finally {
        if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary -Force }
    }
}
function Read-State {
    if (Test-Path -LiteralPath $state -PathType Leaf) { Get-Content -Raw -LiteralPath $state | ConvertFrom-Json }
}
function Test-ExactProfile([string]$ConfigText, [string]$ProfileText) {
    $ConfigText.Replace("`r`n", "`n").Contains($ProfileText.Trim().Replace("`r`n", "`n"))
}
function Get-DefaultPermission([string]$ConfigText) {
    $section = [regex]::Match($ConfigText, '(?m)^\s*\[')
    $top = if ($section.Success) { $ConfigText.Substring(0, $section.Index) } else { $ConfigText }
    $match = [regex]::Match($top, '(?m)^\s*default_permissions\s*=\s*"([^"]+)"\s*$')
    if ($match.Success) { $match.Groups[1].Value }
    else { return $null }
}

$configText = [IO.File]::ReadAllText($target, $utf8)
$profileText = [IO.File]::ReadAllText($profile, $utf8).Trim()
$profileInstalled = Test-ExactProfile $configText $profileText
$defaultPermission = Get-DefaultPermission $configText
$stateRecord = Read-State

if ($Mode -eq 'Status') {
    [pscustomobject][ordered]@{
        status = 'inspected'; target = $target; profile = 'newsletter-retrieval'
        profile_installed = $profileInstalled; default_permissions = $defaultPermission
        active = ($profileInstalled -and $defaultPermission -eq 'newsletter-retrieval')
        state = if ($stateRecord) { $stateRecord.status } else { 'absent' }
    } | ConvertTo-Json -Compress
    return
}

if ($Mode -eq 'Activate') {
    if (-not $profileInstalled) { throw 'The exact reviewed profile is not installed. Run install-newsletter-retrieval-profile.ps1 first.' }
    if ($stateRecord -and $stateRecord.status -eq 'active') {
        if ((Get-FileSha256 $target) -eq $stateRecord.active_sha256 -and $defaultPermission -eq 'newsletter-retrieval') {
            [pscustomobject]@{ status = 'already_active'; target = $target; state = $state } | ConvertTo-Json -Compress
            return
        }
        throw 'An active retrieval state exists but the config hash no longer matches.'
    }
    if ($defaultPermission -eq 'newsletter-retrieval') { throw 'The profile is already selected without a managed activation state.' }
    $newline = if ($configText.Contains("`r`n")) { "`r`n" } else { "`n" }
    $section = [regex]::Match($configText, '(?m)^\s*\[')
    $sectionIndex = if ($section.Success) { $section.Index } else { $configText.Length }
    $top = $configText.Substring(0, $sectionIndex)
    $sections = $configText.Substring($sectionIndex)
    $pattern = '(?m)^\s*default_permissions\s*=.*(?:\r?\n|$)'
    if ([regex]::IsMatch($top, $pattern)) {
        $top = [regex]::Replace($top, $pattern, 'default_permissions = "newsletter-retrieval"' + $newline, 1)
    } else {
        $top = 'default_permissions = "newsletter-retrieval"' + $newline + $top
    }
    $activeText = $top + $sections
    $backup = $target + '.newsletter-retrieval-activation-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.bak'
    $activation = [pscustomobject][ordered]@{
        schema_version = '1.0'; record_type = 'newsletter_retrieval_profile_state'; status = 'active'
        target = $target; backup = $backup; original_sha256 = Get-TextSha256 $configText
        active_sha256 = Get-TextSha256 $activeText; activated_at = [datetimeoffset]::Now.ToString('o')
    }
    if (-not $PSCmdlet.ShouldProcess($target, 'Temporarily select newsletter-retrieval as default_permissions')) {
        [pscustomobject]@{ status = 'what_if_activate'; target = $target; state = $state } | ConvertTo-Json -Compress
        return
    }
    [IO.File]::WriteAllText($backup, $configText, $utf8)
    Write-AtomicUtf8 $state (($activation | ConvertTo-Json -Depth 5) + $newline)
    Write-AtomicUtf8 $target $activeText
    [pscustomobject]@{ status = 'activated'; target = $target; backup = $backup; state = $state } | ConvertTo-Json -Compress
    return
}

if (-not $stateRecord) { throw 'No managed retrieval activation state exists.' }
if ($stateRecord.status -eq 'restored') {
    [pscustomobject]@{ status = 'already_restored'; target = $target; state = $state } | ConvertTo-Json -Compress
    return
}
if ($stateRecord.status -ne 'active') { throw "Unsupported retrieval state: $($stateRecord.status)" }
if ([IO.Path]::GetFullPath($stateRecord.target) -ne $target) { throw 'Retrieval state targets a different config file.' }
if (-not (Test-Path -LiteralPath $stateRecord.backup -PathType Leaf)) { throw 'The recorded activation backup is missing.' }
if ((Get-FileSha256 $target) -ne $stateRecord.active_sha256) { throw 'The active config changed after activation.' }
if ((Get-FileSha256 $stateRecord.backup) -ne $stateRecord.original_sha256) { throw 'The activation backup hash does not match.' }
if (-not $PSCmdlet.ShouldProcess($target, 'Restore the exact pre-activation Codex config')) {
    [pscustomobject]@{ status = 'what_if_restore'; target = $target; state = $state } | ConvertTo-Json -Compress
    return
}
$originalText = [IO.File]::ReadAllText($stateRecord.backup, $utf8)
Write-AtomicUtf8 $target $originalText
$stateRecord.status = 'restored'
$stateRecord | Add-Member restored_at ([datetimeoffset]::Now.ToString('o')) -Force
$stateRecord | Add-Member restored_sha256 (Get-FileSha256 $target) -Force
$newline = if ($originalText.Contains("`r`n")) { "`r`n" } else { "`n" }
Write-AtomicUtf8 $state (($stateRecord | ConvertTo-Json -Depth 5) + $newline)
[pscustomobject]@{ status = 'restored'; target = $target; backup = $stateRecord.backup; state = $state } | ConvertTo-Json -Compress
