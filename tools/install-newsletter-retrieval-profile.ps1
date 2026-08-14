[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$TargetPath = (Join-Path $env:USERPROFILE '.codex\config.toml'),
    [string]$ProfilePath,
    [switch]$NoBackup
)

$ErrorActionPreference = 'Stop'

if (-not $ProfilePath) {
    $ProfilePath = Join-Path $PSScriptRoot 'config\newsletter-retrieval-profile.toml'
}

$target = [System.IO.Path]::GetFullPath($TargetPath)
$profile = [System.IO.Path]::GetFullPath($ProfilePath)
if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
    throw "Codex config does not exist: $target"
}
if (-not (Test-Path -LiteralPath $profile -PathType Leaf)) {
    throw "Retrieval profile template does not exist: $profile"
}

$existing = [System.IO.File]::ReadAllText($target)
$profileText = [System.IO.File]::ReadAllText($profile).Trim()
$profileHeader = '[permissions.newsletter-retrieval]'

if ($existing -match '(?m)^\s*sandbox_mode\s*=|(?m)^\s*\[sandbox_workspace_write\]\s*$') {
    throw 'Legacy sandbox_mode configuration is active. Migrate it before installing a permission profile.'
}

if ($existing.Contains($profileHeader)) {
    $normalizedExisting = $existing.Replace("`r`n", "`n")
    $normalizedProfile = $profileText.Replace("`r`n", "`n")
    if ($normalizedExisting.Contains($normalizedProfile)) {
        [pscustomobject]@{
            status = 'already_installed'
            target = $target
            profile = 'newsletter-retrieval'
        } | ConvertTo-Json -Compress
        return
    }
    throw 'A different newsletter-retrieval profile already exists. Refusing to overwrite it.'
}

$newline = if ($existing.Contains("`r`n")) { "`r`n" } else { "`n" }
$updated = $existing.TrimEnd("`r", "`n") + $newline + $newline + $profileText.Replace("`r`n", "`n").Replace("`n", $newline) + $newline

if (-not $PSCmdlet.ShouldProcess($target, 'Install the opt-in newsletter-retrieval permission profile')) {
    [pscustomobject]@{
        status = 'what_if'
        target = $target
        profile = 'newsletter-retrieval'
    } | ConvertTo-Json -Compress
    return
}

$backup = $null
if (-not $NoBackup) {
    $backup = "$target.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Copy-Item -LiteralPath $target -Destination $backup -ErrorAction Stop
}

$temp = "$target.newsletter-retrieval.tmp"
try {
    [System.IO.File]::WriteAllText($temp, $updated, [System.Text.UTF8Encoding]::new($false))
    Move-Item -LiteralPath $temp -Destination $target -Force
}
finally {
    if (Test-Path -LiteralPath $temp) {
        Remove-Item -LiteralPath $temp -Force
    }
}

[pscustomobject]@{
    status = 'installed'
    target = $target
    backup = $backup
    profile = 'newsletter-retrieval'
} | ConvertTo-Json -Compress
