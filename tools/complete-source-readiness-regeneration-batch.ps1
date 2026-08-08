[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceVaultRoot,

    [Parameter(Mandatory = $true)]
    [string]$LedgerPath,

    [Parameter(Mandatory = $true)]
    [string]$ManifestPath,

    [Parameter(Mandatory = $true)]
    [string]$ReportPath,

    [string]$RepositoryRoot = ''
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

function Get-NormalizedSourceKey {
    param([Parameter(Mandatory = $true)][string]$Source)

    return $Source.Trim().TrimStart([char]0xFEFF).Replace('\', '/').Normalize([Text.NormalizationForm]::FormC).ToLowerInvariant()
}

$vaultRoot = [System.IO.Path]::GetFullPath($SourceVaultRoot)
$ledgerFile = [System.IO.Path]::GetFullPath($LedgerPath)
$manifestFile = [System.IO.Path]::GetFullPath($ManifestPath)
$rows = @(Import-Csv -LiteralPath $ledgerFile)
if ($rows.Count -eq 0) {
    throw 'Regeneration batch ledger is empty.'
}

$gate = Join-Path $vaultRoot 'tools\assert-source-ingest-ready.ps1'
$gateOutput = @(& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $gate -Manifest $manifestFile -Intent ContentLevel -Json 2>&1)
$gateExit = $LASTEXITCODE
$jsonText = ($gateOutput | ForEach-Object { $_.ToString() }) -join "`n"
$jsonStart = $jsonText.IndexOf('[')
if ($jsonStart -lt 0) {
    throw "Pre-ingest gate did not return JSON: $jsonText"
}
$parsedGateRows = $jsonText.Substring($jsonStart) | ConvertFrom-Json
$gateRows = @($parsedGateRows | ForEach-Object { $_ })
$gateIndex = @{}
foreach ($row in $gateRows) {
    $gateIndex[(Get-NormalizedSourceKey -Source $row.source)] = $row
}

$completed = [System.Collections.Generic.List[object]]::new()
foreach ($row in $rows) {
    $key = Get-NormalizedSourceKey -Source $row.source
    if (-not $gateIndex.ContainsKey($key)) {
        throw "Gate result missing selected source: $($row.source); gate_rows=$($gateRows.Count); gate_keys=$($gateIndex.Count)"
    }
    $absoluteSource = Join-Path $vaultRoot $row.source
    $absoluteSidecar = Join-Path $vaultRoot $row.sidecar
    if (-not (Test-Path -LiteralPath $absoluteSource -PathType Leaf)) {
        throw "Selected original disappeared: $($row.source)"
    }
    if (-not (Test-Path -LiteralPath $absoluteSidecar -PathType Leaf)) {
        throw "Regenerated sidecar is missing: $($row.sidecar)"
    }
    $sourceAfter = (Get-FileHash -LiteralPath $absoluteSource -Algorithm SHA256).Hash.ToLowerInvariant()
    $sidecarAfter = (Get-FileHash -LiteralPath $absoluteSidecar -Algorithm SHA256).Hash.ToLowerInvariant()
    $repositoryHash = ''
    if (-not [string]::IsNullOrWhiteSpace($RepositoryRoot)) {
        $repositorySidecar = Join-Path ([System.IO.Path]::GetFullPath($RepositoryRoot)) $row.sidecar
        if (-not (Test-Path -LiteralPath $repositorySidecar -PathType Leaf)) {
            throw "Repository sidecar is missing: $($row.sidecar)"
        }
        $repositoryHash = (Get-FileHash -LiteralPath $repositorySidecar -Algorithm SHA256).Hash.ToLowerInvariant()
    }
    $gateRow = $gateIndex[$key]

    $output = [ordered]@{}
    foreach ($property in $row.PSObject.Properties) {
        $output[$property.Name] = $property.Value
    }
    $output['original_sha256_after'] = $sourceAfter
    $output['original_unchanged'] = ($sourceAfter -eq $row.original_sha256_before).ToString().ToLowerInvariant()
    $output['sidecar_sha256_after'] = $sidecarAfter
    $output['sidecar_sha256_repository'] = $repositoryHash
    $output['regeneration_status'] = if ($gateRow.status -eq 'ready') { 'completed' } else { 'failed-gate' }
    $output['gate_status'] = $gateRow.status
    $output['gate_reason'] = $gateRow.reason
    $completed.Add([pscustomobject]$output)
}

Write-Utf8Lf -LiteralPath $ledgerFile -Text (($completed | ConvertTo-Csv -NoTypeInformation) -join "`n")

$unchanged = @($completed | Where-Object original_unchanged -eq 'true').Count
$ready = @($completed | Where-Object { $_.gate_status -eq 'ready' -and $_.gate_reason -eq 'validated-sidecar' }).Count
$changedSidecars = @($completed | Where-Object { $_.sidecar_sha256_before -ne $_.sidecar_sha256_after }).Count
$repositoryHashes = @($completed | Where-Object { -not [string]::IsNullOrWhiteSpace($_.sidecar_sha256_repository) }).Count
$unsafe = @($completed | Where-Object { $_.physical_action -ne 'none' -or $_.physical_action_status -ne 'not-authorized' }).Count
$passed = $gateExit -eq 0 -and $gateRows.Count -eq $completed.Count -and $unchanged -eq $completed.Count -and $ready -eq $completed.Count -and $unsafe -eq 0

$report = [System.Collections.Generic.List[string]]::new()
$report.Add('---')
$report.Add('type: generated-output')
$report.Add("status: $(if ($passed) { 'passed' } else { 'failed' })")
$report.Add('created: 2026-08-07')
$report.Add('---')
$report.Add('')
$report.Add('# Readiness Regeneration Batch 001 Verification')
$report.Add('')
$report.Add("- Selected sidecars: $($completed.Count)")
$report.Add("- Original hashes unchanged: $unchanged")
$report.Add("- Sidecar hashes changed: $changedSidecars")
$report.Add("- Repository-normalized sidecar hashes recorded: $repositoryHashes")
$report.Add("- Content gates ready / validated-sidecar: $ready")
$report.Add("- Physical actions authorized: $unsafe")
$report.Add('')
$report.Add('## Verification Result')
$report.Add('')
$report.Add('| Criterion | Result | Evidence |')
$report.Add('| --- | --- | --- |')
$report.Add("| Goal fit | $(if ($ready -eq $completed.Count) { 'Pass' } else { 'Issue' }) | Every selected derivative must become content-readable. |")
$report.Add("| Evidence | $(if ($unchanged -eq $completed.Count) { 'Pass' } else { 'Issue' }) | Before/after SHA-256 values are recorded per original and sidecar. |")
$report.Add("| Accuracy | $(if ($gateExit -eq 0) { 'Pass' } else { 'Issue' }) | The authoritative content-level gate returned exit code $gateExit. |")
$report.Add("| Completeness | $(if ($gateRows.Count -eq $completed.Count) { 'Pass' } else { 'Issue' }) | Gate rows: $($gateRows.Count); selected rows: $($completed.Count). |")
$report.Add("| Risk / uncertainty | $(if ($unsafe -eq 0) { 'Pass' } else { 'Issue' }) | No source move, mutation, deletion, OCR, or semantic promotion was authorized. |")
$report.Add('')
$report.Add("Approval state: **$(if ($passed) { 'approved durable knowledge' } else { 'rejected' })** for technical readiness and curation-ledger use only. This does not validate every factual claim inside the sources.")
Write-Utf8Lf -LiteralPath ([System.IO.Path]::GetFullPath($ReportPath)) -Text ($report -join "`n")

[pscustomobject]@{
    batch_id = $completed[0].batch_id
    selected = $completed.Count
    originals_unchanged = $unchanged
    sidecars_changed = $changedSidecars
    repository_hashes = $repositoryHashes
    gates_ready = $ready
    physical_actions = $unsafe
    passed = $passed
    report = [System.IO.Path]::GetFullPath($ReportPath)
} | ConvertTo-Json -Depth 4

if (-not $passed) { exit 1 }
