[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceVaultRoot,

    [ValidateSet('Baseline', 'Pilot', 'All')]
    [string]$Mode = 'All',

    [string]$SnapshotId = 'starter-pack-2026-08-07',

    [string]$OutputRoot = '',

    [string]$PolicyPath = '',

    [ValidateSet('Auto', 'Ripgrep', 'PowerShell')]
    [string]$CitationSearchBackend = 'Auto'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($OutputRoot)) {
    $OutputRoot = Join-Path $PSScriptRoot '..\wiki\_outputs\source-curation'
}
if ([string]::IsNullOrWhiteSpace($PolicyPath)) {
    $PolicyPath = Join-Path $PSScriptRoot 'config\source-curation-policy.json'
}

function Resolve-FullPath {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)

    return [System.IO.Path]::GetFullPath($LiteralPath)
}

function Get-RelativeVaultPath {
    param(
        [Parameter(Mandatory = $true)][string]$VaultRoot,
        [Parameter(Mandatory = $true)][string]$LiteralPath
    )

    $rootWithSeparator = $VaultRoot.TrimEnd('\', '/') + [System.IO.Path]::DirectorySeparatorChar
    $rootUri = [System.Uri]::new($rootWithSeparator)
    $pathUri = [System.Uri]::new($LiteralPath)
    return [System.Uri]::UnescapeDataString($rootUri.MakeRelativeUri($pathUri).ToString()).Replace('\', '/')
}

function Write-Utf8Lf {
    param(
        [Parameter(Mandatory = $true)][string]$LiteralPath,
        [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Text
    )

    $parent = Split-Path -Parent $LiteralPath
    if (-not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    $normalized = $Text.Replace("`r`n", "`n").Replace("`r", "`n")
    if (-not $normalized.EndsWith("`n", [System.StringComparison]::Ordinal)) {
        $normalized += "`n"
    }
    [System.IO.File]::WriteAllText($LiteralPath, $normalized, [System.Text.UTF8Encoding]::new($false))
}

function Write-CsvLf {
    param(
        [Parameter(Mandatory = $true)][string]$LiteralPath,
        [Parameter(Mandatory = $true)][AllowEmptyCollection()][object[]]$Rows
    )

    if ($Rows.Count -eq 0) {
        throw "Refusing to write an empty CSV: $LiteralPath"
    }
    $csv = $Rows | ConvertTo-Csv -NoTypeInformation
    Write-Utf8Lf -LiteralPath $LiteralPath -Text ($csv -join "`n")
}

function Get-StableSourceId {
    param([Parameter(Mandatory = $true)][string]$Source)

    $bytes = [System.Text.Encoding]::UTF8.GetBytes($Source.ToLowerInvariant())
    $hasher = [System.Security.Cryptography.SHA256]::Create()
    try {
        $digest = $hasher.ComputeHash($bytes)
    }
    finally {
        $hasher.Dispose()
    }
    $hex = ([System.BitConverter]::ToString($digest) -replace '-', '').ToLowerInvariant()
    return "src-$($hex.Substring(0, 16))"
}

function Get-LatestRegistryIndex {
    param([Parameter(Mandatory = $true)][string]$RegistryPath)

    $index = @{}
    if (-not (Test-Path -LiteralPath $RegistryPath -PathType Leaf)) {
        return $index
    }

    foreach ($row in (Import-Csv -LiteralPath $RegistryPath)) {
        if ([string]::IsNullOrWhiteSpace($row.source)) {
            continue
        }
        $index[$row.source.ToLowerInvariant()] = $row
    }
    return $index
}

function Get-CitationMap {
    param(
        [Parameter(Mandatory = $true)][string]$VaultRoot,
        [Parameter(Mandatory = $true)][hashtable]$KnownSources,
        [ValidateSet('Auto', 'Ripgrep', 'PowerShell')][string]$SearchBackend = 'Auto'
    )

    $map = @{}
    foreach ($source in $KnownSources.Values) {
        $map[$source] = @{}
    }

    $searchRoots = @('wiki', 'research', 'docs', 'projects', 'skills') |
        Where-Object { Test-Path -LiteralPath (Join-Path $VaultRoot $_) -PathType Container }
    if ($searchRoots.Count -eq 0) {
        return $map
    }

    $extensionPattern = 'docx?|pdf|pptx?|xlsx?|zip|png|jpe?g|gif|webp|psd|ai|indd|mp3|mp4|mov|wav|m4a|msg|html?|txt|csv|json|ya?ml|ipynb|download|md'
    $referencePattern = "(?:raw|research)/assets/.*?\.(?:$extensionPattern)(?=[\x22\x27\x60\)\]\}>;,|]|$)"
    $arguments = @(
        '--json', '--only-matching', '--pcre2', '--ignore-case',
        '-g', '*.md', '-g', '*.csv', '-g', '*.json', '-g', '*.yaml', '-g', '*.yml',
        '-g', '!wiki/_extractions/**', '-g', '!wiki/_outputs/**',
        '-g', '!research/assets/**', '-g', '!raw/assets/**',
        $referencePattern
    ) + $searchRoots

    $citations = [System.Collections.Generic.List[object]]::new()
    $ripgrep = Get-Command 'rg' -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1
    if ($SearchBackend -eq 'Ripgrep' -and -not $ripgrep) {
        throw 'Ripgrep citation search was requested, but rg is unavailable.'
    }
    $useRipgrep = $SearchBackend -eq 'Ripgrep' -or ($SearchBackend -eq 'Auto' -and $ripgrep)
    if ($useRipgrep) {
        Push-Location $VaultRoot
        try {
            $rgLines = @(& $ripgrep.Source @arguments 2>$null)
        }
        finally {
            Pop-Location
        }

        foreach ($line in $rgLines) {
            if ([string]::IsNullOrWhiteSpace($line)) {
                continue
            }
            try {
                $event = $line | ConvertFrom-Json
            }
            catch {
                continue
            }
            if ($event.type -ne 'match') {
                continue
            }
            $referenceFile = $event.data.path.text.Replace('\', '/')
            foreach ($submatch in $event.data.submatches) {
                $citations.Add([pscustomobject]@{
                    reference_file = $referenceFile
                    candidate = $submatch.match.text.Replace('\', '/')
                })
            }
        }
    }
    else {
        $allowedExtensions = @('.md', '.csv', '.json', '.yaml', '.yml')
        $regex = [regex]::new($referencePattern, [Text.RegularExpressions.RegexOptions]::IgnoreCase)
        foreach ($root in $searchRoots) {
            foreach ($file in (Get-ChildItem -LiteralPath (Join-Path $VaultRoot $root) -Recurse -File)) {
                $referenceFile = Get-RelativeVaultPath -VaultRoot $VaultRoot -LiteralPath $file.FullName
                if ($file.Extension.ToLowerInvariant() -notin $allowedExtensions -or
                    $referenceFile -like 'wiki/_extractions/*' -or
                    $referenceFile -like 'wiki/_outputs/*' -or
                    $referenceFile -like 'research/assets/*' -or
                    $referenceFile -like 'raw/assets/*') {
                    continue
                }
                $text = [IO.File]::ReadAllText($file.FullName, [Text.Encoding]::UTF8)
                foreach ($match in $regex.Matches($text)) {
                    $citations.Add([pscustomobject]@{
                        reference_file = $referenceFile
                        candidate = $match.Value.Replace('\', '/')
                    })
                }
            }
        }
    }

    foreach ($citation in $citations) {
        $key = $citation.candidate.ToLowerInvariant()
        if (-not $KnownSources.ContainsKey($key)) {
            continue
        }
        $source = $KnownSources[$key]
        if (-not $map[$source].ContainsKey($citation.reference_file)) {
            $map[$source][$citation.reference_file] = 0
        }
        $map[$source][$citation.reference_file] += 1
    }

    return $map
}

function Select-PilotRows {
    param(
        [Parameter(Mandatory = $true)][object[]]$Manifest,
        [Parameter(Mandatory = $true)][object]$Policy
    )

    $used = @{}
    $selected = [System.Collections.Generic.List[object]]::new()
    $perStratum = [int]$Policy.pilot.per_stratum
    $visualExtensions = @('.png', '.jpg', '.jpeg', '.gif', '.webp', '.mp3', '.mp4', '.mov', '.wav', '.m4a')

    $selectors = [ordered]@{
        'cited-green' = { param($row) ([int]$row.citation_count -gt 0) -and $row.conversion_state -eq 'green' }
        'uncited-green' = { param($row) ([int]$row.citation_count -eq 0) -and $row.conversion_state -eq 'green' -and [string]::IsNullOrWhiteSpace($row.duplicate_group) }
        'exact-duplicate' = { param($row) -not [string]::IsNullOrWhiteSpace($row.duplicate_group) -and $row.is_canonical -eq 'false' }
        'conversion-exception' = { param($row) $row.conversion_state -in @('amber', 'red', 'stale-blocked') }
        'visual-research-unsupported' = { param($row) $row.source_class -eq 'research' -or $row.conversion_state -in @('unsupported', 'native') -or $row.extension -in $visualExtensions }
    }

    foreach ($stratum in $Policy.pilot.strata) {
        $selector = $selectors[$stratum]
        $candidates = @(
            $Manifest |
                Where-Object { -not $used.ContainsKey($_.source) -and (& $selector $_) } |
                Sort-Object @{ Expression = 'sha256'; Ascending = $true }, @{ Expression = 'source'; Ascending = $true }
        )
        if ($candidates.Count -lt $perStratum) {
            throw "Pilot stratum '$stratum' has only $($candidates.Count) eligible unique rows; $perStratum required."
        }

        $rank = 0
        foreach ($row in ($candidates | Select-Object -First $perStratum)) {
            $rank += 1
            $used[$row.source] = $true
            $pilotRow = [ordered]@{}
            foreach ($property in $row.PSObject.Properties) {
                $pilotRow[$property.Name] = $property.Value
            }
            $pilotRow['pilot_stratum'] = $stratum
            $pilotRow['pilot_rank'] = $rank
            $pilotRow['reviewed_curation_status'] = ''
            $pilotRow['review_notes'] = ''
            $pilotRow['content_review_state'] = 'not-reviewed'
            $pilotRow['readiness_status'] = 'not-checked'
            $pilotRow['readiness_reason'] = ''
            $pilotRow['review_basis'] = ''
            $pilotRow['content_signals'] = ''
            $pilotRow['requires_user_decision'] = 'false'
            $pilotRow['decision_resolution'] = ''
            $pilotRow['decision_approved_by'] = ''
            $pilotRow['decision_date'] = ''
            $selected.Add([pscustomobject]$pilotRow)
        }
    }

    return @($selected)
}

$sourceVault = Resolve-FullPath -LiteralPath $SourceVaultRoot
if (-not (Test-Path -LiteralPath $sourceVault -PathType Container)) {
    throw "Source vault does not exist: $sourceVault"
}

$outputDirectory = Resolve-FullPath -LiteralPath $OutputRoot
$policyFile = Resolve-FullPath -LiteralPath $PolicyPath
$policy = Get-Content -Raw -LiteralPath $policyFile | ConvertFrom-Json
if ($policy.automatic_actions.modify_sources -or $policy.automatic_actions.move_sources -or $policy.automatic_actions.delete_sources) {
    throw 'Unsafe curation policy: source mutation, moving, or deletion must remain disabled.'
}

$registryPath = Join-Path $sourceVault 'wiki\_outputs\source-conversions\source-conversion-registry.csv'
$registryIndex = Get-LatestRegistryIndex -RegistryPath $registryPath
$sourceFiles = [System.Collections.Generic.List[System.IO.FileInfo]]::new()
foreach ($root in $policy.approved_roots) {
    $absoluteRoot = Join-Path $sourceVault $root
    if (-not (Test-Path -LiteralPath $absoluteRoot -PathType Container)) {
        throw "Approved source root is missing: $absoluteRoot"
    }
    foreach ($file in (Get-ChildItem -LiteralPath $absoluteRoot -Recurse -File)) {
        $sourceFiles.Add($file)
    }
}

$knownSources = @{}
foreach ($file in $sourceFiles) {
    $relative = Get-RelativeVaultPath -VaultRoot $sourceVault -LiteralPath $file.FullName
    $knownSources[$relative.ToLowerInvariant()] = $relative
}
$citationMap = Get-CitationMap -VaultRoot $sourceVault -KnownSources $knownSources -SearchBackend $CitationSearchBackend

$rows = [System.Collections.Generic.List[object]]::new()
$newHashesComputed = 0
foreach ($file in ($sourceFiles | Sort-Object FullName)) {
    $source = Get-RelativeVaultPath -VaultRoot $sourceVault -LiteralPath $file.FullName
    $sourceKey = $source.ToLowerInvariant()
    $registryRow = if ($registryIndex.ContainsKey($sourceKey)) { $registryIndex[$sourceKey] } else { $null }

    $hashSource = 'computed'
    $sha256 = ''
    if ($null -ne $registryRow -and
        -not [string]::IsNullOrWhiteSpace($registryRow.sha256) -and
        [long]$registryRow.size_bytes -eq $file.Length) {
        $sha256 = $registryRow.sha256.ToLowerInvariant()
        $hashSource = 'conversion-registry'
    }
    else {
        $sha256 = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
        $newHashesComputed += 1
    }

    $sidecar = if ($null -ne $registryRow) { [string]$registryRow.target } else { '' }
    $sidecarExists = -not [string]::IsNullOrWhiteSpace($sidecar) -and (Test-Path -LiteralPath (Join-Path $sourceVault $sidecar) -PathType Leaf)
    $conversionState = if ($null -ne $registryRow -and -not [string]::IsNullOrWhiteSpace($registryRow.state)) { $registryRow.state } else { 'unregistered' }
    $auditStatus = if ($null -ne $registryRow) { [string]$registryRow.audit_status } else { '' }
    $sourceClass = if ($source.StartsWith('research/', [System.StringComparison]::OrdinalIgnoreCase)) { 'research' } else { 'raw' }
    $references = $citationMap[$source]
    $citationCount = 0
    if ($references.Count -gt 0) {
        $citationCount = ($references.Values | Measure-Object -Sum).Sum
    }

    $rows.Add([pscustomobject][ordered]@{
        snapshot_id = $SnapshotId
        source_id = Get-StableSourceId -Source $source
        source = $source
        source_class = $sourceClass
        extension = $file.Extension.ToLowerInvariant()
        size_bytes = $file.Length
        modified = $file.LastWriteTimeUtc.ToString('o')
        sha256 = $sha256
        hash_source = $hashSource
        sidecar = $sidecar
        sidecar_exists = $sidecarExists.ToString().ToLowerInvariant()
        audit_status = $auditStatus
        conversion_state = $conversionState
        citation_count = $citationCount
        citation_files = (($references.Keys | Sort-Object) -join '|')
        duplicate_group = ''
        canonical_source = ''
        is_canonical = 'true'
        proposed_curation_status = ''
        decision_reason = ''
        confidence = ''
        review_status = 'proposed'
        approved_by = ''
        approved_date = ''
        backup_verified = 'false'
        physical_action = 'none'
        physical_action_status = 'not-authorized'
    })
}

$duplicates = $rows | Group-Object sha256 | Where-Object { -not [string]::IsNullOrWhiteSpace($_.Name) -and $_.Count -gt 1 }
foreach ($group in $duplicates) {
    $canonical = $group.Group |
        Sort-Object @{ Expression = { if ($_.source_class -eq 'research') { 0 } else { 1 } }; Ascending = $true }, @{ Expression = 'source'; Ascending = $true } |
        Select-Object -First 1
    foreach ($row in $group.Group) {
        $row.duplicate_group = $group.Name.Substring(0, 16)
        $row.canonical_source = $canonical.source
        $row.is_canonical = ($row.source -eq $canonical.source).ToString().ToLowerInvariant()
    }
}

foreach ($row in $rows) {
    if ([int]$row.citation_count -gt 0) {
        $row.proposed_curation_status = 'protected'
        $row.decision_reason = 'Referenced outside generated extraction/output areas; physical action blocked.'
        $row.confidence = 'high'
    }
    elseif (-not [string]::IsNullOrWhiteSpace($row.duplicate_group) -and $row.is_canonical -eq 'false') {
        $row.proposed_curation_status = 'duplicate-candidate'
        $row.decision_reason = 'Exact SHA-256 duplicate of the deterministic canonical source; review only, no physical action authorized.'
        $row.confidence = 'high'
    }
    elseif ($row.source_class -eq 'research') {
        $row.proposed_curation_status = 'research-secondary'
        $row.decision_reason = 'Research attachment remains secondary evidence unless independently verified.'
        $row.confidence = 'high'
    }
    elseif ($row.conversion_state -in @('amber', 'red', 'stale-blocked', 'unregistered', 'unsupported')) {
        $row.proposed_curation_status = 'exception-on-demand'
        $row.decision_reason = 'Conversion state requires source-specific review only when the source becomes relevant.'
        $row.confidence = 'high'
    }
    else {
        $row.proposed_curation_status = 'cold-retain'
        $row.decision_reason = 'No active citation or exact-duplicate disposition found; retain without active curation.'
        $row.confidence = 'medium'
    }
}

$manifest = @($rows | Sort-Object source)
$manifestPath = Join-Path $outputDirectory "$SnapshotId-manifest.csv"
$summaryPath = Join-Path $outputDirectory "$SnapshotId-summary.md"

if ($Mode -in @('Baseline', 'All')) {
    Write-CsvLf -LiteralPath $manifestPath -Rows $manifest
    $totalBytes = ($manifest | Measure-Object size_bytes -Sum).Sum
    $statusSummary = $manifest | Group-Object proposed_curation_status | Sort-Object Name
    $conversionSummary = $manifest | Group-Object conversion_state | Sort-Object Name
    $summary = [System.Collections.Generic.List[string]]::new()
    $summary.Add('---')
    $summary.Add('type: generated-output')
    $summary.Add('status: pilot-active')
    $summary.Add("snapshot_id: $SnapshotId")
    $summary.Add('created: 2026-08-07')
    $summary.Add('---')
    $summary.Add('')
    $summary.Add('# Starter-Pack Curation Baseline')
    $summary.Add('')
    $summary.Add("- Source files: $($manifest.Count)")
    $summary.Add("- Total bytes: $totalBytes")
    $summary.Add("- Total GiB: $([math]::Round($totalBytes / 1GB, 2))")
    $summary.Add("- Hashes reused from conversion registry: $($manifest.Count - $newHashesComputed)")
    $summary.Add("- Hashes computed in this run: $newHashesComputed")
    $summary.Add("- Exact duplicate files: $((@($manifest | Where-Object { -not [string]::IsNullOrWhiteSpace($_.duplicate_group) })).Count)")
    $summary.Add("- Exact duplicate groups: $($duplicates.Count)")
    $summary.Add("- Sources with detected durable references: $((@($manifest | Where-Object { [int]$_.citation_count -gt 0 })).Count)")
    $summary.Add('')
    $summary.Add('## Proposed Curation Status')
    $summary.Add('')
    foreach ($group in $statusSummary) {
        $summary.Add("- $($group.Name): $($group.Count)")
    }
    $summary.Add('')
    $summary.Add('## Conversion State')
    $summary.Add('')
    foreach ($group in $conversionSummary) {
        $summary.Add("- $($group.Name): $($group.Count)")
    }
    $summary.Add('')
    $summary.Add('## Safety Boundary')
    $summary.Add('')
    $summary.Add('All classifications are proposals. No original was modified, moved, or deleted, and every physical action remains `none` / `not-authorized`.')
    Write-Utf8Lf -LiteralPath $summaryPath -Text ($summary -join "`n")
}

if ($Mode -in @('Pilot', 'All')) {
    if ($Mode -eq 'Pilot' -and -not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
        throw "Pilot mode requires an existing baseline manifest: $manifestPath"
    }
    if ($Mode -eq 'Pilot') {
        $manifest = @(Import-Csv -LiteralPath $manifestPath)
    }
    $pilot = Select-PilotRows -Manifest $manifest -Policy $policy
    $pilotPath = Join-Path $outputDirectory "$SnapshotId-pilot-50.csv"
    Write-CsvLf -LiteralPath $pilotPath -Rows $pilot

    $pilotReport = [System.Collections.Generic.List[string]]::new()
    $pilotReport.Add('---')
    $pilotReport.Add('type: generated-output')
    $pilotReport.Add('status: awaiting-review')
    $pilotReport.Add("snapshot_id: $SnapshotId")
    $pilotReport.Add('created: 2026-08-07')
    $pilotReport.Add('---')
    $pilotReport.Add('')
    $pilotReport.Add('# Starter-Pack 50-Source Pilot')
    $pilotReport.Add('')
    $pilotReport.Add('This is the deterministic pilot selection. Content-level review and final curation decisions remain pending.')
    $pilotReport.Add('')
    $pilotReport.Add('## Strata')
    $pilotReport.Add('')
    foreach ($group in ($pilot | Group-Object pilot_stratum | Sort-Object Name)) {
        $pilotReport.Add("- $($group.Name): $($group.Count)")
    }
    $pilotReport.Add('')
    $pilotReport.Add('## Hard Boundary')
    $pilotReport.Add('')
    $pilotReport.Add('The pilot performs no physical source action and grants no semantic promotion.')
    Write-Utf8Lf -LiteralPath (Join-Path $outputDirectory "$SnapshotId-pilot-checkpoint.md") -Text ($pilotReport -join "`n")
}

[pscustomobject]@{
    snapshot_id = $SnapshotId
    source_count = $manifest.Count
    output_root = $outputDirectory
    manifest = $manifestPath
    summary = $summaryPath
    mode = $Mode
} | ConvertTo-Json -Depth 4
