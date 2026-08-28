[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Validate', 'CheckPre', 'Apply', 'CheckPost')]
    [string]$Mode,

    [Parameter(Mandatory = $true)]
    [string]$VaultRoot,

    [string]$ManifestPath,
    [string]$ArchivePath,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ManifestPath)) {
    $ManifestPath = Join-Path $PSScriptRoot '..\manifests\exact-poststate-manifest.csv'
}
if ([string]::IsNullOrWhiteSpace($ArchivePath)) {
    $ArchivePath = Join-Path $PSScriptRoot '..\poststate\exact-poststate.zip'
}

function Get-Sha256Bytes {
    param([byte[]]$Bytes)
    $algorithm = [Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($algorithm.ComputeHash($Bytes))).Replace('-', '')
    }
    finally {
        $algorithm.Dispose()
    }
}

function Get-Sha256File {
    param([string]$LiteralPath)
    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Resolve-InRoot {
    param(
        [string]$Root,
        [string]$RepositoryRelativePath
    )

    if ([string]::IsNullOrWhiteSpace($RepositoryRelativePath) -or [IO.Path]::IsPathRooted($RepositoryRelativePath)) {
        throw "Expected a non-empty repository-relative path: $RepositoryRelativePath"
    }
    $normalized = $RepositoryRelativePath.Replace('\', '/')
    if (($normalized -eq 'raw') -or $normalized.StartsWith('raw/', [StringComparison]::OrdinalIgnoreCase) -or
        ($normalized -eq 'research') -or $normalized.StartsWith('research/', [StringComparison]::OrdinalIgnoreCase) -or
        ($normalized -eq 'inbox') -or $normalized.StartsWith('inbox/', [StringComparison]::OrdinalIgnoreCase)) {
        throw "Protected source or inbox path is outside this tool's authority: $RepositoryRelativePath"
    }

    $resolvedRoot = [IO.Path]::GetFullPath($Root).TrimEnd('\')
    $candidate = [IO.Path]::GetFullPath((Join-Path $resolvedRoot $normalized.Replace('/', '\')))
    if (($candidate -ne $resolvedRoot) -and (-not $candidate.StartsWith($resolvedRoot + '\', [StringComparison]::OrdinalIgnoreCase))) {
        throw "Path escapes the Vault root: $RepositoryRelativePath"
    }
    return $candidate
}

function Get-ArchiveBytes {
    param(
        [IO.Compression.ZipArchive]$Archive,
        [string]$EntryName
    )

    $entry = $Archive.GetEntry($EntryName)
    if ($null -eq $entry) {
        throw "Archive entry is missing: $EntryName"
    }
    $stream = $entry.Open()
    try {
        $memory = [IO.MemoryStream]::new()
        try {
            $stream.CopyTo($memory)
            return $memory.ToArray()
        }
        finally {
            $memory.Dispose()
        }
    }
    finally {
        $stream.Dispose()
    }
}

function Assert-FileState {
    param(
        [object[]]$Rows,
        [ValidateSet('Pre', 'Post')]
        [string]$State,
        [string]$Root
    )

    $verified = 0
    foreach ($row in $Rows) {
        $path = Resolve-InRoot -Root $Root -RepositoryRelativePath ([string]$row.repository_path)
        if ($State -eq 'Pre') {
            if ($row.pre_sha256 -eq 'ABSENT') {
                if (Test-Path -LiteralPath $path) {
                    throw "Pre-state requires an absent target: $($row.repository_path)"
                }
            }
            else {
                if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
                    throw "Pre-state file is missing: $($row.repository_path)"
                }
                if ((Get-Sha256File -LiteralPath $path) -ne $row.pre_sha256) {
                    throw "Pre-state hash mismatch: $($row.repository_path)"
                }
            }
        }
        else {
            if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
                throw "Post-state file is missing: $($row.repository_path)"
            }
            if ((Get-Sha256File -LiteralPath $path) -ne $row.post_sha256) {
                throw "Post-state hash mismatch: $($row.repository_path)"
            }
            if ((Get-Item -LiteralPath $path).Length -ne [int64]$row.post_bytes) {
                throw "Post-state byte-count mismatch: $($row.repository_path)"
            }
        }
        $verified++
    }
    return $verified
}

$resolvedVaultRoot = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
$resolvedManifest = (Resolve-Path -LiteralPath $ManifestPath).Path
$resolvedArchive = (Resolve-Path -LiteralPath $ArchivePath).Path
$rows = @(Import-Csv -LiteralPath $resolvedManifest)

$requiredColumns = @(
    'group', 'operation_id', 'repository_path', 'forward_mode', 'pre_sha256',
    'post_sha256', 'post_bytes', 'rollback_policy', 'archive_entry',
    'content_sha256', 'content_bytes'
)
if ($rows.Count -ne 23) {
    throw "Expected exactly 23 exact-poststate rows; found $($rows.Count)."
}
if (@($rows[0].PSObject.Properties.Name).Count -ne $requiredColumns.Count -or
    @($requiredColumns | Where-Object { $_ -notin @($rows[0].PSObject.Properties.Name) }).Count -gt 0) {
    throw 'Exact-poststate manifest columns do not match the required contract.'
}
if (@($rows | Group-Object operation_id | Where-Object Count -ne 1).Count -gt 0 -or
    @($rows | Group-Object repository_path | Where-Object Count -ne 1).Count -gt 0 -or
    @($rows | Group-Object archive_entry | Where-Object Count -ne 1).Count -gt 0) {
    throw 'Operation ids, repository paths, and archive entries must each be unique.'
}
if (@($rows | Where-Object { $_.forward_mode -notin @('replace-exact', 'create-exact', 'append-exact') }).Count -gt 0) {
    throw 'Unsupported forward mode in exact-poststate manifest.'
}
foreach ($row in $rows) {
    $null = Resolve-InRoot -Root $resolvedVaultRoot -RepositoryRelativePath ([string]$row.repository_path)
    if (($row.post_sha256 -notmatch '^[A-F0-9]{64}$') -or ($row.content_sha256 -notmatch '^[A-F0-9]{64}$')) {
        throw "Malformed post-state or content hash: $($row.operation_id)"
    }
    if (($row.forward_mode -eq 'create-exact') -xor ($row.pre_sha256 -eq 'ABSENT')) {
        throw "create-exact and ABSENT pre-state must occur together: $($row.operation_id)"
    }
    if (($row.pre_sha256 -ne 'ABSENT') -and ($row.pre_sha256 -notmatch '^[A-F0-9]{64}$')) {
        throw "Malformed pre-state hash: $($row.operation_id)"
    }
    if (($row.forward_mode -eq 'append-exact') -and ($row.rollback_policy -ne 'append-only-prefix')) {
        throw "Append operation requires append-only-prefix rollback: $($row.operation_id)"
    }
}

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [IO.Compression.ZipFile]::OpenRead($resolvedArchive)
try {
    $expectedEntries = @($rows.archive_entry | Sort-Object)
    $actualEntries = @($archive.Entries.FullName | Sort-Object)
    if (($expectedEntries.Count -ne $actualEntries.Count) -or (Compare-Object $expectedEntries $actualEntries)) {
        throw 'Archive entries do not exactly match the manifest.'
    }
    foreach ($row in $rows) {
        $content = Get-ArchiveBytes -Archive $archive -EntryName ([string]$row.archive_entry)
        if (($content.Length -ne [int64]$row.content_bytes) -or ((Get-Sha256Bytes -Bytes $content) -ne $row.content_sha256)) {
            throw "Archive content mismatch: $($row.archive_entry)"
        }
    }

    if ($Mode -eq 'CheckPre') {
        $count = Assert-FileState -Rows $rows -State Pre -Root $resolvedVaultRoot
    }
    elseif ($Mode -eq 'CheckPost') {
        $count = Assert-FileState -Rows $rows -State Post -Root $resolvedVaultRoot
    }
    elseif ($Mode -eq 'Validate') {
        $count = $rows.Count
    }
    else {
        $null = Assert-FileState -Rows $rows -State Pre -Root $resolvedVaultRoot
        $prepared = [System.Collections.Generic.List[object]]::new()
        $committed = [System.Collections.Generic.List[object]]::new()
        try {
            foreach ($row in $rows) {
                $target = Resolve-InRoot -Root $resolvedVaultRoot -RepositoryRelativePath ([string]$row.repository_path)
                $parent = Split-Path -Parent $target
                if (-not (Test-Path -LiteralPath $parent -PathType Container)) {
                    $null = New-Item -ItemType Directory -Path $parent -Force
                }
                $content = Get-ArchiveBytes -Archive $archive -EntryName ([string]$row.archive_entry)
                if ($row.forward_mode -eq 'append-exact') {
                    $prefix = [IO.File]::ReadAllBytes($target)
                    $final = New-Object byte[] ($prefix.Length + $content.Length)
                    [Array]::Copy($prefix, 0, $final, 0, $prefix.Length)
                    [Array]::Copy($content, 0, $final, $prefix.Length, $content.Length)
                }
                else {
                    $final = $content
                }
                if (($final.Length -ne [int64]$row.post_bytes) -or ((Get-Sha256Bytes -Bytes $final) -ne $row.post_sha256)) {
                    throw "Prepared post-state mismatch: $($row.repository_path)"
                }
                $temp = $target + '.g3e1-post-' + [guid]::NewGuid().ToString('N')
                [IO.File]::WriteAllBytes($temp, $final)
                $prepared.Add([pscustomobject]@{ row = $row; target = $target; temp = $temp; backup = $null })
            }

            foreach ($item in $prepared) {
                if ($item.row.forward_mode -eq 'create-exact') {
                    [IO.File]::Move($item.temp, $item.target)
                }
                else {
                    $item.backup = $item.target + '.g3e1-backup-' + [guid]::NewGuid().ToString('N')
                    [IO.File]::Replace($item.temp, $item.target, $item.backup)
                }
                $committed.Add($item)
            }
            $count = Assert-FileState -Rows $rows -State Post -Root $resolvedVaultRoot
            foreach ($item in $committed) {
                if (($null -ne $item.backup) -and (Test-Path -LiteralPath $item.backup -PathType Leaf)) {
                    Remove-Item -LiteralPath $item.backup -Force
                }
            }
        }
        catch {
            $originalError = $_
            foreach ($item in @($committed | Select-Object -Reverse)) {
                if ($item.row.forward_mode -eq 'create-exact') {
                    if ((Test-Path -LiteralPath $item.target -PathType Leaf) -and ((Get-Sha256File -LiteralPath $item.target) -eq $item.row.post_sha256)) {
                        Remove-Item -LiteralPath $item.target -Force
                    }
                }
                elseif (($null -ne $item.backup) -and (Test-Path -LiteralPath $item.backup -PathType Leaf)) {
                    if (Test-Path -LiteralPath $item.target -PathType Leaf) {
                        [IO.File]::Replace($item.backup, $item.target, $null)
                    }
                    else {
                        [IO.File]::Move($item.backup, $item.target)
                    }
                }
            }
            throw $originalError
        }
        finally {
            foreach ($item in $prepared) {
                if (Test-Path -LiteralPath $item.temp -PathType Leaf) {
                    Remove-Item -LiteralPath $item.temp -Force
                }
            }
        }
    }
}
finally {
    $archive.Dispose()
}

$result = [ordered]@{
    contract = 'g3e-exact-poststate/v1'
    mode = $Mode
    verdict = 'PASS'
    row_count = $count
    vault_root = $resolvedVaultRoot
    manifest_sha256 = Get-Sha256File -LiteralPath $resolvedManifest
    archive_sha256 = Get-Sha256File -LiteralPath $resolvedArchive
}
if ($Json) {
    $result | ConvertTo-Json -Compress
}
else {
    Write-Output "PASS | $Mode | $count/23 exact post-state rows | live authority effect: none unless invoked later under explicit G3E2 approval"
}
