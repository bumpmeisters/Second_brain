[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceVaultRoot,

    [Parameter(Mandatory = $true)]
    [string[]]$WavePath,

    [string[]]$PriorDecisionPath = @(),

    [ValidateRange(1, 100)]
    [int]$BatchSize = 10,

    [Parameter(Mandatory = $true)]
    [string]$BatchId,

    [Parameter(Mandatory = $true)]
    [string]$LedgerPath,

    [Parameter(Mandatory = $true)]
    [string]$ManifestPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Utf8Lf {
    param(
        [Parameter(Mandatory = $true)][string]$LiteralPath,
        [Parameter(Mandatory = $true)][string]$Text,
        [switch]$Bom
    )

    $parent = Split-Path -Parent $LiteralPath
    if (-not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    $normalized = $Text.Replace("`r`n", "`n").Replace("`r", "`n")
    if (-not $normalized.EndsWith("`n", [System.StringComparison]::Ordinal)) {
        $normalized += "`n"
    }
    [System.IO.File]::WriteAllText($LiteralPath, $normalized, [System.Text.UTF8Encoding]::new($Bom.IsPresent))
}

$vaultRoot = [System.IO.Path]::GetFullPath($SourceVaultRoot)
$backlog = [System.Collections.Generic.List[object]]::new()
foreach ($path in $WavePath) {
    $waveFile = [System.IO.Path]::GetFullPath($path)
    if (-not (Test-Path -LiteralPath $waveFile -PathType Leaf)) {
        throw "Wave ledger does not exist: $waveFile"
    }
    foreach ($row in (Import-Csv -LiteralPath $waveFile)) {
        if ($row.requires_user_decision -eq 'true' -and $row.readiness_reason -eq 'stale-blocked') {
            $backlog.Add($row)
        }
    }
}

$decided = @{}
foreach ($path in $PriorDecisionPath) {
    $decisionFile = [System.IO.Path]::GetFullPath($path)
    if (-not (Test-Path -LiteralPath $decisionFile -PathType Leaf)) {
        throw "Prior decision ledger does not exist: $decisionFile"
    }
    foreach ($row in (Import-Csv -LiteralPath $decisionFile)) {
        if (-not [string]::IsNullOrWhiteSpace($row.source)) {
            $decided[$row.source.ToLowerInvariant()] = $true
        }
    }
}

$eligible = @(
    $backlog |
        Where-Object { -not $decided.ContainsKey($_.source.ToLowerInvariant()) } |
        Sort-Object `
            @{ Expression = { [int]$_.citation_count }; Descending = $true }, `
            @{ Expression = { if ($_.source_class -eq 'raw') { 0 } else { 1 } }; Ascending = $true }, `
            @{ Expression = 'sha256'; Ascending = $true }, `
            @{ Expression = 'source'; Ascending = $true }
)
if ($eligible.Count -lt $BatchSize) {
    throw "Only $($eligible.Count) eligible stale-blocked sources remain; batch requires $BatchSize."
}

$rows = [System.Collections.Generic.List[object]]::new()
$rank = 0
foreach ($sourceRow in ($eligible | Select-Object -First $BatchSize)) {
    $rank += 1
    $absoluteSource = Join-Path $vaultRoot $sourceRow.source
    if (-not (Test-Path -LiteralPath $absoluteSource -PathType Leaf)) {
        throw "Selected original does not exist: $($sourceRow.source)"
    }
    $actualSourceHash = (Get-FileHash -LiteralPath $absoluteSource -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actualSourceHash -ne $sourceRow.sha256.ToLowerInvariant()) {
        throw "Selected original hash diverges from the curation ledger: $($sourceRow.source)"
    }
    if ([string]::IsNullOrWhiteSpace($sourceRow.sidecar)) {
        throw "Selected source has no sidecar path: $($sourceRow.source)"
    }
    $absoluteSidecar = Join-Path $vaultRoot $sourceRow.sidecar
    if (-not (Test-Path -LiteralPath $absoluteSidecar -PathType Leaf)) {
        throw "Selected stale sidecar does not exist: $($sourceRow.sidecar)"
    }
    $sidecarBefore = (Get-FileHash -LiteralPath $absoluteSidecar -Algorithm SHA256).Hash.ToLowerInvariant()

    $rows.Add([pscustomobject][ordered]@{
        batch_id = $BatchId
        selected_rank = $rank
        source = $sourceRow.source
        wave_id = $sourceRow.wave_id
        citation_count = $sourceRow.citation_count
        source_class = $sourceRow.source_class
        extension = $sourceRow.extension
        size_bytes = $sourceRow.size_bytes
        original_sha256_before = $actualSourceHash
        original_sha256_after = ''
        original_unchanged = 'not-checked'
        sidecar = $sourceRow.sidecar
        sidecar_sha256_before = $sidecarBefore
        sidecar_sha256_after = ''
        sidecar_sha256_repository = ''
        decision = 'regenerate-sidecar'
        approved_by = 'user'
        approved_date = '2026-08-07'
        selection_rule = 'citation-count-desc|raw-first|sha256|source'
        regeneration_status = 'pending'
        gate_status = 'not-checked'
        gate_reason = ''
        physical_action = 'none'
        physical_action_status = 'not-authorized'
    })
}

$ledgerFile = [System.IO.Path]::GetFullPath($LedgerPath)
Write-Utf8Lf -LiteralPath $ledgerFile -Text (($rows | ConvertTo-Csv -NoTypeInformation) -join "`n")
$manifestFile = [System.IO.Path]::GetFullPath($ManifestPath)
Write-Utf8Lf -LiteralPath $manifestFile -Text (($rows.source) -join "`n") -Bom

[pscustomobject]@{
    batch_id = $BatchId
    selected = $rows.Count
    backlog_before_selection = $backlog.Count
    prior_decisions_excluded = $decided.Count
    ledger = $ledgerFile
    manifest = $manifestFile
} | ConvertTo-Json -Depth 4
