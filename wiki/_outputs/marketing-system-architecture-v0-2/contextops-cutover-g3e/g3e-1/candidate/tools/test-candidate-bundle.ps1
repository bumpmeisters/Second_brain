[CmdletBinding()]
param(
    [string]$CandidateRoot,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($CandidateRoot)) {
    $CandidateRoot = Join-Path $PSScriptRoot '..'
}
$candidate = (Resolve-Path -LiteralPath $CandidateRoot).Path.TrimEnd('\')
$g3eRoot = (Resolve-Path -LiteralPath (Join-Path $candidate '..\..')).Path
$findings = [System.Collections.Generic.List[string]]::new()

function Get-Sha256 {
    param([string]$LiteralPath)
    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Add-Finding {
    param([string]$Message)
    $findings.Add($Message)
}

function Test-RowCount {
    param([string]$RelativePath, [int]$Expected)
    $path = Join-Path $candidate $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Finding "Missing manifest: $RelativePath"
        return
    }
    $count = @(Import-Csv -LiteralPath $path).Count
    if ($count -ne $Expected) {
        Add-Finding "Unexpected row count for ${RelativePath}: $count; expected $Expected"
    }
}

$bundlePath = Join-Path $candidate 'bundle-manifest.csv'
if (-not (Test-Path -LiteralPath $bundlePath -PathType Leaf)) {
    throw 'bundle-manifest.csv is missing.'
}
$bundle = @(Import-Csv -LiteralPath $bundlePath)
if ($bundle.Count -ne 30) {
    Add-Finding "Bundle manifest contains $($bundle.Count) rows; expected 30."
}
if (@($bundle | Group-Object candidate_path | Where-Object Count -ne 1).Count -gt 0) {
    Add-Finding 'Bundle manifest candidate_path values are not unique.'
}
foreach ($row in $bundle) {
    $path = [IO.Path]::GetFullPath((Join-Path $candidate ([string]$row.candidate_path)))
    if (-not $path.StartsWith($candidate + '\', [StringComparison]::OrdinalIgnoreCase)) {
        Add-Finding "Bundle path escapes candidate root: $($row.candidate_path)"
        continue
    }
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Finding "Bundle file is missing: $($row.candidate_path)"
        continue
    }
    if ((Get-Sha256 -LiteralPath $path) -ne $row.sha256) {
        Add-Finding "Bundle hash mismatch: $($row.candidate_path)"
    }
    if ((Get-Item -LiteralPath $path).Length -ne [int64]$row.bytes) {
        Add-Finding "Bundle byte-count mismatch: $($row.candidate_path)"
    }
}

Test-RowCount 'manifests/component-posthashes.csv' 95
Test-RowCount 'manifests/control-posthashes.csv' 11
Test-RowCount 'manifests/exact-poststate-manifest.csv' 23
Test-RowCount 'manifests/forward-transaction.csv' 20
Test-RowCount 'manifests/mos-posthashes.csv' 16
Test-RowCount 'manifests/reverse-transaction.csv' 12
Test-RowCount 'manifests/wrapper-transition-manifest.csv' 11
Test-RowCount 'specs/snapshot-selection.csv' 130
Test-RowCount 'snapshot/snapshot-manifest.csv' 130
Test-RowCount '..\..\move-manifest.csv' 95

$refactorSpecPath = Join-Path $candidate 'specs/component-refactor-operations.json'
try {
    $refactorSpec = Get-Content -Raw -LiteralPath $refactorSpecPath | ConvertFrom-Json
    if (@($refactorSpec.files).Count -ne 21) {
        Add-Finding "Refactor spec contains $(@($refactorSpec.files).Count) files; expected 21."
    }
    if (@($refactorSpec.files.operations).Count -ne 63) {
        Add-Finding "Refactor spec contains $(@($refactorSpec.files.operations).Count) operations; expected 63."
    }
}
catch {
    Add-Finding "Refactor spec is not readable JSON: $($_.Exception.Message)"
}

foreach ($jsonFile in Get-ChildItem -LiteralPath $candidate -Recurse -File -Filter '*.json') {
    try {
        Get-Content -Raw -LiteralPath $jsonFile.FullName | ConvertFrom-Json | Out-Null
    }
    catch {
        Add-Finding "Invalid JSON: $($jsonFile.FullName.Substring($candidate.Length + 1))"
    }
}

foreach ($powerShellFile in Get-ChildItem -LiteralPath (Join-Path $candidate 'tools') -File -Filter '*.ps1') {
    $tokens = $null
    $errors = $null
    [Management.Automation.Language.Parser]::ParseFile($powerShellFile.FullName, [ref]$tokens, [ref]$errors) | Out-Null
    if ($errors.Count -gt 0) {
        Add-Finding "PowerShell syntax failure: $($powerShellFile.Name)"
    }
}

$snapshotEnvelopePath = Join-Path $candidate 'snapshot/snapshot-envelope.json'
$snapshotEnvelope = Get-Content -Raw -LiteralPath $snapshotEnvelopePath | ConvertFrom-Json
if ($snapshotEnvelope.selection_fingerprint -ne '2B697F4996C9313CEAE6689C879470687A78DCC31D46D93A12F9AFA8167A2457') {
    Add-Finding 'Snapshot selection fingerprint is not the approved Ordinal identity.'
}
if ((Get-Sha256 -LiteralPath (Join-Path $candidate 'snapshot/snapshot-manifest.csv')) -ne $snapshotEnvelope.manifest_sha256 -or
    (Get-Sha256 -LiteralPath (Join-Path $candidate 'snapshot/prestate-snapshot.zip')) -ne $snapshotEnvelope.archive_sha256) {
    Add-Finding 'Snapshot envelope does not match its manifest or archive.'
}

$postEnvelopePath = Join-Path $candidate 'poststate/exact-poststate-envelope.json'
$postEnvelope = Get-Content -Raw -LiteralPath $postEnvelopePath | ConvertFrom-Json
if ((Get-Sha256 -LiteralPath (Join-Path $candidate 'manifests/exact-poststate-manifest.csv')) -ne $postEnvelope.manifest.sha256 -or
    (Get-Sha256 -LiteralPath (Join-Path $candidate 'poststate/exact-poststate.zip')) -ne $postEnvelope.archive.sha256 -or
    (Get-Sha256 -LiteralPath (Join-Path $candidate 'tools/apply-exact-poststate.ps1')) -ne $postEnvelope.consumer_tool.sha256) {
    Add-Finding 'Exact-poststate envelope does not match its manifest, archive, or consumer tool.'
}

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
foreach ($archiveSpec in @(
    @{ path = 'snapshot/prestate-snapshot.zip'; entries = 129 },
    @{ path = 'poststate/exact-poststate.zip'; entries = 23 }
)) {
    $archive = [IO.Compression.ZipFile]::OpenRead((Join-Path $candidate $archiveSpec.path))
    try {
        if ($archive.Entries.Count -ne $archiveSpec.entries) {
            Add-Finding "Unexpected ZIP entry count for $($archiveSpec.path): $($archive.Entries.Count)"
        }
    }
    finally {
        $archive.Dispose()
    }
}

$pathColumns = @('repository_path', 'source_path', 'target_path', 'canonical_path', 'wrapper_path', 'canonical_pre_path', 'canonical_post_path')
foreach ($csvFile in Get-ChildItem -LiteralPath (Join-Path $candidate 'manifests') -File -Filter '*.csv') {
    foreach ($row in @(Import-Csv -LiteralPath $csvFile.FullName)) {
        foreach ($column in $pathColumns) {
            $property = $row.PSObject.Properties[$column]
            if ($null -eq $property) { continue }
            $value = ([string]$property.Value).Replace('\', '/')
            if ($value -match '^(raw|research|inbox)(/|$)') {
                Add-Finding "Protected path in $($csvFile.Name): $column=$value"
            }
        }
    }
}

foreach ($patchFile in Get-ChildItem -LiteralPath (Join-Path $candidate 'patches') -File) {
    $text = Get-Content -Raw -LiteralPath $patchFile.FullName
    if (($text -match '(?i)AppData[/\\]Local[/\\]Temp') -or ($text -match 'g3e1-simulation-')) {
        Add-Finding "Temporary path leaked into patch: $($patchFile.Name)"
    }
}

$result = [ordered]@{
    contract = 'g3e1-candidate-static-verifier/v1'
    verdict = if ($findings.Count -eq 0) { 'PASS' } else { 'FAIL' }
    bundle_rows = $bundle.Count
    findings = @($findings)
    authority_effect = 'none'
}
if ($Json) {
    $result | ConvertTo-Json -Depth 5 -Compress
}
else {
    Write-Output "$($result.verdict) | $($bundle.Count)/30 material artifacts | findings: $($findings.Count) | authority effect: none"
    foreach ($finding in $findings) { Write-Output "FAIL $finding" }
}
if ($findings.Count -gt 0) { exit 1 }
exit 0
