[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceVaultRoot,

    [Parameter(Mandatory = $true)]
    [string]$ManifestPath,

    [Parameter(Mandatory = $true)]
    [string]$PilotPath,

    [string[]]$PreviousWavePath = @(),

    [Parameter(Mandatory = $true)]
    [string]$WavePath,

    [Parameter(Mandatory = $true)]
    [string]$ReportPath,

    [Parameter(Mandatory = $true)]
    [string]$JsonPath,

    [Parameter(Mandatory = $true)]
    [string]$ExpectedWaveId,

    [ValidateRange(1, 1000)]
    [int]$ExpectedSize = 100
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Utf8Lf {
    param(
        [Parameter(Mandatory = $true)][string]$LiteralPath,
        [Parameter(Mandatory = $true)][string]$Text
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

$vaultRoot = [System.IO.Path]::GetFullPath($SourceVaultRoot)
$manifest = @(Import-Csv -LiteralPath ([System.IO.Path]::GetFullPath($ManifestPath)))
$pilot = @(Import-Csv -LiteralPath ([System.IO.Path]::GetFullPath($PilotPath)))
$wave = @(Import-Csv -LiteralPath ([System.IO.Path]::GetFullPath($WavePath)))
$checks = [System.Collections.Generic.List[object]]::new()

function Add-Check {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][bool]$Pass,
        [Parameter(Mandatory = $true)][string]$Details
    )
    $checks.Add([pscustomobject][ordered]@{ name = $Name; pass = $Pass; details = $Details })
}

$waveSources = @($wave | Select-Object -ExpandProperty source)
$uniqueSources = @($waveSources | Sort-Object -Unique)
$waveIds = @($wave | Select-Object -ExpandProperty wave_id -Unique)
$ranks = @($wave | ForEach-Object { [int]$_.wave_rank } | Sort-Object)
Add-Check -Name 'wave-size' -Pass ($wave.Count -eq $ExpectedSize) -Details "rows=$($wave.Count); expected=$ExpectedSize"
Add-Check -Name 'unique-sources' -Pass ($uniqueSources.Count -eq $ExpectedSize) -Details "unique=$($uniqueSources.Count); expected=$ExpectedSize"
Add-Check -Name 'single-wave-id' -Pass ($waveIds.Count -eq 1 -and $waveIds[0] -eq $ExpectedWaveId) -Details "wave_ids=$($waveIds -join '|'); expected=$ExpectedWaveId"
Add-Check -Name 'contiguous-ranks' -Pass (($ranks -join ',') -eq ((1..$ExpectedSize) -join ',')) -Details "rank_count=$($ranks.Count)"

$priorIndex = @{}
foreach ($row in $pilot) { $priorIndex[$row.source.ToLowerInvariant()] = $true }
foreach ($previousPath in $PreviousWavePath) {
    $previousFile = [System.IO.Path]::GetFullPath($previousPath)
    if (-not (Test-Path -LiteralPath $previousFile -PathType Leaf)) {
        throw "Previous wave does not exist: $previousFile"
    }
    foreach ($row in (Import-Csv -LiteralPath $previousFile)) {
        $priorIndex[$row.source.ToLowerInvariant()] = $true
    }
}
$overlap = @($wave | Where-Object { $priorIndex.ContainsKey($_.source.ToLowerInvariant()) })
Add-Check -Name 'prior-ledger-exclusion' -Pass ($overlap.Count -eq 0) -Details "overlap=$($overlap.Count); prior_unique=$($priorIndex.Count)"

$manifestIndex = @{}
foreach ($row in $manifest) { $manifestIndex[$row.source.ToLowerInvariant()] = $row }
$missing = @($wave | Where-Object { -not $manifestIndex.ContainsKey($_.source.ToLowerInvariant()) })
$ledgerHashMismatch = @($wave | Where-Object {
    $key = $_.source.ToLowerInvariant()
    $manifestIndex.ContainsKey($key) -and $_.sha256 -ne $manifestIndex[$key].sha256
})
Add-Check -Name 'manifest-membership' -Pass ($missing.Count -eq 0) -Details "missing=$($missing.Count)"
Add-Check -Name 'manifest-hash-consistency' -Pass ($ledgerHashMismatch.Count -eq 0) -Details "mismatches=$($ledgerHashMismatch.Count)"

$reviewPending = @($wave | Where-Object { $_.review_status -ne 'reviewed' })
$statusMismatch = @($wave | Where-Object {
    $_.reviewed_curation_status -ne $_.proposed_curation_status -or
    ([int]$_.citation_count -gt 0 -and $_.reviewed_curation_status -ne 'protected')
})
$invalidDuplicates = @($wave | Where-Object {
    $_.reviewed_curation_status -eq 'duplicate-candidate' -and
    ([string]::IsNullOrWhiteSpace($_.duplicate_group) -or $_.is_canonical -ne 'false' -or
        [string]::IsNullOrWhiteSpace($_.canonical_source) -or $_.readiness_status -ne 'not-required' -or
        $_.review_basis -ne 'sha256-and-lineage')
})
$contentMismatch = @($wave | Where-Object {
    ($_.content_review_state -eq 'content-reviewed' -and ($_.readiness_status -ne 'ready' -or [string]::IsNullOrWhiteSpace($_.content_signals))) -or
    ($_.content_review_state -eq 'gate-blocked' -and ($_.readiness_status -ne 'blocked' -or $_.requires_user_decision -ne 'true')) -or
    ($_.content_review_state -eq 'metadata-reviewed' -and $_.readiness_status -notin @('not-eligible', 'not-required')) -or
    ($_.content_review_state -notin @('content-reviewed', 'gate-blocked', 'metadata-reviewed'))
})
Add-Check -Name 'review-complete' -Pass ($reviewPending.Count -eq 0) -Details "pending=$($reviewPending.Count)"
Add-Check -Name 'status-preservation' -Pass ($statusMismatch.Count -eq 0) -Details "status_mismatches=$($statusMismatch.Count)"
Add-Check -Name 'duplicate-lineage' -Pass ($invalidDuplicates.Count -eq 0) -Details "invalid_duplicates=$($invalidDuplicates.Count)"
Add-Check -Name 'review-state-coherence' -Pass ($contentMismatch.Count -eq 0) -Details "mismatches=$($contentMismatch.Count)"

$unsafe = @($wave | Where-Object { $_.physical_action -ne 'none' -or $_.physical_action_status -ne 'not-authorized' })
Add-Check -Name 'no-physical-actions' -Pass ($unsafe.Count -eq 0) -Details "unsafe_rows=$($unsafe.Count)"

$actualHashMismatch = [System.Collections.Generic.List[object]]::new()
foreach ($row in $wave) {
    $absoluteSource = Join-Path $vaultRoot $row.source
    if (-not (Test-Path -LiteralPath $absoluteSource -PathType Leaf)) {
        $actualHashMismatch.Add([pscustomobject]@{ source = $row.source; reason = 'missing' })
        continue
    }
    $actual = (Get-FileHash -LiteralPath $absoluteSource -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $row.sha256.ToLowerInvariant()) {
        $actualHashMismatch.Add([pscustomobject]@{ source = $row.source; reason = 'hash-mismatch'; actual = $actual; expected = $row.sha256 })
    }
}
Add-Check -Name 'selected-original-hashes' -Pass ($actualHashMismatch.Count -eq 0) -Details "mismatches=$($actualHashMismatch.Count); checked=$($wave.Count)"

$passed = @($checks | Where-Object pass).Count
$failed = @($checks | Where-Object { -not $_.pass }).Count
$result = [pscustomobject][ordered]@{
    validation = 'source-curation-wave'
    wave_id = if ($waveIds.Count -eq 1) { $waveIds[0] } else { '' }
    checked_at = (Get-Date).ToUniversalTime().ToString('o')
    source_count = $wave.Count
    content_reviewed = @($wave | Where-Object { $_.content_review_state -eq 'content-reviewed' }).Count
    metadata_reviewed = @($wave | Where-Object { $_.content_review_state -eq 'metadata-reviewed' }).Count
    gate_blocked = @($wave | Where-Object { $_.content_review_state -eq 'gate-blocked' }).Count
    user_decisions = @($wave | Where-Object { $_.requires_user_decision -eq 'true' }).Count
    checks_passed = $passed
    checks_failed = $failed
    checks = @($checks)
}

$json = $result | ConvertTo-Json -Depth 6
Write-Utf8Lf -LiteralPath ([System.IO.Path]::GetFullPath($JsonPath)) -Text $json

$report = [System.Collections.Generic.List[string]]::new()
$report.Add('---')
$report.Add('type: generated-output')
$report.Add("status: $(if ($failed -eq 0) { 'passed' } else { 'failed' })")
$report.Add('created: 2026-08-07')
$report.Add('---')
$report.Add('')
$waveNumber = [regex]::Match($ExpectedWaveId, 'wave-(\d+)$').Groups[1].Value
$report.Add("# Starter-Pack Wave $waveNumber Verification")
$report.Add('')
$report.Add("- Checks passed: $passed")
$report.Add("- Checks failed: $failed")
$report.Add("- Original hashes checked: $($wave.Count)")
$report.Add("- Content-reviewed: $($result.content_reviewed)")
$report.Add("- Metadata-reviewed: $($result.metadata_reviewed)")
$report.Add("- Gate-blocked: $($result.gate_blocked)")
$report.Add("- Open source-specific decisions: $($result.user_decisions)")
$report.Add('')
$report.Add('## Checks')
$report.Add('')
foreach ($check in $checks) {
    $mark = if ($check.pass) { 'PASS' } else { 'FAIL' }
    $report.Add("- **$mark** ``$($check.name)``: $($check.details)")
}
$report.Add('')
$report.Add('The validator rehashed all 100 selected originals. No source mutation, move, deletion, sidecar regeneration, or semantic promotion was authorized by this wave.')
Write-Utf8Lf -LiteralPath ([System.IO.Path]::GetFullPath($ReportPath)) -Text ($report -join "`n")

$json
if ($failed -gt 0) { exit 1 }
