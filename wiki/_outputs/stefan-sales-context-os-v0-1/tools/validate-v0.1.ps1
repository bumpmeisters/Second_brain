[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$toolDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $toolDirectory
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Project-Path([string]$RelativePath) {
    Join-Path $projectRoot $RelativePath
}

$requiredFiles = @(
    'README.md',
    'CLAUDE.md',
    'START-PROMPT.md',
    'SETUP-WINDOWS.md',
    '.claude/settings.json',
    'context/sales-operating-profile.md',
    'references/sales-knowledge-model.md',
    'workflows/sales-context-operations.md',
    'workflows/content-intelligence-pipeline.md',
    'templates/sales-context-templates.md',
    'system/v0.1-acceptance.md',
    'system/decision-log.md',
    'raw/README.md',
    'raw/inbox/README.md',
    'wiki/index.md',
    'wiki/sources.md',
    'wiki/log.md'
)

foreach ($file in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Project-Path $file) -PathType Leaf)) {
        $errors.Add("Required file missing: $file")
    }
}

$settingsPath = Project-Path '.claude/settings.json'
if (Test-Path -LiteralPath $settingsPath -PathType Leaf) {
    try {
        $settings = Get-Content -Raw -Encoding UTF8 -LiteralPath $settingsPath | ConvertFrom-Json
        $deny = @($settings.permissions.deny)
        if ($deny -notcontains 'Edit(raw/**)') {
            $errors.Add('settings.json must deny Edit(raw/**).')
        }
        if ($deny -notcontains 'Read(.env)') {
            $warnings.Add('settings.json does not deny Read(.env).')
        }
    }
    catch {
        $errors.Add("Invalid settings.json: $($_.Exception.Message)")
    }
}

$claudePath = Project-Path 'CLAUDE.md'
if (Test-Path -LiteralPath $claudePath -PathType Leaf) {
    $claude = Get-Content -Raw -Encoding UTF8 -LiteralPath $claudePath
    foreach ($requiredPhrase in @('Deutschlandmodus v0.1', 'Emotionserkennung', 'Trenne immer')) {
        if ($claude -notmatch [regex]::Escape($requiredPhrase)) {
            $errors.Add("CLAUDE.md guardrail missing: $requiredPhrase")
        }
    }
}

$contentFiles = Get-ChildItem -LiteralPath (Project-Path 'wiki') -Recurse -File -Filter '*.md'
foreach ($file in $contentFiles) {
    if ($file.Directory.Name -in @('accounts', 'conversations', 'patterns', 'context-packets', 'artifacts', 'sources')) {
        if ($file.BaseName -cnotmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$' -and $file.Name -ne 'README.md') {
            $errors.Add("Knowledge filename is not lowercase-hyphenated: $($file.FullName)")
        }
    }
}

Write-Host 'Stefan Sales Context OS v0.1 - structural validation'
Write-Host "Project: $projectRoot"
Write-Host ''

foreach ($warning in $warnings) {
    Write-Host "WARN: $warning" -ForegroundColor Yellow
}
foreach ($validationError in $errors) {
    Write-Host "ERROR: $validationError" -ForegroundColor Red
}

Write-Host ''
Write-Host "Warnings: $($warnings.Count)"
Write-Host "Errors:   $($errors.Count)"

if ($errors.Count -gt 0) {
    exit 1
}

Write-Host 'PASS: structural validation completed.' -ForegroundColor Green
exit 0
