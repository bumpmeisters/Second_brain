$ErrorActionPreference = 'Stop'

$vault = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$tool = Join-Path $vault 'tools\new-clipping-intake.ps1'
$fixtureRoot = Join-Path ([IO.Path]::GetTempPath()) ('clipping-intake-' + [guid]::NewGuid().ToString('N'))
$clippings = Join-Path $fixtureRoot 'raw\Clippings'
$outputs = Join-Path $fixtureRoot 'wiki\_outputs'
$ledger = Join-Path $outputs 'delta.csv'
$summary = Join-Path $outputs 'summary.md'
$prior = Join-Path $outputs 'prior.csv'

function Write-Utf8NoBom([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

try {
    New-Item -ItemType Directory -Path $clippings -Force | Out-Null
    New-Item -ItemType Directory -Path $outputs -Force | Out-Null

    $transcript = @'
---
title: "Canonical Workflow"
source: "https://www.youtube.com/watch?v=abcDEF12345&t=10s"
created: 2026-07-23
author:
  - "Example Practitioner"
---
# Canonical Workflow

An operational workflow for account-based marketing and AI agents.

## Transcript

**0:01** · Intro
**0:10** · Step one
**0:20** · Step two
**0:30** · Step three
**0:40** · Step four
**0:50** · Step five
**1:00** · Step six
**1:10** · Step seven
**1:20** · Step eight
**1:30** · Step nine
**1:40** · Step ten
'@
    Write-Utf8NoBom (Join-Path $clippings 'Wrong Filename.md') $transcript
    Write-Utf8NoBom (Join-Path $clippings 'Exact Copy.md') $transcript
    Write-Utf8NoBom (Join-Path $clippings 'Same Video Variant.md') ($transcript.Replace('An operational workflow', 'A practical workflow').Replace('&t=10s', '&list=playlist'))
    $emergingTranscript = @'
---
title: "Unified Work Surface"
source: "https://example.com/unified-work-surface"
created: 2026-07-23
author:
  - "Example Explorer"
---
# Unified Work Surface

A new work surface may blend building, browsing, and coordination.

## Transcript

**0:01** Â· Intro
**0:10** Â· Step one
**0:20** Â· Step two
**0:30** Â· Step three
**0:40** Â· Step four
**0:50** Â· Step five
**1:00** Â· Step six
**1:10** Â· Step seven
**1:20** Â· Step eight
**1:30** Â· Step nine
**1:40** Â· Step ten
'@
    Write-Utf8NoBom (Join-Path $clippings 'Emerging Work Surface.md') $emergingTranscript
    Write-Utf8NoBom (Join-Path $clippings 'Empty.md') "---`ntitle:`nsource:`n---`n"
    Write-Utf8NoBom (Join-Path $clippings 'Known.md') "---`ntitle: Known`nsource: https://example.com/known`n---`n# Known`n"
    Write-Utf8NoBom (Join-Path $fixtureRoot 'wiki\agentic-systems.md') "# Agentic Systems`n`nCanonical workflow for AI agents."
    New-Item -ItemType Directory -Path (Join-Path $fixtureRoot 'tools\config') -Force | Out-Null
    Copy-Item (Join-Path $vault 'tools\config\source-selection-policy.json') (Join-Path $fixtureRoot 'tools\config\source-selection-policy.json')

    Get-ChildItem -LiteralPath $clippings -File | ForEach-Object {
        $_.LastWriteTime = [datetime]'2026-07-23T12:00:00'
    }

    $knownPath = Join-Path $clippings 'Known.md'
    $knownHash = (Get-FileHash -LiteralPath $knownPath -Algorithm SHA256).Hash
    @([pscustomobject]@{
        canonical_source = 'raw/Clippings/Known.md'
        sha256 = $knownHash
        variant_hashes = $knownHash
    }) | Export-Csv -LiteralPath $prior -NoTypeInformation -Encoding UTF8
    @(Get-ChildItem -LiteralPath $clippings -File | ForEach-Object {
        [pscustomobject][ordered]@{
            canonical_source = 'raw/Clippings/' + $_.Name
            sha256 = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
            availability = 'unknown'
            selection_status = 'pending'
            processing_status = 'unread'
            semantic_disposition = 'pending'
            package = ''
        }
    }) | Export-Csv -LiteralPath (Join-Path $outputs 'dispositions.csv') -NoTypeInformation -Encoding UTF8

    $before = @{}
    Get-ChildItem -LiteralPath $clippings -File | ForEach-Object {
        $before[$_.Name] = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
    }

    & $tool `
        -VaultRoot $fixtureRoot `
        -ClippingsRoot 'raw/Clippings' `
        -PriorLedger 'wiki/_outputs/prior.csv' `
        -OutputLedger 'wiki/_outputs/delta.csv' `
        -OutputSummary 'wiki/_outputs/summary.md' `
        -DispositionRegister 'wiki/_outputs/dispositions.csv' `
        -SnapshotDate '2026-07-23' `
        -PackageId 'P10' `
        -ShortlistLimit 10 `
        -TokenBudget 150000

    $rows = @(Import-Csv -LiteralPath $ledger)
    if ($rows.Count -ne 3) { throw "Expected three canonical rows, found $($rows.Count)." }

    $video = $rows | Where-Object source_identity -eq 'youtube:abcDEF12345'
    if (-not $video) { throw 'Same-video variants were not normalized to a YouTube source identity.' }
    if ($video.duplicate_file_count -ne '3') { throw "Expected three aliases in the video family, found $($video.duplicate_file_count)." }
    if ($video.has_transcript -ne 'true' -or $video.transcript_completeness -ne 'full') {
        throw 'Transcript detection or completeness classification failed.'
    }
    if ($video.title_mismatch -ne 'true') { throw 'Filename/body-title mismatch was not flagged.' }
    if ($video.shortlisted -ne 'true') { throw 'Eligible transcript was not shortlisted.' }
    if ($video.package -or $video.selection_gate_status -ne 'pending') { throw 'Pending transcript was assigned to a semantic package.' }
    if ($video.topic_cluster -notin @('ai-native-gtm','abm-execution','content-brand')) {
        throw 'Eligible transcript was not assigned to an active topic cluster.'
    }
    if (-not $video.wiki_coverage_terms -or -not $video.wiki_coverage_hits) {
        throw 'Existing wiki coverage was not measured during triage.'
    }

    $emerging = $rows | Where-Object source_identity -eq 'https://example.com/unified-work-surface'
    if (-not $emerging -or $emerging.topic_cluster -ne 'unclassified-emerging') {
        throw 'Emerging content without a fixed keyword was not retained as an open review candidate.'
    }
    if ($emerging.shortlisted -ne 'true' -or $emerging.triage_status -ne 'shortlisted-review-candidate') {
        throw 'Unclassified emerging content was blocked from the bounded review candidate set.'
    }

    $empty = $rows | Where-Object source_type -eq 'empty-clip'
    if (-not $empty -or $empty.triage_status -ne 'excluded-empty') {
        throw 'Empty capture was not retained with an exclusion status.'
    }

    if ($rows.canonical_source -contains 'raw/Clippings/Known.md') {
        throw 'A hash represented in a prior ledger was not excluded.'
    }

    foreach ($file in Get-ChildItem -LiteralPath $clippings -File) {
        $after = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
        if ($before[$file.Name] -ne $after) { throw "Source changed during intake: $($file.Name)" }
    }

    $summaryText = Get-Content -LiteralPath $summary -Raw
    if ($summaryText -notmatch 'Source immutability verified: `true`') {
        throw 'Summary does not record source immutability verification.'
    }
    if ($summaryText -notmatch 'Estimated transcript tokens') {
        throw 'Summary is missing shortlist token reporting.'
    }
    if ($summaryText -match 'approved for full transcript reading' -or $summaryText -notmatch 'clusters are descriptive only') {
        throw 'Summary either implies approval or omits the open-discovery boundary.'
    }

    Write-Host 'Clipping intake tests passed.'
}
finally {
    if (Test-Path -LiteralPath $fixtureRoot) {
        $resolvedFixture = [IO.Path]::GetFullPath($fixtureRoot)
        $resolvedTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
        if (-not $resolvedFixture.StartsWith($resolvedTemp, [StringComparison]::OrdinalIgnoreCase)) {
            throw "Refusing to remove test fixture outside the temp directory: $resolvedFixture"
        }
        Remove-Item -LiteralPath $fixtureRoot -Recurse -Force
    }
}
