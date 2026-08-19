param(
    [Parameter(Mandatory = $true)][ValidatePattern('^P[0-9]+$')][string]$PackageId,
    [Parameter(Mandatory = $true)][string]$IntakeLedger,
    [string[]]$RerouteLedger = @(),
    [string[]]$CompletedLedger = @(),
    [string]$SelectionPolicy = 'tools/config/source-selection-policy.json',
    [string]$DispositionRegister = '',
    [string]$StandingAuthorityId = '',
    [string]$StandingAuthorityRunManifest = '',
    [string]$OutputDirectory
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$packageKey = $PackageId.ToLowerInvariant()
$schema = Get-Content -LiteralPath (Join-Path $vaultRoot 'tools\config\semantic-ingest-schema.json') -Raw | ConvertFrom-Json

function Resolve-VaultPath([string]$Path, [switch]$MustExist) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $vaultRoot $Path }
    if ($MustExist -and -not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
        throw "File does not exist: $Path"
    }
    $full = [IO.Path]::GetFullPath($candidate)
    if (-not $full.StartsWith($vaultRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Path is outside the vault: $Path"
    }
    return $full
}

function Get-RelativePath([string]$Path) {
    return $Path.Substring($vaultRoot.Length + 1).Replace('\', '/')
}

$selectionPolicyPath = Resolve-VaultPath $SelectionPolicy -MustExist
$selectionPolicyData = Get-Content -LiteralPath $selectionPolicyPath -Raw | ConvertFrom-Json
if (-not $DispositionRegister) { $DispositionRegister = $selectionPolicyData.register_path }

$standingAuthority = $null
$standingManifest = $null
$standingManifestRelative = ''
$standingManifestHash = ''
if ($StandingAuthorityId -or $StandingAuthorityRunManifest) {
    if (-not $StandingAuthorityId -or -not $StandingAuthorityRunManifest) {
        throw 'Standing authority requires both StandingAuthorityId and StandingAuthorityRunManifest.'
    }
    $matches = @($selectionPolicyData.standing_authorities | Where-Object authority_id -eq $StandingAuthorityId)
    if ($matches.Count -ne 1) { throw "Expected one standing authority named $StandingAuthorityId; found $($matches.Count)." }
    $standingAuthority = $matches[0]
    if (-not $standingAuthority.enabled) { throw "Standing authority is disabled: $StandingAuthorityId" }
    $standingManifestPath = Resolve-VaultPath $StandingAuthorityRunManifest -MustExist
    $standingManifestRelative = Get-RelativePath $standingManifestPath
    $standingManifestHash = (Get-FileHash -LiteralPath $standingManifestPath -Algorithm SHA256).Hash
    $standingManifest = Get-Content -LiteralPath $standingManifestPath -Raw | ConvertFrom-Json
    if ($standingManifest.schema_version -ne $standingAuthority.required_manifest_schema) {
        throw 'Standing-authority run manifest uses an unauthorized schema.'
    }
    if (-not $standingManifest.run_id) { throw 'Standing-authority run manifest has no run id.' }
}

$intakePath = Resolve-VaultPath $IntakeLedger -MustExist
$outputPath = if ($OutputDirectory) {
    Resolve-VaultPath $OutputDirectory
} else {
    Join-Path $vaultRoot "wiki\_outputs\semantic-ingest\$packageKey"
}
if (Test-Path -LiteralPath $outputPath) {
    throw "Output directory already exists; semantic-ingest scaffolding is create-only: $(Get-RelativePath $outputPath)"
}

$intakeRows = @(Import-Csv -LiteralPath $intakePath)
$selected = [Collections.Generic.List[object]]::new()
$resolvedRerouteLedgers = [Collections.Generic.List[string]]::new()
$resolvedCompletedLedgers = [Collections.Generic.List[string]]::new()
foreach ($row in @($intakeRows | Where-Object package -eq $PackageId)) {
    $selected.Add([pscustomobject]@{ intake = $row; origin = "assigned-$PackageId" })
}
foreach ($ledger in $RerouteLedger) {
    if (-not $ledger) { continue }
    $ledgerPath = Resolve-VaultPath $ledger -MustExist
    $resolvedRerouteLedgers.Add((Get-RelativePath $ledgerPath))
    foreach ($route in @(Import-Csv -LiteralPath $ledgerPath | Where-Object routing -eq "rerouted-$PackageId")) {
        $match = $intakeRows | Where-Object canonical_source -eq $route.canonical_source | Select-Object -First 1
        if (-not $match) { throw "Rerouted source is missing from intake ledger: $($route.canonical_source)" }
        $selected.Add([pscustomobject]@{ intake = $match; origin = "rerouted-$PackageId" })
    }
}
foreach ($ledger in $CompletedLedger) {
    if (-not $ledger) { continue }
    $ledgerPath = Resolve-VaultPath $ledger -MustExist
    $resolvedCompletedLedgers.Add((Get-RelativePath $ledgerPath))
}

$seen = @{}
$decisionRows = foreach ($item in $selected) {
    $row = $item.intake
    if ($seen.ContainsKey($row.canonical_source)) { continue }
    $seen[$row.canonical_source] = $true
    $originalTitle = [IO.Path]::GetFileNameWithoutExtension($row.canonical_source)
    $contentTitle = if ($row.canonical_title) { $row.canonical_title } else { $originalTitle }
    $mismatch = ($row.cross_title_duplicate -eq 'true') -or ($originalTitle -ne $contentTitle)
    $decision = [ordered]@{
        canonical_source = $row.canonical_source
        sha256 = $row.sha256
        original_title = $originalTitle
        canonical_content_title = $contentTitle
        title_mismatch = $mismatch.ToString().ToLowerInvariant()
        source_type = $row.source_type
        trust_class = 'pending'
        semantic_decision = 'pending'
        routing = "stay-$PackageId"
        claim_risk = 'pending'
        target_pages = ''
        source_summary = ''
        rationale = if ($item.origin -like 'rerouted-*') { "Rerouted into $PackageId during prior body-level review." } else { '' }
        review_status = 'pending'
    }
    if ($standingAuthority) {
        $decision.decision_authority = 'standing-policy'
        $decision.authority_id = $standingAuthority.authority_id
        $decision.decision_actor = $standingAuthority.decision_actor
        $decision.autonomy_level = $standingAuthority.required_autonomy_level
        $decision.authority_policy_version = $selectionPolicyData.schema_version
        $decision.authority_run_id = $standingManifest.run_id
        $decision.authority_manifest_sha256 = $standingManifestHash
    }
    [pscustomobject]$decision
}

$packageNumber = [int]($PackageId.Substring(1))
$gatedRows = @($decisionRows | Where-Object {
    $source = $_.canonical_source.Replace('\', '/')
    @($selectionPolicyData.applies_to_prefixes | Where-Object { $source.StartsWith($_, [StringComparison]::OrdinalIgnoreCase) }).Count -gt 0
})
$selectionGateRequired = $packageNumber -ge [int]$selectionPolicyData.enforced_from_package_number -and $gatedRows.Count -gt 0
$selectionRegisterRelative = $DispositionRegister.Replace('\', '/')
if ($selectionGateRequired) {
    $dispositionPath = Resolve-VaultPath $DispositionRegister -MustExist
    $selectionRegisterRelative = Get-RelativePath $dispositionPath
    $dispositions = @(Import-Csv -LiteralPath $dispositionPath)
    foreach ($row in $gatedRows) {
        $matches = @($dispositions | Where-Object canonical_source -eq $row.canonical_source)
        if ($matches.Count -ne 1) { throw "Selection gate requires one disposition row for $($row.canonical_source); found $($matches.Count)." }
        $disposition = $matches[0]
        if ($disposition.sha256 -ne $row.sha256) { throw "Selection gate hash mismatch: $($row.canonical_source)" }
        if ($disposition.availability -ne $selectionPolicyData.required_availability) { throw "Selection gate availability is not approved: $($row.canonical_source)" }
        $standingAuthorized = $false
        if ($standingAuthority) {
            $source = $row.canonical_source.Replace('\', '/')
            $manifestMatches = @($standingManifest.captured_sources | Where-Object { $_.canonical_source -eq $source -and $_.sha256 -eq $row.sha256 })
            $standingAuthorized = $source.StartsWith($standingAuthority.source_prefix, [StringComparison]::OrdinalIgnoreCase) -and $manifestMatches.Count -eq 1
        }
        if ($disposition.selection_status -ne $selectionPolicyData.required_selection_status -and -not $standingAuthorized) {
            throw "Selection gate status is not approved and has no exact standing authority: $($row.canonical_source)"
        }
        if ($disposition.package -and $disposition.package -ne $PackageId) { throw "Selection gate package mismatch: $($row.canonical_source)" }
    }
}

New-Item -ItemType Directory -Path $outputPath -Force | Out-Null
$decisionPath = Join-Path $outputPath 'decisions.csv'
$matrixPath = Join-Path $outputPath 'evidence-matrix.csv'
$bundlePath = Join-Path $outputPath 'source-bundle.md'
$manifestPath = Join-Path $outputPath 'package.json'

$decisionRows | Export-Csv -LiteralPath $decisionPath -NoTypeInformation -Encoding UTF8
@([pscustomobject][ordered]@{
    claim_id = ''
    wave = ''
    pattern_or_claim = ''
    source_paths = ''
    knowledge_delta = ''
    trust = ''
    claim_risk = ''
    target_page = ''
    planned_action = ''
    review_status = 'pending'
    notes = ''
}) | Export-Csv -LiteralPath $matrixPath -NoTypeInformation -Encoding UTF8

$today = Get-Date -Format 'yyyy-MM-dd'
$bundle = @"
---
type: source-summary
status: draft
package: $PackageId
source_ledger: $(Get-RelativePath $decisionPath)
evidence_matrix: $(Get-RelativePath $matrixPath)
canonical_source_count: $(@($decisionRows).Count)
created: $today
updated: $today
---

# $PackageId Semantic Ingest Source Bundle

**Summary**: Draft bundle. Complete the evidence matrix before promoting claims.

---

## Knowledge delta

Pending review.

## Contradictions and caveats

- Pending review.

## Routing and exclusions

- Pending review.
"@
[IO.File]::WriteAllText($bundlePath, $bundle, [Text.UTF8Encoding]::new($false))

$completedSources = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($ledger in $resolvedCompletedLedgers) {
    foreach ($row in @(Import-Csv -LiteralPath (Join-Path $vaultRoot $ledger))) {
        if ($row.semantic_decision -ne 'pending' -and $row.routing -like 'stay-*' -and $row.review_status -eq 'approved') {
            [void]$completedSources.Add($row.canonical_source)
        }
    }
}
$openCount = @($intakeRows.canonical_source | Sort-Object -Unique | Where-Object { -not $completedSources.Contains($_) }).Count

$manifest = [ordered]@{
    schema_version = $schema.schema_version
    package_id = $PackageId
    status = 'draft'
    created = $today
    schema_path = 'tools/config/semantic-ingest-schema.json'
    intake_ledger = Get-RelativePath $intakePath
    decision_ledger = Get-RelativePath $decisionPath
    evidence_matrix = Get-RelativePath $matrixPath
    source_bundle = Get-RelativePath $bundlePath
    expected_source_count = @($decisionRows).Count
    register_updates_required = $false
    register_markers = [ordered]@{}
    routing = [ordered]@{
        reroute_ledgers = @($resolvedRerouteLedgers)
    }
    backlog = [ordered]@{
        completed_ledgers = @($resolvedCompletedLedgers)
        expected_open_count = $openCount
    }
    raw_guard_required = $true
    selection_gate = [ordered]@{
        policy = Get-RelativePath $selectionPolicyPath
        register = $selectionRegisterRelative
        required = $selectionGateRequired
        required_availability = $selectionPolicyData.required_availability
        required_selection_status = $selectionPolicyData.required_selection_status
    }
    standing_authority = if ($standingAuthority) {
        [ordered]@{ authority_id = $standingAuthority.authority_id; run_manifest = $standingManifestRelative }
    } else { $null }
    validation = [ordered]@{
        validator_version = $schema.validator_version
        validated_at = $null
        validation_mode = $null
        validation_profile = $null
        validation_status = 'not-run'
        decision_ledger_sha256 = $null
        evidence_matrix_sha256 = $null
    }
}
$manifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

Write-Host "Created semantic-ingest package $PackageId with $(@($decisionRows).Count) canonical sources."
Write-Host (Get-RelativePath $manifestPath)
