param(
    [string]$VaultRoot = "",
    [string]$SourceRoot = "",
    [string]$OutputPath = "",
    [switch]$Check
)

$ErrorActionPreference = 'Stop'
if (-not $VaultRoot) { $VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
$VaultRoot = [IO.Path]::GetFullPath($VaultRoot)
if (-not $SourceRoot) { $SourceRoot = $VaultRoot }
$SourceRoot = [IO.Path]::GetFullPath($SourceRoot)
if (-not (Test-Path -LiteralPath $VaultRoot -PathType Container)) { throw "Vault root does not exist: $VaultRoot" }
if (-not (Test-Path -LiteralPath $SourceRoot -PathType Container)) { throw "Source root does not exist: $SourceRoot" }
$sourceLanes = @(@('raw', 'research') | Where-Object { Test-Path -LiteralPath (Join-Path $SourceRoot $_) -PathType Container })
if (-not $sourceLanes.Count) { throw "Source root contains neither raw nor research: $SourceRoot" }
if (-not $OutputPath) { $OutputPath = Join-Path $VaultRoot 'wiki\_outputs\source-coverage\source-inventory.csv' }

function Get-RelativePath([string]$Base, [string]$Path) {
    $baseUri = [Uri]::new(([IO.Path]::GetFullPath($Base).TrimEnd('\') + '\'))
    $pathUri = [Uri]::new([IO.Path]::GetFullPath($Path))
    return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($pathUri).ToString()).Replace('\', '/')
}

function Get-StatusFromText([string]$Text) {
    if ($Text -match '(?i)registered[- ]only') { return 'registered-only' }
    if ($Text -match '(?i)inventory[- ]only|catalog|out-of-scope') { return 'inventory-only' }
    if ($Text -match '(?i)partially|pending|undecided|review') { return 'pending-review' }
    if ($Text -match '(?i)duplicate|superseded') { return 'duplicate' }
    if ($Text -match '(?i)content[- ]ingested|\bingested\b') { return 'content-ingested' }
    return 'pending-review'
}

$exactCoverage = @{}
$prefixCoverage = [Collections.Generic.List[object]]::new()
$sourcesPath = Join-Path $VaultRoot 'wiki\sources.md'
if (Test-Path -LiteralPath $sourcesPath -PathType Leaf) {
    $lineNumber = 0
    $aiResearchTable = $false
    foreach ($line in [IO.File]::ReadAllLines($sourcesPath, [Text.Encoding]::UTF8)) {
        $lineNumber++
        if ($line -match '^##\s+AI-generated research') { $aiResearchTable = $true; continue }
        if ($line -match '^##\s+' -and $line -notmatch '^##\s+AI-generated research') { $aiResearchTable = $false; continue }
        if ($line -notmatch '^\|') { continue }
        $cells = @($line.Split('|'))
        if ($cells.Count -lt 4) { continue }
        $sourceCell = $cells[1].Trim()
        $statusCellIndex = if ($aiResearchTable) { 4 } else { 3 }
        if ($cells.Count -le $statusCellIndex) { continue }
        $statusText = $cells[$statusCellIndex].Trim()
        foreach ($match in [regex]::Matches($sourceCell, '`((?:raw|research)/[^`]+)`')) {
            $candidate = $match.Groups[1].Value.TrimEnd('/').Replace('\', '/')
            $candidateStatus = Get-StatusFromText $statusText
            $record = [pscustomobject]@{
                status = $candidateStatus
                reference = "wiki/sources.md:$lineNumber"
            }
            $absolute = Join-Path $SourceRoot $candidate
            if (Test-Path -LiteralPath $absolute -PathType Container) {
                if ($line -match '(?i)inventory[- ]level|inventory refreshed|inventory-only|cataloged') { $record.status = 'inventory-only' }
                $prefixCoverage.Add([pscustomobject]@{ prefix = "$candidate/"; record = $record })
            } else {
                $exactCoverage[$candidate.ToLowerInvariant()] = $record
            }
        }
    }
}

$decisionFiles = @(Get-ChildItem -LiteralPath (Join-Path $VaultRoot 'wiki\_outputs\semantic-ingest') -Recurse -File -Filter 'decisions.csv' -ErrorAction SilentlyContinue)
foreach ($decisionFile in $decisionFiles) {
    foreach ($row in @(Import-Csv -LiteralPath $decisionFile.FullName -Encoding UTF8)) {
        $source = ([string]$row.canonical_source).Replace('\', '/').Trim()
        if (-not $source -or $source -notmatch '^(raw|research)/') { continue }
        $decision = [string]$row.semantic_decision
        $status = if ($decision -match '(?i)^registered-only$') { 'registered-only' } elseif ($decision -match '(?i)duplicate') { 'duplicate' } elseif ($decision -match '(?i)^out-of-scope$') { 'inventory-only' } elseif ($decision -match '(?i)^(new-claim|extended-claim|corroborating)$') { 'content-ingested' } else { 'pending-review' }
        $exactCoverage[$source.ToLowerInvariant()] = [pscustomobject]@{
            status = $status
            reference = (Get-RelativePath $VaultRoot $decisionFile.FullName)
        }
    }
}

$rows = [Collections.Generic.List[object]]::new()
foreach ($lane in $sourceLanes) {
    $laneRoot = Join-Path $SourceRoot $lane
    if (-not (Test-Path -LiteralPath $laneRoot -PathType Container)) { continue }
    foreach ($file in Get-ChildItem -LiteralPath $laneRoot -Recurse -File -Force | Sort-Object FullName) {
        $relative = Get-RelativePath $SourceRoot $file.FullName
        $coverage = $exactCoverage[$relative.ToLowerInvariant()]
        if (-not $coverage) {
            $match = $prefixCoverage | Where-Object { $relative.StartsWith($_.prefix, [StringComparison]::OrdinalIgnoreCase) } | Sort-Object { $_.prefix.Length } -Descending | Select-Object -First 1
            if ($match) { $coverage = $match.record }
        }
        if (-not $coverage) {
            $coverage = [pscustomobject]@{ status = 'inventory-only'; reference = 'filesystem-inventory' }
        }
        $kind = if ($relative -match '^(raw|research)/assets/') { 'binary-library' } elseif ($relative -match '^raw/Clippings/') { 'clipping' } elseif ($relative -match '/imports/') { 'import' } elseif ($lane -eq 'research') { 'ai-research' } else { 'native-source' }
        $rows.Add([pscustomobject][ordered]@{
            source_path = $relative
            lane = $lane
            source_kind = $kind
            size_bytes = $file.Length
            coverage_status = $coverage.status
            coverage_ref = $coverage.reference
        })
    }
}

$csv = (($rows | Sort-Object source_path | ConvertTo-Csv -NoTypeInformation) -join "`n") + "`n"
if ($Check) {
    if (-not (Test-Path -LiteralPath $OutputPath -PathType Leaf)) {
        Write-Error "Source coverage inventory is missing: $OutputPath" -ErrorAction Continue
        exit 2
    }
    $actual = [IO.File]::ReadAllText($OutputPath, [Text.Encoding]::UTF8).Replace("`r`n", "`n")
    if ($actual -ne $csv) {
        Write-Error 'Source coverage inventory is stale. Regenerate it with tools/new-source-coverage-inventory.ps1.' -ErrorAction Continue
        exit 2
    }
    Write-Output "Source coverage inventory is current ($($rows.Count) files)."
    exit 0
}

$parent = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Force -Path $parent | Out-Null
[IO.File]::WriteAllText($OutputPath, $csv, [Text.UTF8Encoding]::new($false))
Write-Output "Wrote source coverage inventory: $OutputPath ($($rows.Count) files)."
