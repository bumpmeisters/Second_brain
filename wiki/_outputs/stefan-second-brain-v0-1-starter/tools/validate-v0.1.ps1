[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$toolDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $toolDirectory
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Add-ValidationError {
    param([string]$Message)
    $errors.Add($Message)
}

function Add-ValidationWarning {
    param([string]$Message)
    $warnings.Add($Message)
}

function Get-ProjectPath {
    param([string]$RelativePath)
    Join-Path $projectRoot $RelativePath
}

Write-Host 'Stefan Second Brain v0.1 - structural validation'
Write-Host "Project: $projectRoot"

$requiredFiles = @(
    'README.md',
    'CLAUDE.md',
    'START-PROMPT.md',
    'context/project-spec.md',
    'context/onboarding.md',
    'references/evidence-model.md',
    '.claude/settings.json',
    'wiki/index.md',
    'wiki/sources.md',
    'wiki/log.md',
    'system/v0.1-acceptance.md',
    'workflows/operations.md'
)

foreach ($relativePath in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Get-ProjectPath $relativePath) -PathType Leaf)) {
        Add-ValidationError "Required file missing: $relativePath"
    }
}

$settingsPath = Get-ProjectPath '.claude/settings.json'
if (Test-Path -LiteralPath $settingsPath -PathType Leaf) {
    try {
        $settings = Get-Content -Raw -Encoding UTF8 -LiteralPath $settingsPath | ConvertFrom-Json
        $denyRules = @($settings.permissions.deny)
        if ($denyRules -notcontains 'Edit(raw/**)') {
            Add-ValidationError 'Claude Code settings do not deny edits to raw/**.'
        }
        if ($denyRules -notcontains 'Read(.env)') {
            Add-ValidationWarning 'Claude Code settings do not deny reading .env.'
        }
    }
    catch {
        Add-ValidationError "Invalid .claude/settings.json: $($_.Exception.Message)"
    }
}

$knowledgeFolders = @(
    'wiki/sources',
    'wiki/claims',
    'wiki/concepts',
    'wiki/objects',
    'wiki/context-packets',
    'wiki/artifacts'
)

foreach ($folder in $knowledgeFolders) {
    $folderPath = Get-ProjectPath $folder
    if (-not (Test-Path -LiteralPath $folderPath -PathType Container)) {
        Add-ValidationError "Knowledge folder missing: $folder"
        continue
    }

    $notes = Get-ChildItem -LiteralPath $folderPath -File -Filter '*.md' |
        Where-Object { $_.Name -ne 'README.md' }

    foreach ($note in $notes) {
        if ($note.BaseName -cnotmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
            Add-ValidationError "Filename is not lowercase-hyphenated: $($note.FullName)"
        }

        $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $note.FullName
        if ($content -notmatch '(?s)\A---\s*\r?\n.*?\r?\n---\s*\r?\n') {
            Add-ValidationError "Missing YAML frontmatter: $($note.FullName)"
            continue
        }
        if ($content -notmatch '(?m)^type:\s*\S+') {
            Add-ValidationError "Missing type property: $($note.FullName)"
        }
        if ($content -notmatch '(?m)^layer:\s*[OLS]\s*$') {
            Add-ValidationError "Missing or invalid layer property: $($note.FullName)"
        }
    }
}

$claimFolder = Get-ProjectPath 'wiki/claims'
if (Test-Path -LiteralPath $claimFolder -PathType Container) {
    $claimFiles = Get-ChildItem -LiteralPath $claimFolder -File -Filter '*.md' |
        Where-Object { $_.Name -ne 'README.md' }

    foreach ($claimFile in $claimFiles) {
        $claim = Get-Content -Raw -Encoding UTF8 -LiteralPath $claimFile.FullName
        $isSupported = $claim -match '(?m)^status:\s*supported\s*$'
        if ($isSupported) {
            if ($claim -match '(?m)^evidence_grade:\s*B0\s*$') {
                Add-ValidationError "Supported claim is still B0: $($claimFile.Name)"
            }
            if (($claim -notmatch '(?m)^sources:\s*') -or ($claim -match '(?m)^sources:\s*\[\s*\]\s*$')) {
                Add-ValidationError "Supported claim has no sources: $($claimFile.Name)"
            }
            if ($claim -match '(?m)^\s*-\s*open\s*$') {
                Add-ValidationError "Supported claim still has open artifact relation: $($claimFile.Name)"
            }
        }
    }
}

$artifactFolder = Get-ProjectPath 'wiki/artifacts'
if (Test-Path -LiteralPath $artifactFolder -PathType Container) {
    $artifactFiles = Get-ChildItem -LiteralPath $artifactFolder -File -Filter '*.md' |
        Where-Object { $_.Name -ne 'README.md' }

    foreach ($artifactFile in $artifactFiles) {
        $artifact = Get-Content -Raw -Encoding UTF8 -LiteralPath $artifactFile.FullName
        $isBeyondDraft = $artifact -match '(?m)^status:\s*(active|approved|published)\s*$'
        if ($isBeyondDraft -and $artifact -match '(?m)^claim_refs:\s*\[\s*\]\s*$') {
            Add-ValidationError "Non-draft artifact has no claim_refs: $($artifactFile.Name)"
        }
        if ($artifact -match '(?m)^revision_needed:\s*true\s*$') {
            Add-ValidationWarning "Artifact needs revision: $($artifactFile.Name)"
        }
    }
}

$sourceFolder = Get-ProjectPath 'wiki/sources'
if (Test-Path -LiteralPath $sourceFolder -PathType Container) {
    $sourceFiles = Get-ChildItem -LiteralPath $sourceFolder -File -Filter '*.md' |
        Where-Object { $_.Name -ne 'README.md' }

    foreach ($sourceFile in $sourceFiles) {
        $sourceNote = Get-Content -Raw -Encoding UTF8 -LiteralPath $sourceFile.FullName
        if ($sourceNote -notmatch '(?m)^source_path:\s*raw[/\\]') {
            Add-ValidationError "Source note does not reference raw/: $($sourceFile.Name)"
        }
    }
}

Push-Location $projectRoot
try {
    & git rev-parse --is-inside-work-tree 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        $modifiedRaw = @(& git diff --name-only --diff-filter=MD -- raw)
        $stagedRaw = @(& git diff --cached --name-only --diff-filter=MD -- raw)
        $protectedChanges = @($modifiedRaw + $stagedRaw | Where-Object { $_ } | Sort-Object -Unique)
        foreach ($changedPath in $protectedChanges) {
            Add-ValidationError "Tracked raw source was modified or deleted: $changedPath"
        }
    }
    else {
        Add-ValidationWarning 'Git repository not initialized; raw-source mutation check skipped.'
    }
}
finally {
    Pop-Location
}

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
