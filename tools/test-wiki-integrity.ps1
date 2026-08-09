param(
    [string]$VaultRoot = "",
    [ValidateSet('Fast', 'Full')][string]$Profile = 'Fast',
    [switch]$Json,
    [switch]$Strict
)

$ErrorActionPreference = 'Stop'
if (-not $VaultRoot) { $VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
$VaultRoot = [IO.Path]::GetFullPath($VaultRoot)
$findings = [Collections.Generic.List[object]]::new()

function Add-Finding([string]$RuleId, [string]$Severity, [string]$Path, [int]$Line, [string]$Message, [string]$SuggestedFix) {
    $findings.Add([pscustomobject][ordered]@{
        rule_id = $RuleId
        severity = $Severity
        path = $Path.Replace('\', '/')
        line = $Line
        message = $Message
        suggested_fix = $SuggestedFix
    })
}

function Get-RelativePath([string]$Path) {
    return [IO.Path]::GetFullPath($Path).Substring($VaultRoot.Length + 1).Replace('\', '/')
}

function Get-Frontmatter([string]$Text) {
    if ($Text -notmatch '(?s)^---\s*\r?\n(.*?)\r?\n---') { return '' }
    return $matches[1]
}

$activePages = @(Get-ChildItem -LiteralPath (Join-Path $VaultRoot 'wiki') -Recurse -File -Filter '*.md' | Where-Object {
    $relative = Get-RelativePath $_.FullName
    $relative -notmatch '^wiki/_(outputs|extractions)/' -and $relative -ne 'wiki/log.md'
})
$corePages = @($activePages | Where-Object { (Split-Path -Parent $_.FullName) -eq (Join-Path $VaultRoot 'wiki') })
$h1ByTitle = @{}

foreach ($page in $activePages) {
    $relative = Get-RelativePath $page.FullName
    $text = [IO.File]::ReadAllText($page.FullName, [Text.Encoding]::UTF8)
    $lineNumber = 0
    foreach ($line in $text -split '\r?\n') {
        $lineNumber++
        if ($line -match '(?:[A-Za-z]:[\\/](?:Users|Documents|Google Drive)|/Users/)[^\s"]*') {
            Add-Finding 'source.absolute-path' 'error' $relative $lineNumber 'Active wiki content contains a user-specific absolute path.' 'Admit the source locally and use a repository-relative path.'
        }
        if ($line -match '\u00C3\u0192|\u00C3\u00A2|\u00E2\u20AC|\u00E2\u20AC\u2122|\u00F0\u0178|\u00EF\u00BB\u00BF') {
            Add-Finding 'encoding.mojibake' 'error' $relative $lineNumber 'Likely UTF-8 mojibake appears in active wiki content.' 'Restore the intended Unicode text from source evidence.'
        }
    }
    if ($relative -like 'wiki/newsletters/*' -and $text -match '\d{4}-\d{2}-\d{2}\d{4}-\d{2}-\d{2}') {
        Add-Finding 'newsletter.malformed-date-range' 'error' $relative 0 'Newsletter coverage contains concatenated ISO dates.' 'Regenerate the newsletter index from the identity registry.'
    }
}

foreach ($page in $corePages) {
    $relative = Get-RelativePath $page.FullName
    $text = [IO.File]::ReadAllText($page.FullName, [Text.Encoding]::UTF8)
    $frontmatter = Get-Frontmatter $text
    if (-not $frontmatter) {
        Add-Finding 'page.frontmatter' 'error' $relative 1 'Core page has no YAML frontmatter.' 'Add the standard page frontmatter block.'
        continue
    }
    foreach ($field in @('type', 'status', 'sources')) {
        if ($frontmatter -notmatch ('(?m)^' + [regex]::Escape($field) + ':')) {
            Add-Finding "page.frontmatter.$field" 'error' $relative 1 "Core page is missing the '$field' frontmatter field." "Add '$field' using the page contract."
        }
    }
    if ($text -notmatch '(?m)^\*\*Summary\*\*:') {
        Add-Finding 'page.summary' 'warning' $relative 0 'Core page has no standard Summary line.' 'Add a one- or two-sentence Summary when the page is next edited.'
    }
    $h1 = @([regex]::Matches($text, '(?m)^#\s+(.+)$'))
    if ($h1.Count -ne 1) {
        Add-Finding 'page.h1-count' 'error' $relative 0 "Core page has $($h1.Count) H1 headings." 'Keep exactly one H1 heading.'
    } else {
        $titleKey = $h1[0].Groups[1].Value.Trim().ToLowerInvariant()
        if (-not $h1ByTitle.ContainsKey($titleKey)) { $h1ByTitle[$titleKey] = [Collections.Generic.List[string]]::new() }
        $h1ByTitle[$titleKey].Add($relative)
    }
    if ($page.BaseName -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$' -and $page.Name -ne 'README.md') {
        Add-Finding 'page.filename' 'error' $relative 0 'Core wiki filename is not lowercase and hyphenated.' 'Rename the page and update inbound links.'
    }
}
foreach ($titleKey in $h1ByTitle.Keys) {
    $paths = @($h1ByTitle[$titleKey])
    if ($paths.Count -gt 1) { Add-Finding 'page.duplicate-h1' 'error' ($paths -join '; ') 0 "Multiple core pages share the H1 '$titleKey'." 'Keep one canonical page title or clarify the distinct concepts.' }
}

$sourcesPath = Join-Path $VaultRoot 'wiki\sources.md'
if (Test-Path -LiteralPath $sourcesPath) {
    $sourcesText = [IO.File]::ReadAllText($sourcesPath, [Text.Encoding]::UTF8)
    if ($sourcesText -match 'Binary source libraries live outside the vault|paths starting with `quellen/` resolve to') {
        Add-Finding 'sources.storage-contract' 'error' 'wiki/sources.md' 0 'Source register describes the obsolete external-library contract.' 'Describe raw/assets and research/assets as the active local libraries.'
    }
}

$practiceLibraryPath = Join-Path $VaultRoot 'wiki\reusable-practices-library.md'
if (Test-Path -LiteralPath $practiceLibraryPath -PathType Leaf) {
    $practiceSection = [IO.File]::ReadAllText($practiceLibraryPath, [Text.Encoding]::UTF8).Split(@('## Admission rule'), [StringSplitOptions]::None)[0]
    foreach ($line in $practiceSection -split '\r?\n') {
        if ($line -notmatch '^- \[\[([^\]|#]+)') { continue }
        $practiceName = $matches[1]
        $practicePath = Join-Path $VaultRoot ("wiki\$practiceName.md")
        if (-not (Test-Path -LiteralPath $practicePath -PathType Leaf)) {
            Add-Finding 'practice.missing' 'error' 'wiki/reusable-practices-library.md' 0 "Registered practice page is missing: $practiceName" 'Restore the page or remove the stale registration.'
            continue
        }
        $practiceText = [IO.File]::ReadAllText($practicePath, [Text.Encoding]::UTF8)
        $practiceFrontmatter = Get-Frontmatter $practiceText
        foreach ($field in @('description', 'use_when', 'avoid_when', 'output')) {
            if ($practiceFrontmatter -notmatch ('(?m)^' + [regex]::Escape($field) + ':\s*\S')) {
                Add-Finding "practice.$field" 'error' (Get-RelativePath $practicePath) 1 "Registered practice has no non-empty '$field' field." "Add the required '$field' routing metadata."
            }
        }
    }
}

$coverageTool = Join-Path $VaultRoot 'tools\new-source-coverage-inventory.ps1'
if (-not (Test-Path -LiteralPath $coverageTool)) {
    Add-Finding 'sources.coverage-tool' 'warning' 'tools/new-source-coverage-inventory.ps1' 0 'Source coverage integration is not installed in this recovery wave.' 'Restore the source coverage generator in its dedicated source-governance wave.'
} else {
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $coverageTool -VaultRoot $VaultRoot -Check 2>&1 | Out-Null
    $coverageExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorActionPreference
    if ($coverageExit -ne 0) { Add-Finding 'sources.coverage-stale' 'error' 'wiki/_outputs/source-coverage/source-inventory.csv' 0 'Source coverage inventory is missing or stale.' 'Regenerate the inventory after source admission or registration changes.' }
}

$newsletterTool = Join-Path $VaultRoot 'tools\update-newsletter-index.ps1'
if (-not (Test-Path -LiteralPath $newsletterTool)) {
    Add-Finding 'newsletter.generator' 'warning' 'tools/update-newsletter-index.ps1' 0 'Newsletter index integration is not installed in this recovery wave.' 'Restore the deterministic generator in its dedicated newsletter-intelligence wave.'
} else {
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $newsletterTool -VaultRoot $VaultRoot -Check 2>&1 | Out-Null
    $newsletterExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorActionPreference
    if ($newsletterExit -ne 0) { Add-Finding 'newsletter.index-stale' 'error' 'wiki/newsletters/index.md' 0 'Newsletter index does not match the identity registry.' 'Regenerate the selected-dossiers table.' }
}

$conversionRegistryPath = Join-Path $VaultRoot 'wiki\_outputs\source-conversions\source-conversion-registry.csv'
$conversionBySource = @{}
if (Test-Path -LiteralPath $conversionRegistryPath) {
    foreach ($row in @(Import-Csv -LiteralPath $conversionRegistryPath -Encoding UTF8)) { $conversionBySource[([string]$row.source).ToLowerInvariant()] = $row }
}
foreach ($page in $activePages) {
    $relative = Get-RelativePath $page.FullName
    $text = [IO.File]::ReadAllText($page.FullName, [Text.Encoding]::UTF8)
    $frontmatter = Get-Frontmatter $text
    foreach ($match in [regex]::Matches($frontmatter, '(?m)^\s*-\s*"?((?:raw|research)/.+?\.(?:docx|pdf|pptx|xlsx))"?\s*$')) {
        $source = $match.Groups[1].Value.Replace('\', '/')
        $sourcePath = Join-Path $VaultRoot $source
        if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
            Add-Finding 'source.cited-missing' 'error' $relative 0 "Cited binary source does not exist: $source" 'Correct the citation or restore the source through the approved inbox.'
            continue
        }
        $record = $conversionBySource[$source.ToLowerInvariant()]
        if (-not $record -or -not $record.target) {
            Add-Finding 'source.sidecar-unregistered' 'error' $relative 0 "Cited binary has no registered sidecar: $source" 'Run the source-ingest readiness gate and create the missing derivative.'
        } elseif (-not (Test-Path -LiteralPath (Join-Path $VaultRoot $record.target) -PathType Leaf)) {
            Add-Finding 'source.sidecar-missing' 'error' $relative 0 "Registered sidecar is missing: $($record.target)" 'Restore or regenerate the derivative without modifying the source.'
        }
    }
}

$allMarkdown = @(Get-ChildItem -LiteralPath $VaultRoot -Recurse -File -Filter '*.md' | Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' })
$targets = @{}
foreach ($file in $allMarkdown) {
    $relativeWithoutExtension = (Get-RelativePath $file.FullName) -replace '\.md$', ''
    $targets[$relativeWithoutExtension.ToLowerInvariant()] = $true
    $targets[$file.BaseName.ToLowerInvariant()] = $true
}
$inbound = @{}
foreach ($page in $activePages) {
    $relative = Get-RelativePath $page.FullName
    $text = [IO.File]::ReadAllText($page.FullName, [Text.Encoding]::UTF8)
    foreach ($match in [regex]::Matches($text, '\[\[([^\]|#]+)')) {
        $target = $match.Groups[1].Value.Trim().Replace('\', '/')
        if (-not $target) { continue }
        $candidate = $target.ToLowerInvariant()
        $candidateWithWiki = ('wiki/' + $target).ToLowerInvariant()
        $candidateSidecar = ($target + '.md').ToLowerInvariant()
        if (-not $targets.ContainsKey($candidate) -and -not $targets.ContainsKey($candidateWithWiki) -and -not $targets.ContainsKey($candidateSidecar)) {
            Add-Finding 'link.unresolved' 'warning' $relative 0 "Wiki link did not resolve uniquely: $target" 'Correct the target or document the intentional placeholder.'
        } else {
            $inbound[$candidate] = 1
            $inbound[[IO.Path]::GetFileName($candidate)] = 1
        }
    }
}

foreach ($page in $corePages) {
    if ($page.BaseName -in @('index', 'sources', 'log')) { continue }
    if (-not $inbound.ContainsKey($page.BaseName.ToLowerInvariant())) {
        Add-Finding 'page.orphan' 'warning' (Get-RelativePath $page.FullName) 0 'Core page has no inbound wiki link.' 'Link it from the canonical index or a related concept page, or document the intentional isolation.'
    }
}

foreach ($rootNote in Get-ChildItem -LiteralPath $VaultRoot -File -Filter 'Untitled*.md') {
    Add-Finding 'root.untitled-duplicate' 'warning' (Get-RelativePath $rootNote.FullName) 0 'Root-level Untitled note is an exact duplicate candidate already represented under raw/.' 'Retain until explicit deletion approval, then remove the duplicate.'
}

if ($Profile -eq 'Full') {
    foreach ($page in $corePages) {
        $relative = Get-RelativePath $page.FullName
        $text = [IO.File]::ReadAllText($page.FullName, [Text.Encoding]::UTF8)
        $frontmatter = Get-Frontmatter $text
        if ($frontmatter -match '(?m)^\s*-\s*research/' -and $frontmatter -notmatch '(?m)^(?:trust|trust_level):') {
            Add-Finding 'research.trust-missing' 'warning' $relative 1 'Page cites AI-generated research without an explicit trust field.' 'Add unverified, partially-verified, or verified trust metadata after review.'
        }
        if ($text -match '(?i)\b(latest|currently|today|current market)\b' -and $frontmatter -match '(?m)^updated:\s*(\d{4}-\d{2}-\d{2})') {
            $updated = [datetime]::ParseExact($matches[1], 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture)
            if (((Get-Date) - $updated).TotalDays -gt 180) { Add-Finding 'claim.stale-candidate' 'warning' $relative 1 'Page contains time-sensitive wording and has not been updated in 180 days.' 'Recheck current claims against authoritative sources.' }
        }
    }
}

$errors = @($findings | Where-Object severity -eq 'error').Count
$warnings = @($findings | Where-Object severity -eq 'warning').Count
$result = [pscustomobject][ordered]@{
    audit_version = 'wiki-integrity/v1'
    profile = $Profile
    passed = ($errors -eq 0 -and (-not $Strict -or $warnings -eq 0))
    errors = $errors
    warnings = $warnings
    findings = @($findings | Sort-Object severity, path, line, rule_id)
}

if ($Json) {
    $result | ConvertTo-Json -Depth 6
} else {
    Write-Output "Wiki integrity $Profile`: $errors error(s), $warnings warning(s)."
    $number = 0
    foreach ($finding in $result.findings) {
        $number++
        $location = if ($finding.line) { "$($finding.path):$($finding.line)" } else { $finding.path }
        Write-Output "$number. [$($finding.severity.ToUpperInvariant())] $($finding.rule_id) - $location - $($finding.message) Suggested fix: $($finding.suggested_fix)"
    }
}
if (-not $result.passed) { exit 2 }
