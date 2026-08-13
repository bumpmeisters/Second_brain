$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$vault = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
Push-Location $vault
try {
    $tracked = @(git -c core.quotepath=false ls-files)
    if ($LASTEXITCODE -ne 0) {
        throw 'Could not enumerate tracked files.'
    }

    $expectedProtected = @('raw/assets/README.md', 'research/assets/README.md')
    $trackedProtected = @($tracked | Where-Object {
        $_ -like 'raw/assets/*' -or $_ -like 'research/assets/*'
    })
    $protectedDifference = @(Compare-Object $expectedProtected $trackedProtected)
    if ($protectedDifference.Count -gt 0) {
        throw 'Protected source roots must contain exactly their tracked README contracts.'
    }

    $excludedOutputs = @($tracked | Where-Object {
        $_ -like 'wiki/_extractions/*' -or
        $_ -like 'wiki/_outputs/source-conversions/*' -or
        $_ -like 'wiki/_outputs/source-curation/*'
    })
    if ($excludedOutputs.Count -gt 0) {
        throw 'Source-derived extractions or generated source ledgers crossed the publication boundary.'
    }

    $indexTree = (& git write-tree).Trim()
    if ($LASTEXITCODE -ne 0 -or -not $indexTree) {
        throw 'Could not snapshot the tracked index for blob-size inspection.'
    }
    $treeRows = @(git ls-tree -r -l $indexTree)
    $oversized = [Collections.Generic.List[string]]::new()
    $parsedBlobs = 0
    foreach ($line in $treeRows) {
        if ($line -match '^\d+\s+\w+\s+[0-9a-f]+\s+(\d+)\t(.+)$' -and [int64]$Matches[1] -gt 10MB) {
            $oversized.Add($Matches[2])
        }
        if ($line -match '^\d+\s+blob\s+[0-9a-f]+\s+\d+\t') {
            $parsedBlobs++
        }
    }
    if ($LASTEXITCODE -ne 0) {
        throw 'Could not inspect tracked blob sizes.'
    }
    if ($parsedBlobs -ne $tracked.Count) {
        throw "Blob-size inspection parsed $parsedBlobs of $($tracked.Count) tracked files."
    }
    if ($oversized.Count -gt 0) {
        throw "Tracked blobs exceed the 10 MiB publication limit: $($oversized -join ', ')"
    }

    Write-Host 'Publication boundary contract: PASS'
}
finally {
    Pop-Location
}
