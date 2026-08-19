$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$fixture = Join-Path $repo '.tmp\youtube-reconciliation-tests'
if (-not $fixture.StartsWith($repo + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) { throw 'Fixture escaped repository.' }
if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }

try {
    New-Item -ItemType Directory -Force (Join-Path $fixture 'raw\imports\automated-clippings\youtube\c') | Out-Null
    New-Item -ItemType Directory -Force (Join-Path $fixture 'wiki\_outputs\semantic-ingest\p99') | Out-Null
    New-Item -ItemType Directory -Force (Join-Path $fixture 'wiki\_outputs\source-intake') | Out-Null
    New-Item -ItemType Directory -Force (Join-Path $fixture 'tools\config') | Out-Null
    Copy-Item (Join-Path $repo 'tools\reconcile-semantic-dispositions.ps1') (Join-Path $fixture 'tools\reconcile-semantic-dispositions.ps1')
    Copy-Item (Join-Path $repo 'tools\config\source-selection-policy.json') (Join-Path $fixture 'tools\config\source-selection-policy.json')
    $source = Join-Path $fixture 'raw\imports\automated-clippings\youtube\c\v.md'
    [IO.File]::WriteAllText($source, 'immutable source', [Text.UTF8Encoding]::new($false))
    $sourceHash = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash
    @([pscustomobject][ordered]@{
        canonical_source = 'raw/imports/automated-clippings/youtube/c/v.md'; sha256 = $sourceHash
        semantic_decision = 'registered-only'; review_status = 'approved'
    }) | Export-Csv (Join-Path $fixture 'wiki\_outputs\semantic-ingest\p99\decisions.csv') -NoTypeInformation -Encoding utf8
    @([pscustomobject][ordered]@{
        canonical_source = 'raw/imports/automated-clippings/youtube/c/v.md'; sha256 = $sourceHash
        source_identity = 'youtube:v'; source_type = 'markdown-clipping'; availability = 'available'
        selection_status = 'approved-for-semantic-review'; processing_status = 'unread'; semantic_disposition = 'pending'
        package = ''; decision_context = ''; decided_by = ''; decided_at = ''; review_after = ''; rationale = ''
        discovered_at = '2026-08-17T00:00:00Z'; updated_at = '2026-08-17T00:00:00Z'
    }) | Export-Csv (Join-Path $fixture 'wiki\_outputs\source-intake\clipping-dispositions.csv') -NoTypeInformation -Encoding utf8

    $script = Join-Path $fixture 'tools\reconcile-semantic-dispositions.ps1'
    $arguments = @('-NoProfile','-ExecutionPolicy','Bypass','-File',$script,'-Package','P99','-DecisionLedger','wiki/_outputs/semantic-ingest/p99/decisions.csv')
    $dry = (& powershell.exe @arguments | Out-String) | ConvertFrom-Json
    if ($dry.changed_count -ne 1 -or -not $dry.dry_run) { throw 'Dry run did not report one exact change.' }
    $applied = (& powershell.exe @arguments -Apply | Out-String) | ConvertFrom-Json
    if ($applied.changed_count -ne 1 -or $applied.dry_run) { throw 'Apply did not reconcile one exact row.' }
    $second = (& powershell.exe @arguments | Out-String) | ConvertFrom-Json
    if ($second.changed_count -ne 0) { throw 'Reconciliation was not idempotent.' }
    $row = Import-Csv (Join-Path $fixture 'wiki\_outputs\source-intake\clipping-dispositions.csv')
    if ($row.processing_status -ne 'reviewed' -or $row.semantic_disposition -ne 'registered-only' -or $row.package -ne 'P99') { throw 'Applied state is incorrect.' }
    if ((Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash -ne $sourceHash) { throw 'Protected source changed.' }

    $standingSourceRelative = 'raw/imports/automated-clippings/youtube/c/standing.md'
    $standingSource = Join-Path $fixture $standingSourceRelative
    [IO.File]::WriteAllText($standingSource, 'standing source', [Text.UTF8Encoding]::new($false))
    $standingHash = (Get-FileHash -LiteralPath $standingSource -Algorithm SHA256).Hash
    $standingDir = Join-Path $fixture 'wiki\_outputs\semantic-ingest\p100'
    New-Item -ItemType Directory -Force $standingDir | Out-Null
    $policyPath = Join-Path $fixture 'tools\config\source-selection-policy.json'
    $policy = Get-Content $policyPath -Raw | ConvertFrom-Json
    $policy.standing_authorities[0].enabled = $true
    $policy | ConvertTo-Json -Depth 8 | Set-Content $policyPath -Encoding UTF8
    $runManifest = [ordered]@{ schema_version = 'youtube-intelligence-run/v1'; run_id = 'standing-run'; captured_sources = @([ordered]@{ canonical_source = $standingSourceRelative; sha256 = $standingHash }) }
    $runManifestPath = Join-Path $fixture 'wiki\_outputs\standing-run.json'
    $runManifest | ConvertTo-Json -Depth 5 | Set-Content $runManifestPath -Encoding UTF8
    $runManifestHash = (Get-FileHash $runManifestPath -Algorithm SHA256).Hash
    @([pscustomobject][ordered]@{
        canonical_source = $standingSourceRelative; sha256 = $standingHash
        semantic_decision = 'registered-only'; review_status = 'reviewed'; decision_authority = 'standing-policy'
        authority_id = 'youtube-p35-l2'; decision_actor = 'codex-semantic-worker'; autonomy_level = 'L2'
        authority_policy_version = 'source-selection/v1'; authority_run_id = 'standing-run'; authority_manifest_sha256 = $runManifestHash
    }) | Export-Csv (Join-Path $standingDir 'decisions.csv') -NoTypeInformation -Encoding utf8
    $packageManifest = [ordered]@{
        package_id = 'P100'
        selection_gate = [ordered]@{ policy = 'tools/config/source-selection-policy.json' }
        standing_authority = [ordered]@{ authority_id = 'youtube-p35-l2'; run_manifest = 'wiki/_outputs/standing-run.json' }
    }
    $packageManifest | ConvertTo-Json -Depth 5 | Set-Content (Join-Path $standingDir 'package.json') -Encoding UTF8
    $registerPath = Join-Path $fixture 'wiki\_outputs\source-intake\clipping-dispositions.csv'
    $rows = @(Import-Csv $registerPath)
    $rows += [pscustomobject][ordered]@{
        canonical_source = $standingSourceRelative; sha256 = $standingHash; source_identity = 'youtube:standing'; source_type = 'markdown-clipping'; availability = 'available'
        selection_status = 'pending'; processing_status = 'unread'; semantic_disposition = 'pending'; package = ''; decision_context = ''; decided_by = ''; decided_at = ''; review_after = ''; rationale = ''
        discovered_at = '2026-08-17T00:00:00Z'; updated_at = '2026-08-17T00:00:00Z'
    }
    $rows | Export-Csv $registerPath -NoTypeInformation -Encoding utf8
    $standingArguments = @('-NoProfile','-ExecutionPolicy','Bypass','-File',$script,'-Package','P100','-DecisionLedger','wiki/_outputs/semantic-ingest/p100/decisions.csv','-PackageManifest','wiki/_outputs/semantic-ingest/p100/package.json')
    $standingApplied = (& powershell.exe @standingArguments -Apply | Out-String) | ConvertFrom-Json
    if ($standingApplied.standing_policy_decision_count -ne 1) { throw 'Standing-policy decision was not counted.' }
    $standingRow = Import-Csv $registerPath | Where-Object canonical_source -eq $standingSourceRelative
    if ($standingRow.processing_status -ne 'reviewed' -or $standingRow.selection_status -ne 'pending' -or $standingRow.decided_by -ne 'codex-semantic-worker') { throw 'Standing-policy reconciliation state is incorrect.' }
    Write-Host 'YouTube reconciliation tests passed (8 assertions).'
} finally {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}
