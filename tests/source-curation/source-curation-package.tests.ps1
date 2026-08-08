$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$vault = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$tempRoot = [System.IO.Path]::GetFullPath((Join-Path $vault '.tmp'))
$testRoot = [System.IO.Path]::GetFullPath((Join-Path $tempRoot 'source-curation-package'))
if (-not $testRoot.StartsWith(($tempRoot.TrimEnd('\') + '\'), [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing unsafe test path: $testRoot"
}
if (Test-Path -LiteralPath $testRoot) {
    Remove-Item -LiteralPath $testRoot -Recurse -Force
}

foreach ($directory in @(
    'raw\assets',
    'research\assets',
    'wiki\_outputs\source-conversions',
    'wiki',
    'output'
)) {
    New-Item -ItemType Directory -Force -Path (Join-Path $testRoot $directory) | Out-Null
}

function Write-FixtureFile {
    param(
        [Parameter(Mandatory = $true)][string]$RelativePath,
        [Parameter(Mandatory = $true)][string]$Content
    )

    $path = Join-Path $testRoot $RelativePath
    $parent = Split-Path -Parent $path
    if (-not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Force -Path $parent | Out-Null
    }
    [System.IO.File]::WriteAllText($path, $Content, [System.Text.UTF8Encoding]::new($false))
    return Get-Item -LiteralPath $path
}

try {
    $registryRows = [System.Collections.Generic.List[object]]::new()
    $citationLines = [System.Collections.Generic.List[string]]::new()

    for ($index = 1; $index -le 10; $index++) {
        $relative = "raw/assets/cited/source-$('{0:d2}' -f $index).pdf"
        $file = Write-FixtureFile -RelativePath $relative -Content "cited green $index"
        $citationLines.Add("- Evidence (source: $relative)")
        $registryRows.Add([pscustomobject]@{
            source = $relative; size_bytes = $file.Length; modified = $file.LastWriteTimeUtc.ToString('o')
            sha256 = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
            profile = 'fixture'; target = ''; audit_status = 'ok'; state = 'green'; run_id = 'fixture'
        })
    }

    for ($index = 1; $index -le 10; $index++) {
        $relative = "raw/assets/uncited/source-$('{0:d2}' -f $index).docx"
        $file = Write-FixtureFile -RelativePath $relative -Content "uncited green $index"
        $registryRows.Add([pscustomobject]@{
            source = $relative; size_bytes = $file.Length; modified = $file.LastWriteTimeUtc.ToString('o')
            sha256 = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
            profile = 'fixture'; target = ''; audit_status = 'ok'; state = 'green'; run_id = 'fixture'
        })
    }

    for ($index = 1; $index -le 10; $index++) {
        $content = "duplicate family $index"
        foreach ($root in @('raw', 'research')) {
            $relative = "$root/assets/duplicates/source-$('{0:d2}' -f $index).pptx"
            $file = Write-FixtureFile -RelativePath $relative -Content $content
            $registryRows.Add([pscustomobject]@{
                source = $relative; size_bytes = $file.Length; modified = $file.LastWriteTimeUtc.ToString('o')
                sha256 = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
                profile = 'fixture'; target = ''; audit_status = 'ok'; state = 'green'; run_id = 'fixture'
            })
        }
    }

    for ($index = 1; $index -le 10; $index++) {
        $relative = "raw/assets/exceptions/source-$('{0:d2}' -f $index).xlsx"
        $file = Write-FixtureFile -RelativePath $relative -Content "exception $index"
        $state = if ($index -le 5) { 'amber' } else { 'red' }
        $audit = if ($state -eq 'amber') { 'review' } else { 'poor' }
        $registryRows.Add([pscustomobject]@{
            source = $relative; size_bytes = $file.Length; modified = $file.LastWriteTimeUtc.ToString('o')
            sha256 = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
            profile = 'fixture'; target = ''; audit_status = $audit; state = $state; run_id = 'fixture'
        })
    }

    for ($index = 1; $index -le 10; $index++) {
        $relative = "research/assets/visual/source-$('{0:d2}' -f $index).png"
        $file = Write-FixtureFile -RelativePath $relative -Content "visual research $index"
        $registryRows.Add([pscustomobject]@{
            source = $relative; size_bytes = $file.Length; modified = $file.LastWriteTimeUtc.ToString('o')
            sha256 = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
            profile = 'fixture'; target = ''; audit_status = ''; state = 'unsupported'; run_id = 'fixture'
        })
    }

    $registryText = $registryRows | ConvertTo-Csv -NoTypeInformation
    [System.IO.File]::WriteAllText(
        (Join-Path $testRoot 'wiki\_outputs\source-conversions\source-conversion-registry.csv'),
        (($registryText -join "`n") + "`n"),
        [System.Text.UTF8Encoding]::new($false)
    )
    [System.IO.File]::WriteAllText(
        (Join-Path $testRoot 'wiki\fixture-citations.md'),
        (($citationLines -join "`n") + "`n"),
        [System.Text.UTF8Encoding]::new($false)
    )

    $before = @{}
    foreach ($file in (Get-ChildItem -LiteralPath (Join-Path $testRoot 'raw\assets'), (Join-Path $testRoot 'research\assets') -Recurse -File)) {
        $before[$file.FullName] = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    }

    $generator = Join-Path $vault 'tools\new-source-curation-package.ps1'
    $validator = Join-Path $vault 'tools\test-source-curation-package.ps1'
    $policy = Join-Path $vault 'tools\config\source-curation-policy.json'
    $schema = Join-Path $vault 'tools\config\source-curation-schema.json'
    $output = Join-Path $testRoot 'output'
    & $generator -SourceVaultRoot $testRoot -Mode All -OutputRoot $output -PolicyPath $policy | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw 'Curation package generator failed.'
    }

    $manifestPath = Join-Path $output 'starter-pack-2026-08-07-manifest.csv'
    $pilotPath = Join-Path $output 'starter-pack-2026-08-07-pilot-50.csv'
    & $validator -SourceVaultRoot $testRoot -ManifestPath $manifestPath -PilotPath $pilotPath -PolicyPath $policy -SchemaPath $schema | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw 'Curation package validator failed.'
    }

    $manifest = @(Import-Csv -LiteralPath $manifestPath)
    $pilot = @(Import-Csv -LiteralPath $pilotPath)
    if ($manifest.Count -ne 60) {
        throw "Expected 60 fixture sources, found $($manifest.Count)."
    }
    if (@($manifest | Where-Object { [int]$_.citation_count -gt 0 -and $_.proposed_curation_status -ne 'protected' }).Count -ne 0) {
        throw 'Every detected cited fixture must be protected.'
    }
    if (@($manifest | Where-Object { $_.duplicate_group -and $_.is_canonical -eq 'false' -and $_.proposed_curation_status -ne 'duplicate-candidate' }).Count -ne 0) {
        throw 'Every noncanonical exact duplicate fixture must be a duplicate candidate.'
    }
    if (@($pilot | Group-Object pilot_stratum | Where-Object Count -ne 10).Count -ne 0) {
        throw 'Pilot must contain ten rows per stratum.'
    }
    if (@($manifest | Where-Object { $_.physical_action -ne 'none' -or $_.physical_action_status -ne 'not-authorized' }).Count -ne 0) {
        throw 'Generated package must never authorize physical source actions.'
    }

    foreach ($file in (Get-ChildItem -LiteralPath (Join-Path $testRoot 'raw\assets'), (Join-Path $testRoot 'research\assets') -Recurse -File)) {
        $afterHash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
        if ($before[$file.FullName] -ne $afterHash) {
            throw "Generator modified a fixture source: $($file.FullName)"
        }
    }

    Write-Host 'Source curation package contract: PASS'
}
finally {
    if (Test-Path -LiteralPath $testRoot) {
        Remove-Item -LiteralPath $testRoot -Recurse -Force
    }
}
