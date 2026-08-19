param(
    [Parameter(Mandatory = $true)][string]$Manifest,
    [ValidateSet('Draft', 'Wave', 'Final')][string]$Mode = 'Draft',
    [ValidateSet('Fast', 'Full')][string]$Profile = 'Full',
    [switch]$RecordResult,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$errors = [Collections.Generic.List[object]]::new()
$warnings = [Collections.Generic.List[object]]::new()

function Add-Issue([string]$Level, [string]$Code, [string]$Message, [string]$Path = '') {
    $issue = [pscustomobject][ordered]@{ code = $Code; message = $Message; path = $Path }
    if ($Level -eq 'error') { $errors.Add($issue) } else { $warnings.Add($issue) }
}

function Resolve-VaultPath([string]$Path) {
    if (-not $Path) { return $null }
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $vaultRoot $Path }
    $full = [IO.Path]::GetFullPath($candidate)
    if (-not $full.StartsWith($vaultRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        Add-Issue error 'PATH_OUTSIDE_VAULT' "Path is outside the vault: $Path" $Path
        return $null
    }
    return $full
}

function Get-RelativePath([string]$Path) {
    return $Path.Substring($vaultRoot.Length + 1).Replace('\', '/')
}

function Test-MarkdownFile([string]$RelativePath) {
    $path = Resolve-VaultPath $RelativePath
    if (-not $path -or -not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Issue error 'MARKDOWN_MISSING' 'Referenced Markdown file does not exist.' $RelativePath
        return
    }
    $text = [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
    $frontmatter = [regex]::Matches($text, '(?m)^---\s*$')
    if ($frontmatter.Count -lt 2 -or $frontmatter[0].Index -ne 0) {
        Add-Issue error 'FRONTMATTER_INVALID' 'Markdown file must start with closed YAML frontmatter.' $RelativePath
    }
    $tick = ([char]96).ToString()
    $literalNewlinePair = $tick + 'n' + $tick + 'n'
    $literalCrLf = $tick + 'r' + $tick + 'n'
    if ($text.Contains($literalNewlinePair) -or $text.Contains($literalCrLf)) {
        Add-Issue error 'LITERAL_NEWLINE_ESCAPE' 'Markdown contains literal escaped line-break pairs.' $RelativePath
    }
    foreach ($match in [regex]::Matches($text, '\[\[([^\]|#]+)')) {
        $linkTarget = $match.Groups[1].Value.Trim()
        $directTarget = if ($linkTarget.EndsWith('.md', [StringComparison]::OrdinalIgnoreCase)) { $linkTarget } else { $linkTarget + '.md' }
        $directPath = Join-Path $vaultRoot $directTarget
        $wikiPath = Join-Path $vaultRoot ('wiki/' + $directTarget)
        $linkName = [IO.Path]::GetFileNameWithoutExtension($directTarget)
        if (
            -not (Test-Path -LiteralPath $directPath -PathType Leaf) -and
            -not (Test-Path -LiteralPath $wikiPath -PathType Leaf) -and
            -not $markdownNameIndex.Contains($linkName)
        ) {
            Add-Issue error 'WIKI_LINK_MISSING' "Wiki link target does not exist: $($match.Groups[1].Value)" $RelativePath
        }
    }

    foreach ($match in [regex]::Matches($text, 'source:\s*([^;\r\n]+?\.md)')) {
        $citation = $match.Groups[1].Value.Trim().Trim([char]96)
        if ($citation -match '^\[\[' -or $citation -match '^`?wiki/') { continue }
        $citationPath = Join-Path $vaultRoot $citation
        $citationName = [IO.Path]::GetFileName($citation)
        if (-not (Test-Path -LiteralPath $citationPath -PathType Leaf) -and -not $sourceNameIndex.Contains($citationName)) {
            Add-Issue error 'SOURCE_CITATION_MISSING' "Cited source filename does not exist: $citation" $RelativePath
        }
    }
}

function Get-FrontmatterValue([string]$Text, [string]$Field) {
    $frontmatter = [regex]::Match($Text, '(?s)\A---\s*\r?\n(.*?)\r?\n---\s*(?:\r?\n|$)')
    if (-not $frontmatter.Success) { return '' }
    $match = [regex]::Match(
        $frontmatter.Groups[1].Value,
        '(?m)^' + [regex]::Escape($Field) + ':\s*(?:"([^"]*)"|''([^'']*)''|([^\r\n#]+))\s*$'
    )
    if (-not $match.Success) { return '' }
    foreach ($index in 1..3) {
        if ($match.Groups[$index].Success) { return $match.Groups[$index].Value.Trim() }
    }
    return ''
}

function Test-ReusablePracticePage(
    [string]$RelativePath,
    [object]$PracticeConfig,
    [Collections.Generic.HashSet[string]]$ValidatedPaths
) {
    if ($ValidatedPaths.Contains($RelativePath)) { return }
    [void]$ValidatedPaths.Add($RelativePath)
    $path = Resolve-VaultPath $RelativePath
    if (-not $path -or -not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Issue error 'REUSABLE_PRACTICE_MISSING' 'Registered reusable practice does not exist.' $RelativePath
        return
    }
    $text = [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
    foreach ($field in @($PracticeConfig.required_frontmatter_fields)) {
        if (-not (Get-FrontmatterValue $text $field)) {
            Add-Issue error 'REUSABLE_ROUTING_FIELD_MISSING' "Reusable practice requires non-empty frontmatter field '$field'." $RelativePath
        }
    }
    if ($text -notmatch '(?m)^##\s+(When to use|Trigger|Use when)\s*$') {
        Add-Issue error 'REUSABLE_TRIGGER_SECTION_MISSING' 'Reusable practice requires a detailed trigger or when-to-use section.' $RelativePath
    }
    if ($text -notmatch '(?mi)^##\s+(Output(?: contract)?|Inspectable output)\s*$') {
        Add-Issue error 'REUSABLE_OUTPUT_SECTION_MISSING' 'Reusable practice requires an inspectable output section.' $RelativePath
    }
    if ($text -notmatch '(?mi)^##\s+(Guardrails|Reuse boundaries|Do not use when)\s*$') {
        Add-Issue error 'REUSABLE_BOUNDARY_SECTION_MISSING' 'Reusable practice requires guardrails or reuse boundaries.' $RelativePath
    }
}

$manifestPath = Resolve-VaultPath $Manifest
if (-not $manifestPath -or -not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    throw "Manifest does not exist: $Manifest"
}
$package = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
$schemaPath = Resolve-VaultPath $package.schema_path
if (-not $schemaPath -or -not (Test-Path -LiteralPath $schemaPath -PathType Leaf)) {
    throw "Semantic-ingest schema does not exist: $($package.schema_path)"
}
$schema = Get-Content -LiteralPath $schemaPath -Raw | ConvertFrom-Json
$validatorVersion = $schema.validator_version
if (-not $validatorVersion) { throw 'Semantic-ingest schema does not define validator_version.' }
if ($Profile -notin @($schema.validation_profiles)) { throw "Validation profile is absent from the schema: $Profile" }
$sourceNameIndex = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$markdownNameIndex = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
if ($Profile -eq 'Full') {
    foreach ($root in @($schema.source_roots)) {
        $rootPath = Join-Path $vaultRoot $root
        if (Test-Path -LiteralPath $rootPath) {
            foreach ($file in @(Get-ChildItem -LiteralPath $rootPath -Recurse -File)) {
                [void]$sourceNameIndex.Add($file.Name)
                if ($file.Extension -eq '.md') { [void]$markdownNameIndex.Add($file.BaseName) }
            }
        }
    }
}
if ($package.schema_version -ne $schema.schema_version) {
    Add-Issue error 'SCHEMA_VERSION_MISMATCH' "Manifest uses $($package.schema_version); expected $($schema.schema_version)." (Get-RelativePath $manifestPath)
}

$decisionPath = Resolve-VaultPath $package.decision_ledger
$matrixPath = Resolve-VaultPath $package.evidence_matrix
$bundlePath = Resolve-VaultPath $package.source_bundle
$intakePath = Resolve-VaultPath $package.intake_ledger
foreach ($pair in @(
    @{ name = 'decision ledger'; path = $decisionPath; relative = $package.decision_ledger },
    @{ name = 'evidence matrix'; path = $matrixPath; relative = $package.evidence_matrix },
    @{ name = 'source bundle'; path = $bundlePath; relative = $package.source_bundle },
    @{ name = 'intake ledger'; path = $intakePath; relative = $package.intake_ledger }
)) {
    if (-not $pair.path -or -not (Test-Path -LiteralPath $pair.path -PathType Leaf)) {
        Add-Issue error 'PACKAGE_FILE_MISSING' "Required $($pair.name) does not exist." $pair.relative
    }
}

$decisions = @(if ($decisionPath -and (Test-Path -LiteralPath $decisionPath)) { Import-Csv -LiteralPath $decisionPath })
$matrix = @(if ($matrixPath -and (Test-Path -LiteralPath $matrixPath)) { Import-Csv -LiteralPath $matrixPath })
$intake = @(if ($intakePath -and (Test-Path -LiteralPath $intakePath)) { Import-Csv -LiteralPath $intakePath })

$selectionPolicyPath = Resolve-VaultPath 'tools/config/source-selection-policy.json'
$selectionPolicy = if ($selectionPolicyPath -and (Test-Path -LiteralPath $selectionPolicyPath -PathType Leaf)) {
    Get-Content -LiteralPath $selectionPolicyPath -Raw | ConvertFrom-Json
} else {
    $null
}
$dispositionBySource = @{}
$selectionGateRequired = $false
if ($selectionPolicy -and $package.package_id -match '^P([0-9]+)$') {
    $gatedDecisions = @($decisions | Where-Object {
        $source = $_.canonical_source.Replace('\', '/')
        @($selectionPolicy.applies_to_prefixes | Where-Object { $source.StartsWith($_, [StringComparison]::OrdinalIgnoreCase) }).Count -gt 0
    })
    $selectionGateRequired = [int]$matches[1] -ge [int]$selectionPolicy.enforced_from_package_number -and $gatedDecisions.Count -gt 0
    if ($selectionGateRequired) {
        if (-not $package.selection_gate -or -not $package.selection_gate.required) {
            Add-Issue error 'SOURCE_SELECTION_GATE_MISSING' 'Package requires a fail-closed source-selection gate.' (Get-RelativePath $manifestPath)
        } else {
            $registerPath = Resolve-VaultPath $package.selection_gate.register
            if (-not $registerPath -or -not (Test-Path -LiteralPath $registerPath -PathType Leaf)) {
                Add-Issue error 'SOURCE_SELECTION_REGISTER_MISSING' 'Source-selection register does not exist.' $package.selection_gate.register
            } else {
                foreach ($disposition in @(Import-Csv -LiteralPath $registerPath)) {
                    if ($dispositionBySource.ContainsKey($disposition.canonical_source)) {
                        Add-Issue error 'SOURCE_SELECTION_DUPLICATE' 'Source-selection register contains a duplicate path.' $disposition.canonical_source
                    } else {
                        $dispositionBySource[$disposition.canonical_source] = $disposition
                    }
                }
            }
        }
    }
}

if ($decisions.Count -ne [int]$package.expected_source_count) {
    Add-Issue error 'SOURCE_COUNT_MISMATCH' "Decision ledger has $($decisions.Count) rows; expected $($package.expected_source_count)." $package.decision_ledger
}
if (@($decisions.canonical_source | Sort-Object -Unique).Count -ne $decisions.Count) {
    Add-Issue error 'DUPLICATE_CANONICAL_SOURCE' 'Each canonical source must occur exactly once.' $package.decision_ledger
}

$headers = if ($decisions.Count) { @($decisions[0].PSObject.Properties.Name) } else { @() }
foreach ($field in @($schema.decision_fields)) {
    if ($headers -notcontains $field) { Add-Issue error 'DECISION_FIELD_MISSING' "Decision ledger is missing field: $field" $package.decision_ledger }
}
$authorityFields = @($schema.decision_authority_fields)
$authorityHeadersPresent = @($authorityFields | Where-Object { $headers -contains $_ })
$authorityColumnsEnabled = $authorityHeadersPresent.Count -eq $authorityFields.Count
if ($authorityHeadersPresent.Count -gt 0 -and -not $authorityColumnsEnabled) {
    Add-Issue error 'DECISION_AUTHORITY_FIELDS_INCOMPLETE' 'Decision-authority columns are optional for legacy ledgers, but must be present as a complete set when used.' $package.decision_ledger
}

$standingAuthorities = @{}
if ($selectionPolicy) {
    foreach ($authority in @($selectionPolicy.standing_authorities)) {
        if ($authority.authority_id) { $standingAuthorities[$authority.authority_id] = $authority }
    }
}

$decisionBySource = @{}
foreach ($row in $decisions) {
    $source = $row.canonical_source.Replace('\', '/')
    $standingAuthorized = $false
    if ($authorityColumnsEnabled -and -not $row.decision_authority -and @($authorityFields | Where-Object { $_ -ne 'decision_authority' -and $row.$_ }).Count -gt 0) {
        Add-Issue error 'DECISION_AUTHORITY_VALUE_ORPHANED' 'Authority metadata cannot be present without decision_authority.' $source
    }
    if ($authorityColumnsEnabled -and $row.decision_authority) {
        if ($row.decision_authority -notin @($schema.decision_authorities)) {
            Add-Issue error 'DECISION_AUTHORITY_INVALID' "Invalid decision authority: $($row.decision_authority)" $source
        }
        foreach ($field in @('authority_id', 'decision_actor', 'autonomy_level', 'authority_policy_version')) {
            if (-not $row.$field) { Add-Issue error 'DECISION_AUTHORITY_VALUE_MISSING' "Decision authority requires a value for: $field" $source }
        }
        if ($row.decision_authority -eq 'standing-policy') {
            if (-not $standingAuthorities.ContainsKey($row.authority_id)) {
                Add-Issue error 'STANDING_AUTHORITY_UNKNOWN' 'Standing authority is not registered in the source-selection policy.' $source
            } else {
                $authority = $standingAuthorities[$row.authority_id]
                if (-not $authority.enabled) {
                    Add-Issue error 'STANDING_AUTHORITY_DISABLED' 'Standing authority exists but is disabled.' $source
                } else {
                    if (-not $source.StartsWith($authority.source_prefix, [StringComparison]::OrdinalIgnoreCase)) { Add-Issue error 'STANDING_AUTHORITY_SOURCE_SCOPE' 'Source is outside the standing authority prefix.' $source }
                    if ($row.decision_actor -ne $authority.decision_actor) { Add-Issue error 'STANDING_AUTHORITY_ACTOR_MISMATCH' 'Decision actor does not match the standing authority.' $source }
                    if ($row.autonomy_level -ne $authority.required_autonomy_level) { Add-Issue error 'STANDING_AUTHORITY_LEVEL_MISMATCH' 'Autonomy level does not match the standing authority.' $source }
                    if ($row.authority_policy_version -ne $selectionPolicy.schema_version) { Add-Issue error 'STANDING_AUTHORITY_POLICY_MISMATCH' 'Authority policy version is stale or incorrect.' $source }
                    if (-not $row.authority_run_id) { Add-Issue error 'STANDING_AUTHORITY_RUN_MISSING' 'Standing authority requires an exact run id.' $source }
                    if ($row.authority_manifest_sha256 -notmatch '^[0-9A-Fa-f]{64}$') { Add-Issue error 'STANDING_AUTHORITY_MANIFEST_HASH_INVALID' 'Standing authority requires an exact manifest SHA-256.' $source }

                    $authorityManifestPath = if ($package.standing_authority) { Resolve-VaultPath $package.standing_authority.run_manifest } else { $null }
                    if (-not $authorityManifestPath -or -not (Test-Path -LiteralPath $authorityManifestPath -PathType Leaf)) {
                        Add-Issue error 'STANDING_AUTHORITY_MANIFEST_MISSING' 'Standing authority requires an existing run manifest named in the package.' $source
                    } else {
                        $authorityManifestHash = (Get-FileHash -LiteralPath $authorityManifestPath -Algorithm SHA256).Hash
                        if ($authorityManifestHash -ne $row.authority_manifest_sha256) { Add-Issue error 'STANDING_AUTHORITY_MANIFEST_HASH_MISMATCH' 'Run-manifest file hash does not match the decision ledger.' $source }
                        try {
                            $authorityManifest = Get-Content -LiteralPath $authorityManifestPath -Raw | ConvertFrom-Json
                            if ($authorityManifest.schema_version -ne $authority.required_manifest_schema) { Add-Issue error 'STANDING_AUTHORITY_MANIFEST_SCHEMA' 'Run manifest uses an unauthorized schema.' $source }
                            if ($authorityManifest.run_id -ne $row.authority_run_id) { Add-Issue error 'STANDING_AUTHORITY_RUN_MISMATCH' 'Run manifest id does not match the decision ledger.' $source }
                            $manifestSource = @($authorityManifest.captured_sources | Where-Object { $_.canonical_source -eq $source -and $_.sha256 -eq $row.sha256 })
                            if ($manifestSource.Count -ne 1) { Add-Issue error 'STANDING_AUTHORITY_SOURCE_NOT_MANIFESTED' 'Exact source path and hash are not present once in the run manifest.' $source }
                            if ($authorityManifest.schema_version -eq $authority.required_manifest_schema -and $authorityManifest.run_id -eq $row.authority_run_id -and $manifestSource.Count -eq 1 -and $authorityManifestHash -eq $row.authority_manifest_sha256) {
                                $standingAuthorized = $true
                            }
                        } catch {
                            Add-Issue error 'STANDING_AUTHORITY_MANIFEST_INVALID' 'Run manifest is not valid JSON.' $source
                        }
                    }
                }
            }
        }
    }
    if ($source) { $decisionBySource[$source] = $row }
    if (-not (@($schema.source_roots | Where-Object { $source.StartsWith($_, [StringComparison]::OrdinalIgnoreCase) }).Count)) {
        Add-Issue error 'SOURCE_ROOT_INVALID' 'Canonical source is outside allowed source roots.' $source
        continue
    }
    $sourcePath = Resolve-VaultPath $source
    if (-not $sourcePath -or -not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
        Add-Issue error 'SOURCE_MISSING' 'Canonical source does not exist.' $source
    } elseif ($row.sha256 -notmatch '^[0-9A-Fa-f]{64}$') {
        Add-Issue error 'HASH_INVALID' 'SHA-256 must contain 64 hexadecimal characters.' $source
    } elseif ($Profile -eq 'Full' -and (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash -ne $row.sha256) {
        Add-Issue error 'HASH_MISMATCH' 'Canonical source fingerprint does not match the ledger.' $source
    }
    if (-not $row.original_title) { Add-Issue error 'ORIGINAL_TITLE_MISSING' 'Original title is required.' $source }

    if ($selectionGateRequired -and @($selectionPolicy.applies_to_prefixes | Where-Object { $source.StartsWith($_, [StringComparison]::OrdinalIgnoreCase) }).Count -gt 0) {
        if (-not $dispositionBySource.ContainsKey($source)) {
            Add-Issue error 'SOURCE_NOT_SELECTION_APPROVED' 'Canonical source is absent from the approved source-selection register.' $source
        } else {
            $disposition = $dispositionBySource[$source]
            if ($disposition.sha256 -ne $row.sha256) { Add-Issue error 'SOURCE_SELECTION_HASH_MISMATCH' 'Source-selection hash does not match the decision ledger.' $source }
            if ($disposition.availability -ne $selectionPolicy.required_availability) { Add-Issue error 'SOURCE_NOT_AVAILABLE' 'Source is not marked available in the selection register.' $source }
            if ($disposition.selection_status -ne $selectionPolicy.required_selection_status -and -not $standingAuthorized) { Add-Issue error 'SOURCE_NOT_SELECTION_APPROVED' 'Source is not approved for semantic review and has no valid standing authority.' $source }
            if ($disposition.package -and $disposition.package -ne $package.package_id) { Add-Issue error 'SOURCE_SELECTION_PACKAGE_MISMATCH' 'Source-selection package does not match the semantic package.' $source }
        }
    }
    if (-not $row.canonical_content_title) { Add-Issue error 'CONTENT_TITLE_MISSING' 'Canonical content title is required.' $source }
    if ($row.title_mismatch -notin @('true', 'false')) { Add-Issue error 'TITLE_MISMATCH_INVALID' 'title_mismatch must be true or false.' $source }
    if ($row.title_mismatch -eq 'true' -and $row.original_title -eq $row.canonical_content_title) {
        Add-Issue error 'TITLE_ALIAS_MISSING' 'A title mismatch requires a distinct canonical content title.' $source
    }
    if ($row.semantic_decision -notin @($schema.semantic_decisions)) { Add-Issue error 'DECISION_INVALID' "Invalid semantic decision: $($row.semantic_decision)" $source }
    if ($row.trust_class -notin @($schema.trust_classes)) { Add-Issue error 'TRUST_INVALID' "Invalid trust class: $($row.trust_class)" $source }
    if ($row.claim_risk -notin @($schema.claim_risks)) { Add-Issue error 'RISK_INVALID' "Invalid claim risk: $($row.claim_risk)" $source }
    if ($row.review_status -notin @($schema.review_statuses)) { Add-Issue error 'REVIEW_INVALID' "Invalid review status: $($row.review_status)" $source }
    if ($row.routing -notmatch $schema.routing_pattern) { Add-Issue error 'ROUTING_INVALID' "Invalid routing: $($row.routing)" $source }
    if ($Mode -eq 'Final' -and @($row.semantic_decision, $row.trust_class, $row.claim_risk, $row.review_status) -contains 'pending') {
        Add-Issue error 'PENDING_FINAL_DECISION' 'Final packages cannot contain pending decision fields.' $source
    }
    if (-not $row.rationale -and $Mode -ne 'Draft' -and $row.semantic_decision -ne 'pending') { Add-Issue error 'RATIONALE_MISSING' 'Reviewed decisions require a rationale.' $source }
    if ($row.semantic_decision -in @($schema.promotional_decisions)) {
        if (-not $row.target_pages) { Add-Issue error 'PROMOTION_TARGET_MISSING' 'Promotional decisions require target pages.' $source }
        if (-not $row.source_summary) { Add-Issue error 'SOURCE_SUMMARY_MISSING' 'Promotional decisions require a source summary.' $source }
        if ($Mode -eq 'Final' -and $row.review_status -ne 'approved') { Add-Issue error 'PROMOTION_NOT_APPROVED' 'Final promotional decisions must be approved.' $source }
        if ($Mode -eq 'Final' -and $authorityColumnsEnabled -and $row.decision_authority -eq 'standing-policy' -and $row.autonomy_level -eq 'L2') {
            Add-Issue error 'L2_PROMOTION_FINAL_FORBIDDEN' 'L2 standing authority may stage a promotional proposal in Wave mode but cannot finalize wiki promotion.' $source
        }
    }
    if ($row.semantic_decision -eq 'registered-only') {
        if ($row.target_pages) { Add-Issue error 'REGISTERED_ONLY_TARGET_PRESENT' 'Registered-only decisions must not name target pages.' $source }
        if ($row.review_status -notin @('reviewed', 'approved')) {
            Add-Issue error 'REGISTERED_ONLY_NOT_REVIEWED' 'Registered-only is a post-review disposition and requires reviewed or approved status.' $source
        }
    }
    foreach ($target in @($row.target_pages -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ })) {
        $targetPath = Resolve-VaultPath $target
        if ($Mode -eq 'Final' -and (-not $targetPath -or -not (Test-Path -LiteralPath $targetPath -PathType Leaf))) {
            Add-Issue error 'TARGET_PAGE_MISSING' 'Target page does not exist.' $target
        }
    }
    if ($row.source_summary -and $Mode -eq 'Final') {
        $summaryPath = Resolve-VaultPath $row.source_summary
        if (-not $summaryPath -or -not (Test-Path -LiteralPath $summaryPath -PathType Leaf)) {
            Add-Issue error 'SUMMARY_PAGE_MISSING' 'Source summary does not exist.' $row.source_summary
        }
    }
}

$matrixRows = @($matrix | Where-Object { $_.claim_id -or $_.pattern_or_claim -or $_.source_paths })
$promotionalDecisionCount = @($decisions | Where-Object { $_.semantic_decision -in @($schema.promotional_decisions) }).Count
if ($Mode -eq 'Final' -and $promotionalDecisionCount -gt 0 -and -not $matrixRows.Count) { Add-Issue error 'EVIDENCE_MATRIX_EMPTY' 'Final packages with promotional decisions require at least one evidence row.' $package.evidence_matrix }
if (@($matrixRows.claim_id | Sort-Object -Unique).Count -ne $matrixRows.Count) { Add-Issue error 'CLAIM_ID_DUPLICATE' 'Evidence claim IDs must be unique.' $package.evidence_matrix }
$coveredSources = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($claim in $matrixRows) {
    if (-not $claim.claim_id) { Add-Issue error 'CLAIM_ID_MISSING' 'Evidence row requires a claim ID.' $package.evidence_matrix }
    if ($claim.knowledge_delta -notin @($schema.knowledge_deltas)) { Add-Issue error 'KNOWLEDGE_DELTA_INVALID' "Invalid knowledge delta: $($claim.knowledge_delta)" $claim.claim_id }
    if ($claim.planned_action -notin @($schema.planned_actions)) { Add-Issue error 'PLANNED_ACTION_INVALID' "Invalid planned action: $($claim.planned_action)" $claim.claim_id }
    if ($claim.review_status -notin @($schema.review_statuses)) { Add-Issue error 'CLAIM_REVIEW_INVALID' "Invalid claim review status: $($claim.review_status)" $claim.claim_id }
    if ($Mode -eq 'Final' -and $claim.review_status -ne 'approved') { Add-Issue error 'CLAIM_NOT_APPROVED' 'Final evidence rows must be approved.' $claim.claim_id }
    $claimSources = @($claim.source_paths -split ';' | ForEach-Object { $_.Trim().Replace('\', '/') } | Where-Object { $_ })
    if (-not $claimSources.Count) { Add-Issue error 'CLAIM_SOURCE_MISSING' 'Evidence row requires canonical sources.' $claim.claim_id }
    foreach ($source in $claimSources) {
        if (-not $decisionBySource.ContainsKey($source)) {
            Add-Issue error 'CLAIM_SOURCE_UNKNOWN' 'Evidence row cites a source outside the decision ledger.' $source
        } else {
            [void]$coveredSources.Add($source)
            if ($decisionBySource[$source].semantic_decision -eq 'registered-only') {
                Add-Issue error 'REGISTERED_ONLY_IN_MATRIX' 'Registered-only sources must not be used as durable evidence.' $source
            }
        }
    }
    if ($claim.knowledge_delta -in @('new-claim', 'extended-claim', 'corroborating')) {
        if (-not $claim.target_page) { Add-Issue error 'CLAIM_TARGET_MISSING' 'Promotional evidence row requires a target page.' $claim.claim_id }
        if ($claim.planned_action -in @('none', 'summary-only', '')) { Add-Issue error 'CLAIM_ACTION_INVALID' 'Promotional evidence row requires create-page or update-page.' $claim.claim_id }
    }
}
if ($Mode -in @('Wave', 'Final')) {
    $promotionsRequiringCoverage = if ($Mode -eq 'Final') {
        @($decisions | Where-Object semantic_decision -in @($schema.promotional_decisions))
    } else {
        @($decisions | Where-Object {
            $_.semantic_decision -in @($schema.promotional_decisions) -and
            $_.review_status -in @('reviewed', 'approved')
        })
    }
    foreach ($row in $promotionsRequiringCoverage) {
        if (-not $coveredSources.Contains($row.canonical_source)) { Add-Issue error 'PROMOTION_NOT_IN_MATRIX' 'Promoted source is not covered by an evidence row.' $row.canonical_source }
    }
}

if ($Mode -eq 'Final' -and $Profile -eq 'Full') {
    $markdown = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    if ($package.source_bundle) { [void]$markdown.Add($package.source_bundle) }
    foreach ($row in $decisions) {
        if ($row.source_summary) { [void]$markdown.Add($row.source_summary) }
        foreach ($target in @($row.target_pages -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ })) { [void]$markdown.Add($target) }
    }
    foreach ($path in $markdown) { Test-MarkdownFile $path }

    if ($schema.reusable_practices) {
        $practiceConfig = $schema.reusable_practices
        $libraryPath = Resolve-VaultPath $practiceConfig.library
        $routerPath = Resolve-VaultPath $practiceConfig.router
        if (-not $libraryPath -or -not (Test-Path -LiteralPath $libraryPath -PathType Leaf)) {
            Add-Issue error 'REUSABLE_LIBRARY_MISSING' 'Reusable-practices library does not exist.' $practiceConfig.library
        }
        if (-not $routerPath -or -not (Test-Path -LiteralPath $routerPath -PathType Leaf)) {
            Add-Issue error 'REUSABLE_ROUTER_MISSING' 'Reusable-practices router does not exist.' $practiceConfig.router
        }
        if (
            $libraryPath -and (Test-Path -LiteralPath $libraryPath -PathType Leaf) -and
            $routerPath -and (Test-Path -LiteralPath $routerPath -PathType Leaf)
        ) {
            $libraryText = [IO.File]::ReadAllText($libraryPath, [Text.Encoding]::UTF8)
            $routerText = [IO.File]::ReadAllText($routerPath, [Text.Encoding]::UTF8)
            $libraryZoneMatch = [regex]::Match($libraryText, '(?ms)^## AI work and adoption\s*$.*?(?=^## Admission rule\s*$)')
            $routerZoneMatch = [regex]::Match($routerText, '(?ms)^## Routing table\s*$.*?(?=^## Selection protocol\s*$)')
            $libraryZone = if ($libraryZoneMatch.Success) { $libraryZoneMatch.Value } else { $libraryText }
            $routerZone = if ($routerZoneMatch.Success) { $routerZoneMatch.Value } else { $routerText }
            $libraryNames = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
            $routerNames = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
            foreach ($match in [regex]::Matches($libraryZone, '\[\[([^\]|#]+)')) { [void]$libraryNames.Add($match.Groups[1].Value) }
            foreach ($match in [regex]::Matches($routerZone, '\[\[([^\]|#]+)')) { [void]$routerNames.Add($match.Groups[1].Value) }
            foreach ($match in [regex]::Matches($libraryZone, '`wiki/([^`]+)\.md`')) { [void]$libraryNames.Add($match.Groups[1].Value) }
            foreach ($match in [regex]::Matches($routerZone, '`wiki/([^`]+)\.md`')) { [void]$routerNames.Add($match.Groups[1].Value) }

            $validatedPracticePaths = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
            foreach ($name in $libraryNames) {
                $relative = 'wiki/' + $name + '.md'
                Test-ReusablePracticePage $relative $practiceConfig $validatedPracticePaths
                if (-not $routerNames.Contains($name)) {
                    Add-Issue error 'REUSABLE_ROUTER_ENTRY_MISSING' 'Reusable practice is registered in the library but absent from the router.' $relative
                }
            }
            foreach ($name in $routerNames) {
                if (-not $libraryNames.Contains($name)) {
                    Add-Issue error 'REUSABLE_LIBRARY_ENTRY_MISSING' 'Router entry is absent from the reusable-practices library.' ('wiki/' + $name + '.md')
                }
            }

            foreach ($row in $decisions) {
                foreach ($target in @($row.target_pages -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ })) {
                    $targetPath = Resolve-VaultPath $target
                    if (-not $targetPath -or -not (Test-Path -LiteralPath $targetPath -PathType Leaf)) { continue }
                    $targetText = [IO.File]::ReadAllText($targetPath, [Text.Encoding]::UTF8)
                    $targetType = Get-FrontmatterValue $targetText 'type'
                    if ($targetType -notin @($practiceConfig.artifact_types)) { continue }
                    Test-ReusablePracticePage $target $practiceConfig $validatedPracticePaths
                    $name = [IO.Path]::GetFileNameWithoutExtension($target)
                    if (-not $libraryNames.Contains($name)) {
                        Add-Issue error 'REUSABLE_TARGET_NOT_REGISTERED' 'Reusable target page is absent from the reusable-practices library.' $target
                    }
                    if (-not $routerNames.Contains($name)) {
                        Add-Issue error 'REUSABLE_TARGET_NOT_ROUTED' 'Reusable target page is absent from the reusable-practices router.' $target
                    }
                }
            }
        }
    }
}

if ($Mode -eq 'Final' -and $package.register_updates_required) {
    foreach ($register in @($schema.required_registers)) {
        $markerProperty = $package.register_markers.PSObject.Properties[$register]
        if (-not $markerProperty -or -not $markerProperty.Value) {
            Add-Issue error 'REGISTER_MARKER_MISSING' 'Final manifest must define a marker for every required register.' $register
            continue
        }
        $registerPath = Resolve-VaultPath $register
        if (-not $registerPath -or -not (Test-Path -LiteralPath $registerPath -PathType Leaf)) {
            Add-Issue error 'REGISTER_MISSING' 'Required register does not exist.' $register
        } elseif (-not ([IO.File]::ReadAllText($registerPath, [Text.Encoding]::UTF8).Contains([string]$markerProperty.Value))) {
            Add-Issue error 'REGISTER_NOT_UPDATED' "Required marker is absent: $($markerProperty.Value)" $register
        }
    }
}

$openCount = $null
if ($package.backlog -and $intake.Count) {
    $completed = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($ledger in @($package.backlog.completed_ledgers)) {
        $ledgerPath = Resolve-VaultPath $ledger
        if (-not $ledgerPath -or -not (Test-Path -LiteralPath $ledgerPath -PathType Leaf)) {
            Add-Issue error 'COMPLETED_LEDGER_MISSING' 'Backlog completed ledger does not exist.' $ledger
            continue
        }
        foreach ($row in @(Import-Csv -LiteralPath $ledgerPath)) {
            if ($row.semantic_decision -ne 'pending' -and $row.routing -like 'stay-*' -and $row.review_status -eq 'approved') { [void]$completed.Add($row.canonical_source) }
        }
    }
    $allSources = @($intake.canonical_source | Sort-Object -Unique)
    $openCount = @($allSources | Where-Object { -not $completed.Contains($_) }).Count
    if ($openCount -ne [int]$package.backlog.expected_open_count) {
        Add-Issue error 'BACKLOG_COUNT_MISMATCH' "Calculated open backlog is $openCount; expected $($package.backlog.expected_open_count)." (Get-RelativePath $manifestPath)
    }
}

if ($package.raw_guard_required -and $Profile -eq 'Full') {
    try {
        $unstaged = @(& git -C $vaultRoot diff --name-only -- raw research/assets 2>$null)
        $staged = @(& git -C $vaultRoot diff --cached --name-only -- raw research/assets 2>$null)
        foreach ($path in @($unstaged + $staged | Sort-Object -Unique | Where-Object { $_ })) {
            Add-Issue error 'PROTECTED_SOURCE_MODIFIED' 'Tracked protected source has local modifications.' $path
        }
    } catch {
        Add-Issue warning 'RAW_GUARD_UNAVAILABLE' "Could not execute Git protected-source guard: $($_.Exception.Message)"
    }
}

$decisionLedgerHash = if ($decisionPath -and (Test-Path -LiteralPath $decisionPath -PathType Leaf)) { (Get-FileHash -LiteralPath $decisionPath -Algorithm SHA256).Hash } else { $null }
$evidenceMatrixHash = if ($matrixPath -and (Test-Path -LiteralPath $matrixPath -PathType Leaf)) { (Get-FileHash -LiteralPath $matrixPath -Algorithm SHA256).Hash } else { $null }
$recordedValidationCurrent = $false
if ($package.validation) {
    $recordedValidationCurrent = (
        $package.validation.validator_version -eq $validatorVersion -and
        $package.validation.validation_status -eq 'passed' -and
        $package.validation.decision_ledger_sha256 -eq $decisionLedgerHash -and
        $package.validation.evidence_matrix_sha256 -eq $evidenceMatrixHash
    )
    if ($package.validation.validation_status -eq 'passed' -and -not $recordedValidationCurrent) {
        Add-Issue warning 'RECORDED_VALIDATION_STALE' 'Recorded validation no longer matches the current validator or package artifacts.' (Get-RelativePath $manifestPath)
    }
}
if ($Mode -eq 'Final' -and $package.status -eq 'complete' -and -not $RecordResult) {
    if (-not $recordedValidationCurrent -or $package.validation.validation_mode -ne 'Final' -or $package.validation.validation_profile -ne 'Full') {
        Add-Issue error 'FINAL_PROVENANCE_MISSING_OR_STALE' 'A completed package requires a current successful Final/Full validation record. Run with -RecordResult after all other checks pass.' (Get-RelativePath $manifestPath)
    }
}

$validationRecorded = $false
if ($RecordResult) {
    $validationRecord = [pscustomobject][ordered]@{
        validator_version = $validatorVersion
        validated_at = (Get-Date).ToUniversalTime().ToString('o')
        validation_mode = $Mode
        validation_profile = $Profile
        validation_status = if ($errors.Count -eq 0) { 'passed' } else { 'failed' }
        decision_ledger_sha256 = $decisionLedgerHash
        evidence_matrix_sha256 = $evidenceMatrixHash
    }
    $package | Add-Member -NotePropertyName validation -NotePropertyValue $validationRecord -Force
    $manifestTemp = Join-Path (Split-Path -Parent $manifestPath) ('.' + [IO.Path]::GetFileName($manifestPath) + '.validation-' + [Guid]::NewGuid().ToString('N') + '.tmp')
    $manifestBackup = $manifestPath + '.validation-backup-' + [Guid]::NewGuid().ToString('N')
    try {
        $manifestJson = ($package | ConvertTo-Json -Depth 10) + [Environment]::NewLine
        [IO.File]::WriteAllText($manifestTemp, $manifestJson, [Text.UTF8Encoding]::new($false))
        [IO.File]::Replace($manifestTemp, $manifestPath, $manifestBackup, $true)
        if (Test-Path -LiteralPath $manifestBackup) { Remove-Item -LiteralPath $manifestBackup -Force }
        $validationRecorded = $true
    } finally {
        if (Test-Path -LiteralPath $manifestTemp) { Remove-Item -LiteralPath $manifestTemp -Force }
    }
}

$result = [pscustomobject][ordered]@{
    schema_version = $schema.schema_version
    validator_version = $validatorVersion
    package_id = $package.package_id
    mode = $Mode
    profile = $Profile
    validation_recorded = $validationRecorded
    passed = ($errors.Count -eq 0)
    metrics = [pscustomobject][ordered]@{
        decision_rows = $decisions.Count
        evidence_rows = $matrixRows.Count
        covered_promotional_sources = $coveredSources.Count
        calculated_open_backlog = $openCount
    }
    errors = @($errors)
    warnings = @($warnings)
}

if ($Json) { $result | ConvertTo-Json -Depth 8 } else {
    $result | Format-List schema_version, validator_version, package_id, mode, profile, validation_recorded, passed
    if ($errors.Count) { Write-Host 'Errors:'; $errors | Format-Table -AutoSize -Wrap }
    if ($warnings.Count) { Write-Host 'Warnings:'; $warnings | Format-Table -AutoSize -Wrap }
}
if ($errors.Count) { exit 2 }
