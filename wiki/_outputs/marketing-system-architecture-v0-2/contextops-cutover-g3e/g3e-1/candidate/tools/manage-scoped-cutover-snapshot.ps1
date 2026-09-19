[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Capture', 'Verify', 'RestorePlan', 'Restore')]
    [string]$Command,

    [Parameter(Mandatory = $true)]
    [string]$VaultRoot,

    [Parameter(Mandatory = $true)]
    [string]$SelectionManifest,

    [Parameter(Mandatory = $true)]
    [string]$SnapshotDirectory,

    [switch]$AllowRestore
)

$ErrorActionPreference = 'Stop'
$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
$allowedPolicies = @('restore-exact', 'append-only-prefix', 'verify-only')
$expectedColumns = @('snapshot_id', 'repository_path', 'pre_sha256', 'bytes', 'restore_policy', 'basis')

function Get-Sha256 {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    return (Get-FileHash -Algorithm SHA256 -LiteralPath $LiteralPath).Hash.ToUpperInvariant()
}

function Get-BytesSha256 {
    param([Parameter(Mandatory = $true)][byte[]]$Bytes)
    $algorithm = [System.Security.Cryptography.SHA256]::Create()
    try {
        return ([System.BitConverter]::ToString($algorithm.ComputeHash($Bytes))).Replace('-', '')
    }
    finally {
        $algorithm.Dispose()
    }
}

