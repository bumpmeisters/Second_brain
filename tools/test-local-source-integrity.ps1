[CmdletBinding()]
param(
    [string]$VaultRoot = "",
    [string]$SourceRoot = "",
    [string]$ContractPath = "",
    [ValidateSet('Auto', 'CleanCheckout', 'LocalHydrated')][string]$Mode = 'Auto',
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Get-RelativePath([string]$Base, [string]$Path) {
    $baseUri = [Uri]::new(([IO.Path]::GetFullPath($Base).TrimEnd('\') + '\'))
    $pathUri = [Uri]::new([IO.Path]::GetFullPath($Path))
    return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($pathUri).ToString()).Replace('\', '/')
}

function Get-TextSha256([string]$Text) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($Text)))).Replace('-', '') }
    finally { $sha.Dispose() }
}

function Assert-Hash([string]$Value, [string]$Field) {
    if ($Value -cnotmatch '^[0-9A-F]{64}$') { throw "$Field is not an uppercase SHA-256 value." }
}

if (-not $VaultRoot) { $VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
$VaultRoot = [IO.Path]::GetFullPath($VaultRoot)
if (-not $SourceRoot) { $SourceRoot = $VaultRoot }
$SourceRoot = [IO.Path]::GetFullPath($SourceRoot)
if (-not $ContractPath) { $ContractPath = Join-Path $VaultRoot 'tools\config\local-source-integrity-contract.json' }
$ContractPath = [IO.Path]::GetFullPath($ContractPath)

if (-not (Test-Path -LiteralPath $ContractPath -PathType Leaf)) { throw "Local-source integrity contract is missing: $ContractPath" }
$contractText = [IO.File]::ReadAllText($ContractPath, [Text.Encoding]::UTF8)
if ($contractText -match '(?i)"(?:source|sidecar|target|repository)_path"\s*:' -or
    $contractText -match '(?i)(?:[A-Z]:[\\/]|/Users/|raw/assets/|research/assets/|wiki/_extractions/)') {
    throw 'Local-source integrity contract contains a concrete or private path.'
}
$contract = $contractText | ConvertFrom-Json
if ($contract.contract -cne 'local-source-integrity/v1') { throw 'Unexpected local-source integrity contract type.' }

$sourceBindings = @($contract.source_bindings)
$linkTargets = @($contract.local_link_targets)
if ($sourceBindings.Count -ne [int]$contract.coverage.bound_local_source_count) { throw 'Source-binding count does not match the coverage contract.' }
if ([int]$contract.coverage.tracked_source_count -lt 0 -or [int]$contract.coverage.total_source_count -ne ([int]$contract.coverage.tracked_source_count + $sourceBindings.Count)) {
    throw 'Coverage counts are inconsistent.'
}
if (@($sourceBindings | ForEach-Object { [string]$_.binding_id } | Sort-Object -Unique).Count -ne $sourceBindings.Count -or
    @($sourceBindings | ForEach-Object { [string]$_.source_locator_sha256 } | Sort-Object -Unique).Count -ne $sourceBindings.Count -or
    @($sourceBindings | ForEach-Object { [string]$_.sidecar_locator_sha256 } | Sort-Object -Unique).Count -ne $sourceBindings.Count) {
    throw 'Source bindings contain duplicate identifiers or locators.'
}
if (@($linkTargets | ForEach-Object { [string]$_.binding_id } | Sort-Object -Unique).Count -ne $linkTargets.Count -or
    @($linkTargets | ForEach-Object { [string]$_.target_locator_sha256 } | Sort-Object -Unique).Count -ne $linkTargets.Count) {
    throw 'Local-link bindings contain duplicate identifiers or locators.'
}
foreach ($row in $sourceBindings) {
    foreach ($field in @('source_locator_sha256', 'source_sha256', 'sidecar_locator_sha256', 'sidecar_sha256')) { Assert-Hash ([string]$row.$field) $field }
    if ([int64]$row.source_bytes -lt 1 -or [int64]$row.sidecar_bytes -lt 1) { throw "Binding $($row.binding_id) has a non-positive byte count." }
}
foreach ($row in $linkTargets) {
    Assert-Hash ([string]$row.target_locator_sha256) 'target_locator_sha256'
    if ($row.availability -cne 'local-only') { throw "Local-link binding $($row.binding_id) has an unexpected availability." }
}

$sourceFiles = [Collections.Generic.List[object]]::new()
foreach ($lane in @('raw', 'research')) {
    $laneRoot = Join-Path $SourceRoot $lane
    if (-not (Test-Path -LiteralPath $laneRoot -PathType Container)) { continue }
    foreach ($file in Get-ChildItem -LiteralPath $laneRoot -Recurse -File -Force) {
        $relative = Get-RelativePath $SourceRoot $file.FullName
        $sourceFiles.Add([pscustomobject]@{ file = $file; locator_sha256 = Get-TextSha256 $relative })
    }
}
$sidecarFiles = [Collections.Generic.List[object]]::new()
$sidecarRoot = Join-Path $VaultRoot 'wiki\_extractions'
if (Test-Path -LiteralPath $sidecarRoot -PathType Container) {
    foreach ($file in Get-ChildItem -LiteralPath $sidecarRoot -Recurse -File -Force) {
        $relative = Get-RelativePath $VaultRoot $file.FullName
        $sidecarFiles.Add([pscustomobject]@{ file = $file; locator_sha256 = Get-TextSha256 $relative })
    }
}

$contractedSourceLocators = @($sourceBindings | ForEach-Object { [string]$_.source_locator_sha256 })
$contractedSidecarLocators = @($sourceBindings | ForEach-Object { [string]$_.sidecar_locator_sha256 })
$matchedSources = @($sourceFiles | Where-Object locator_sha256 -in $contractedSourceLocators)
$matchedSidecars = @($sidecarFiles | Where-Object locator_sha256 -in $contractedSidecarLocators)
$effectiveMode = $Mode
if ($Mode -eq 'Auto') {
    if ($matchedSources.Count -eq 0 -and $matchedSidecars.Count -eq 0) { $effectiveMode = 'CleanCheckout' }
    elseif ($matchedSources.Count -eq $sourceBindings.Count -and $matchedSidecars.Count -eq $sourceBindings.Count) { $effectiveMode = 'LocalHydrated' }
    else { throw 'Local-source custody is partially hydrated.' }
}

$registryJoins = 0
if ($effectiveMode -eq 'CleanCheckout') {
    if ($matchedSources.Count -ne 0 -or $matchedSidecars.Count -ne 0) { throw 'Clean-checkout mode found contracted local source material.' }
    if ($sourceFiles.Count -ne [int]$contract.coverage.tracked_source_count) { throw "Clean-checkout source count is $($sourceFiles.Count), expected $($contract.coverage.tracked_source_count)." }
}
else {
    if ($matchedSources.Count -ne $sourceBindings.Count -or $matchedSidecars.Count -ne $sourceBindings.Count) { throw 'Hydrated mode does not contain every contracted source and sidecar.' }
    foreach ($row in $sourceBindings) {
        $source = @($matchedSources | Where-Object locator_sha256 -ceq $row.source_locator_sha256)
        $sidecar = @($matchedSidecars | Where-Object locator_sha256 -ceq $row.sidecar_locator_sha256)
        if ($source.Count -ne 1 -or $sidecar.Count -ne 1) { throw "Binding $($row.binding_id) did not resolve uniquely." }
        if ($source[0].file.Length -ne [int64]$row.source_bytes -or (Get-FileHash -LiteralPath $source[0].file.FullName -Algorithm SHA256).Hash -cne $row.source_sha256) { throw "Source identity mismatch for $($row.binding_id)." }
        if ($sidecar[0].file.Length -ne [int64]$row.sidecar_bytes -or (Get-FileHash -LiteralPath $sidecar[0].file.FullName -Algorithm SHA256).Hash -cne $row.sidecar_sha256) { throw "Sidecar identity mismatch for $($row.binding_id)." }
    }
    $registryPath = Join-Path $VaultRoot 'wiki\_outputs\source-conversions\source-conversion-registry.csv'
    if (-not (Test-Path -LiteralPath $registryPath -PathType Leaf)) { throw 'Hydrated mode requires the local source-conversion registry.' }
    $registryPairs = @{}
    foreach ($registryRow in @(Import-Csv -LiteralPath $registryPath -Encoding UTF8)) {
        if (-not $registryRow.source -or -not $registryRow.target) { continue }
        $sourceLocator = ([string]$registryRow.source).Replace('\', '/')
        $sidecarLocator = ([string]$registryRow.target).Replace('\', '/')
        $key = (Get-TextSha256 $sourceLocator) + ':' + (Get-TextSha256 $sidecarLocator)
        if ($registryPairs.ContainsKey($key)) { throw 'Source-conversion registry contains a duplicate contracted pair.' }
        $registryPairs[$key] = $true
    }
    foreach ($row in $sourceBindings) {
        $key = [string]$row.source_locator_sha256 + ':' + [string]$row.sidecar_locator_sha256
        if (-not $registryPairs.ContainsKey($key)) { throw "Registry join is missing for $($row.binding_id)." }
        $registryJoins++
    }
}

$result = [ordered]@{
    contract = 'local-source-integrity-result/v1'
    verdict = 'PASS'
    mode = $effectiveMode
    source_bindings = $sourceBindings.Count
    sidecar_bindings = $sourceBindings.Count
    local_link_targets = $linkTargets.Count
    matched_sources = $matchedSources.Count
    matched_sidecars = $matchedSidecars.Count
    registry_joins = $registryJoins
    visible_source_files = $sourceFiles.Count
}
if ($Json) { $result | ConvertTo-Json -Depth 4 -Compress }
else { Write-Output "Local-source integrity: PASS | $effectiveMode | $($sourceBindings.Count) source/sidecar bindings | $($linkTargets.Count) local links" }
