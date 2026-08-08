[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceVaultRoot,

    [Parameter(Mandatory = $true)]
    [string]$PilotPath,

    [string]$ReportPath = '',

    [string]$DecisionPath = ''
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

function Get-ContentSignals {
    param([Parameter(Mandatory = $true)][string]$SidecarPath)

    $text = Get-Content -Raw -LiteralPath $SidecarPath
    $headings = @(
        $text -split "`r?`n" |
            Where-Object { $_ -match '^#{1,3}\s+\S' } |
            ForEach-Object { ($_ -replace '^#{1,3}\s+', '').Trim() } |
            Select-Object -First 6
    )
    if ($headings.Count -gt 0) {
        return ($headings -join ' | ')
    }

    $plain = ($text -replace '(?s)^---.*?---\s*', '' -replace '\s+', ' ').Trim()
    if ($plain.Length -gt 240) {
        $plain = $plain.Substring(0, 240) + '...'
    }
    return $plain
}

$vaultRoot = [System.IO.Path]::GetFullPath($SourceVaultRoot)
$pilotFile = [System.IO.Path]::GetFullPath($PilotPath)
$pilot = @(Import-Csv -LiteralPath $pilotFile)
$decisionIndex = @{}
if (-not [string]::IsNullOrWhiteSpace($DecisionPath)) {
    $decisionFile = [System.IO.Path]::GetFullPath($DecisionPath)
    if (-not (Test-Path -LiteralPath $decisionFile -PathType Leaf)) {
        throw "Decision ledger does not exist: $decisionFile"
    }
    foreach ($decision in (Import-Csv -LiteralPath $decisionFile)) {
        if ([string]::IsNullOrWhiteSpace($decision.source) -or [string]::IsNullOrWhiteSpace($decision.decision)) {
            throw 'Decision ledger rows require source and decision.'
        }
        if ($decision.decision -notin @('regenerate-sidecar', 'leave-blocked')) {
            throw "Unsupported curation decision: $($decision.decision)"
        }
        $decisionIndex[$decision.source.ToLowerInvariant()] = $decision
    }
}
$eligible = @(
    $pilot |
        Where-Object { $_.conversion_state -eq 'green' -and $_.pilot_stratum -ne 'exact-duplicate' } |
        Select-Object -ExpandProperty source
)

$readinessIndex = @{}
if ($eligible.Count -gt 0) {
    $manifest = Join-Path ([System.IO.Path]::GetTempPath()) ("source-curation-readiness-$([guid]::NewGuid().ToString('N')).txt")
    try {
        [System.IO.File]::WriteAllText($manifest, (($eligible -join "`r`n") + "`r`n"), [System.Text.UTF8Encoding]::new($true))
        $gate = Join-Path $vaultRoot 'tools\assert-source-ingest-ready.ps1'
        $gateOutput = @(
            & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $gate -Manifest $manifest -Intent ContentLevel -Json 2>&1
        )
        $jsonText = ($gateOutput | ForEach-Object { $_.ToString() }) -join "`n"
        $jsonStart = $jsonText.IndexOf('[')
        if ($jsonStart -lt 0) {
            throw "Pre-ingest gate did not return JSON: $jsonText"
        }
        $gateRows = $jsonText.Substring($jsonStart) | ConvertFrom-Json
        foreach ($row in $gateRows) {
            $key = ([string]$row.source).Trim().ToLowerInvariant()
            $readinessIndex[$key] = $row
        }
        if ($readinessIndex.Count -ne $eligible.Count) {
            throw "Pre-ingest gate returned $($readinessIndex.Count) unique rows for $($eligible.Count) eligible pilot sources."
        }
    }
    finally {
        if (Test-Path -LiteralPath $manifest) {
            Remove-Item -LiteralPath $manifest -Force
        }
    }
}

$reviewed = [System.Collections.Generic.List[object]]::new()
foreach ($row in $pilot) {
    $output = [ordered]@{}
    foreach ($property in $row.PSObject.Properties) {
        $output[$property.Name] = $property.Value
    }

    $output['reviewed_curation_status'] = $row.proposed_curation_status
    $output['review_status'] = 'reviewed'
    $output['requires_user_decision'] = 'false'
    $output['content_signals'] = ''
    $output['decision_resolution'] = ''
    $output['decision_approved_by'] = ''
    $output['decision_date'] = ''

    if ($row.pilot_stratum -eq 'exact-duplicate') {
        $output['readiness_status'] = 'not-required'
        $output['readiness_reason'] = 'exact-byte-duplicate'
        $output['review_basis'] = 'sha256-and-lineage'
        $output['content_review_state'] = 'metadata-reviewed'
        $output['review_notes'] = "Exact duplicate of $($row.canonical_source); retain as a non-destructive candidate only."
    }
    elseif ($readinessIndex.ContainsKey($row.source.ToLowerInvariant())) {
        $readiness = $readinessIndex[$row.source.ToLowerInvariant()]
        $output['readiness_status'] = $readiness.status
        $output['readiness_reason'] = $readiness.reason
        if ($readiness.status -eq 'ready') {
            $absoluteSidecar = Join-Path $vaultRoot $readiness.target
            if (-not (Test-Path -LiteralPath $absoluteSidecar -PathType Leaf)) {
                throw "Ready source has no resolvable sidecar: $($row.source)"
            }
            $output['review_basis'] = 'validated-sidecar-headings'
            $output['content_review_state'] = 'content-reviewed'
            $output['content_signals'] = Get-ContentSignals -SidecarPath $absoluteSidecar
            $trustNote = if ($row.source_class -eq 'research') { ' Treat as secondary or AI-generated evidence.' } else { '' }
            $output['review_notes'] = "Validated sidecar inspected; proposed status remains evidence-bounded.$trustNote"
        }
        else {
            $output['review_basis'] = 'pre-ingest-gate'
            $output['content_review_state'] = 'gate-blocked'
            $output['review_notes'] = "Content not read because the pre-ingest gate returned $($readiness.reason)."
            if ([int]$row.citation_count -gt 0) {
                $output['reviewed_curation_status'] = 'protected'
                $output['requires_user_decision'] = 'true'
            }
            else {
                $output['reviewed_curation_status'] = 'exception-on-demand'
            }
        }
    }
    else {
        $output['readiness_status'] = 'not-eligible'
        $output['readiness_reason'] = $row.conversion_state
        $output['review_basis'] = 'registry-and-file-metadata'
        $output['content_review_state'] = 'metadata-reviewed'
        $output['review_notes'] = 'Content not read; technical or unsupported state remains demand-driven.'
        if ($row.conversion_state -in @('amber', 'red', 'stale-blocked', 'unregistered', 'unsupported') -and [int]$row.citation_count -eq 0 -and $row.source_class -ne 'research') {
            $output['reviewed_curation_status'] = 'exception-on-demand'
        }
    }

    $decisionKey = $row.source.ToLowerInvariant()
    if ($decisionIndex.ContainsKey($decisionKey)) {
        $decision = $decisionIndex[$decisionKey]
        if ($decision.decision -eq 'regenerate-sidecar' -and $output['readiness_status'] -ne 'ready') {
            throw "Approved regeneration has not produced a ready sidecar: $($row.source)"
        }
        if ($decision.decision -eq 'leave-blocked' -and $output['readiness_status'] -ne 'blocked') {
            throw "Approved leave-blocked decision no longer matches readiness: $($row.source)"
        }
        $output['decision_resolution'] = $decision.decision
        $output['decision_approved_by'] = $decision.approved_by
        $output['decision_date'] = $decision.approved_date
        $output['requires_user_decision'] = 'false'
        if ($decision.decision -eq 'leave-blocked') {
            $output['review_notes'] += ' User approved retaining this source in the blocked state; no OCR or regeneration is authorized.'
        }
        else {
            $output['review_notes'] += ' User-approved sidecar regeneration completed and passed the content-level gate.'
        }
    }

    $output['physical_action'] = 'none'
    $output['physical_action_status'] = 'not-authorized'
    $reviewed.Add([pscustomobject]$output)
}

$csv = $reviewed | ConvertTo-Csv -NoTypeInformation
Write-Utf8Lf -LiteralPath $pilotFile -Text ($csv -join "`n")

if ([string]::IsNullOrWhiteSpace($ReportPath)) {
    $ReportPath = Join-Path (Split-Path -Parent $pilotFile) 'starter-pack-2026-08-07-pilot-review.md'
}
$report = [System.Collections.Generic.List[string]]::new()
$report.Add('---')
$report.Add('type: generated-output')
$report.Add('status: human-checkpoint-required')
$report.Add('snapshot_id: starter-pack-2026-08-07')
$report.Add('created: 2026-08-07')
$report.Add('---')
$report.Add('')
$report.Add('# Starter-Pack Pilot Review')
$report.Add('')
$report.Add("- Pilot sources: $($reviewed.Count)")
$report.Add("- Content-reviewed through validated sidecars: $((@($reviewed | Where-Object { $_.content_review_state -eq 'content-reviewed' })).Count)")
$report.Add("- Metadata-reviewed: $((@($reviewed | Where-Object { $_.content_review_state -eq 'metadata-reviewed' })).Count)")
$report.Add("- Blocked by pre-ingest gate: $((@($reviewed | Where-Object { $_.content_review_state -eq 'gate-blocked' })).Count)")
$report.Add("- Sources requiring a user decision: $((@($reviewed | Where-Object { $_.requires_user_decision -eq 'true' })).Count)")
$report.Add("- User decisions applied: $((@($reviewed | Where-Object { -not [string]::IsNullOrWhiteSpace($_.decision_resolution) })).Count)")
$report.Add("- Physical actions authorized: $((@($reviewed | Where-Object { $_.physical_action -ne 'none' })).Count)")
$report.Add('')
$report.Add('## Reviewed Status')
$report.Add('')
foreach ($group in ($reviewed | Group-Object reviewed_curation_status | Sort-Object Name)) {
    $report.Add("- $($group.Name): $($group.Count)")
}
$report.Add('')
$report.Add('## Required Decisions')
$report.Add('')
foreach ($item in ($reviewed | Where-Object { $_.requires_user_decision -eq 'true' } | Sort-Object source)) {
    $report.Add("- ``$($item.source)``: $($item.readiness_reason); proposed status remains ``$($item.reviewed_curation_status)``.")
}
$report.Add('')
$report.Add('## Applied Decisions')
$report.Add('')
foreach ($item in ($reviewed | Where-Object { -not [string]::IsNullOrWhiteSpace($_.decision_resolution) } | Sort-Object source)) {
    $report.Add("- ``$($item.source)``: ``$($item.decision_resolution)`` ($($item.decision_approved_by), $($item.decision_date)).")
}
$report.Add('')
$report.Add('No original was modified, moved, or deleted. The pilot does not authorize semantic promotion.')
Write-Utf8Lf -LiteralPath ([System.IO.Path]::GetFullPath($ReportPath)) -Text ($report -join "`n")

[pscustomobject]@{
    pilot_rows = $reviewed.Count
    content_reviewed = @($reviewed | Where-Object { $_.content_review_state -eq 'content-reviewed' }).Count
    metadata_reviewed = @($reviewed | Where-Object { $_.content_review_state -eq 'metadata-reviewed' }).Count
    gate_blocked = @($reviewed | Where-Object { $_.content_review_state -eq 'gate-blocked' }).Count
    user_decisions = @($reviewed | Where-Object { $_.requires_user_decision -eq 'true' }).Count
    report = [System.IO.Path]::GetFullPath($ReportPath)
} | ConvertTo-Json -Depth 3
