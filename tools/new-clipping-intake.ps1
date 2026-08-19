param(
    [string]$VaultRoot,
    [string]$ClippingsRoot = 'raw/Clippings',
    [string[]]$PriorLedger = @(),
    [Parameter(Mandatory = $true)][string]$OutputLedger,
    [Parameter(Mandatory = $true)][string]$OutputSummary,
    [Parameter(Mandatory = $true)][datetime]$SnapshotDate,
    [string]$SelectionPolicy = 'tools/config/source-selection-policy.json',
    [string]$DispositionRegister = '',
    [ValidatePattern('^P[0-9]+$')][string]$PackageId = 'P10',
    [ValidateRange(1, 100)][int]$ShortlistLimit = 10,
    [ValidateRange(1000, 1000000)][int]$TokenBudget = 150000
)

$ErrorActionPreference = 'Stop'
$root = if ($VaultRoot) {
    (Resolve-Path -LiteralPath $VaultRoot).Path
} else {
    (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function Resolve-InVault([string]$Path, [switch]$MustExist) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $root $Path }
    $full = [IO.Path]::GetFullPath($candidate)
    if (-not ($full -eq $root -or $full.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase))) {
        throw "Path is outside the vault: $Path"
    }
    if ($MustExist -and -not (Test-Path -LiteralPath $full)) {
        throw "Path does not exist: $Path"
    }
    return $full
}

