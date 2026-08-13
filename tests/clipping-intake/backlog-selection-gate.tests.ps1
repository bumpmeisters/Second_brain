$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$fixture = Join-Path $repo '.tmp\backlog-selection-gate-tests'

function Write-Utf8([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

try {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
    @('tools\config', 'wiki\_outputs', 'raw\Clippings') | ForEach-Object { New-Item -ItemType Directory -Path (Join-Path $fixture $_) -Force | Out-Null }
    Copy-Item (Join-Path $repo 'tools\reconcile-clipping-backlog.ps1') (Join-Path $fixture 'tools\reconcile-clipping-backlog.ps1')
    Copy-Item (Join-Path $repo 'tools\config\source-selection-policy.json') (Join-Path $fixture 'tools\config\source-selection-policy.json')

    $sources = @(
        @{ name = 'Approved.md'; title = 'Approved AI workflow'; selection = 'approved-for-semantic-review'; availability = 'available'; score = 8 },
        @{ name = 'Pending.md'; title = 'Pending AI workflow'; selection = 'pending'; availability = 'unknown'; score = 10 }
    )
    $intake = @()
    $dispositions = @()
    foreach ($item in $sources) {
        $relative = 'raw/Clippings/' + $item.name
        $path = Join-Path $fixture $relative
        Write-Utf8 $path ('# ' + $item.title)
        $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash
        $intake += [pscustomobject][ordered]@{
            canonical_source = $relative; canonical_title = $item.title; filename_title = $item.title
            package = ''; proposed_wave = 'backlog'; source_type = 'video-transcript'; trust_class = 'practitioner'
            triage_status = 'deferred-backlog'; sha256 = $hash; variant_hashes = $hash
            source_identity = 'youtube:' + $item.name.Replace('.md',''); source_url = ''; estimated_tokens = '1000'
            transcript_completeness = 'full'; topic_cluster = 'ai-native-gtm'; triage_score = [string]$item.score; novelty_score = '1'
            selection_rank = ''; shortlisted = 'false'
        }
        $dispositions += [pscustomobject][ordered]@{
            canonical_source = $relative; sha256 = $hash; availability = $item.availability
            selection_status = $item.selection; processing_status = 'unread'; semantic_disposition = 'pending'; package = ''
        }
    }
    $intake | Export-Csv (Join-Path $fixture 'wiki\_outputs\intake.csv') -NoTypeInformation -Encoding UTF8
    $dispositions | Export-Csv (Join-Path $fixture 'wiki\_outputs\dispositions.csv') -NoTypeInformation -Encoding UTF8
    @([pscustomobject]@{ canonical_source = 'none'; sha256 = ''; semantic_decision = 'pending'; routing = 'stay-P1'; review_status = 'pending' }) |
        Export-Csv (Join-Path $fixture 'wiki\_outputs\completed.csv') -NoTypeInformation -Encoding UTF8

    $tool = Join-Path $fixture 'tools\reconcile-clipping-backlog.ps1'
    & $tool -IntakeLedger 'wiki/_outputs/intake.csv' -CompletedLedger 'wiki/_outputs/completed.csv' -DispositionRegister 'wiki/_outputs/dispositions.csv' -OutputLedger 'wiki/_outputs/reconciled.csv' -OutputSummary 'wiki/_outputs/reconciled.md' -PackageId P32 -ShortlistLimit 5 -TokenBudget 10000 | Out-Null
    $rows = @(Import-Csv (Join-Path $fixture 'wiki\_outputs\reconciled.csv'))
    $approved = $rows | Where-Object canonical_source -eq 'raw/Clippings/Approved.md'
    $pending = $rows | Where-Object canonical_source -eq 'raw/Clippings/Pending.md'
    if ($approved.package_selected -ne 'true' -or $approved.package -ne 'P32') { throw ('Approved source was not selected: rows=' + ($rows | ConvertTo-Json -Depth 5 -Compress) + '; dispositions=' + ((Import-Csv (Join-Path $fixture 'wiki\_outputs\dispositions.csv')) | ConvertTo-Json -Depth 5 -Compress)) }
    if ($pending.package_selected -ne 'false' -or $pending.package) { throw 'Pending source bypassed the backlog selection gate.' }
    if ($pending.selection_gate_status -ne 'pending') { throw 'Pending source lost its gate status.' }
}
finally {
    if (Test-Path -LiteralPath $fixture) {
        $resolved = [IO.Path]::GetFullPath($fixture)
        $expected = [IO.Path]::GetFullPath((Join-Path $repo '.tmp'))
        if (-not $resolved.StartsWith($expected, [StringComparison]::OrdinalIgnoreCase)) { throw 'Refusing to remove fixture outside repository temp.' }
        Remove-Item -LiteralPath $fixture -Recurse -Force
    }
}

Write-Host 'Backlog selection gate tests passed (3 assertions).'
