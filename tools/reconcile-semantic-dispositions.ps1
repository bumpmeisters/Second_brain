[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][ValidatePattern('^P[0-9]+$')][string]$Package,
    [Parameter(Mandatory)][string]$DecisionLedger,
    [string]$PackageManifest = '',
    [string]$Register = 'wiki/_outputs/source-intake/clipping-dispositions.csv',
    [string]$ReportDirectory = 'wiki/_outputs/youtube-intelligence/reconciliation',
    [switch]$Apply
)

$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

function Resolve-RepoFile([string]$RelativePath) {
    if ([IO.Path]::IsPathRooted($RelativePath)) { throw "Repository-relative path required: $RelativePath" }
    $candidate = [IO.Path]::GetFullPath((Join-Path $repo $RelativePath))
    if (-not $candidate.StartsWith($repo + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Path escaped repository: $RelativePath"
    }
    return $candidate
}

function Get-SemanticDisposition([string]$Decision) {
    switch ($Decision) {
        { $_ -in @('new-claim', 'extended-claim', 'corroborating') } { return 'promotional' }
        'registered-only' { return 'registered-only' }
        'duplicate-variant' { return 'duplicate' }
        'out-of-scope' { return 'out-of-scope' }
        'blocked' { return 'blocked' }
        default { throw "Decision is not a completed semantic outcome: $Decision" }
    }
}

$ledgerPath = Resolve-RepoFile $DecisionLedger
$registerPath = Resolve-RepoFile $Register
foreach ($path in @($ledgerPath, $registerPath)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Required file missing: $path" }
}

$registerHashBefore = (Get-FileHash -LiteralPath $registerPath -Algorithm SHA256).Hash
$decisions = @(Import-Csv -LiteralPath $ledgerPath)
$registerRows = @(Import-Csv -LiteralPath $registerPath)
$registerBySource = @{}
foreach ($row in $registerRows) {
    if ($registerBySource.ContainsKey($row.canonical_source)) { throw "Duplicate register path: $($row.canonical_source)" }
    $registerBySource[$row.canonical_source] = $row
}

$standingRows = @($decisions | Where-Object decision_authority -eq 'standing-policy')
$standingAuthority = $null
$standingManifest = $null
$standingManifestHash = ''
if ($standingRows.Count -gt 0) {
    if (-not $PackageManifest) { throw 'Standing-policy reconciliation requires PackageManifest.' }
    $packageManifestPath = Resolve-RepoFile $PackageManifest
    if (-not (Test-Path -LiteralPath $packageManifestPath -PathType Leaf)) { throw "Package manifest missing: $PackageManifest" }
    $packageData = Get-Content -LiteralPath $packageManifestPath -Raw | ConvertFrom-Json
    if ($packageData.package_id -ne $Package) { throw 'Package manifest id does not match the requested package.' }
    if (-not $packageData.standing_authority.authority_id -or -not $packageData.standing_authority.run_manifest) {
        throw 'Package manifest lacks standing-authority provenance.'
    }
    $selectionPolicyPath = Resolve-RepoFile $packageData.selection_gate.policy
    $selectionPolicy = Get-Content -LiteralPath $selectionPolicyPath -Raw | ConvertFrom-Json
    $authorityMatches = @($selectionPolicy.standing_authorities | Where-Object authority_id -eq $packageData.standing_authority.authority_id)
    if ($authorityMatches.Count -ne 1 -or -not $authorityMatches[0].enabled) { throw 'Standing authority is missing or disabled.' }
    $standingAuthority = $authorityMatches[0]
    $standingManifestPath = Resolve-RepoFile $packageData.standing_authority.run_manifest
    if (-not (Test-Path -LiteralPath $standingManifestPath -PathType Leaf)) { throw 'Standing-authority run manifest is missing.' }
    $standingManifestHash = (Get-FileHash -LiteralPath $standingManifestPath -Algorithm SHA256).Hash
    $standingManifest = Get-Content -LiteralPath $standingManifestPath -Raw | ConvertFrom-Json
    if ($standingManifest.schema_version -ne $standingAuthority.required_manifest_schema) { throw 'Standing-authority manifest schema mismatch.' }
}

$changes = [Collections.Generic.List[object]]::new()
$eligible = @($decisions | Where-Object {
    if ($_.decision_authority -eq 'standing-policy') { $_.review_status -in @('reviewed', 'approved') }
    else { $_.review_status -eq 'approved' }
})
if ($eligible.Count -ne $decisions.Count) { throw 'Reconciliation requires every decision to be human-approved or standing-policy reviewed.' }

$timestamp = [DateTime]::UtcNow.ToString('o')
foreach ($decision in $eligible) {
    $source = $decision.canonical_source.Replace('\', '/')
    if (-not $registerBySource.ContainsKey($source)) { throw "Decision source is absent from register: $source" }
    $row = $registerBySource[$source]
    if ($decision.sha256 -notmatch '^[0-9A-Fa-f]{64}$') { throw "Invalid ledger SHA-256: $source" }
    if ($row.sha256 -ne $decision.sha256) { throw "Ledger/register hash mismatch: $source" }
    $sourcePath = Resolve-RepoFile $source
    if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) { throw "Source missing: $source" }
    if ((Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash -ne $decision.sha256) { throw "Ledger/source hash mismatch: $source" }
    $standingAuthorized = $false
    if ($decision.decision_authority -eq 'standing-policy') {
        $manifestMatches = @($standingManifest.captured_sources | Where-Object { $_.canonical_source -eq $source -and $_.sha256 -eq $decision.sha256 })
        $standingAuthorized = (
            $decision.authority_id -eq $standingAuthority.authority_id -and
            $decision.decision_actor -eq $standingAuthority.decision_actor -and
            $decision.autonomy_level -eq $standingAuthority.required_autonomy_level -and
            $decision.authority_policy_version -eq $selectionPolicy.schema_version -and
            $decision.authority_run_id -eq $standingManifest.run_id -and
            $decision.authority_manifest_sha256 -eq $standingManifestHash -and
            $source.StartsWith($standingAuthority.source_prefix, [StringComparison]::OrdinalIgnoreCase) -and
            $manifestMatches.Count -eq 1
        )
        if (-not $standingAuthorized) { throw "Invalid standing-authority provenance: $source" }
    }
    if ($row.availability -ne 'available' -or ($row.selection_status -ne 'approved-for-semantic-review' -and -not $standingAuthorized)) {
        throw "Source lacks the approved selection state required for reconciliation: $source"
    }
    if ($row.package -and $row.package -ne $Package) { throw "Register already assigns source to another package: $source ($($row.package))" }

    $targetDisposition = Get-SemanticDisposition $decision.semantic_decision
    $alreadyReconciled = $row.processing_status -eq 'reviewed' -and $row.semantic_disposition -eq $targetDisposition -and $row.package -eq $Package
    if (-not $alreadyReconciled) {
        if ($row.processing_status -notin @('unread', 'reviewed') -or $row.semantic_disposition -notin @('pending', $targetDisposition)) {
            throw "Register contains a conflicting completed outcome: $source"
        }
        $changes.Add([pscustomobject][ordered]@{
            canonical_source = $source
            before_processing_status = $row.processing_status
            after_processing_status = 'reviewed'
            before_semantic_disposition = $row.semantic_disposition
            after_semantic_disposition = $targetDisposition
        })
        $row.processing_status = 'reviewed'
        $row.semantic_disposition = $targetDisposition
        $row.package = $Package
        $row.decision_context = if ($standingAuthorized) { "standing-policy:$($standingAuthority.authority_id):$DecisionLedger" } else { "approved-semantic-ingest:$DecisionLedger" }
        $row.decided_by = if ($standingAuthorized) { $standingAuthority.decision_actor } else { 'approved-package-checkpoint' }
        $row.decided_at = $timestamp
        $row.rationale = if ($standingAuthorized) { 'Reconciled from an exact manifested standing-policy review with path and SHA-256 verification.' } else { 'Reconciled from an approved semantic-ingest decision with exact path and SHA-256 verification.' }
        $row.updated_at = $timestamp
    }
}

$report = [ordered]@{
    schema_version = 'semantic-disposition-reconciliation/v1'
    package = $Package
    decision_ledger = $DecisionLedger.Replace('\', '/')
    decision_ledger_sha256 = (Get-FileHash -LiteralPath $ledgerPath -Algorithm SHA256).Hash
    register = $Register.Replace('\', '/')
    register_sha256_before = $registerHashBefore
    approved_decision_count = $eligible.Count
    standing_policy_decision_count = $standingRows.Count
    changed_count = $changes.Count
    dry_run = -not $Apply
    reconciled_at = $timestamp
    changes = @($changes)
}

if ($Apply -and $changes.Count -gt 0) {
    if ((Get-FileHash -LiteralPath $registerPath -Algorithm SHA256).Hash -ne $registerHashBefore) { throw 'Register changed during reconciliation; refusing to overwrite.' }
    if ($PSCmdlet.ShouldProcess($Register, "Reconcile $($changes.Count) approved $Package decisions")) {
        $tempPath = Join-Path (Split-Path -Parent $registerPath) ('.reconcile-' + [guid]::NewGuid().ToString('N') + '.csv')
        try {
            $registerRows | Export-Csv -LiteralPath $tempPath -NoTypeInformation -Encoding utf8
            Move-Item -LiteralPath $tempPath -Destination $registerPath -Force
        } finally {
            if (Test-Path -LiteralPath $tempPath) { Remove-Item -LiteralPath $tempPath -Force }
        }
    }
}

$report['register_sha256_after'] = (Get-FileHash -LiteralPath $registerPath -Algorithm SHA256).Hash
if ($Apply) {
    $reportDirPath = Resolve-RepoFile $ReportDirectory
    if (-not (Test-Path -LiteralPath $reportDirPath)) { New-Item -ItemType Directory -Path $reportDirPath -Force | Out-Null }
    $reportPath = Join-Path $reportDirPath ("{0}-{1}.json" -f $Package.ToLowerInvariant(), [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ'))
    $report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $reportPath -Encoding utf8
    $report['report_path'] = $reportPath.Substring($repo.Length + 1).Replace('\', '/')
}

$report | ConvertTo-Json -Depth 8
