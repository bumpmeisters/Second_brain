[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceVaultRoot,

    [Parameter(Mandatory = $true)]
    [string]$ManifestPath,

    [Parameter(Mandatory = $true)]
    [string]$PilotPath,

    [string]$PolicyPath = '',

    [string]$SchemaPath = '',

    [string]$ReportPath = '',

    [switch]$CheckGitSafety,

    [switch]$VerifyAllHashes
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($PolicyPath)) {
    $PolicyPath = Join-Path $PSScriptRoot 'config\source-curation-policy.json'
}
if ([string]::IsNullOrWhiteSpace($SchemaPath)) {
    $SchemaPath = Join-Path $PSScriptRoot 'config\source-curation-schema.json'
}

function Add-Check {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][bool]$Passed,
        [Parameter(Mandatory = $true)][string]$Evidence
    )

    $script:checks.Add([pscustomobject]@{
        check = $Name
        passed = $Passed
        evidence = $Evidence
    })
}

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
$manifestFile = [System.IO.Path]::GetFullPath($ManifestPath)
$pilotFile = [System.IO.Path]::GetFullPath($PilotPath)
$policy = Get-Content -Raw -LiteralPath $PolicyPath | ConvertFrom-Json
$schema = Get-Content -Raw -LiteralPath $SchemaPath | ConvertFrom-Json
$manifest = @(Import-Csv -LiteralPath $manifestFile)
$pilot = @(Import-Csv -LiteralPath $pilotFile)
$checks = [System.Collections.Generic.List[object]]::new()

$actualFiles = @()
foreach ($root in $policy.approved_roots) {
    $absoluteRoot = Join-Path $vaultRoot $root
    $actualFiles += Get-ChildItem -LiteralPath $absoluteRoot -Recurse -File
}
Add-Check -Name 'filesystem-coverage' -Passed ($manifest.Count -eq $actualFiles.Count) -Evidence "manifest=$($manifest.Count); filesystem=$($actualFiles.Count)"

$uniqueSources = @($manifest | Select-Object -ExpandProperty source -Unique)
Add-Check -Name 'unique-source-rows' -Passed ($uniqueSources.Count -eq $manifest.Count) -Evidence "unique=$($uniqueSources.Count); rows=$($manifest.Count)"

$manifestColumns = @($manifest[0].PSObject.Properties.Name)
$missingColumns = @($schema.manifest_required_columns | Where-Object { $_ -notin $manifestColumns })
Add-Check -Name 'manifest-schema' -Passed ($missingColumns.Count -eq 0) -Evidence $(if ($missingColumns.Count -eq 0) { 'all required columns present' } else { "missing=$($missingColumns -join ',')" })

