$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$fixtureRoot = Join-Path $repo '.tmp\semantic-ingest-validator-tests'
if (-not $fixtureRoot.StartsWith($repo + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Fixture path escaped the repository.'
}

function Write-Utf8([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Force $parent | Out-Null }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

function New-Fixture {
    if (Test-Path -LiteralPath $fixtureRoot) { Remove-Item -LiteralPath $fixtureRoot -Recurse -Force }
    @(
        (Join-Path $fixtureRoot 'tools\config')
        (Join-Path $fixtureRoot 'raw\Clippings')
        (Join-Path $fixtureRoot 'research\assets')
        (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest')
    ) | ForEach-Object { New-Item -ItemType Directory -Force $_ | Out-Null }
    Copy-Item (Join-Path $repo 'tools\test-semantic-ingest-package.ps1') (Join-Path $fixtureRoot 'tools\test-semantic-ingest-package.ps1')
    Copy-Item (Join-Path $repo 'tools\config\semantic-ingest-schema.json') (Join-Path $fixtureRoot 'tools\config\semantic-ingest-schema.json')

    Write-Utf8 (Join-Path $fixtureRoot 'raw\Clippings\a.md') '# Source A'
    Write-Utf8 (Join-Path $fixtureRoot 'raw\Clippings\b.md') '# Source B'
    $hashA = (Get-FileHash (Join-Path $fixtureRoot 'raw\Clippings\a.md') -Algorithm SHA256).Hash
    $hashB = (Get-FileHash (Join-Path $fixtureRoot 'raw\Clippings\b.md') -Algorithm SHA256).Hash
    $decisions = @(
        [pscustomobject][ordered]@{
            canonical_source = 'raw/Clippings/a.md'; sha256 = $hashA; original_title = 'a'; canonical_content_title = 'Account signal pattern'; title_mismatch = 'true'; source_type = 'web-article'; trust_class = 'vendor'; semantic_decision = 'new-claim'; routing = 'stay-P9'; claim_risk = 'medium'; target_pages = 'wiki/target.md'; source_summary = 'wiki/source-bundle.md'; rationale = 'Adds a new pattern.'; review_status = 'approved'
        },
        [pscustomobject][ordered]@{
            canonical_source = 'raw/Clippings/b.md'; sha256 = $hashB; original_title = 'b'; canonical_content_title = 'b'; title_mismatch = 'false'; source_type = 'video-transcript'; trust_class = 'practitioner'; semantic_decision = 'corroborating'; routing = 'stay-P9'; claim_risk = 'medium'; target_pages = 'wiki/target.md'; source_summary = 'wiki/source-bundle.md'; rationale = 'Corroborates the pattern.'; review_status = 'approved'
        }
    )
    $decisions | Export-Csv (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv') -NoTypeInformation -Encoding UTF8
    @([pscustomobject][ordered]@{
        claim_id = 'C1'; wave = 'test'; pattern_or_claim = 'Signals need context.'; source_paths = 'raw/Clippings/a.md; raw/Clippings/b.md'; knowledge_delta = 'new-claim'; trust = 'mixed'; claim_risk = 'medium'; target_page = 'wiki/target.md'; planned_action = 'update-page'; review_status = 'approved'; notes = 'Fixture claim.'
    }) | Export-Csv (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv') -NoTypeInformation -Encoding UTF8
    $decisionHash = (Get-FileHash (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv') -Algorithm SHA256).Hash
    $matrixHash = (Get-FileHash (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv') -Algorithm SHA256).Hash
    @([pscustomobject]@{ canonical_source = 'raw/Clippings/a.md' }, [pscustomobject]@{ canonical_source = 'raw/Clippings/b.md' }) | Export-Csv (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\intake.csv') -NoTypeInformation -Encoding UTF8
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\target.md') @"
---
type: concept
---

# Target

Claim (source: a.md; source: b.md).

## Related pages

- [[source-bundle]]
"@
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\source-bundle.md') @"
---
type: source-summary
---

# Bundle

Evidence (source: a.md; source: b.md).

## Related pages

- [[target]]
"@
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\reusable-practices-library.md') @"
---
type: library
---

# Reusable Practices Library

## AI work and adoption

## Admission rule
"@
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\reusable-practices-router.md') @"
---
type: router
---

# Reusable Practices Router

## Routing table

## Selection protocol
"@
    foreach ($register in @('index.md', 'sources.md', 'log.md')) {
        Write-Utf8 (Join-Path $fixtureRoot "wiki\$register") "---`ntype: register`n---`n`n# PTEST-MARKER"
    }
    $manifest = [ordered]@{
        schema_version = 'semantic-ingest/v1'; package_id = 'P9'; status = 'complete'; schema_path = 'tools/config/semantic-ingest-schema.json'; intake_ledger = 'wiki/_outputs/semantic-ingest/ptest/intake.csv'; decision_ledger = 'wiki/_outputs/semantic-ingest/ptest/decisions.csv'; evidence_matrix = 'wiki/_outputs/semantic-ingest/ptest/evidence-matrix.csv'; source_bundle = 'wiki/source-bundle.md'; expected_source_count = 2; register_updates_required = $true; register_markers = [ordered]@{ 'wiki/index.md' = 'PTEST-MARKER'; 'wiki/sources.md' = 'PTEST-MARKER'; 'wiki/log.md' = 'PTEST-MARKER' }; backlog = [ordered]@{ completed_ledgers = @('wiki/_outputs/semantic-ingest/ptest/decisions.csv'); expected_open_count = 0 }; raw_guard_required = $true; validation = [ordered]@{ validator_version = 'semantic-ingest-validator/2.3'; validated_at = '2026-07-18T00:00:00.0000000Z'; validation_mode = 'Final'; validation_profile = 'Full'; validation_status = 'passed'; decision_ledger_sha256 = $decisionHash; evidence_matrix_sha256 = $matrixHash }
    }
    $manifest | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\package.json') -Encoding UTF8
    & git -C $fixtureRoot init --quiet
    & git -C $fixtureRoot config user.email 'fixture@example.invalid'
    & git -C $fixtureRoot config user.name 'Semantic Ingest Fixture'
    & git -C $fixtureRoot config core.autocrlf false
    & git -C $fixtureRoot add .
    & git -C $fixtureRoot commit --quiet -m baseline
}

function Invoke-FixtureValidation([string]$Mode = 'Final', [string]$Profile = 'Full', [switch]$RecordResult) {
    $validator = Join-Path $fixtureRoot 'tools\test-semantic-ingest-package.ps1'
    $manifest = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\package.json'
    $arguments = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $validator, '-Manifest', $manifest, '-Mode', $Mode, '-Profile', $Profile, '-Json')
    if ($RecordResult) { $arguments += '-RecordResult' }
    $output = & powershell.exe @arguments 2>$null
    $code = $LASTEXITCODE
    $result = ($output | Out-String) | ConvertFrom-Json
    return [pscustomobject]@{ code = $code; result = $result }
}

function Assert-Passes([string]$Name) {
    $run = Invoke-FixtureValidation
    if ($run.code -ne 0 -or -not $run.result.passed) { throw "$Name failed unexpectedly: $($run.result.errors | ConvertTo-Json -Compress)" }
}

function Assert-Error([string]$Name, [string]$Code) {
    $run = Invoke-FixtureValidation
    if ($run.code -ne 2 -or $run.result.errors.code -notcontains $Code) {
        throw "$Name did not produce $Code. Actual: $($run.result.errors.code -join ', ')"
    }
}

try {
    New-Fixture
    $tick = [char]96
    Add-Content (Join-Path $fixtureRoot 'wiki\target.md') ([Environment]::NewLine + 'Normal inline code such as ' + $tick + 'new-claim' + $tick)
    Assert-Passes 'baseline'

    New-Fixture
    Add-Content (Join-Path $fixtureRoot 'raw\Clippings\a.md') 'changed outside contract profile'
    $fast = Invoke-FixtureValidation -Profile Fast
    if ($fast.code -ne 0 -or -not $fast.result.passed -or $fast.result.profile -ne 'Fast') { throw 'Fast profile unexpectedly ran full integration checks.' }

    New-Fixture
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\target-2.md') "---`ntype: concept`n---`n`n# Target 2`n`nClaim (source: a.md)."
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[0].target_pages = 'wiki/target.md; wiki/target-2.md'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $recorded = Invoke-FixtureValidation -RecordResult
    $recordedManifest = Get-Content (Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\package.json') -Raw | ConvertFrom-Json
    if ($recorded.code -ne 0 -or -not $recorded.result.validation_recorded -or $recordedManifest.validation.validation_status -ne 'passed' -or $recordedManifest.validation.validation_profile -ne 'Full') { throw 'Successful validation provenance was not recorded.' }

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[0].rationale = 'Changed after validation.'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'stale final provenance' 'FINAL_PROVENANCE_MISSING_OR_STALE'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[1].semantic_decision = 'pending'; $rows[1].trust_class = 'pending'; $rows[1].claim_risk = 'pending'; $rows[1].review_status = 'pending'; $rows[1].rationale = ''; $rows[1].target_pages = ''; $rows[1].source_summary = ''; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv'; $claims = Import-Csv $path; $claims[0].source_paths = 'raw/Clippings/a.md'; $claims | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $manifestPath = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\package.json'; $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json; $manifest.backlog.expected_open_count = 1; $manifest | ConvertTo-Json -Depth 8 | Set-Content $manifestPath -Encoding UTF8
    $wave = Invoke-FixtureValidation -Mode Wave
    if ($wave.code -ne 0 -or -not $wave.result.passed) { throw 'Wave mode did not permit untouched pending rows.' }

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[0].sha256 = '0' * 64; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'bad hash' 'HASH_MISMATCH'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = @(Import-Csv $path); @($rows + $rows[0]) | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $manifestPath = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\package.json'; $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json; $manifest.expected_source_count = 3; $manifest | ConvertTo-Json -Depth 8 | Set-Content $manifestPath -Encoding UTF8
    Assert-Error 'duplicate source' 'DUPLICATE_CANONICAL_SOURCE'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[0].semantic_decision = 'promoted'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'invalid decision' 'DECISION_INVALID'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[0].canonical_content_title = 'a'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'missing title alias' 'TITLE_ALIAS_MISSING'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[0].target_pages = 'wiki/missing.md'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'missing target' 'TARGET_PAGE_MISSING'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv'; $rows = Import-Csv $path; $rows[0].source_paths = 'raw/Clippings/missing.md'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'unknown claim source' 'CLAIM_SOURCE_UNKNOWN'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv'; $rows = Import-Csv $path; $rows[0].review_status = 'pending'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'unapproved evidence' 'CLAIM_NOT_APPROVED'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv'; $rows = Import-Csv $path; $rows[0].source_paths = 'raw/Clippings/a.md'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    Assert-Error 'promotion missing from matrix' 'PROMOTION_NOT_IN_MATRIX'

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv'; $rows = Import-Csv $path; $rows[0].source_paths = 'raw/Clippings/a.md'; $rows[0].review_status = 'reviewed'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $wave = Invoke-FixtureValidation -Mode Wave -Profile Fast
    if ($wave.code -ne 2 -or $wave.result.errors.code -notcontains 'PROMOTION_NOT_IN_MATRIX') { throw 'Wave/Fast did not catch reviewed corroborating evidence without matrix coverage.' }

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[1].semantic_decision = 'registered-only'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $wave = Invoke-FixtureValidation -Mode Wave -Profile Fast
    if ($wave.code -ne 2 -or $wave.result.errors.code -notcontains 'REGISTERED_ONLY_TARGET_PRESENT') { throw 'Wave/Fast did not reject registered-only target pages.' }

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[1].semantic_decision = 'registered-only'; $rows[1].target_pages = ''; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $wave = Invoke-FixtureValidation -Mode Wave -Profile Fast
    if ($wave.code -ne 2 -or $wave.result.errors.code -notcontains 'REGISTERED_ONLY_IN_MATRIX') { throw 'Wave/Fast did not reject registered-only evidence-matrix coverage.' }

    New-Fixture
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\decisions.csv'; $rows = Import-Csv $path; $rows[1].semantic_decision = 'registered-only'; $rows[1].target_pages = ''; $rows[1].review_status = 'pending'; $rows | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $path = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\evidence-matrix.csv'; $claims = Import-Csv $path; $claims[0].source_paths = 'raw/Clippings/a.md'; $claims | Export-Csv $path -NoTypeInformation -Encoding UTF8
    $wave = Invoke-FixtureValidation -Mode Wave -Profile Fast
    if ($wave.code -ne 2 -or $wave.result.errors.code -notcontains 'REGISTERED_ONLY_NOT_REVIEWED') { throw 'Wave/Fast did not reject registered-only without documented review status.' }

    New-Fixture
    Add-Content (Join-Path $fixtureRoot 'wiki\source-bundle.md') "`n- [[missing-page]]"
    Assert-Error 'broken wiki link' 'WIKI_LINK_MISSING'

    New-Fixture
    Add-Content (Join-Path $fixtureRoot 'wiki\source-bundle.md') "`nMissing (source: absent.md)."
    Assert-Error 'missing source citation' 'SOURCE_CITATION_MISSING'

    New-Fixture
    $tick = [char]96
    Add-Content (Join-Path $fixtureRoot 'wiki\source-bundle.md') ($tick + 'n' + $tick + 'n## Broken')
    Assert-Error 'literal escaped line break' 'LITERAL_NEWLINE_ESCAPE'

    New-Fixture
    Add-Content (Join-Path $fixtureRoot 'raw\Clippings\a.md') 'changed'
    Assert-Error 'protected source modification' 'PROTECTED_SOURCE_MODIFIED'

    New-Fixture
    $manifestPath = Join-Path $fixtureRoot 'wiki\_outputs\semantic-ingest\ptest\package.json'; $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json; $manifest.backlog.expected_open_count = 1; $manifest | ConvertTo-Json -Depth 8 | Set-Content $manifestPath -Encoding UTF8
    Assert-Error 'bad backlog count' 'BACKLOG_COUNT_MISMATCH'

    New-Fixture
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\log.md') "---`ntype: log`n---`n# No marker"
    Assert-Error 'missing register marker' 'REGISTER_NOT_UPDATED'

    New-Fixture
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\target.md') @"
---
type: workflow
---

# Target

Claim (source: a.md; source: b.md).

## Trigger

Use for the fixture.

## Output

A fixture record.

## Guardrails

Do not generalize.

## Related pages

- [[source-bundle]]
"@
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\reusable-practices-library.md') "---`ntype: library`n---`n`n# Library`n`n## AI work and adoption`n`n- [[target]]`n`n## Admission rule"
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\reusable-practices-router.md') "---`ntype: router`n---`n`n# Router`n`n## Routing table`n`n| [[target]] | fixture |`n`n## Selection protocol"
    Assert-Error 'missing reusable routing metadata' 'REUSABLE_ROUTING_FIELD_MISSING'

    New-Fixture
    Write-Utf8 (Join-Path $fixtureRoot 'wiki\target.md') @"
---
type: workflow
description: "Fixture workflow."
use_when: "Fixture use."
avoid_when: "Fixture exclusion."
output: "Fixture record."
---

# Target

Claim (source: a.md; source: b.md).

## Trigger

Use for the fixture.

## Output

A fixture record.

## Guardrails

Do not generalize.

## Related pages

- [[source-bundle]]
"@
    Assert-Error 'unregistered reusable target' 'REUSABLE_TARGET_NOT_REGISTERED'
}
finally {
    if (Test-Path -LiteralPath $fixtureRoot) { Remove-Item -LiteralPath $fixtureRoot -Recurse -Force }
}

Write-Host 'Semantic-ingest package validator tests passed (24 assertions).'
