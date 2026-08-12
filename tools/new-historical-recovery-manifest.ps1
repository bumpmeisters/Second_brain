param(
    [Parameter(Mandatory = $true)][string]$HistoricalRoot,
    [string]$BaselineRef = 'origin/main',
    [string]$OutputDirectory = 'wiki/_outputs/recovery-manifest'
)

$ErrorActionPreference = 'Stop'
$HistoricalRoot = [IO.Path]::GetFullPath($HistoricalRoot)
$RepositoryRoot = [IO.Path]::GetFullPath((Resolve-Path (Join-Path $PSScriptRoot '..')).Path)
$OutputDirectory = Join-Path $RepositoryRoot $OutputDirectory

function Invoke-Git([string[]]$Arguments) {
    $result = @(& git -c "safe.directory=$HistoricalRoot" -C $HistoricalRoot @Arguments)
    if ($LASTEXITCODE -ne 0) {
        throw "git $($Arguments -join ' ') failed with exit code $LASTEXITCODE"
    }
    return $result
}

function Get-Disposition([string]$Path, [string]$Relation, [bool]$Exists) {
    $p = $Path.Replace('\', '/')

    if (-not $Exists) {
        return @('discard', 'none', 'Current main is authoritative; do not recover a historical deletion.')
    }
    if ($Relation -eq 'identical-to-main') {
        return @('discard', 'none', 'Content is already present on current main.')
    }
    if ($p -match '^(raw/|research/assets/|inbox/)') {
        return @('local-only', 'none', 'Protected source or intake custody; never recover through Git.')
    }
    if ($p -match '^wiki/_extractions/') {
        return @('local-only', 'none', 'Generated sidecar; retain locally and regenerate through source policy when needed.')
    }
    if ($p -match '^wiki/_outputs/') {
        return @('local-only', 'none', 'Generated output; retain outside Git unless a later task explicitly promotes it.')
    }
    if ($p -match '^\.worktrees/|^\.tmp-|^tmp/') {
        return @('discard', 'none', 'Temporary or nested-worktree artifact; do not recover.')
    }
    if ($p -match '/\.patch-test$') {
        return @('discard', 'none', 'Patch-mechanism probe; do not recover as project content.')
    }
    if ($p -match '^projects/(compound-engineering-plugin|gstack)(/|$)') {
        return @('discard', 'none', 'Vendored or embedded third-party checkout; restore from its upstream, not this repository.')
    }
    if ($p -match '^ME/') {
        return @('local-only', 'none', 'Personal workspace material remains local and outside recovery PRs.')
    }

    $aiCore = @(
        'wiki/agent-evaluation.md',
        'wiki/agent-security.md',
        'wiki/agentic-systems.md',
        'wiki/ai-governance.md',
        'wiki/applied-ai-use-cases.md',
        'wiki/mcp-and-tool-access.md'
    )
    if ($aiCore -contains $p) {
        return @('recover', '04-ai-core-delta', 'Review only the post-PR-10 delta against the recovered AI core pages.')
    }
    if ($p -match '^projects/ai/') {
        return @('recover', '05-ai-project', 'Recover as the bounded AI project wave.')
    }
    if ($p -match '^projects/content-operating-system/' -or $p -match '^projects/No and low code_1st Marketing Agent/') {
        return @('recover', '06-content-operating-system', 'Recover with the related content operating-system project.')
    }
    if ($p -match '^projects/abm-operating-system/') {
        return @('recover', '07-abm-operating-system', 'Recover with the bounded ABM operating-system project.')
    }

    if ($p -match '(?i)newsletter') {
        return @('recover', '09-newsletter-intelligence', 'Recover only as part of the newsletter system wave with its tests and documentation.')
    }
    if ($p -match '(?i)(youtube|linkedin|transcript)') {
        return @('archive', '10-channel-automation-archive', 'Experimental channel automation is excluded from the minimum sane recovery; preserve in backup only.')
    }

    if ($p -match '(?i)(semantic-ingest|reusable-practice|source-selection|source-inbox|clipping-intake|clipping-disposition|vault-transaction|python-runtime|resolve-vault-link|set-file-transactional|wiki-integrity|line-ending|local-skill-contract|source-coverage|source-curation)' -or
        $p -match '^(AGENTS\.md|\.gitignore|docs/decisions/|docs/local-python-runtime\.md|skills/|tests/|tools/|templates/)') {
        return @('recover', '08-knowledge-workflow-governance', 'Recover with the repository governance, tooling, tests, and reusable-practice contracts.')
    }

    if ($p -match '^docs/plans/') {
        return @('archive', 'archive-historical-plans', 'Historical implementation plan; preserve in backup but do not add to current main by default.')
    }
    if ($p -match '^(wiki/|research/)') {
        return @('recover', '11-curated-wiki-delta', 'Review as durable knowledge; recover only with citations, links, and current-index fit.')
    }

    return @('archive', 'archive-unclassified', 'Outside the bounded recovery waves; preserve in backup unless explicitly reopened.')
}

$baselineCommit = ([string](Invoke-Git @('rev-parse', $BaselineRef))).Trim()
$historicalHead = ([string](Invoke-Git @('rev-parse', 'HEAD'))).Trim()
$baselineByPath = @{}
foreach ($treeLine in @(Invoke-Git @('-c', 'core.quotepath=false', 'ls-tree', '-r', '--full-tree', $BaselineRef))) {
    if ($treeLine -match '^\d+\s+\w+\s+([0-9a-f]+)\t(.+)$') {
        $baselineByPath[$matches[2].Replace('\', '/')] = $matches[1]
    }
}
$statusLines = @(Invoke-Git @('-c', 'core.quotepath=false', 'status', '--porcelain=v1', '-uall'))
$rows = [Collections.Generic.List[object]]::new()

foreach ($line in $statusLines) {
    if ([string]::IsNullOrWhiteSpace($line) -or $line.Length -lt 4) { continue }
    $status = $line.Substring(0, 2)
    $path = $line.Substring(3).Replace('\', '/')
    if ($path -match ' -> ') { $path = ($path -split ' -> ', 2)[1] }
    if ($path.Length -ge 2 -and $path.StartsWith('"') -and $path.EndsWith('"')) {
        $path = $path.Substring(1, $path.Length - 2).Replace('\"', '"').Replace('\\', '\')
    }
    if ($path -eq '.worktrees/recovery-manifest/') { continue }
    $absolutePath = Join-Path $HistoricalRoot $path
    $exists = Test-Path -LiteralPath $absolutePath
    $isDirectory = $exists -and (Get-Item -LiteralPath $absolutePath -Force).PSIsContainer
    $candidateKind = if ($status -eq '??') { 'untracked' } else { 'tracked-change' }
    $baselineBlob = ''
    $worktreeBlob = ''
    $relation = 'absent-from-main'

    if ($baselineByPath.ContainsKey($path)) {
        $baselineBlob = $baselineByPath[$path]
        if (-not $exists) {
            $relation = 'missing-from-historical'
        } elseif ($isDirectory) {
            $relation = 'directory-candidate'
        } else {
            $worktreeProbe = @(& git -c "safe.directory=$HistoricalRoot" -C $HistoricalRoot hash-object "--path=$path" -- $absolutePath)
            if ($LASTEXITCODE -ne 0) { throw "Unable to hash $path" }
            $worktreeBlob = $worktreeProbe[0].Trim()
            $relation = if ($worktreeBlob -eq $baselineBlob) { 'identical-to-main' } else { 'differs-from-main' }
        }
    } elseif ($isDirectory) {
        $relation = 'directory-candidate'
    }

    $decision = Get-Disposition -Path $path -Relation $relation -Exists $exists
    $nextAction = switch ($decision[0]) {
        'recover' { "Process and close in $($decision[1]); do not copy blindly." }
        'archive' { 'Retain only in the existing backup; no recovery PR.' }
        'local-only' { 'Retain outside Git under the applicable custody or generation policy.' }
        'discard' { 'No recovery action; may disappear when the historical workspace is retired.' }
    }
    $rows.Add([pscustomobject][ordered]@{
        path = $path
        git_status = $status
        candidate_kind = $candidateKind
        object_type = if ($isDirectory) { 'directory' } else { 'file' }
        baseline_relation = $relation
        disposition = $decision[0]
        recovery_wave = $decision[1]
        rationale = $decision[2]
        decision_status = 'final'
        next_action = $nextAction
        sensitive_content_review = if ($decision[0] -eq 'recover') { 'required-before-commit' } else { 'not-applicable' }
        historical_head = $historicalHead
        baseline_commit = $baselineCommit
        worktree_blob = $worktreeBlob
        baseline_blob = $baselineBlob
    })
}

New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
$privateOutputDirectory = Join-Path $OutputDirectory 'private'
New-Item -ItemType Directory -Path $privateOutputDirectory -Force | Out-Null
$manifestPath = Join-Path $privateOutputDirectory 'historical-workspace-recovery-manifest.csv'
$rows | Sort-Object path | Export-Csv -LiteralPath $manifestPath -NoTypeInformation -Encoding UTF8
$manifestSha256 = (Get-FileHash -LiteralPath $manifestPath -Algorithm SHA256).Hash.ToLowerInvariant()

$summary = @($rows | Group-Object disposition | Sort-Object Name | ForEach-Object {
    [pscustomobject]@{ disposition = $_.Name; count = $_.Count }
})
$waves = @($rows | Where-Object { $_.recovery_wave -ne 'none' } | Group-Object recovery_wave, disposition | Sort-Object Name | ForEach-Object {
    [pscustomobject]@{ wave = $_.Group[0].recovery_wave; disposition = $_.Group[0].disposition; count = $_.Count }
})
$wavePath = Join-Path $OutputDirectory 'recovery-wave-summary.csv'
$waves | Export-Csv -LiteralPath $wavePath -NoTypeInformation -Encoding UTF8

$metadata = [pscustomobject][ordered]@{
    manifest_version = 'historical-workspace-recovery-manifest/v1'
    snapshot_date = (Get-Date).ToString('yyyy-MM-dd')
    historical_branch = 'codex/abm-operating-system'
    historical_head = $historicalHead
    baseline_ref = $BaselineRef
    baseline_commit = $baselineCommit
    candidate_count = $rows.Count
    tracked_change_count = @($rows | Where-Object { $_.candidate_kind -eq 'tracked-change' }).Count
    untracked_count = @($rows | Where-Object { $_.candidate_kind -eq 'untracked' }).Count
    private_manifest_sha256 = $manifestSha256
    disposition_counts = $summary
    wave_counts = $waves
}
$metadataPath = Join-Path $OutputDirectory 'recovery-manifest-metadata.json'
[IO.File]::WriteAllText($metadataPath, ($metadata | ConvertTo-Json -Depth 5) + "`n", [Text.UTF8Encoding]::new($false))

$result = [pscustomobject][ordered]@{
    manifest_version = 'historical-workspace-recovery-manifest/v1'
    generated_at = (Get-Date).ToString('yyyy-MM-ddTHH:mm:ssK')
    historical_root = $HistoricalRoot
    historical_head = $historicalHead
    baseline_ref = $BaselineRef
    baseline_commit = $baselineCommit
    candidate_count = $rows.Count
    disposition_counts = $summary
    wave_counts = $waves
    manifest_path = $manifestPath
    metadata_path = $metadataPath
    wave_summary_path = $wavePath
}
$result | ConvertTo-Json -Depth 5
