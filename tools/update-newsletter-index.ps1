param(
    [string]$VaultRoot = "",
    [string]$RegistryPath = "",
    [string]$PublicContractPath = "",
    [string]$OutputPath = "",
    [switch]$Check
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Get-TextSha256([string]$Text) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($Text)))).Replace('-', '') }
    finally { $sha.Dispose() }
}

function Assert-PublicProjection([string]$Content, [object]$Contract) {
    if ($Contract.contract -cne 'newsletter-index-public-projection/v1') { throw 'Unexpected newsletter public-projection contract type.' }
    $match = [regex]::Match($Content, '(?s)<!-- BEGIN GENERATED SELECTED DOSSIERS -->.*?<!-- END GENERATED SELECTED DOSSIERS -->')
    if (-not $match.Success) { throw 'Newsletter index has no generated selected-dossiers block.' }
    $block = $match.Value
    $blockBytes = [Text.Encoding]::UTF8.GetByteCount($block)
    if ($blockBytes -ne [int64]$Contract.generated_block_bytes -or (Get-TextSha256 $block) -cne [string]$Contract.generated_block_sha256) {
        throw 'Newsletter index does not match the public projection contract.'
    }
    if ($Content -notmatch ('(?m)^- \*\*Selected canonical newsletters\*\*: ' + [regex]::Escape([string]$Contract.selected_canonical_newsletters) + '$') -or
        $Content -notmatch ('(?m)^- \*\*Qualified streams represented\*\*: ' + [regex]::Escape([string]$Contract.selected_streams) + '$')) {
        throw 'Newsletter index counts do not match the public projection contract.'
    }
}

