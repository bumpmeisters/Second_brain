param(
    [Parameter(Mandatory = $true, Position = 0)]
    [Alias('Path', 'Name', 'Id')]
    [string]$Query,

    [ValidateSet('Auto', 'Path', 'Name', 'ObjectId')]
    [string]$Mode = 'Auto',

    [ValidateSet('File', 'Directory', 'Any')]
    [string]$ExpectedType = 'File',

    [ValidateSet('Any', 'ContentId', 'DirectionId', 'BriefId', 'VariantId', 'PerformanceId')]
    [string]$ObjectField = 'Any',

    [string]$Label,

    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$vaultRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path

function Test-ExpectedType {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)

    switch ($ExpectedType) {
        'File' { return Test-Path -LiteralPath $LiteralPath -PathType Leaf }
        'Directory' { return Test-Path -LiteralPath $LiteralPath -PathType Container }
        default { return Test-Path -LiteralPath $LiteralPath }
    }
}

function Assert-InsideVault {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)

    $fullPath = [System.IO.Path]::GetFullPath($LiteralPath)
    $insideVault = $fullPath.Equals($vaultRoot, [System.StringComparison]::OrdinalIgnoreCase) -or
        $fullPath.StartsWith(
            $vaultRoot + [System.IO.Path]::DirectorySeparatorChar,
            [System.StringComparison]::OrdinalIgnoreCase
        )

    if (-not $insideVault) {
        throw "Resolved target is outside the vault: $fullPath"
    }

    return $fullPath
}

function Get-PathMatches {
    $candidate = if ([System.IO.Path]::IsPathRooted($Query)) {
        $Query
    }
    else {
        Join-Path $vaultRoot ($Query -replace '/', '\')
    }

    $candidate = Assert-InsideVault -LiteralPath $candidate
    if (Test-ExpectedType -LiteralPath $candidate) {
        return @((Resolve-Path -LiteralPath $candidate).Path)
    }

    return @()
}

function Get-NameMatches {
    if ($Query.IndexOfAny([char[]]@('\', '/')) -ge 0) {
        return @()
    }

    $worktreeRoot = Join-Path $vaultRoot '.worktrees'
    $items = switch ($ExpectedType) {
        'File' { Get-ChildItem -LiteralPath $vaultRoot -Recurse -File }
        'Directory' { Get-ChildItem -LiteralPath $vaultRoot -Recurse -Directory }
        default { Get-ChildItem -LiteralPath $vaultRoot -Recurse }
    }

    return @(
        $items |
            Where-Object {
                -not $_.FullName.StartsWith(
                    $worktreeRoot + [System.IO.Path]::DirectorySeparatorChar,
                    [System.StringComparison]::OrdinalIgnoreCase
                )
            } |
            Where-Object { $_.Name.Equals($Query, [System.StringComparison]::OrdinalIgnoreCase) } |
            ForEach-Object { $_.FullName }
    )
}

function Get-Frontmatter {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)

    $lines = @(Get-Content -LiteralPath $LiteralPath -TotalCount 100)
    if ($lines.Count -eq 0 -or $lines[0].Trim() -ne '---') {
        return @{}
    }

    $frontmatter = @{}
    for ($index = 1; $index -lt $lines.Count; $index++) {
        $line = $lines[$index]
        if ($line.Trim() -eq '---') {
            break
        }
        if ($line -match '^([A-Za-z0-9_-]+):\s*(.*?)\s*$') {
            $frontmatter[$matches[1]] = $matches[2].Trim().Trim("'`"")
        }
    }

    return $frontmatter
}

function Get-ObjectIdMatches {
    if ($ExpectedType -eq 'Directory') {
        return @()
    }

    $fieldNames = @{
        ContentId = @('content_id')
        DirectionId = @('direction_id')
        BriefId = @('brief_id')
        VariantId = @('variant_id')
        PerformanceId = @('performance_id')
        Any = @('content_id', 'direction_id', 'brief_id', 'variant_id', 'performance_id')
    }[$ObjectField]

    $projectsRoot = Join-Path $vaultRoot 'projects'

    if (-not (Test-Path -LiteralPath $projectsRoot -PathType Container)) {
        return @()
    }

    $canonicalType = switch ($ObjectField) {
        'DirectionId' { 'creative-direction' }
        'BriefId' { 'content-brief' }
        default { $null }
    }

    return @(
        Get-ChildItem -LiteralPath $projectsRoot -Recurse -File -Filter '*.md' |
            Where-Object {
                $frontmatter = Get-Frontmatter -LiteralPath $_.FullName
                if ($canonicalType -and $frontmatter['type'] -ne $canonicalType) {
                    return $false
                }
                foreach ($fieldName in $fieldNames) {
                    if ($frontmatter[$fieldName] -eq $Query) {
                        return $true
                    }
                }
                return $false
            } |
            ForEach-Object { $_.FullName } |
            Sort-Object -Unique
    )
}

$effectiveMode = $Mode
if ($Mode -eq 'Auto') {
    if ([System.IO.Path]::IsPathRooted($Query) -or $Query.IndexOfAny([char[]]@('\', '/')) -ge 0) {
        $effectiveMode = 'Path'
    }
    else {
        $effectiveMode = 'Name'
    }
}

$matches = switch ($effectiveMode) {
    'Path' { @(Get-PathMatches) }
    'Name' {
        $nameMatches = @(Get-NameMatches)
        if ($Mode -eq 'Auto' -and $nameMatches.Count -eq 0) {
            @(Get-ObjectIdMatches)
        }
        else {
            $nameMatches
        }
    }
    'ObjectId' { @(Get-ObjectIdMatches) }
}

$matches = @(
    $matches |
        ForEach-Object { Assert-InsideVault -LiteralPath $_ } |
        Sort-Object -Unique
)

if ($matches.Count -eq 0) {
    throw "No $ExpectedType target matched '$Query' in mode '$effectiveMode'. No link was generated."
}

if ($matches.Count -gt 1) {
    $relativeCandidates = $matches | ForEach-Object {
        $_.Substring($vaultRoot.Length + 1).Replace('\', '/')
    }
    throw "Target '$Query' is ambiguous. No link was generated. Candidates: $($relativeCandidates -join '; ')"
}

$fullPath = $matches[0]
$repositoryRelativePath = if ($fullPath.Equals($vaultRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    '.'
}
else {
    $fullPath.Substring($vaultRoot.Length + 1).Replace('\', '/')
}

$linkLabel = if ([string]::IsNullOrWhiteSpace($Label)) {
    [System.IO.Path]::GetFileNameWithoutExtension($fullPath)
}
else {
    $Label
}
$linkLabel = $linkLabel -replace ']', '\]'

$markdownTarget = $fullPath.Replace('\', '/')
if ($markdownTarget -match '^[A-Za-z]:/') {
    $markdownTarget = '/' + $markdownTarget
}
$markdownLink = "[$linkLabel](<$markdownTarget>)"

$result = [pscustomobject]@{
    query = $Query
    resolved_mode = $effectiveMode
    expected_type = $ExpectedType
    repository_relative_path = $repositoryRelativePath
    full_path = $fullPath
    markdown_link = $markdownLink
}

if ($Json) {
    $result | ConvertTo-Json -Depth 3
}
else {
    $result | Format-List
}