function Get-RelativeVaultPath([string]$Path) {
    return $Path.Substring($root.Length + 1).Replace('\', '/')
}

function Get-Scalar([string]$Text, [string]$Key) {
    $pattern = '(?m)^' + [regex]::Escape($Key) + ':\s*["'']?([^"''\r\n]+)'
    $match = [regex]::Match($Text, $pattern)
    if ($match.Success) { return $match.Groups[1].Value.Trim() }
    return ''
}

function Get-Author([string]$Text) {
    $inline = Get-Scalar $Text 'author'
    if ($inline) { return $inline }
    $match = [regex]::Match($Text, '(?ms)^author:\s*\r?\n\s*-\s*["'']?([^"''\r\n]+)')
    if ($match.Success) { return $match.Groups[1].Value.Trim() }
    return ''
}

function Get-ContentTitle([string]$Text, [string]$Fallback) {
    $title = Get-Scalar $Text 'title'
    if ($title) { return $title }
    $heading = [regex]::Match($Text, '(?m)^#\s+(.+?)\s*$')
    if ($heading.Success) { return $heading.Groups[1].Value.Trim() }
    return $Fallback
}

function Normalize-Title([string]$Title) {
    if (-not $Title) { return '' }
    $value = $Title.ToLowerInvariant()
    $value = [regex]::Replace($value, '\s+\d+$', '')
    $value = [regex]::Replace($value, '[^\p{L}\p{Nd}]+', ' ')
    return [regex]::Replace($value.Trim(), '\s+', ' ')
}

function Get-SourceUrl([string]$Text) {
    $source = Get-Scalar $Text 'source'
    if ($source) { return $source }
    $quote = [regex]::Match($Text, '(?m)^>\s*(?:Quelle|Source):\s*(https?://\S+)')
    if ($quote.Success) { return $quote.Groups[1].Value.Trim() }
    return ''
}

function Get-SourceIdentity([string]$Url, [string]$Hash) {
    if ($Url -match '(?:youtube\.com/watch\?(?:[^#\r\n]*&)?v=|youtu\.be/)([A-Za-z0-9_-]{6,})') {
        return 'youtube:' + $matches[1]
    }
    if ($Url) {
        try {
            $uri = [uri]$Url
            $path = $uri.AbsolutePath.TrimEnd('/').ToLowerInvariant()
            return ($uri.Scheme.ToLowerInvariant() + '://' + $uri.Host.ToLowerInvariant() + $path)
        } catch {
            return 'url:' + $Url.Trim().ToLowerInvariant()
        }
    }
    return 'hash:' + $Hash
}

function Get-TriageExcerpt([string]$Text) {
    $body = [regex]::Replace($Text, '(?s)^---\s*\r?\n.*?\r?\n---\s*', '')
    $body = [regex]::Split($body, '(?im)^##\s+Transcript\s*$')[0]
    $body = [regex]::Replace($body, '(?m)^#{1,6}\s+.*$', '')
    $body = [regex]::Replace($body, '(?m)^>\s*(?:Quelle|Source|Ver\S*ffentlicht|Geclippt).*$','')
    $body = [regex]::Replace($body, '!\[[^\]]*\]\([^)]+\)', '')
    $body = [regex]::Replace($body, '\s+', ' ').Trim()
    if ($body.Length -gt 1200) { return $body.Substring(0, 1200).Trim() + '...' }
    return $body
}

function Get-SuggestedTargets([string]$Text) {
    $targets = [Collections.Generic.List[string]]::new()
    if ($Text -match '(?i)\bABM\b|account[- ]based|buying group|intent data') {
        $targets.Add('wiki/account-based-marketing.md')
    }
    if ($Text -match '(?i)\bGTM\b|go[- ]to[- ]market|orchestrat|pipeline|demand gen|revenue') {
        $targets.Add('wiki/marketing-orchestration.md')
    }
    if ($Text -match '(?i)\bAI\b|agent|Claude|Codex|context engineering|automation') {
        $targets.Add('wiki/agentic-systems.md')
    }
    if ($Text -match '(?i)content|messaging|thought leadership|storytelling') {
        $targets.Add('wiki/content-quality.md')
    }
    if ($Text -match '(?i)brand|positioning|differentiation|visibility') {
        $targets.Add('wiki/brand-system.md')
    }
    if ($targets.Count -eq 0) { $targets.Add('wiki/index.md') }
    return (@($targets | Select-Object -Unique) -join ';')
}

function Get-TopicCluster([string]$Title, [string]$Excerpt) {
    if ($Title -match '(?i)content|brand|positioning|visibility|thought leader|influence|trust|storytelling') {
        return 'content-brand'
    }
    if ($Title -match '(?i)\bABM\b|account[- ]based|intent data|buying group|pipeline|demand gen') {
        return 'abm-execution'
    }
    if ($Title -match '(?i)\bAI\b|agent|Claude|Codex|\bGTM\b|go[- ]to[- ]market|automation|martech') {
        return 'ai-native-gtm'
    }
    if ($Excerpt -match '(?i)\bABM\b|account[- ]based|intent data|buying group|pipeline|demand gen') {
        return 'abm-execution'
    }
    if ($Excerpt -match '(?i)\bAI\b|agent|Claude|Codex|\bGTM\b|go[- ]to[- ]market|automation|martech') {
        return 'ai-native-gtm'
    }
    return 'unclassified-emerging'
}

function Get-TrustClass([string]$Url, [bool]$HasTranscript, [string]$Text) {
    if ($Url -match '(?i)demandbase\.com|6sense\.com|pathfactory\.com|fullfunnel\.io|heinzmarketing\.com|/case-stud') {
        return 'vendor'
    }
    if ($Url -match '(?i)sciencedirect\.com|doi\.org|arxiv\.org') { return 'primary' }
    if ($HasTranscript -and $Text -match '(?i)demandbase|6sense|pathfactory|fullfunnel') { return 'mixed' }
    if ($HasTranscript) { return 'practitioner' }
    if ($Text -match '(?i)\bsponsored\b') { return 'sponsored-research' }
    return 'unknown'
}

function Get-WikiCoverage([string]$Title, [string]$TargetPages) {
    $stop = @('with','from','that','this','your','into','about','using','build','create','high','quality','podcast')
    $terms = @([regex]::Matches($Title.ToLowerInvariant(), '[a-z0-9]{4,}') | ForEach-Object {
        $_.Value
    } | Where-Object { $stop -notcontains $_ } | Sort-Object -Unique)
    $corpus = ''
    foreach ($target in @($TargetPages -split ';' | Where-Object { $_ })) {
        try {
            $targetPath = Resolve-InVault $target -MustExist
            $corpus += ' ' + [IO.File]::ReadAllText($targetPath).ToLowerInvariant()
        } catch {
            continue
        }
    }
    $hits = 0
    foreach ($term in $terms) {
        if ($corpus -match ('\b' + [regex]::Escape($term) + '\b')) { $hits += 1 }
    }
    $ratio = if ($terms.Count -gt 0) { $hits / [double]$terms.Count } else { 0.0 }
    $novelty = if ($ratio -ge 0.7) { 0 } elseif ($ratio -ge 0.4) { 1 } else { 2 }
    return [pscustomobject]@{ hits = $hits; terms = $terms.Count; novelty = $novelty }
}

function Get-Score([string]$Title, [string]$Excerpt, [bool]$HasTranscript, [string]$Completeness, [string]$TrustClass, [int]$DuplicateCount, [int]$NoveltyScore) {
    $relevance = 0
    if ($Title -match '(?i)\bABM\b|account[- ]based|\bGTM\b|go[- ]to[- ]market|buying group|orchestrat|pipeline|demand gen|revenue') { $relevance += 3 }
    if ($Title -match '(?i)\bAI\b|agent|Claude|Codex|context engineering') { $relevance += 3 }
    if ($Title -match '(?i)content|brand|positioning|visibility|thought leader') { $relevance += 2 }
    if ($relevance -gt 3) { $relevance = 3 }
    if ($relevance -eq 0 -and $Excerpt -match '(?i)\bABM\b|account[- ]based|\bGTM\b|go[- ]to[- ]market|\bAI\b|agent|content|brand') {
        $relevance = 1
    }

    $novelty = $NoveltyScore
    $evidence = if ($HasTranscript -and $Completeness -eq 'full') { 2 } elseif ($HasTranscript) { 1 } else { 0 }
    if ($TrustClass -eq 'vendor' -and $evidence -gt 0) { $evidence -= 1 }
    $actionability = if ($Title -match '(?i)how to|playbook|workflow|framework|process|build|implement|run|create|tricks') {
        2
    } elseif ($Title -match '(?i)strategy|operating model|transform|case study|campaign|growth|rebuild') {
        1
    } else {
        0
    }
    $redundancy = [math]::Min(2, [math]::Max(0, $DuplicateCount - 1))
    return [pscustomobject]@{
        relevance = $relevance
        novelty = $novelty
        evidence = $evidence
        actionability = $actionability
        redundancy = $redundancy
        total = $relevance + $novelty + $evidence + $actionability - $redundancy
    }
}

$clippingsPath = Resolve-InVault $ClippingsRoot -MustExist
$ledgerPath = Resolve-InVault $OutputLedger
$summaryPath = Resolve-InVault $OutputSummary
$selectionPolicyPath = Resolve-InVault $SelectionPolicy -MustExist
$selectionPolicyData = Get-Content -LiteralPath $selectionPolicyPath -Raw | ConvertFrom-Json
if (-not $DispositionRegister) { $DispositionRegister = $selectionPolicyData.register_path }
$dispositionPath = Resolve-InVault $DispositionRegister -MustExist
$dispositionBySource = @{}
foreach ($dispositionRow in @(Import-Csv -LiteralPath $dispositionPath)) {
    if ($dispositionBySource.ContainsKey($dispositionRow.canonical_source)) { throw "Duplicate disposition path: $($dispositionRow.canonical_source)" }
    $dispositionBySource[$dispositionRow.canonical_source] = $dispositionRow
}
foreach ($output in @($ledgerPath, $summaryPath)) {
    $parent = Split-Path -Parent $output
    if (-not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
}

$knownHashes = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($ledger in $PriorLedger) {
    $priorPath = Resolve-InVault $ledger -MustExist
    foreach ($row in @(Import-Csv -LiteralPath $priorPath)) {
        foreach ($hash in (($row.sha256 + '|' + $row.variant_hashes) -split '\|')) {
            if ($hash.Trim()) { [void]$knownHashes.Add($hash.Trim()) }
        }
    }
}

$sourceHashesBefore = @{}
$records = [Collections.Generic.List[object]]::new()
$snapshotEnd = $SnapshotDate.Date.AddDays(1)
foreach ($file in @(Get-ChildItem -LiteralPath $clippingsPath -Recurse -File -Filter '*.md' | Where-Object {
    $_.LastWriteTime -ge $SnapshotDate.Date -and $_.LastWriteTime -lt $snapshotEnd
})) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $sourceHashesBefore[$file.FullName] = $hash
    if ($knownHashes.Contains($hash)) { continue }

    $text = [IO.File]::ReadAllText($file.FullName)
    $timestampCount = [regex]::Matches($text, '(?m)^(?:\*\*\d{1,2}:\d{2}(?::\d{2})?\*\*|\[\d{1,2}:\d{2}(?::\d{2})?\]\([^\r\n]+\))').Count
    $hasTranscript = ($text -match '(?im)^##\s+Transcript\s*$') -or $timestampCount -ge 10
    $source = Get-SourceUrl $text
    $filenameTitle = [IO.Path]::GetFileNameWithoutExtension($file.Name)
    $contentTitle = Get-ContentTitle $text $filenameTitle
    $isEmpty = $file.Length -le 100 -or (-not $contentTitle -and -not $source)
    $completeness = if ($isEmpty) {
        'empty'
    } elseif ($hasTranscript -and $timestampCount -ge 10) {
        'full'
    } elseif ($hasTranscript -or $source -match '(?i)youtube\.com|youtu\.be') {
        'partial'
    } else {
        'not-transcript'
    }
    $headings = @([regex]::Matches($text, '(?m)^#{2,4}\s+(.+?)\s*$') | ForEach-Object { $_.Groups[1].Value.Trim() })
    $records.Add([pscustomobject]@{
        path = Get-RelativeVaultPath $file.FullName
        name = $file.Name
        filename_title = $filenameTitle
        canonical_title = $contentTitle
        normalized_title = Normalize-Title $contentTitle
        sha256 = $hash
        size_bytes = $file.Length
        estimated_tokens = [math]::Ceiling($text.Length / 4.0)
        source_url = $source
        source_identity = Get-SourceIdentity $source $hash
        origin_host = if ($source) { try { ([uri]$source).Host.ToLowerInvariant() } catch { '' } } else { '' }
        published = Get-Scalar $text 'published'
        author = Get-Author $text
        has_transcript = $hasTranscript
        timestamp_count = $timestampCount
        transcript_completeness = $completeness
        source_type = if ($isEmpty) { 'empty-clip' } elseif ($hasTranscript) { 'video-transcript' } else { 'web-article' }
        triage_excerpt = Get-TriageExcerpt $text
        headings = $headings -join ' | '
    })
}

$hashRepresentatives = [Collections.Generic.List[object]]::new()
foreach ($hashGroup in @($records | Group-Object sha256)) {
    $best = $hashGroup.Group | Sort-Object @{Expression='size_bytes';Descending=$true}, path | Select-Object -First 1
    $best | Add-Member -NotePropertyName all_aliases -NotePropertyValue @($hashGroup.Group.path) -Force
    $best | Add-Member -NotePropertyName all_hashes -NotePropertyValue @($hashGroup.Name) -Force
    $hashRepresentatives.Add($best)
}

$rows = [Collections.Generic.List[object]]::new()
foreach ($identityGroup in @($hashRepresentatives | Group-Object source_identity)) {
    $best = $identityGroup.Group | Sort-Object @{Expression='size_bytes';Descending=$true}, path | Select-Object -First 1
    $aliases = @($identityGroup.Group | ForEach-Object { $_.all_aliases } | Sort-Object -Unique)
    $hashes = @($identityGroup.Group | ForEach-Object { $_.all_hashes } | Sort-Object -Unique)
    $titles = @($identityGroup.Group.canonical_title | Where-Object { $_ } | Sort-Object -Unique)
    $titleMismatch = (Normalize-Title $best.filename_title) -ne (Normalize-Title $best.canonical_title)
    $crossTitle = $titles.Count -gt 1 -or $titleMismatch
    $trust = Get-TrustClass $best.source_url $best.has_transcript ($best.canonical_title + ' ' + $best.triage_excerpt)
    $targets = Get-SuggestedTargets ($best.canonical_title + ' ' + $best.triage_excerpt)
    $cluster = Get-TopicCluster $best.canonical_title $best.triage_excerpt
    $coverage = Get-WikiCoverage $best.canonical_title $targets
    $score = Get-Score $best.canonical_title $best.triage_excerpt $best.has_transcript $best.transcript_completeness $trust $aliases.Count $coverage.novelty
    $status = if ($best.source_type -eq 'empty-clip') {
        'excluded-empty'
    } elseif ($best.has_transcript -and $best.transcript_completeness -eq 'partial') {
        'blocked-incomplete-transcript'
    } else {
        'deferred-backlog'
    }
    $notes = @()
    if ($aliases.Count -gt 1) { $notes += "identity family contains $($aliases.Count) files" }
    if ($crossTitle) { $notes += 'filename/body-title or same-identity title mismatch' }
    if ($trust -eq 'vendor') { $notes += 'vendor or case-study claims require qualification' }
    $disposition = if ($dispositionBySource.ContainsKey($best.path)) { $dispositionBySource[$best.path] } else { $null }
    $selectionGateStatus = if (-not $disposition) {
        'missing'
    } elseif ($disposition.sha256 -ne $best.sha256) {
        'hash-mismatch'
    } elseif ($disposition.availability -eq $selectionPolicyData.required_availability -and $disposition.selection_status -eq $selectionPolicyData.required_selection_status) {
        'approved'
    } else {
        $disposition.selection_status
    }

    $rows.Add([pscustomobject][ordered]@{
        canonical_source = $best.path
        canonical_title = $best.canonical_title
        filename_title = $best.filename_title
        package = ''
        proposed_wave = 'backlog'
        source_type = $best.source_type
        trust_class = $trust
        triage_status = $status
        sha256 = $best.sha256
        variant_hashes = $hashes -join '|'
        source_identity = $best.source_identity
        source_url = $best.source_url
        origin_host = $best.origin_host
        published = $best.published
        author = $best.author
        size_bytes = $best.size_bytes
        estimated_tokens = $best.estimated_tokens
        has_transcript = $best.has_transcript.ToString().ToLowerInvariant()
        transcript_timestamp_count = $best.timestamp_count
        transcript_completeness = $best.transcript_completeness
        duplicate_file_count = $aliases.Count
        duplicate_aliases = $aliases -join ' | '
        identity_duplicate = ($identityGroup.Count -gt 1).ToString().ToLowerInvariant()
        title_mismatch = $titleMismatch.ToString().ToLowerInvariant()
        cross_title_duplicate = $crossTitle.ToString().ToLowerInvariant()
        triage_excerpt = $best.triage_excerpt
        headings = $best.headings
        topic_cluster = $cluster
        relevance_score = $score.relevance
        novelty_score = $score.novelty
        evidence_score = $score.evidence
        actionability_score = $score.actionability
        redundancy_penalty = $score.redundancy
        triage_score = $score.total
        wiki_coverage_hits = $coverage.hits
        wiki_coverage_terms = $coverage.terms
        suggested_target_pages = $targets
        selection_rank = ''
        shortlisted = 'false'
        selection_gate_status = $selectionGateStatus
        notes = $notes -join '; '
    })
}

$eligible = @($rows | Where-Object {
    $_.source_type -eq 'video-transcript' -and $_.transcript_completeness -eq 'full'
} | Sort-Object @{Expression={[int]$_.triage_score};Descending=$true}, @{Expression={[int]$_.estimated_tokens};Descending=$false}, canonical_title)

$selected = [Collections.Generic.List[object]]::new()
$tokenTotal = 0
foreach ($row in $eligible) {
    if ($selected.Count -ge $ShortlistLimit) { break }
    if ($selected.Contains($row)) { continue }
    $candidateTokens = [int]$row.estimated_tokens
    if ($tokenTotal + $candidateTokens -gt $TokenBudget) { continue }
    $selected.Add($row)
    $tokenTotal += $candidateTokens
}

$rank = 0
foreach ($row in $selected) {
    $rank += 1
    $row.package = if ($row.selection_gate_status -eq 'approved') { $PackageId } else { '' }
    $row.proposed_wave = $row.topic_cluster
    $row.triage_status = if ($row.selection_gate_status -eq 'approved') { 'approved-review-candidate' } else { 'shortlisted-review-candidate' }
    $row.selection_rank = $rank
    $row.shortlisted = 'true'
}

$orderedRows = @($rows | Sort-Object @{Expression={if ($_.shortlisted -eq 'true') { 0 } else { 1 }}}, @{Expression={[int]($_.selection_rank -as [int])}}, canonical_title)
$orderedRows | Export-Csv -LiteralPath $ledgerPath -NoTypeInformation -Encoding UTF8

$immutabilityVerified = $true
foreach ($sourcePath in $sourceHashesBefore.Keys) {
    $after = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash
    if ($after -ne $sourceHashesBefore[$sourcePath]) {
        $immutabilityVerified = $false
        throw "Protected source changed during intake: $(Get-RelativeVaultPath $sourcePath)"
    }
}

$shortlistRows = @($orderedRows | Where-Object shortlisted -eq 'true')
$summaryLines = [Collections.Generic.List[string]]::new()
$summaryLines.Add('# Clipping Intake Summary - ' + $SnapshotDate.ToString('yyyy-MM-dd'))
$summaryLines.Add('')
$summaryLines.Add('**Summary**: Deterministic, metadata-first intake for newly modified Markdown clippings. No source body was changed and no semantic promotion was performed.')
$summaryLines.Add('')
$summaryLines.Add('## Snapshot')
$summaryLines.Add('')
$summaryLines.Add("- Candidate files inspected: $($sourceHashesBefore.Count)")
$summaryLines.Add("- Previously represented hashes excluded: $($sourceHashesBefore.Count - $records.Count)")
$summaryLines.Add("- Canonical source identities: $($orderedRows.Count)")
$summaryLines.Add("- Transcript identities: $(@($orderedRows | Where-Object source_type -eq 'video-transcript').Count)")
$summaryLines.Add("- Non-transcript identities: $(@($orderedRows | Where-Object source_type -ne 'video-transcript').Count)")
$summaryLines.Add("- Source immutability verified: ``$($immutabilityVerified.ToString().ToLowerInvariant())``")
$summaryLines.Add('')
$summaryLines.Add('## Bounded review candidates')
$summaryLines.Add('')
$summaryLines.Add("- Maximum sources: $ShortlistLimit")
$summaryLines.Add("- Token ceiling: $TokenBudget")
$summaryLines.Add("- Candidate transcripts: $($shortlistRows.Count)")
$summaryLines.Add("- Candidates approved for semantic review: $(@($shortlistRows | Where-Object selection_gate_status -eq 'approved').Count)")
$summaryLines.Add("- Estimated transcript tokens: $tokenTotal")
$summaryLines.Add('')
$summaryLines.Add('| Rank | Cluster | Transcript | Score | Est. tokens | Trust | Suggested targets |')
$summaryLines.Add('| ---: | --- | --- | ---: | ---: | --- | --- |')
foreach ($row in $shortlistRows) {
    $safeTitle = $row.canonical_title.Replace('|', '\|')
    $safeTargets = $row.suggested_target_pages.Replace('|', '\|')
    $summaryLines.Add("| $($row.selection_rank) | $($row.topic_cluster) | $safeTitle | $($row.triage_score) | $($row.estimated_tokens) | $($row.trust_class) | $safeTargets |")
}
$summaryLines.Add('')
$summaryLines.Add('## Method')
$summaryLines.Add('')
$summaryLines.Add('- Exact SHA-256 duplicates are collapsed first; normalized URLs and YouTube video IDs then collapse source-identity variants.')
$summaryLines.Add('- Triage uses frontmatter, descriptions, headings, transcript markers, existing-wiki keyword coverage, and deterministic topic/actionability heuristics. It does not claim body-level semantic review.')
$summaryLines.Add('- Topic clusters are descriptive only. All complete transcripts, including unclassified or emerging topics, enter the same bounded candidate ordering; cluster membership neither authorizes nor blocks review.')
$summaryLines.Add('- Unselected sources remain deferred in the intake backlog. They are not classified as registered-only.')
$summaryLines.Add('- Candidate ranking does not assign a package unless the exact path and hash are marked `available` and `approved-for-semantic-review` in the external disposition register.')
$summaryLines.Add('- Vendor and case-study sources retain a qualification warning.')
$summaryLines.Add('')
$summaryLines.Add('## Approval checkpoint')
$summaryLines.Add('')
$summaryLines.Add('These are review candidates only. Full transcript reading and evidence preparation still require explicit human approval; wiki promotion remains a separate evidence-matrix decision.')
[IO.File]::WriteAllLines($summaryPath, $summaryLines, [Text.UTF8Encoding]::new($false))

Write-Host "Created clipping intake with $($orderedRows.Count) canonical identities."
Write-Host "Prepared $($shortlistRows.Count) transcript review candidates at an estimated $tokenTotal tokens."
Write-Host (Get-RelativeVaultPath $ledgerPath)
Write-Host (Get-RelativeVaultPath $summaryPath)
