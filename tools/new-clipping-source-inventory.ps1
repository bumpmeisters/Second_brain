param(
    [string]$ClippingsRoot = 'raw/Clippings',
    [string]$OutputCsv = 'wiki/_outputs/clipping-source-inventory-2026-07-30.csv',
    [string]$OutputReport = 'wiki/_outputs/clipping-source-inventory-2026-07-30.md',
    [datetime]$SnapshotDate = '2026-07-30'
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

function Resolve-InVault([string]$Path, [switch]$MustExist) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $vaultRoot $Path }
    $full = [IO.Path]::GetFullPath($candidate)
    if (-not ($full -eq $vaultRoot -or $full.StartsWith($vaultRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase))) {
        throw "Path is outside the vault: $Path"
    }
    if ($MustExist -and -not (Test-Path -LiteralPath $full)) {
        throw "Path does not exist: $Path"
    }
    return $full
}

function Get-RelativeVaultPath([string]$Path) {
    return $Path.Substring($vaultRoot.Length + 1).Replace('\', '/')
}

function Get-Frontmatter([string]$Text) {
    $match = [regex]::Match($Text, '(?s)\A---\s*\r?\n(.*?)\r?\n---')
    if ($match.Success) { return $match.Groups[1].Value }
    return ''
}

function Convert-YamlScalar([string]$Value) {
    $clean = $Value.Trim()
    if ($clean.Length -ge 2 -and $clean.StartsWith('"') -and $clean.EndsWith('"')) {
        return $clean.Substring(1, $clean.Length - 2).Replace('\"', '"')
    }
    if ($clean.Length -ge 2 -and $clean.StartsWith("'") -and $clean.EndsWith("'")) {
        return $clean.Substring(1, $clean.Length - 2).Replace("''", "'")
    }
    return $clean
}

function Get-FrontmatterValue([string]$Frontmatter, [string]$Key) {
    $pattern = '(?m)^' + [regex]::Escape($Key) + ':[ \t]*([^\r\n]*)\r?$'
    $match = [regex]::Match($Frontmatter, $pattern)
    if (-not $match.Success) { return '' }
    return Convert-YamlScalar $match.Groups[1].Value
}

function Get-FrontmatterListFirst([string]$Frontmatter, [string]$Key) {
    $inline = Get-FrontmatterValue $Frontmatter $Key
    if ($inline) { return $inline }
    $pattern = '(?m)^' + [regex]::Escape($Key) + ':[ \t]*\r?\n[ \t]*-[ \t]*([^\r\n]*)'
    $match = [regex]::Match($Frontmatter, $pattern)
    if (-not $match.Success) { return '' }
    return Convert-YamlScalar $match.Groups[1].Value
}

function Get-Author([string]$Frontmatter) {
    $inline = Get-FrontmatterValue $Frontmatter 'author'
    if ($inline) { return $inline }
    $blockMatch = [regex]::Match($Frontmatter, '(?ms)^author:[ \t]*\r?\n((?:[ \t]+-[^\r\n]*\r?\n?)*)')
    if (-not $blockMatch.Success) { return '' }
    $block = $blockMatch.Groups[1].Value.Replace('\"', '"')
    $nameMatch = [regex]::Match($block, '(?i)"name"\s*:\s*"([^"]+)"')
    if ($nameMatch.Success) { return $nameMatch.Groups[1].Value.Trim() }
    $firstMatch = [regex]::Match($block, '(?m)^[ \t]*-[ \t]*([^\r\n]*)')
    if ($firstMatch.Success) {
        return Convert-YamlScalar $firstMatch.Groups[1].Value
    }
    return ''
}

function Get-BodySourceLine([string]$Text) {
    $fallback = [regex]::Match($Text, '(?m)^>\s*(?:Quelle|Source):\s*(https?://\S+)')
    if ($fallback.Success) { return $fallback.Groups[1].Value.Trim() }
    return ''
}

function Get-InferredYouTubeUrl([string]$Text) {
    $prefixLength = [math]::Min(5000, $Text.Length)
    $prefix = $Text.Substring(0, $prefixLength)
    $match = [regex]::Match($prefix, '(?:!\[[^\]]*\]\()?((?:https?://)?(?:www\.)?(?:youtube\.com/watch\?[^\s\)]+|youtu\.be/[A-Za-z0-9_-]{6,}))')
    if (-not $match.Success) { return '' }
    $url = $match.Groups[1].Value.Trim()
    if ($url -notmatch '^https?://') { $url = 'https://' + $url }
    return $url
}

function Get-YouTubeVideoId([string]$Url) {
    if ($Url -match '(?:youtube\.com/watch\?(?:[^#\r\n]*&)?v=|youtu\.be/)([A-Za-z0-9_-]{6,})') {
        return $matches[1]
    }
    return ''
}

function Get-NormalizedSource([string]$Url) {
    if (-not $Url) { return '' }
    $videoId = Get-YouTubeVideoId $Url
    if ($videoId) { return 'youtube:' + $videoId }
    try {
        $uri = [uri]$Url
        $sourceHost = $uri.Host.ToLowerInvariant() -replace '^www\.', ''
        $path = $uri.AbsolutePath.TrimEnd('/').ToLowerInvariant()
        return $uri.Scheme.ToLowerInvariant() + '://' + $sourceHost + $path
    } catch {
        return 'url:' + $Url.Trim().ToLowerInvariant()
    }
}

function Get-Service([string]$SourceHost, [string]$Extension, [string]$Text) {
    if ($Extension -eq '.eml') {
        if ($Text -match '(?i)substack\.com') { return 'substack-email' }
        return 'email-export'
    }
    if (-not $SourceHost) { return 'missing-source-url' }
    if ($SourceHost -match '(^|\.)(youtube\.com|youtu\.be)$') { return 'youtube' }
    if ($SourceHost -match '(^|\.)(linkedin\.com|lnkd\.in)$') { return 'linkedin' }
    if ($SourceHost -match '(^|\.)(x\.com|twitter\.com|t\.co)$') { return 'x-twitter' }
    if ($SourceHost -match '(^|\.)substack\.com$') { return 'substack-web' }
    if ($SourceHost -match '(^|\.)reddit\.com$') { return 'reddit' }
    if ($SourceHost -match '(^|\.)github\.com$') { return 'github' }
    if ($SourceHost -match '(^|\.)medium\.com$') { return 'medium' }
    return 'website'
}

function Get-EmailHeader([string]$Text, [string]$Name) {
    $match = [regex]::Match($Text, '(?im)^' + [regex]::Escape($Name) + ':\s*([^\r\n]+)')
    if ($match.Success) { return $match.Groups[1].Value.Trim() }
    return ''
}

function Get-FirstLinkedDomain([string]$Text) {
    $match = [regex]::Match($Text, 'https?://[^\s\)\]"''<>]+')
    if (-not $match.Success) { return '' }
    try {
        return ([uri]$match.Value).Host.ToLowerInvariant() -replace '^www\.', ''
    } catch {
        return ''
    }
}

function Escape-MarkdownCell([string]$Value) {
    if ($null -eq $Value) { return '' }
    return ($Value -replace '\|', '\|' -replace '\r?\n', ' ')
}

function Add-MarkdownTable(
    [Collections.Generic.List[string]]$Lines,
    [string[]]$Headers,
    [object[]]$Rows,
    [scriptblock]$Project
) {
    $Lines.Add('| ' + (($Headers | ForEach-Object { Escape-MarkdownCell $_ }) -join ' | ') + ' |')
    $Lines.Add('| ' + (($Headers | ForEach-Object { '---' }) -join ' | ') + ' |')
    foreach ($row in $Rows) {
        $cells = @(& $Project $row)
        $Lines.Add('| ' + (($cells | ForEach-Object { Escape-MarkdownCell ([string]$_) }) -join ' | ') + ' |')
    }
}

$clippingsPath = Resolve-InVault $ClippingsRoot -MustExist
$csvPath = Resolve-InVault $OutputCsv
$reportPath = Resolve-InVault $OutputReport
$csvDirectory = Split-Path -Parent $csvPath
$reportDirectory = Split-Path -Parent $reportPath
if (-not (Test-Path -LiteralPath $csvDirectory)) { [void](New-Item -ItemType Directory -Path $csvDirectory) }
if (-not (Test-Path -LiteralPath $reportDirectory)) { [void](New-Item -ItemType Directory -Path $reportDirectory) }

$rows = foreach ($file in @(Get-ChildItem -LiteralPath $clippingsPath -File | Sort-Object Name)) {
    $text = [IO.File]::ReadAllText($file.FullName)
    $frontmatter = if ($file.Extension -eq '.md') { Get-Frontmatter $text } else { '' }
    $declaredSource = if ($file.Extension -eq '.md') { Get-FrontmatterValue $frontmatter 'source' } else { '' }
    $sourceResolution = if ($declaredSource) { 'frontmatter' } else { 'missing' }
    $source = $declaredSource
    if (-not $source -and $file.Extension -eq '.md') {
        $bodySource = Get-BodySourceLine $text
        if ($bodySource) {
            $source = $bodySource
            $sourceResolution = 'body-source-line'
        }
    }
    if (-not $source -and $file.Extension -eq '.md') {
        $inferredYouTube = Get-InferredYouTubeUrl $text
        if ($inferredYouTube) {
            $source = $inferredYouTube
            $sourceResolution = 'body-youtube-embed'
        }
    }
    $sourceHost = ''
    if ($source) {
        try { $sourceHost = ([uri]$source).Host.ToLowerInvariant() -replace '^www\.', '' } catch {}
    } elseif ($file.Extension -eq '.eml' -and $text -match '(?i)substack\.com') {
        $sourceHost = 'substack.com'
    }
    $author = if ($file.Extension -eq '.md') {
        Get-Author $frontmatter
    } else {
        Get-EmailHeader $text 'From'
    }
    $title = if ($file.Extension -eq '.md') {
        Get-FrontmatterValue $frontmatter 'title'
    } else {
        Get-EmailHeader $text 'Subject'
    }
    $created = if ($file.Extension -eq '.md') {
        Get-FrontmatterValue $frontmatter 'created'
    } else {
        Get-EmailHeader $text 'Date'
    }
    $normalizedSource = Get-NormalizedSource $source
    if (-not $normalizedSource -and $file.Extension -eq '.eml') {
        $messageId = Get-EmailHeader $text 'Message-Id'
        if ($messageId) { $normalizedSource = 'email:' + $messageId }
    }
    $hasTranscript = $file.Extension -eq '.md' -and $text -match '(?im)^##\s+Transcript\s*$'
    [pscustomobject]@{
        file = Get-RelativeVaultPath $file.FullName
        extension = $file.Extension.ToLowerInvariant()
        title = $title
        declared_source_url = $declaredSource
        source_url = $source
        source_resolution = $sourceResolution
        normalized_source = $normalizedSource
        domain = if ($sourceHost) { $sourceHost } else { '(missing)' }
        first_linked_domain = Get-FirstLinkedDomain $text
        service = Get-Service $sourceHost $file.Extension.ToLowerInvariant() $text
        author_or_channel = if ($author) { $author } else { '(missing)' }
        created = $created
        youtube_video_id = Get-YouTubeVideoId $source
        has_transcript_heading = $hasTranscript.ToString().ToLowerInvariant()
        sha256 = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
        bytes = $file.Length
    }
}

$utf8 = New-Object Text.UTF8Encoding($false)
$rows | Export-Csv -LiteralPath $csvPath -NoTypeInformation -Encoding UTF8
$csvText = [IO.File]::ReadAllText($csvPath).Replace("`r`n", "`n")
[IO.File]::WriteAllText($csvPath, $csvText, $utf8)

$sourceRows = @($rows | Where-Object normalized_source)
$duplicateIdentityGroups = @($sourceRows | Group-Object normalized_source | Where-Object Count -gt 1 | Sort-Object Count -Descending)
$exactDuplicateGroups = @($rows | Group-Object sha256 | Where-Object Count -gt 1 | Sort-Object Count -Descending)
$duplicateIdentityFiles = ($duplicateIdentityGroups | ForEach-Object { $_.Count - 1 } | Measure-Object -Sum).Sum
$exactDuplicateFiles = ($exactDuplicateGroups | ForEach-Object { $_.Count - 1 } | Measure-Object -Sum).Sum
if ($null -eq $duplicateIdentityFiles) { $duplicateIdentityFiles = 0 }
if ($null -eq $exactDuplicateFiles) { $exactDuplicateFiles = 0 }

$serviceRows = @($rows | Group-Object service | Sort-Object Count -Descending | ForEach-Object {
    $unique = @($_.Group | Where-Object normalized_source | Select-Object -ExpandProperty normalized_source -Unique).Count
    [pscustomobject]@{
        service = $_.Name
        files = $_.Count
        unique_sources = $unique
        share = '{0:P1}' -f ($_.Count / [double]$rows.Count)
    }
})
$domainRows = @($rows | Group-Object domain | Sort-Object Count -Descending | Select-Object -First 25 | ForEach-Object {
    [pscustomobject]@{
        domain = $_.Name
        files = $_.Count
        unique_sources = @($_.Group | Where-Object normalized_source | Select-Object -ExpandProperty normalized_source -Unique).Count
    }
})
$youtubeAuthorRows = @($rows | Where-Object service -eq 'youtube' | Group-Object author_or_channel | Sort-Object Count -Descending | Select-Object -First 25 | ForEach-Object {
    [pscustomobject]@{ author = $_.Name; files = $_.Count }
})
$websiteAuthorRows = @($rows | Where-Object service -ne 'youtube' | Group-Object author_or_channel | Sort-Object Count -Descending | Select-Object -First 20 | ForEach-Object {
    [pscustomobject]@{ author = $_.Name; files = $_.Count }
})
$captureDateRows = @($rows | Where-Object created | Group-Object created | Sort-Object Name | ForEach-Object {
    [pscustomobject]@{ date = $_.Name; files = $_.Count }
})
$unresolvedSignalRows = @($rows | Where-Object { -not $_.source_url -and $_.extension -eq '.md' } |
    Group-Object { if ($_.first_linked_domain) { $_.first_linked_domain } else { '(no-url)' } } |
    Sort-Object Count -Descending |
    Select-Object -First 25 |
    ForEach-Object {
        [pscustomobject]@{ domain = $_.Name; files = $_.Count }
    })

$report = [Collections.Generic.List[string]]::new()
$report.Add('---')
$report.Add('type: analysis-output')
$report.Add('status: active')
$report.Add('created: ' + $SnapshotDate.ToString('yyyy-MM-dd'))
$report.Add('updated: ' + $SnapshotDate.ToString('yyyy-MM-dd'))
$report.Add('sources:')
$report.Add('  - raw/Clippings/')
$report.Add('---')
$report.Add('')
$report.Add('# Clipping Source Inventory - ' + $SnapshotDate.ToString('yyyy-MM-dd'))
$report.Add('')
$report.Add('**Summary**: Reproducible inventory of the services, websites, authors, channels, source identities, and metadata quality represented in `raw/Clippings/`. Source files were read only.')
$report.Add('')
$report.Add('## Scope and method')
$report.Add('')
$report.Add('- Snapshot root: `raw/Clippings/`')
$report.Add('- Files are grouped by normalized source URL; YouTube URLs are grouped by video ID.')
$report.Add('- URL query strings are ignored for identity grouping, so tracking and timestamp variants collapse.')
$report.Add('- Exact duplicates are grouped by SHA-256.')
$report.Add('- Service labels are inferred from the source URL. The single EML export is classified from its email headers.')
$report.Add('- The inventory describes captured material, not all subscriptions, followed accounts, bookmarks, or feeds.')
$report.Add('')
$report.Add('## Headline results')
$report.Add('')
$report.Add('- Files: ' + $rows.Count)
$report.Add('- Markdown clippings: ' + @($rows | Where-Object extension -eq '.md').Count)
$report.Add('- Email exports: ' + @($rows | Where-Object extension -eq '.eml').Count)
$report.Add('- Files with a source URL: ' + @($rows | Where-Object source_url).Count)
$report.Add('- Source URLs declared in frontmatter: ' + @($rows | Where-Object source_resolution -eq 'frontmatter').Count)
$report.Add('- Source URLs preserved in a body source line: ' + @($rows | Where-Object source_resolution -eq 'body-source-line').Count)
$report.Add('- YouTube URLs inferred from a leading embed: ' + @($rows | Where-Object source_resolution -eq 'body-youtube-embed').Count)
$report.Add('- Files without a resolvable source URL: ' + @($rows | Where-Object { -not $_.source_url }).Count)
$report.Add('- Unique normalized source identities: ' + @($sourceRows | Select-Object -ExpandProperty normalized_source -Unique).Count)
$report.Add('- Additional files sharing an existing source identity: ' + $duplicateIdentityFiles)
$report.Add('- Additional byte-identical files: ' + $exactDuplicateFiles)
$report.Add('- Unique source domains: ' + @($rows | Where-Object { $_.domain -ne '(missing)' } | Select-Object -ExpandProperty domain -Unique).Count)
$report.Add('- Files without author/channel metadata: ' + @($rows | Where-Object author_or_channel -eq '(missing)').Count)
$report.Add('')
$report.Add('## Services')
$report.Add('')
Add-MarkdownTable $report @('Service', 'Files', 'Unique sources', 'Share') $serviceRows {
    param($row)
    @($row.service, $row.files, $row.unique_sources, $row.share)
}
$report.Add('')
$report.Add('## Most represented domains')
$report.Add('')
Add-MarkdownTable $report @('Domain', 'Files', 'Unique sources') $domainRows {
    param($row)
    @($row.domain, $row.files, $row.unique_sources)
}
$report.Add('')
$report.Add('## Most represented YouTube authors or channels')
$report.Add('')
Add-MarkdownTable $report @('Author/channel', 'Files') $youtubeAuthorRows {
    param($row)
    @($row.author, $row.files)
}
$report.Add('')
$report.Add('## Most represented non-YouTube authors')
$report.Add('')
Add-MarkdownTable $report @('Author', 'Files') $websiteAuthorRows {
    param($row)
    @($row.author, $row.files)
}
$report.Add('')
$report.Add('## Legacy files without a canonical source URL')
$report.Add('')
$report.Add('For unresolved legacy files, the first linked domain is retained only as a recovery signal. It may be an image host, CDN, cited source, or social profile and is not treated as verified provenance.')
$report.Add('')
Add-MarkdownTable $report @('First linked domain signal', 'Files') $unresolvedSignalRows {
    param($row)
    @($row.domain, $row.files)
}
$report.Add('')
$report.Add('## Capture dates')
$report.Add('')
Add-MarkdownTable $report @('Created', 'Files') $captureDateRows {
    param($row)
    @($row.date, $row.files)
}
$report.Add('')
$report.Add('## Largest duplicate source-identity groups')
$report.Add('')
if ($duplicateIdentityGroups.Count -eq 0) {
    $report.Add('- None.')
} else {
    $duplicateRows = @($duplicateIdentityGroups | Select-Object -First 25 | ForEach-Object {
        [pscustomobject]@{
            identity = $_.Name
            files = $_.Count
            paths = ($_.Group.file -join '<br>')
        }
    })
    Add-MarkdownTable $report @('Identity', 'Files', 'Paths') $duplicateRows {
        param($row)
        @($row.identity, $row.files, $row.paths)
    }
}
$report.Add('')
$report.Add('## Automation implications')
$report.Add('')
$report.Add('- YouTube should be treated as its own intake adapter using the video ID as the immutable identity and author metadata as the channel label.')
$report.Add('- High-volume publisher domains are candidates for RSS or site-specific discovery; long-tail websites are better served by a one-click URL queue.')
$report.Add('- LinkedIn and X/Twitter need a separate, session-aware or explicit-share path because normal unauthenticated scraping is less reliable.')
$report.Add('- Newsletter email should route through the existing newsletter workflow rather than be mixed into generic web clipping.')
$report.Add('- Missing URLs, missing authors, source-identity duplicates, and exact duplicates should block automatic admission or go to quarantine.')
$report.Add('- Filename generation should happen only after canonical title and source identity are known.')
$report.Add('')
$report.Add('## Generated data')
$report.Add('')
$report.Add('- Row-level inventory: `' + (Get-RelativeVaultPath $csvPath) + '`')
$report.Add('- Generator: `tools/new-clipping-source-inventory.ps1`')

[IO.File]::WriteAllText($reportPath, ($report -join "`n") + "`n", $utf8)

Write-Host "Created inventory for $($rows.Count) files."
Write-Host "Report: $(Get-RelativeVaultPath $reportPath)"
Write-Host "CSV: $(Get-RelativeVaultPath $csvPath)"
