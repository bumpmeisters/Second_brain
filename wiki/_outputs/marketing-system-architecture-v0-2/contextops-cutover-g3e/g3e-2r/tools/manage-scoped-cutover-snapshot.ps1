[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Capture', 'VerifyBundle', 'CheckLivePreState', 'CheckFunctionalPrestate', 'RestorePlan', 'Restore')]
    [string]$Command,

    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [Parameter(Mandatory = $true)][string]$SelectionManifest,
    [Parameter(Mandatory = $true)][string]$SnapshotDirectory,
    [string]$AllowedCurrentManifest,
    [switch]$AllowCapture,
    [switch]$AllowRestore
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'g3e2r-transaction-lib.psm1') -Force

$utf8NoBom = [Text.UTF8Encoding]::new($false)
$selectionColumns = @('snapshot_id', 'repository_path', 'pre_sha256', 'bytes', 'restore_policy', 'basis')
$allowedPolicies = @('restore-exact', 'append-only-prefix', 'verify-only')

function Resolve-SnapshotDirectory {
    param([string]$Root, [string]$Directory)

    $resolvedRoot = [IO.Path]::GetFullPath($Root).TrimEnd('\')
    $resolved = [IO.Path]::GetFullPath($Directory).TrimEnd('\')
    if (($resolved -eq $resolvedRoot) -or (-not $resolved.StartsWith($resolvedRoot + '\', [StringComparison]::OrdinalIgnoreCase))) {
        throw "Snapshot directory must be a child of the supplied root: $resolved"
    }
    $relative = $resolved.Substring($resolvedRoot.Length + 1).Replace('\', '/')
    if ($relative -match '^(raw|research|inbox)(/|$)') { throw "Snapshot directory is under a protected root: $relative" }
    return $resolved
}

function Import-Selection {
    param([string]$LiteralPath)

    $rows = @(Import-Csv -LiteralPath $LiteralPath)
    Assert-G3E2RColumns -Rows $rows -Expected $selectionColumns -Label 'Snapshot selection'
    if (@($rows.repository_path | Sort-Object -Unique).Count -ne $rows.Count) { throw 'Snapshot paths must be unique.' }
    if (@($rows.snapshot_id | Sort-Object -Unique).Count -ne 1) { throw 'Snapshot rows must share one snapshot_id.' }
    $paths = [string[]]@($rows | ForEach-Object { [string]$_.repository_path })
    $ordinal = [string[]]$paths.Clone()
    [Array]::Sort($ordinal, [StringComparer]::Ordinal)
    for ($index = 0; $index -lt $paths.Count; $index++) {
        if ($paths[$index] -cne $ordinal[$index]) { throw 'Snapshot rows are not ordinal-sorted by repository_path.' }
    }
    foreach ($row in $rows) {
        if ($row.pre_sha256 -notmatch '^[A-F0-9]{64}$' -or [int64]$row.bytes -lt 0) {
            throw "Invalid snapshot identity: $($row.repository_path)"
        }
        if ($row.restore_policy -notin $allowedPolicies -or [string]::IsNullOrWhiteSpace($row.basis)) {
            throw "Invalid snapshot policy or basis: $($row.repository_path)"
        }
        $null = Resolve-G3E2RInRoot -Root $resolvedRoot -RepositoryPath ([string]$row.repository_path)
    }
    $fingerprintRows = @($rows | ForEach-Object {
        [pscustomobject]@{ repository_path = $_.repository_path; sha256 = $_.pre_sha256; bytes = $_.bytes }
    })
    $fingerprint = Get-G3E2RFingerprintV2 -Rows $fingerprintRows
    $expectedId = 'g3e2r-' + $fingerprint.Substring(0, 16).ToLowerInvariant()
    if ($rows[0].snapshot_id -cne $expectedId) { throw "Snapshot id mismatch; expected $expectedId" }
    return @($rows)
}

function Assert-ExactLivePrestate {
    param([object[]]$Rows)

    foreach ($row in $Rows) {
        $path = Resolve-G3E2RInRoot -Root $resolvedRoot -RepositoryPath ([string]$row.repository_path)
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Snapshot prestate is missing: $($row.repository_path)" }
        if ((Get-Item -LiteralPath $path).Length -ne [int64]$row.bytes -or (Get-G3E2RSha256 -LiteralPath $path) -ne $row.pre_sha256) {
            throw "Snapshot prestate identity changed: $($row.repository_path)"
        }
    }
}

function Read-ArchiveBytes {
    param([IO.Compression.ZipArchive]$Archive, [string]$EntryName)

    $entry = $Archive.GetEntry($EntryName)
    if ($null -eq $entry) { throw "Snapshot archive entry is missing: $EntryName" }
    $stream = $entry.Open()
    try {
        $memory = [IO.MemoryStream]::new()
        try { $stream.CopyTo($memory); return $memory.ToArray() } finally { $memory.Dispose() }
    }
    finally { $stream.Dispose() }
}

function New-SnapshotArchive {
    param([object[]]$Rows, [string]$ArchivePath)

    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $stream = [IO.File]::Open($ArchivePath, [IO.FileMode]::CreateNew, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
    try {
        $archive = [IO.Compression.ZipArchive]::new($stream, [IO.Compression.ZipArchiveMode]::Create, $true)
        try {
            foreach ($row in @($Rows | Where-Object restore_policy -ne 'verify-only')) {
                $source = Resolve-G3E2RInRoot -Root $resolvedRoot -RepositoryPath ([string]$row.repository_path)
                $entry = $archive.CreateEntry(([string]$row.repository_path), [IO.Compression.CompressionLevel]::Optimal)
                $entry.LastWriteTime = [DateTimeOffset]::new(1980, 1, 1, 0, 0, 0, [TimeSpan]::Zero)
                $entryStream = $entry.Open()
                try {
                    $sourceStream = [IO.File]::OpenRead($source)
                    try { $sourceStream.CopyTo($entryStream) } finally { $sourceStream.Dispose() }
                }
                finally { $entryStream.Dispose() }
            }
        }
        finally { $archive.Dispose() }
    }
    finally { $stream.Dispose() }
}

function Test-SnapshotBundle {
    param([object[]]$Rows)

    $manifestPath = Join-Path $resolvedSnapshot 'snapshot-manifest.csv'
    $archivePath = Join-Path $resolvedSnapshot 'prestate-snapshot.zip'
    $envelopePath = Join-Path $resolvedSnapshot 'snapshot-envelope.json'
    foreach ($path in @($manifestPath, $archivePath, $envelopePath)) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Snapshot artifact is missing: $path" }
    }

    $manifestRows = @(Import-Csv -LiteralPath $manifestPath)
    if ($manifestRows.Count -ne $Rows.Count) { throw 'Snapshot manifest row count differs from selection.' }
    for ($index = 0; $index -lt $Rows.Count; $index++) {
        foreach ($field in $selectionColumns) {
            if ([string]$manifestRows[$index].$field -cne [string]$Rows[$index].$field) {
                throw "Snapshot manifest differs from selection at row $index field $field."
            }
        }
    }

    $fingerprintRows = @($Rows | ForEach-Object {
        [pscustomobject]@{ repository_path = $_.repository_path; sha256 = $_.pre_sha256; bytes = $_.bytes }
    })
    $fingerprint = Get-G3E2RFingerprintV2 -Rows $fingerprintRows
    $envelope = Get-Content -Raw -LiteralPath $envelopePath -Encoding UTF8 | ConvertFrom-Json
    if ($envelope.envelope_contract -cne 'g3e2r-scoped-snapshot/v2' -or $envelope.snapshot_id -cne $Rows[0].snapshot_id) {
        throw 'Snapshot envelope contract or id mismatch.'
    }
    if ($envelope.fingerprint_v2 -cne $fingerprint -or $envelope.selection_sha256 -cne (Get-G3E2RSha256 -LiteralPath $resolvedSelection)) {
        throw 'Snapshot envelope selection binding mismatch.'
    }
    if ($envelope.manifest_sha256 -cne (Get-G3E2RSha256 -LiteralPath $manifestPath) -or
        $envelope.archive_sha256 -cne (Get-G3E2RSha256 -LiteralPath $archivePath)) {
        throw 'Snapshot envelope material binding mismatch.'
    }

    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [IO.Compression.ZipFile]::OpenRead($archivePath)
    try {
        $expected = @($Rows | Where-Object restore_policy -ne 'verify-only')
        if ($archive.Entries.Count -ne $expected.Count) { throw 'Snapshot archive entry count mismatch.' }
        foreach ($row in $expected) {
            $matches = @($archive.Entries | Where-Object FullName -CEQ $row.repository_path)
            if ($matches.Count -ne 1) { throw "Snapshot archive identity mismatch: $($row.repository_path)" }
            $bytes = Read-ArchiveBytes -Archive $archive -EntryName ([string]$row.repository_path)
            if ($bytes.Length -ne [int64]$row.bytes -or (Get-G3E2RBytesSha256 -Bytes $bytes) -ne $row.pre_sha256) {
                throw "Snapshot archive bytes differ: $($row.repository_path)"
            }
        }
    }
    finally { $archive.Dispose() }
    return $envelope
}

function Assert-FunctionalPrestate {
    param([object[]]$Rows)

    $archivePath = Join-Path $resolvedSnapshot 'prestate-snapshot.zip'
    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [IO.Compression.ZipFile]::OpenRead($archivePath)
    try {
        foreach ($row in $Rows) {
            $target = Resolve-G3E2RInRoot -Root $resolvedRoot -RepositoryPath ([string]$row.repository_path)
            if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { throw "Functional prestate is missing: $($row.repository_path)" }
            if ($row.restore_policy -in @('restore-exact', 'verify-only')) {
                if ((Get-G3E2RSha256 -LiteralPath $target) -ne $row.pre_sha256) { throw "Functional prestate hash mismatch: $($row.repository_path)" }
                continue
            }
            $saved = Read-ArchiveBytes -Archive $archive -EntryName ([string]$row.repository_path)
            $current = [IO.File]::ReadAllBytes($target)
            if ($current.Length -lt $saved.Length) { throw "Append-only prefix was truncated: $($row.repository_path)" }
            for ($index = 0; $index -lt $saved.Length; $index++) {
                if ($current[$index] -ne $saved[$index]) { throw "Append-only prefix changed: $($row.repository_path)" }
            }
        }
    }
    finally { $archive.Dispose() }
}

function Import-AllowedCurrent {
    param([string]$LiteralPath)

    if ([string]::IsNullOrWhiteSpace($LiteralPath)) { throw 'Restore requires -AllowedCurrentManifest.' }
    $rows = @(Import-Csv -LiteralPath $LiteralPath)
    Assert-G3E2RColumns -Rows $rows -Expected @('repository_path', 'allowed_sha256') -Label 'Allowed-current manifest'
    $map = @{}
    foreach ($row in $rows) {
        if ($row.allowed_sha256 -notmatch '^[A-F0-9]{64}$') { throw "Invalid allowed-current hash: $($row.repository_path)" }
        if (-not $map.ContainsKey([string]$row.repository_path)) { $map[[string]$row.repository_path] = [Collections.Generic.List[string]]::new() }
        $map[[string]$row.repository_path].Add([string]$row.allowed_sha256)
    }
    return $map
}

$resolvedRoot = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
$resolvedSelection = (Resolve-Path -LiteralPath $SelectionManifest).Path
$resolvedSnapshot = Resolve-SnapshotDirectory -Root $resolvedRoot -Directory $SnapshotDirectory
$selection = Import-Selection -LiteralPath $resolvedSelection

switch ($Command) {
    'Capture' {
        if (-not $AllowCapture) { throw 'Capture requires explicit -AllowCapture.' }
        if (Test-Path -LiteralPath $resolvedSnapshot) { throw "Capture refuses an existing snapshot directory: $resolvedSnapshot" }
        Assert-ExactLivePrestate -Rows $selection
        $null = New-Item -ItemType Directory -Path $resolvedSnapshot
        $manifestPath = Join-Path $resolvedSnapshot 'snapshot-manifest.csv'
        $manifestText = (@($selection | Select-Object $selectionColumns | ConvertTo-Csv -NoTypeInformation) -join "`n") + "`n"
        [IO.File]::WriteAllText($manifestPath, $manifestText, $utf8NoBom)
        $archivePath = Join-Path $resolvedSnapshot 'prestate-snapshot.zip'
        New-SnapshotArchive -Rows $selection -ArchivePath $archivePath
        $fingerprintRows = @($selection | ForEach-Object {
            [pscustomobject]@{ repository_path = $_.repository_path; sha256 = $_.pre_sha256; bytes = $_.bytes }
        })
        $envelope = [ordered]@{
            envelope_contract = 'g3e2r-scoped-snapshot/v2'
            snapshot_id = $selection[0].snapshot_id
            row_count = $selection.Count
            restore_exact_count = @($selection | Where-Object restore_policy -eq 'restore-exact').Count
            append_only_prefix_count = @($selection | Where-Object restore_policy -eq 'append-only-prefix').Count
            verify_only_count = @($selection | Where-Object restore_policy -eq 'verify-only').Count
            fingerprint_v2 = Get-G3E2RFingerprintV2 -Rows $fingerprintRows
            selection_sha256 = Get-G3E2RSha256 -LiteralPath $resolvedSelection
            manifest_sha256 = Get-G3E2RSha256 -LiteralPath $manifestPath
            archive_sha256 = Get-G3E2RSha256 -LiteralPath $archivePath
            capture_tool_sha256 = Get-G3E2RSha256 -LiteralPath $PSCommandPath
            authority_effect = 'none'
        }
        [IO.File]::WriteAllText((Join-Path $resolvedSnapshot 'snapshot-envelope.json'), (($envelope | ConvertTo-Json -Depth 5) + "`n"), $utf8NoBom)
        $null = Test-SnapshotBundle -Rows $selection
        Write-Output "PASS | Capture | $($selection.Count) rows | authority effect: none"
    }
    'VerifyBundle' {
        $null = Test-SnapshotBundle -Rows $selection
        Write-Output "PASS | VerifyBundle | $($selection.Count) rows | no live-prestate assertion"
    }
    'CheckLivePreState' {
        $null = Test-SnapshotBundle -Rows $selection
        Assert-ExactLivePrestate -Rows $selection
        Write-Output "PASS | CheckLivePreState | $($selection.Count) exact identities"
    }
    'CheckFunctionalPrestate' {
        $null = Test-SnapshotBundle -Rows $selection
        Assert-FunctionalPrestate -Rows $selection
        Write-Output "PASS | CheckFunctionalPrestate | append prefixes allowed"
    }
    'RestorePlan' {
        $null = Test-SnapshotBundle -Rows $selection
        $selection | Select-Object repository_path, restore_policy, pre_sha256, bytes | Format-Table -AutoSize
        Write-Output 'PASS | RestorePlan | no bytes written'
    }
    'Restore' {
        if (-not $AllowRestore) { throw 'Restore requires explicit -AllowRestore.' }
        $null = Test-SnapshotBundle -Rows $selection
        $allowed = Import-AllowedCurrent -LiteralPath $AllowedCurrentManifest
        $archivePath = Join-Path $resolvedSnapshot 'prestate-snapshot.zip'
        Add-Type -AssemblyName System.IO.Compression
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $archive = [IO.Compression.ZipFile]::OpenRead($archivePath)
        try {
            foreach ($row in $selection) {
                $target = Resolve-G3E2RInRoot -Root $resolvedRoot -RepositoryPath ([string]$row.repository_path) -ForMutation
                if ($row.restore_policy -eq 'verify-only') {
                    if (-not (Test-Path -LiteralPath $target -PathType Leaf) -or (Get-G3E2RSha256 -LiteralPath $target) -ne $row.pre_sha256) {
                        throw "verify-only path changed: $($row.repository_path)"
                    }
                    continue
                }
                if ($row.restore_policy -eq 'append-only-prefix') { continue }
                if (Test-Path -LiteralPath $target -PathType Leaf) {
                    $currentHash = Get-G3E2RSha256 -LiteralPath $target
                    if (-not $allowed.ContainsKey([string]$row.repository_path) -or $currentHash -notin $allowed[[string]$row.repository_path]) {
                        throw "Restore refuses unknown current bytes: $($row.repository_path)"
                    }
                }
                $saved = Read-ArchiveBytes -Archive $archive -EntryName ([string]$row.repository_path)
                $parent = Split-Path -Parent $target
                if (-not (Test-Path -LiteralPath $parent -PathType Container)) { $null = New-Item -ItemType Directory -Path $parent -Force }
                $temporary = Join-Path $parent ('.g3e2r-restore-' + [guid]::NewGuid().ToString('N') + '.tmp')
                $backup = Join-Path $parent ('.g3e2r-restore-' + [guid]::NewGuid().ToString('N') + '.bak')
                try {
                    [IO.File]::WriteAllBytes($temporary, $saved)
                    if (Test-Path -LiteralPath $target -PathType Leaf) {
                        [IO.File]::Replace($temporary, $target, $backup)
                        Remove-Item -LiteralPath $backup -Force
                    }
                    else { [IO.File]::Move($temporary, $target) }
                }
                finally {
                    if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary -Force }
                    if (Test-Path -LiteralPath $backup) { Remove-Item -LiteralPath $backup -Force }
                }
            }
        }
        finally { $archive.Dispose() }
        Assert-FunctionalPrestate -Rows $selection
        Write-Output 'PASS | Restore | exact files restored; append prefixes preserved; unknown bytes protected'
    }
}
