param(
    [Parameter(Mandatory = $true)][string]$IntakeLedger,
    [Parameter(Mandatory = $true)][string[]]$CompletedLedger,
    [Parameter(Mandatory = $true)][string]$OutputLedger,
    [Parameter(Mandatory = $true)][string]$OutputSummary,
    [string]$SelectionPolicy = 'tools/config/source-selection-policy.json',
    [string]$DispositionRegister = '',
    [ValidatePattern('^P[0-9]+$')][string]$PackageId = 'P14',
    [ValidateRange(1, 10)][int]$ShortlistLimit = 7,
    [ValidateRange(1000, 150000)][int]$TokenBudget = 75000
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

function Resolve-VaultPath([string]$Path, [switch]$MustExist) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $vaultRoot $Path }
    $full = [IO.Path]::GetFullPath($candidate)
    if (-not $full.StartsWith($vaultRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Path is outside the vault: $Path"
    }
    if ($MustExist -and -not (Test-Path -LiteralPath $full -PathType Leaf)) {
        throw "File does not exist: $Path"
    }
    return $full
}

function Get-RelativePath([string]$Path) {
    return $Path.Substring($vaultRoot.Length + 1).Replace('\', '/')
}

function Normalize-Title([string]$Title) {
    if (-not $Title) { return '' }
    $value = $Title.ToLowerInvariant()
    $value = [regex]::Replace($value, '\s+\d+$', '')
    $value = [regex]::Replace($value, '[^\p{L}\p{Nd}]+', ' ')
    return [regex]::Replace($value.Trim(), '\s+', ' ')
}

function Get-VideoId([string]$Identity, [string]$Url) {
    if ($Identity -match '^youtube:([A-Za-z0-9_-]{6,})$') { return $matches[1] }
    if ($Url -match '(?:youtube\.com/watch\?(?:[^#\r\n]*&)?v=|youtu\.be/)([A-Za-z0-9_-]{6,})') {
        return $matches[1]
    }
    return ''
}

function Get-StrategicPriority([object]$Row) {
    if ($Row.topic_cluster -eq 'ai-native-gtm') { return 0 }
    $identity = (($Row.canonical_title + ' ' + $Row.filename_title) -as [string]).ToLowerInvariant()
    if ($identity -match '\b(ai|agent|agentic)\b|artificial intelligence') { return 0 }
    if ($Row.trust_class -eq 'primary') { return 1 }
    if ($identity -match '\b(abm|account[- ]based)\b') { return 3 }
    if ($Row.topic_cluster -eq 'abm-execution') { return 3 }
    if ($identity -match '\b(content|distribution|seo|geo|brand|visibility)\b') { return 0 }
    return 1
}

function Add-Values([Collections.Generic.HashSet[string]]$Set, [string[]]$Values) {
    foreach ($value in $Values) {
        if ($value -and $value.Trim()) { [void]$Set.Add($value.Trim()) }
    }
}

$intakePath = Resolve-VaultPath $IntakeLedger -MustExist
$outputPath = Resolve-VaultPath $OutputLedger
$summaryPath = Resolve-VaultPath $OutputSummary
$intakeRows = @(Import-Csv -LiteralPath $intakePath)
$selectionPolicyPath = Resolve-VaultPath $SelectionPolicy -MustExist
$selectionPolicyData = Get-Content -LiteralPath $selectionPolicyPath -Raw | ConvertFrom-Json
if (-not $DispositionRegister) { $DispositionRegister = $selectionPolicyData.register_path }
$dispositionPath = Resolve-VaultPath $DispositionRegister -MustExist
$dispositionBySource = @{}
foreach ($row in @(Import-Csv -LiteralPath $dispositionPath)) {
    if ($dispositionBySource.ContainsKey($row.canonical_source)) { throw "Duplicate disposition path: $($row.canonical_source)" }
    $dispositionBySource[$row.canonical_source] = $row
}

$completedPaths = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$completedHashes = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$completedIdentities = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$completedVideoIds = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$completedTitles = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$completedByHash = @{}
$completedByIdentity = @{}
$completedByVideo = @{}
$completedByTitle = @{}

foreach ($ledger in $CompletedLedger) {
    $ledgerPath = Resolve-VaultPath $ledger -MustExist
    foreach ($decision in @(Import-Csv -LiteralPath $ledgerPath | Where-Object {
        $_.review_status -eq 'approved' -and $_.routing -like 'stay-*'
    })) {
        [void]$completedPaths.Add($decision.canonical_source)
        if ($decision.sha256) {
            [void]$completedHashes.Add($decision.sha256)
            $completedByHash[$decision.sha256] = $decision.canonical_source
        }
        $title = Normalize-Title $decision.canonical_content_title
        if ($title) {
            [void]$completedTitles.Add($title)
            $completedByTitle[$title] = $decision.canonical_source
        }
        $intake = $intakeRows | Where-Object canonical_source -eq $decision.canonical_source | Select-Object -First 1
        if ($intake) {
            foreach ($hash in (($intake.sha256 + '|' + $intake.variant_hashes) -split '\|')) {
                if ($hash.Trim()) {
                    [void]$completedHashes.Add($hash.Trim())
                    $completedByHash[$hash.Trim()] = $decision.canonical_source
                }
            }
            if ($intake.source_identity) {
                [void]$completedIdentities.Add($intake.source_identity)
                $completedByIdentity[$intake.source_identity] = $decision.canonical_source
            }
            $videoId = Get-VideoId $intake.source_identity $intake.source_url
            if ($videoId) {
                [void]$completedVideoIds.Add($videoId)
                $completedByVideo[$videoId] = $decision.canonical_source
            }
        }
    }
}

$reconciled = foreach ($row in $intakeRows) {
    $basis = ''
    $coveredBy = ''
    $rowHashes = @(($row.sha256 + '|' + $row.variant_hashes) -split '\|' | Where-Object { $_.Trim() })
    $matchingHash = $rowHashes | Where-Object { $completedHashes.Contains($_.Trim()) } | Select-Object -First 1
    $videoId = Get-VideoId $row.source_identity $row.source_url
    $normalizedTitle = Normalize-Title $row.canonical_title

    if ($completedPaths.Contains($row.canonical_source)) {
        $basis = 'completed-source'
        $coveredBy = $row.canonical_source
    } elseif ($matchingHash) {
        $basis = 'exact-or-variant-hash'
        $coveredBy = $completedByHash[$matchingHash.Trim()]
    } elseif ($row.source_identity -and $completedIdentities.Contains($row.source_identity)) {
        $basis = 'source-identity'
        $coveredBy = $completedByIdentity[$row.source_identity]
    } elseif ($videoId -and $completedVideoIds.Contains($videoId)) {
        $basis = 'youtube-video-id'
        $coveredBy = $completedByVideo[$videoId]
    } elseif ($normalizedTitle -and $completedTitles.Contains($normalizedTitle)) {
        $basis = 'canonical-title'
        $coveredBy = $completedByTitle[$normalizedTitle]
    }

    $copy = [ordered]@{}
    foreach ($property in $row.PSObject.Properties) { $copy[$property.Name] = $property.Value }
    $copy['reconciliation_status'] = if ($basis -eq 'completed-source') {
        'completed'
    } elseif ($basis) {
        'covered-variant'
    } else {
        'open'
    }
    $copy['coverage_basis'] = $basis
    $copy['covered_by'] = $coveredBy
    $copy['package_selected'] = 'false'
    $disposition = if ($dispositionBySource.ContainsKey($row.canonical_source)) { $dispositionBySource[$row.canonical_source] } else { $null }
    $copy['selection_gate_status'] = if (-not $disposition) {
        'missing'
    } elseif ($disposition.sha256 -ne $row.sha256) {
        'hash-mismatch'
    } elseif ($disposition.availability -eq $selectionPolicyData.required_availability -and $disposition.selection_status -eq $selectionPolicyData.required_selection_status) {
        'approved'
    } else {
        $disposition.selection_status
    }
    [pscustomobject]$copy
}

$eligible = @($reconciled | Where-Object {
    $_.reconciliation_status -eq 'open' -and
    $_.selection_gate_status -eq 'approved' -and
    $_.source_type -eq 'video-transcript' -and
    $_.transcript_completeness -eq 'full' -and
    $_.topic_cluster -in @('ai-native-gtm', 'content-brand')
} | Sort-Object @{Expression={Get-StrategicPriority $_};Descending=$false},
    @{Expression={[int]$_.triage_score};Descending=$true},
    @{Expression={[int]$_.novelty_score};Descending=$true},
    @{Expression={[int]$_.estimated_tokens};Descending=$false})

$selected = [Collections.Generic.List[object]]::new()
$tokenTotal = 0
$selectionMode = 'complete-transcripts'
$aiLimit = [math]::Ceiling($ShortlistLimit / 2.0)
$contentLimit = $ShortlistLimit - $aiLimit
foreach ($cluster in @('ai-native-gtm', 'content-brand')) {
    $clusterLimit = if ($cluster -eq 'ai-native-gtm') { $aiLimit } else { $contentLimit }
    foreach ($row in @($eligible | Where-Object topic_cluster -eq $cluster)) {
        if (@($selected | Where-Object topic_cluster -eq $cluster).Count -ge $clusterLimit) { break }
        $tokens = [int]$row.estimated_tokens
        if ($selected.Count -ge $ShortlistLimit -or $tokenTotal + $tokens -gt $TokenBudget) { continue }
        $selected.Add($row)
        $tokenTotal += $tokens
    }
}

if ($selected.Count -lt 5) {
    foreach ($row in @($reconciled | Where-Object {
        $_.reconciliation_status -eq 'open' -and
        $_.selection_gate_status -eq 'approved' -and
        $_.source_type -eq 'video-transcript' -and
        $_.transcript_completeness -eq 'full'
    } | Sort-Object @{Expression={Get-StrategicPriority $_};Descending=$false},
        @{Expression={[int]$_.triage_score};Descending=$true},
        @{Expression={[int]$_.estimated_tokens};Descending=$false})) {
        if ($selected.Contains($row)) { continue }
        $tokens = [int]$row.estimated_tokens
        if ($selected.Count -ge $ShortlistLimit -or $tokenTotal + $tokens -gt $TokenBudget) { continue }
        $selected.Add($row)
        $tokenTotal += $tokens
        if ($selected.Count -ge 5) { break }
    }
}

if ($selected.Count -eq 0) {
    $selectionMode = 'web-articles'
    foreach ($row in @($reconciled | Where-Object {
        $_.reconciliation_status -eq 'open' -and
        $_.selection_gate_status -eq 'approved' -and
        $_.source_type -eq 'web-article'
    } | Sort-Object @{Expression={Get-StrategicPriority $_};Descending=$false},
        @{Expression={[int]$_.triage_score};Descending=$true},
        @{Expression={[int]$_.novelty_score};Descending=$true},
        @{Expression={[int]$_.estimated_tokens};Descending=$false})) {
        $tokens = [int]$row.estimated_tokens
        if ($selected.Count -ge $ShortlistLimit -or $tokenTotal + $tokens -gt $TokenBudget) { continue }
        $selected.Add($row)
        $tokenTotal += $tokens
        if ($selected.Count -ge 5) { break }
    }
}

$rank = 0
foreach ($row in $selected) {
    $rank += 1
    $row.package = $PackageId
    $row.proposed_wave = "$PackageId-W1"
    $row.triage_status = 'shortlisted-after-reconciliation'
    $row.selection_rank = $rank
    $row.shortlisted = 'true'
    $row.package_selected = 'true'
}

$ordered = @($reconciled | Sort-Object `
    @{Expression={if ($_.package_selected -eq 'true') { 0 } elseif ($_.reconciliation_status -eq 'covered-variant') { 1 } elseif ($_.reconciliation_status -eq 'completed') { 2 } else { 3 }}}, `
    @{Expression={[int]($_.selection_rank -as [int])}}, `
    'canonical_title')

$parent = Split-Path -Parent $outputPath
if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
$summaryParent = Split-Path -Parent $summaryPath
if (-not (Test-Path -LiteralPath $summaryParent)) { New-Item -ItemType Directory -Path $summaryParent -Force | Out-Null }
$ordered | Export-Csv -LiteralPath $outputPath -NoTypeInformation -Encoding UTF8

$coveredVariants = @($ordered | Where-Object reconciliation_status -eq 'covered-variant')
$completed = @($ordered | Where-Object reconciliation_status -eq 'completed')
$open = @($ordered | Where-Object reconciliation_status -eq 'open')
$lines = [Collections.Generic.List[string]]::new()
$lines.Add("# Clipping Backlog Reconciliation - $PackageId")
$lines.Add('')
$completedNames = @($CompletedLedger | ForEach-Object { if ($_ -match '/(p[0-9]+)/decisions\.csv$') { $matches[1].ToUpperInvariant() } else { $_ } })
$lines.Add("**Summary**: Deterministic comparison of the clipping backlog against approved $($completedNames -join ', ') decisions. No source body was modified and no semantic promotion was performed.")
$lines.Add('')
$lines.Add('## Result')
$lines.Add('')
$lines.Add("- Intake rows: $($ordered.Count)")
$lines.Add("- Already completed canonical sources: $($completed.Count)")
$lines.Add("- Additional covered variants: $($coveredVariants.Count)")
$lines.Add("- Open rows after reconciliation: $($open.Count)")
$lines.Add("- Open rows approved for semantic review: $(@($open | Where-Object selection_gate_status -eq 'approved').Count)")
$lines.Add("- $PackageId full-reading shortlist: $($selected.Count)")
$lines.Add("- $PackageId selection mode: $selectionMode")
$lines.Add("- $PackageId estimated source tokens: $tokenTotal")
$lines.Add('')
$lines.Add("## $PackageId shortlist")
$lines.Add('')
$lines.Add('| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |')
$lines.Add('| ---: | --- | --- | ---: | ---: | --- |')
foreach ($row in $selected) {
    $title = $row.canonical_title.Replace('|', '\|')
    $lines.Add("| $($row.selection_rank) | $($row.topic_cluster) | $title | $($row.estimated_tokens) | $($row.triage_score) | ``$($row.canonical_source)`` |")
}
$lines.Add('')
$lines.Add('## Covered variants')
$lines.Add('')
if ($coveredVariants.Count -eq 0) {
    $lines.Add('- None.')
} else {
    $lines.Add('| Backlog source | Basis | Covered by |')
    $lines.Add('| --- | --- | --- |')
    foreach ($row in $coveredVariants) {
        $lines.Add("| ``$($row.canonical_source)`` | $($row.coverage_basis) | ``$($row.covered_by)`` |")
    }
}
$lines.Add('')
$lines.Add('## Method')
$lines.Add('')
$lines.Add('- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.')
$lines.Add('- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.')
$lines.Add('- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.')
$lines.Add('- Package selection is fail-closed: only exact path/hash rows marked `available` and `approved-for-semantic-review` in the external disposition register are eligible.')
$lines.Add("- Selection first prioritizes complete AI-native GTM and content/brand transcripts. When none remain, it falls back to readable web articles, preserving the same strategic priority and token ceiling; primary research precedes additional ABM vendor cases.")
[IO.File]::WriteAllLines($summaryPath, $lines, [Text.UTF8Encoding]::new($false))

Write-Host "Reconciled $($ordered.Count) intake rows: $($coveredVariants.Count) covered variants, $($open.Count) open."
Write-Host "Selected $($selected.Count) $PackageId sources in $selectionMode mode at an estimated $tokenTotal tokens."
Write-Host (Get-RelativePath $outputPath)
Write-Host (Get-RelativePath $summaryPath)