try {
    if (-not $VaultRoot) { $VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
    $VaultRoot = [IO.Path]::GetFullPath($VaultRoot)
    if (-not $RegistryPath) { $RegistryPath = Join-Path $VaultRoot 'wiki\_outputs\newsletter-intelligence\identity-registry.json' }
    if (-not $PublicContractPath) { $PublicContractPath = Join-Path $VaultRoot 'tools\config\newsletter-index-contract.json' }
    if (-not $OutputPath) { $OutputPath = Join-Path $VaultRoot 'wiki\newsletters\index.md' }
    $RegistryPath = [IO.Path]::GetFullPath($RegistryPath)
    $PublicContractPath = [IO.Path]::GetFullPath($PublicContractPath)
    $OutputPath = [IO.Path]::GetFullPath($OutputPath)

    $registryExists = Test-Path -LiteralPath $RegistryPath -PathType Leaf
    $outputExists = Test-Path -LiteralPath $OutputPath -PathType Leaf
    if (-not $registryExists -and -not $outputExists) {
        Write-Output 'Newsletter index is not configured locally; no registry or index is present.'
        exit 0
    }
    if (-not $outputExists) { throw 'Newsletter index is missing.' }
    $publicContract = $null
    if (Test-Path -LiteralPath $PublicContractPath -PathType Leaf) {
        $publicContract = [IO.File]::ReadAllText($PublicContractPath, [Text.Encoding]::UTF8) | ConvertFrom-Json
    }
    elseif (-not $registryExists) { throw 'Newsletter public-projection contract is missing.' }
    if (-not $registryExists) {
        $publicContent = [IO.File]::ReadAllText($OutputPath, [Text.Encoding]::UTF8).Replace("`r`n", "`n")
        Assert-PublicProjection $publicContent $publicContract
        if (-not $Check) { throw 'The private identity registry is required to regenerate the newsletter index.' }
        Write-Output "Newsletter index matches the public projection ($($publicContract.selected_canonical_newsletters) dossiers, $($publicContract.selected_streams) selected streams)."
        exit 0
    }

    $registry = [IO.File]::ReadAllText($RegistryPath, [Text.Encoding]::UTF8) | ConvertFrom-Json
    if ($registry.record_type -ne 'newsletter_identity_registry') { throw 'Unexpected newsletter identity registry type.' }
    if ($null -eq $registry.canonical_newsletters) { throw 'Newsletter identity registry has no canonical_newsletters collection.' }

    $selectedCanonicals = @($registry.canonical_newsletters | Where-Object overall_decision -eq 'selected' | Sort-Object canonical_name)
    $selectedStreams = @($selectedCanonicals | ForEach-Object { @($_.streams | Where-Object decision -eq 'selected') })
    $dossierByCanonicalId = @{}
    $dossierRoot = Join-Path $VaultRoot 'wiki\newsletters'
    foreach ($dossier in Get-ChildItem -LiteralPath $dossierRoot -Recurse -File -Filter '*.md' | Where-Object Name -ne 'index.md') {
        $head = (Get-Content -LiteralPath $dossier.FullName -Encoding UTF8 -TotalCount 40) -join "`n"
        if ($head -notmatch '(?m)^canonical_id:\s*["'']?([^\s"'']+)') { continue }
        $canonicalId = $matches[1]
        if ($dossierByCanonicalId.ContainsKey($canonicalId)) { throw "Multiple newsletter dossiers declare canonical_id '$canonicalId'." }
        $relative = $dossier.FullName.Substring((Join-Path $VaultRoot 'wiki').Length + 1).Replace('\', '/') -replace '\.md$', ''
        $dossierByCanonicalId[$canonicalId] = $relative
    }

    $table = [Collections.Generic.List[string]]::new()
    $table.Add('<!-- BEGIN GENERATED SELECTED DOSSIERS -->')
    $table.Add('| Newsletter | Streams | Issues analyzed | Coverage | Identity |')
    $table.Add('|---|---:|---:|---|---|')
    foreach ($canonical in $selectedCanonicals) {
        $canonicalId = [string]$canonical.canonical_id
        $canonicalName = [string]$canonical.canonical_name
        if (-not $canonicalId -or -not $canonicalName) { throw 'Every selected newsletter requires canonical_id and canonical_name.' }
        $streams = @($canonical.streams | Where-Object decision -eq 'selected')
        if ($streams.Count -eq 0) { throw "Selected newsletter has no selected stream: $canonicalName" }
        if (-not $dossierByCanonicalId.ContainsKey($canonicalId)) { throw "Selected newsletter has no dossier: $canonicalName ($canonicalId)" }

        $fromDates = @($streams | ForEach-Object { [string]$_.date_range.from })
        $toDates = @($streams | ForEach-Object { [string]$_.date_range.to })
        if (@($fromDates | Where-Object { $_ -notmatch '^\d{4}-\d{2}-\d{2}$' }).Count -gt 0 -or @($toDates | Where-Object { $_ -notmatch '^\d{4}-\d{2}-\d{2}$' }).Count -gt 0) {
            throw "Selected newsletter has an incomplete or invalid ISO date range: $canonicalName"
        }
        $from = [string]($fromDates | Sort-Object | Select-Object -First 1)
        $to = [string]($toDates | Sort-Object -Descending | Select-Object -First 1)
        $issueCount = 0L
        foreach ($stream in $streams) {
            $streamIssueCount = [int64]$stream.issue_count
            if ($streamIssueCount -lt 0) { throw "Selected newsletter has a negative issue count: $canonicalName" }
            $issueCount += $streamIssueCount
        }
        $identity = ([string]$canonical.identity_status).Replace('_', ' ')
        $table.Add("| [[$($dossierByCanonicalId[$canonicalId])|$canonicalName]] | $($streams.Count) | $issueCount | $from to $to | $identity |")
    }
    $table.Add('<!-- END GENERATED SELECTED DOSSIERS -->')
    $generated = $table -join "`n"

    $rawContent = [IO.File]::ReadAllText($OutputPath, [Text.Encoding]::UTF8)
    $newline = if ($rawContent.Contains("`r`n")) { "`r`n" } else { "`n" }
    $content = $rawContent.Replace("`r`n", "`n")
    $generatedPattern = '(?s)<!-- BEGIN GENERATED SELECTED DOSSIERS -->.*?<!-- END GENERATED SELECTED DOSSIERS -->'
    if ($content -match $generatedPattern) {
        $expected = [regex]::Replace($content, $generatedPattern, [Text.RegularExpressions.MatchEvaluator]{ param($match) $generated }, 1)
    } else {
        $legacyPattern = '(?s)\| Newsletter \| Streams \| Issues analyzed \| Coverage \| Identity \|\n\|---\|---:\|---:\|---\|---\|\n(?:\|.*\n)+'
        if ($content -notmatch $legacyPattern) { throw 'Newsletter index does not contain a replaceable selected-dossiers table.' }
        $expected = [regex]::Replace($content, $legacyPattern, [Text.RegularExpressions.MatchEvaluator]{ param($match) "$generated`n" }, 1)
    }

    $canonicalCountPattern = '(?m)^- \*\*Selected canonical newsletters\*\*: \d+$'
    $streamCountPattern = '(?m)^- \*\*Qualified streams represented\*\*: \d+$'
    if ($expected -notmatch $canonicalCountPattern -or $expected -notmatch $streamCountPattern) {
        throw 'Newsletter index is missing one or both generated count lines.'
    }
    $expected = [regex]::Replace($expected, $canonicalCountPattern, "- **Selected canonical newsletters**: $($selectedCanonicals.Count)", 1)
    $expected = [regex]::Replace($expected, $streamCountPattern, "- **Qualified streams represented**: $($selectedStreams.Count)", 1)
    if ($null -ne $publicContract) {
        if ($selectedCanonicals.Count -ne [int]$publicContract.selected_canonical_newsletters -or $selectedStreams.Count -ne [int]$publicContract.selected_streams) {
            throw 'Private newsletter registry does not match the public projection counts.'
        }
        Assert-PublicProjection $expected $publicContract
    }

    if ($Check) {
        if ($content -ne $expected) {
            [Console]::Error.WriteLine('Newsletter index is stale. Regenerate it with tools/update-newsletter-index.ps1.')
            exit 2
        }
        Write-Output "Newsletter index is current ($($selectedCanonicals.Count) dossiers, $($selectedStreams.Count) selected streams)."
        exit 0
    }

    [IO.File]::WriteAllText($OutputPath, $expected.Replace("`n", $newline), [Text.UTF8Encoding]::new($false))
    Write-Output "Updated newsletter index: $OutputPath ($($selectedCanonicals.Count) dossiers, $($selectedStreams.Count) selected streams)."
}
catch {
    [Console]::Error.WriteLine($_.Exception.Message)
    exit 2
}