function Resolve-InRoot {
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$RepositoryPath
    )

    if ([System.IO.Path]::IsPathRooted($RepositoryPath) -or $RepositoryPath -match '(^|/|\\)\.\.(/|\\|$)') {
        throw "Expected safe repository-relative path: $RepositoryPath"
    }
    $resolvedRoot = [System.IO.Path]::GetFullPath($Root).TrimEnd('\')
    $candidate = [System.IO.Path]::GetFullPath((Join-Path $resolvedRoot ($RepositoryPath -replace '/', '\')))
    if (($candidate -ne $resolvedRoot) -and (-not $candidate.StartsWith($resolvedRoot + '\', [System.StringComparison]::OrdinalIgnoreCase))) {
        throw "Path escapes root: $RepositoryPath"
    }
    return $candidate
}

function Assert-SnapshotDirectory {
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$LiteralPath)

    $resolvedRoot = [System.IO.Path]::GetFullPath($Root).TrimEnd('\')
    $candidate = [System.IO.Path]::GetFullPath($LiteralPath).TrimEnd('\')
    if (-not $candidate.StartsWith($resolvedRoot + '\', [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Snapshot directory must remain inside the supplied vault root: $candidate"
    }
    $relative = $candidate.Substring($resolvedRoot.Length + 1).Replace('\', '/')
    if ($relative -match '^(raw|research|inbox)(/|$)') {
        throw "Snapshot output is forbidden under protected source roots: $relative"
    }
    return $candidate
}

function Read-Selection {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)

    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) {
        throw "Selection manifest is missing: $LiteralPath"
    }
    $rows = @(Import-Csv -LiteralPath $LiteralPath)
    if ($rows.Count -ne 130) {
        throw "Expected exactly 130 snapshot rows; found $($rows.Count)."
    }
    $actualColumns = @($rows[0].PSObject.Properties.Name)
    if ((Compare-Object -ReferenceObject $expectedColumns -DifferenceObject $actualColumns).Count -ne 0) {
        throw 'Selection columns differ from the exact snapshot contract.'
    }
    if (@($rows.repository_path | Sort-Object -Unique).Count -ne $rows.Count) {
        throw 'Snapshot repository_path values must be unique.'
    }
    $manifestPaths = [string[]]@($rows | ForEach-Object { [string]$_.repository_path })
    $ordinalPaths = [string[]]$manifestPaths.Clone()
    [System.Array]::Sort($ordinalPaths, [System.StringComparer]::Ordinal)
    for ($index = 0; $index -lt $manifestPaths.Length; $index++) {
        if ($manifestPaths[$index] -cne $ordinalPaths[$index]) {
            throw 'Snapshot rows must already be sorted by repository_path using ordinal comparison.'
        }
    }
    if (@($rows | Where-Object restore_policy -eq 'restore-exact').Count -ne 126) {
        throw 'Expected exactly 126 restore-exact rows.'
    }
    if (@($rows | Where-Object restore_policy -eq 'append-only-prefix').Count -ne 3) {
        throw 'Expected exactly three append-only-prefix rows.'
    }
    if (@($rows | Where-Object restore_policy -eq 'verify-only').Count -ne 1) {
        throw 'Expected exactly one verify-only row.'
    }
    foreach ($row in $rows) {
        if ($row.restore_policy -notin $allowedPolicies) {
            throw "Unsupported restore policy: $($row.restore_policy)"
        }
        if ($row.pre_sha256 -notmatch '^[A-F0-9]{64}$') {
            throw "Invalid SHA-256: $($row.repository_path)"
        }
        if ([string]::IsNullOrWhiteSpace($row.snapshot_id) -or [string]::IsNullOrWhiteSpace($row.basis)) {
            throw "Snapshot identity or basis is empty: $($row.repository_path)"
        }
    }
    if (@($rows.snapshot_id | Sort-Object -Unique).Count -ne 1) {
        throw 'All rows must share one snapshot_id.'
    }
    return @($rows)
}

function Get-SelectionFingerprint {
    param([Parameter(Mandatory = $true)][object[]]$Rows)

    $lines = @($Rows | ForEach-Object {
        "$($_.repository_path)|$($_.pre_sha256)|$($_.restore_policy)"
    })
    return Get-BytesSha256 -Bytes $utf8NoBom.GetBytes(($lines -join "`n"))
}

function Assert-LivePreState {
    param([Parameter(Mandatory = $true)][object[]]$Rows, [Parameter(Mandatory = $true)][string]$Root)

    foreach ($row in $Rows) {
        $path = Resolve-InRoot -Root $Root -RepositoryPath $row.repository_path
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
            throw "Snapshot input is missing: $($row.repository_path)"
        }
        $item = Get-Item -LiteralPath $path
        if ([int64]$row.bytes -ne $item.Length) {
            throw "Snapshot byte count changed: $($row.repository_path)"
        }
        $actual = Get-Sha256 -LiteralPath $path
        if ($actual -ne $row.pre_sha256) {
            throw "Snapshot hash changed: $($row.repository_path); expected $($row.pre_sha256); actual $actual"
        }
    }
}

function New-DeterministicArchive {
    param(
        [Parameter(Mandatory = $true)][object[]]$Rows,
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$ArchivePath
    )

    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $stream = [System.IO.File]::Open($ArchivePath, [System.IO.FileMode]::CreateNew, [System.IO.FileAccess]::ReadWrite, [System.IO.FileShare]::None)
    try {
        $archive = [System.IO.Compression.ZipArchive]::new($stream, [System.IO.Compression.ZipArchiveMode]::Create, $true)
        try {
            foreach ($row in @($Rows | Where-Object restore_policy -ne 'verify-only')) {
                $source = Resolve-InRoot -Root $Root -RepositoryPath $row.repository_path
                $entry = $archive.CreateEntry($row.repository_path, [System.IO.Compression.CompressionLevel]::Optimal)
                $entry.LastWriteTime = [System.DateTimeOffset]::new(1980, 1, 1, 0, 0, 0, [System.TimeSpan]::Zero)
                $entryStream = $entry.Open()
                try {
                    $sourceStream = [System.IO.File]::OpenRead($source)
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
    param(
        [Parameter(Mandatory = $true)][object[]]$SelectionRows,
        [Parameter(Mandatory = $true)][string]$Directory,
        [switch]$CheckLivePreState,
        [string]$Root
    )

    $manifestPath = Join-Path $Directory 'snapshot-manifest.csv'
    $archivePath = Join-Path $Directory 'prestate-snapshot.zip'
    $envelopePath = Join-Path $Directory 'snapshot-envelope.json'
    foreach ($path in @($manifestPath, $archivePath, $envelopePath)) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Snapshot artifact is missing: $path" }
    }

    $manifestRows = @(Import-Csv -LiteralPath $manifestPath)
    if ($manifestRows.Count -ne 130) { throw 'Snapshot manifest row count is not 130.' }
    foreach ($index in 0..129) {
        foreach ($field in $expectedColumns) {
            if ([string]$manifestRows[$index].$field -ne [string]$SelectionRows[$index].$field) {
                throw "Snapshot manifest differs from selection at row $index field $field."
            }
        }
    }

    $envelope = Get-Content -Raw -LiteralPath $envelopePath -Encoding UTF8 | ConvertFrom-Json
    if ($envelope.snapshot_id -ne $SelectionRows[0].snapshot_id) { throw 'Envelope snapshot_id mismatch.' }
    if ($envelope.selection_fingerprint -ne (Get-SelectionFingerprint -Rows $SelectionRows)) { throw 'Envelope selection fingerprint mismatch.' }
    if ($envelope.manifest_sha256 -ne (Get-Sha256 -LiteralPath $manifestPath)) { throw 'Envelope manifest hash mismatch.' }
    if ($envelope.archive_sha256 -ne (Get-Sha256 -LiteralPath $archivePath)) { throw 'Envelope archive hash mismatch.' }

    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($archivePath)
    try {
        $entries = @($archive.Entries)
        if ($entries.Count -ne 129) { throw "Expected 129 archive entries; found $($entries.Count)." }
        foreach ($row in @($SelectionRows | Where-Object restore_policy -ne 'verify-only')) {
            $matching = @($entries | Where-Object FullName -eq $row.repository_path)
            if ($matching.Count -ne 1) { throw "Archive entry identity mismatch: $($row.repository_path)" }
            $entryStream = $matching[0].Open()
            try {
                $memory = [System.IO.MemoryStream]::new()
                try {
                    $entryStream.CopyTo($memory)
                    $bytes = $memory.ToArray()
                }
                finally { $memory.Dispose() }
            }
            finally { $entryStream.Dispose() }
            if ($bytes.Length -ne [int64]$row.bytes -or (Get-BytesSha256 -Bytes $bytes) -ne $row.pre_sha256) {
                throw "Archive entry bytes differ: $($row.repository_path)"
            }
        }
    }
    finally { $archive.Dispose() }

    if ($CheckLivePreState) { Assert-LivePreState -Rows $SelectionRows -Root $Root }
}

$resolvedVaultRoot = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
$resolvedSelection = (Resolve-Path -LiteralPath $SelectionManifest).Path
$resolvedSnapshotDirectory = Assert-SnapshotDirectory -Root $resolvedVaultRoot -LiteralPath $SnapshotDirectory
$selection = Read-Selection -LiteralPath $resolvedSelection
$selectionFingerprint = Get-SelectionFingerprint -Rows $selection
$expectedSnapshotId = 'g3e1-' + $selectionFingerprint.Substring(0, 16).ToLowerInvariant()
if ($selection[0].snapshot_id -cne $expectedSnapshotId) {
    throw "snapshot_id does not match the selection fingerprint: expected $expectedSnapshotId"
}

switch ($Command) {
    'Capture' {
        if (Test-Path -LiteralPath $resolvedSnapshotDirectory) {
            throw "Capture refuses an existing snapshot directory: $resolvedSnapshotDirectory"
        }
        Assert-LivePreState -Rows $selection -Root $resolvedVaultRoot
        $null = New-Item -ItemType Directory -Path $resolvedSnapshotDirectory
        $manifestPath = Join-Path $resolvedSnapshotDirectory 'snapshot-manifest.csv'
        $manifestText = (@($selection | Select-Object $expectedColumns | ConvertTo-Csv -NoTypeInformation) -join "`n") + "`n"
        [System.IO.File]::WriteAllText($manifestPath, $manifestText, $utf8NoBom)
        $archivePath = Join-Path $resolvedSnapshotDirectory 'prestate-snapshot.zip'
        New-DeterministicArchive -Rows $selection -Root $resolvedVaultRoot -ArchivePath $archivePath
        $toolHash = Get-Sha256 -LiteralPath $PSCommandPath
        $envelope = [ordered]@{
            envelope_contract = 'g3e-scoped-snapshot/v1'
            snapshot_id = $selection[0].snapshot_id
            row_count = 130
            restore_exact_count = 126
            append_only_prefix_count = 3
            verify_only_count = 1
            selection_fingerprint = $selectionFingerprint
            selection_manifest_sha256 = Get-Sha256 -LiteralPath $resolvedSelection
            manifest_sha256 = Get-Sha256 -LiteralPath $manifestPath
            archive_sha256 = Get-Sha256 -LiteralPath $archivePath
            capture_tool_sha256 = $toolHash
            authority_effect = 'none'
        }
        $envelopeText = ($envelope | ConvertTo-Json -Depth 5) + "`n"
        [System.IO.File]::WriteAllText((Join-Path $resolvedSnapshotDirectory 'snapshot-envelope.json'), $envelopeText, $utf8NoBom)
        Test-SnapshotBundle -SelectionRows $selection -Directory $resolvedSnapshotDirectory -CheckLivePreState -Root $resolvedVaultRoot
        Write-Output "PASS | captured 130 rows | selection $selectionFingerprint | authority effect: none"
    }
    'Verify' {
        Test-SnapshotBundle -SelectionRows $selection -Directory $resolvedSnapshotDirectory -CheckLivePreState -Root $resolvedVaultRoot
        Write-Output "PASS | verified 130 rows and 129 archive entries | authority effect: none"
    }
    'RestorePlan' {
        Test-SnapshotBundle -SelectionRows $selection -Directory $resolvedSnapshotDirectory
        $selection | Select-Object repository_path, restore_policy, pre_sha256, bytes | Format-Table -AutoSize
        Write-Output 'PASS | restore plan only | no bytes written'
    }
    'Restore' {
        if (-not $AllowRestore) { throw 'Restore requires explicit -AllowRestore.' }
        Test-SnapshotBundle -SelectionRows $selection -Directory $resolvedSnapshotDirectory
        $archivePath = Join-Path $resolvedSnapshotDirectory 'prestate-snapshot.zip'
        Add-Type -AssemblyName System.IO.Compression
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $archive = [System.IO.Compression.ZipFile]::OpenRead($archivePath)
        try {
            foreach ($row in $selection) {
                $target = Resolve-InRoot -Root $resolvedVaultRoot -RepositoryPath $row.repository_path
                if ($row.restore_policy -eq 'verify-only') {
                    if ((-not (Test-Path -LiteralPath $target -PathType Leaf)) -or (Get-Sha256 -LiteralPath $target) -ne $row.pre_sha256) {
                        throw "verify-only path changed: $($row.repository_path)"
                    }
                    continue
                }
                $entry = @($archive.Entries | Where-Object FullName -eq $row.repository_path)
                if ($entry.Count -ne 1) { throw "Restore entry missing or duplicated: $($row.repository_path)" }
                $entryStream = $entry[0].Open()
                try {
                    $memory = [System.IO.MemoryStream]::new()
                    try { $entryStream.CopyTo($memory); $saved = $memory.ToArray() } finally { $memory.Dispose() }
                }
                finally { $entryStream.Dispose() }
                if ($row.restore_policy -eq 'append-only-prefix') {
                    if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { throw "Append-only log is missing: $($row.repository_path)" }
                    $current = [System.IO.File]::ReadAllBytes($target)
                    if ($current.Length -lt $saved.Length) { throw "Append-only log lost its pre-state prefix: $($row.repository_path)" }
                    for ($index = 0; $index -lt $saved.Length; $index++) {
                        if ($current[$index] -ne $saved[$index]) { throw "Append-only log prefix changed: $($row.repository_path)" }
                    }
                    continue
                }
                $parent = Split-Path -Parent $target
                if (-not (Test-Path -LiteralPath $parent -PathType Container)) { $null = New-Item -ItemType Directory -Path $parent -Force }
                [System.IO.File]::WriteAllBytes($target, $saved)
                if ((Get-Sha256 -LiteralPath $target) -ne $row.pre_sha256) { throw "Restored hash mismatch: $($row.repository_path)" }
            }
        }
        finally { $archive.Dispose() }
        Write-Output 'PASS | exact paths restored; append-only logs preserved; verify-only path unchanged'
    }
}
