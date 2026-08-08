[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ManifestPath,

    [Parameter(Mandatory = $true)]
    [string[]]$ExcludePath,

    [Parameter(Mandatory = $true)]
    [string]$OutputPath,

    [ValidateRange(1, 9999)]
    [int]$WaveNumber = 1,

    [ValidateRange(1, 1000)]
    [int]$WaveSize = 100
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

function Get-Priority {
    param([Parameter(Mandatory = $true)][object]$Row)

    if ($Row.proposed_curation_status -eq 'protected') { return 1 }
    if ($Row.proposed_curation_status -eq 'duplicate-candidate') { return 2 }
    if ($Row.proposed_curation_status -eq 'cold-retain' -and $Row.conversion_state -eq 'green') { return 3 }
    if ($Row.proposed_curation_status -eq 'research-secondary') { return 4 }
    return 5
}

function Get-PriorityReason {
    param([Parameter(Mandatory = $true)][object]$Row)

    switch ($Row.proposed_curation_status) {
        'protected' { return 'durable-reference-first' }
        'duplicate-candidate' { return 'exact-duplicate-second' }
        'cold-retain' { return 'uncited-green-third' }
        'research-secondary' { return 'secondary-research-fourth' }
        default { return 'conversion-exception-fifth' }
    }
}

$manifestFile = [System.IO.Path]::GetFullPath($ManifestPath)
if (-not (Test-Path -LiteralPath $manifestFile -PathType Leaf)) {
    throw "Manifest does not exist: $manifestFile"
}
$manifest = @(Import-Csv -LiteralPath $manifestFile)
if ($manifest.Count -lt $WaveSize) {
    throw "Manifest has only $($manifest.Count) rows; wave requires $WaveSize."
}

$excluded = @{}
foreach ($path in $ExcludePath) {
    $resolved = [System.IO.Path]::GetFullPath($path)
    if (-not (Test-Path -LiteralPath $resolved -PathType Leaf)) {
        throw "Exclusion ledger does not exist: $resolved"
    }
    foreach ($row in (Import-Csv -LiteralPath $resolved)) {
        if (-not [string]::IsNullOrWhiteSpace($row.source)) {
            $excluded[$row.source.ToLowerInvariant()] = $true
        }
    }
}

$eligible = @(
    $manifest |
        Where-Object { -not $excluded.ContainsKey($_.source.ToLowerInvariant()) } |
        Sort-Object `
            @{ Expression = { Get-Priority -Row $_ }; Ascending = $true }, `
            @{ Expression = { [int]$_.citation_count }; Ascending = $false }, `
            @{ Expression = 'sha256'; Ascending = $true }, `
            @{ Expression = 'source'; Ascending = $true }
)
if ($eligible.Count -lt $WaveSize) {
    throw "Only $($eligible.Count) sources remain after exclusions; wave requires $WaveSize."
}

$waveId = "starter-pack-2026-08-07-wave-{0:d3}" -f $WaveNumber
$selected = [System.Collections.Generic.List[object]]::new()
$rank = 0
foreach ($row in ($eligible | Select-Object -First $WaveSize)) {
    $rank += 1
    $output = [ordered]@{}
    foreach ($property in $row.PSObject.Properties) {
        $output[$property.Name] = $property.Value
    }
    $output['wave_id'] = $waveId
    $output['wave_rank'] = $rank
    $output['priority_reason'] = Get-PriorityReason -Row $row
    $output['reviewed_curation_status'] = ''
    $output['review_notes'] = ''
    $output['content_review_state'] = 'not-reviewed'
    $output['readiness_status'] = 'not-checked'
    $output['readiness_reason'] = ''
    $output['review_basis'] = ''
    $output['content_signals'] = ''
    $output['requires_user_decision'] = 'false'
    $output['decision_resolution'] = ''
    $output['decision_approved_by'] = ''
    $output['decision_date'] = ''
    $output['physical_action'] = 'none'
    $output['physical_action_status'] = 'not-authorized'
    $selected.Add([pscustomobject]$output)
}

$csv = $selected | ConvertTo-Csv -NoTypeInformation
$outputFile = [System.IO.Path]::GetFullPath($OutputPath)
Write-Utf8Lf -LiteralPath $outputFile -Text ($csv -join "`n")

[pscustomobject]@{
    wave_id = $waveId
    rows = $selected.Count
    excluded = $excluded.Count
    output = $outputFile
    status_counts = @($selected | Group-Object proposed_curation_status | ForEach-Object { [pscustomobject]@{ status = $_.Name; count = $_.Count } })
} | ConvertTo-Json -Depth 4