$missingFiles = [System.Collections.Generic.List[string]]::new()
$sizeMismatches = [System.Collections.Generic.List[string]]::new()
$invalidHashes = [System.Collections.Generic.List[string]]::new()
$hashMismatches = [System.Collections.Generic.List[string]]::new()
foreach ($row in $manifest) {
    $absoluteSource = Join-Path $vaultRoot $row.source
    if (-not (Test-Path -LiteralPath $absoluteSource -PathType Leaf)) {
        $missingFiles.Add($row.source)
        continue
    }
    if ((Get-Item -LiteralPath $absoluteSource).Length -ne [long]$row.size_bytes) {
        $sizeMismatches.Add($row.source)
    }
    if ($row.sha256 -notmatch '^[0-9a-f]{64}$') {
        $invalidHashes.Add($row.source)
    }
    elseif ($VerifyAllHashes) {
        $actualHash = (Get-FileHash -LiteralPath $absoluteSource -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($actualHash -ne $row.sha256) {
            $hashMismatches.Add($row.source)
        }
    }
}
Add-Check -Name 'source-files-resolve' -Passed ($missingFiles.Count -eq 0) -Evidence "missing=$($missingFiles.Count)"
Add-Check -Name 'source-sizes-match' -Passed ($sizeMismatches.Count -eq 0) -Evidence "mismatches=$($sizeMismatches.Count)"
Add-Check -Name 'source-hashes-valid' -Passed ($invalidHashes.Count -eq 0) -Evidence "invalid=$($invalidHashes.Count)"
if ($VerifyAllHashes) {
    Add-Check -Name 'source-hashes-match-bytes' -Passed ($hashMismatches.Count -eq 0) -Evidence "mismatches=$($hashMismatches.Count); rehashed=$($manifest.Count)"
}

$unsafePhysical = @($manifest | Where-Object { $_.physical_action -ne 'none' -or $_.physical_action_status -ne 'not-authorized' })
Add-Check -Name 'no-physical-actions' -Passed ($unsafePhysical.Count -eq 0) -Evidence "unsafe_rows=$($unsafePhysical.Count)"

$unprotectedCitations = @($manifest | Where-Object { [int]$_.citation_count -gt 0 -and $_.proposed_curation_status -ne 'protected' })
Add-Check -Name 'cited-sources-protected' -Passed ($unprotectedCitations.Count -eq 0) -Evidence "unprotected=$($unprotectedCitations.Count)"

$duplicateIssues = [System.Collections.Generic.List[string]]::new()
foreach ($group in ($manifest | Where-Object { -not [string]::IsNullOrWhiteSpace($_.duplicate_group) } | Group-Object duplicate_group)) {
    $canonical = @($group.Group | Where-Object { $_.is_canonical -eq 'true' })
    $hashes = @($group.Group | Select-Object -ExpandProperty sha256 -Unique)
    $canonicalPaths = @($group.Group | Select-Object -ExpandProperty canonical_source -Unique)
    if ($canonical.Count -ne 1 -or $hashes.Count -ne 1 -or $canonicalPaths.Count -ne 1 -or $canonical[0].source -ne $canonicalPaths[0]) {
        $duplicateIssues.Add($group.Name)
    }
}
Add-Check -Name 'duplicate-canonical-integrity' -Passed ($duplicateIssues.Count -eq 0) -Evidence "invalid_groups=$($duplicateIssues.Count)"

$pilotColumns = @($pilot[0].PSObject.Properties.Name)
$missingPilotColumns = @($schema.pilot_required_columns | Where-Object { $_ -notin $pilotColumns })
Add-Check -Name 'pilot-schema' -Passed ($missingPilotColumns.Count -eq 0) -Evidence $(if ($missingPilotColumns.Count -eq 0) { 'all required columns present' } else { "missing=$($missingPilotColumns -join ',')" })
Add-Check -Name 'pilot-size' -Passed ($pilot.Count -eq [int]$policy.pilot.total) -Evidence "rows=$($pilot.Count); required=$($policy.pilot.total)"
$uniquePilotSources = @($pilot | Select-Object -ExpandProperty source -Unique)
Add-Check -Name 'pilot-unique-sources' -Passed ($uniquePilotSources.Count -eq $pilot.Count) -Evidence "unique=$($uniquePilotSources.Count); rows=$($pilot.Count)"

$stratumIssues = [System.Collections.Generic.List[string]]::new()
foreach ($stratum in $policy.pilot.strata) {
    $count = @($pilot | Where-Object { $_.pilot_stratum -eq $stratum }).Count
    if ($count -ne [int]$policy.pilot.per_stratum) {
        $stratumIssues.Add("$stratum=$count")
    }
}
Add-Check -Name 'pilot-strata' -Passed ($stratumIssues.Count -eq 0) -Evidence $(if ($stratumIssues.Count -eq 0) { 'all strata satisfy configured count' } else { $stratumIssues -join ';' })

$manifestSourceIndex = @{}
foreach ($row in $manifest) {
    $manifestSourceIndex[$row.source] = $true
}
$pilotOrphans = @($pilot | Where-Object { -not $manifestSourceIndex.ContainsKey($_.source) })
Add-Check -Name 'pilot-manifest-membership' -Passed ($pilotOrphans.Count -eq 0) -Evidence "orphans=$($pilotOrphans.Count)"

$unsafePilotPhysical = @($pilot | Where-Object { $_.physical_action -ne 'none' -or $_.physical_action_status -ne 'not-authorized' })
Add-Check -Name 'pilot-no-physical-actions' -Passed ($unsafePilotPhysical.Count -eq 0) -Evidence "unsafe_rows=$($unsafePilotPhysical.Count)"

$invalidContentReadiness = @($pilot | Where-Object { $_.content_review_state -eq 'content-reviewed' -and $_.readiness_status -ne 'ready' })
Add-Check -Name 'pilot-content-readiness' -Passed ($invalidContentReadiness.Count -eq 0) -Evidence "invalid_rows=$($invalidContentReadiness.Count)"

$blockedCitedWithoutDecision = @(
    $pilot | Where-Object {
        $_.content_review_state -eq 'gate-blocked' -and
        [int]$_.citation_count -gt 0 -and
        ($_.reviewed_curation_status -ne 'protected' -or
            ($_.requires_user_decision -ne 'true' -and $_.decision_resolution -ne 'leave-blocked'))
    }
)
Add-Check -Name 'pilot-blocked-cited-sources' -Passed ($blockedCitedWithoutDecision.Count -eq 0) -Evidence "invalid_rows=$($blockedCitedWithoutDecision.Count)"

$invalidDuplicateReviews = @(
    $pilot | Where-Object {
        $_.pilot_stratum -eq 'exact-duplicate' -and
        ($_.reviewed_curation_status -notin @('', 'duplicate-candidate') -or $_.physical_action -ne 'none')
    }
)
Add-Check -Name 'pilot-duplicate-boundary' -Passed ($invalidDuplicateReviews.Count -eq 0) -Evidence "invalid_rows=$($invalidDuplicateReviews.Count)"

if ($CheckGitSafety) {
    $repoRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    Push-Location $repoRoot
    try {
        $trackedProtected = @(& git ls-files -- 'raw/assets/**' 'research/assets/**')
        $unexpectedTracked = @($trackedProtected | Where-Object { $_ -notin @('raw/assets/README.md', 'research/assets/README.md') })
        Add-Check -Name 'git-protected-source-boundary' -Passed ($unexpectedTracked.Count -eq 0) -Evidence "unexpected_tracked=$($unexpectedTracked.Count)"

        $changedProtected = @(& git status --porcelain=v1 -- 'raw/assets' 'research/assets')
        Add-Check -Name 'git-protected-source-clean' -Passed ($changedProtected.Count -eq 0) -Evidence "changed_entries=$($changedProtected.Count)"
    }
    finally {
        Pop-Location
    }
}

$failed = @($checks | Where-Object { -not $_.passed })
$result = [pscustomobject]@{
    status = if ($failed.Count -eq 0) { 'pass' } else { 'fail' }
    checked_at = (Get-Date).ToUniversalTime().ToString('o')
    manifest_rows = $manifest.Count
    pilot_rows = $pilot.Count
    failed_checks = $failed.Count
    checks = @($checks)
}
$json = $result | ConvertTo-Json -Depth 6
if (-not [string]::IsNullOrWhiteSpace($ReportPath)) {
    Write-Utf8Lf -LiteralPath ([System.IO.Path]::GetFullPath($ReportPath)) -Text $json
}
$json

if ($failed.Count -gt 0) {
    exit 1
}
