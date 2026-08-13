param(
    [Parameter(Mandatory = $true)][string]$SkillPath,
    [string]$Contract = 'tools/config/local-skill-contracts.json',
    [string]$PythonPath,
    [string]$OfficialValidator,
    [switch]$SkipOfficial,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$errors = [Collections.Generic.List[object]]::new()
$warnings = [Collections.Generic.List[object]]::new()

function Add-Issue([string]$Level, [string]$Code, [string]$Message, [string]$Path = '') {
    $issue = [pscustomobject][ordered]@{ code = $Code; message = $Message; path = $Path }
    if ($Level -eq 'error') { $errors.Add($issue) } else { $warnings.Add($issue) }
}

function Resolve-VaultPath([string]$Path) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $vaultRoot $Path }
    $full = [IO.Path]::GetFullPath($candidate)
    if ($full -ne $vaultRoot -and -not $full.StartsWith($vaultRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Path is outside the vault: $Path"
    }
    return $full
}

function Get-RelativePath([string]$Path) {
    if ($Path -eq $vaultRoot) { return '.' }
    return $Path.Substring($vaultRoot.Length + 1).Replace('\', '/')
}

$resolvedSkill = Resolve-VaultPath $SkillPath
$skillFile = Join-Path $resolvedSkill 'SKILL.md'
if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) { throw "SKILL.md not found: $SkillPath" }
$skillName = Split-Path -Leaf $resolvedSkill
$validatorPath = 'vault-contract-fallback'
$officialAvailable = $false
$officialReason = 'official validator not probed'

$resolvedOfficial = $OfficialValidator
if (-not $resolvedOfficial) {
    $codexRoot = if ($env:CODEX_HOME) { $env:CODEX_HOME } elseif ($env:USERPROFILE) { Join-Path $env:USERPROFILE '.codex' } else { $null }
    if ($codexRoot) { $resolvedOfficial = Join-Path $codexRoot 'skills\.system\skill-creator\scripts\quick_validate.py' }
}

$resolvedPython = $PythonPath
if (-not $resolvedPython) {
    $pythonCommand = Get-Command python -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($pythonCommand) { $resolvedPython = $pythonCommand.Source }
}
if (-not $resolvedPython -and $env:USERPROFILE) {
    $bundled = Join-Path $env:USERPROFILE '.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
    if (Test-Path -LiteralPath $bundled -PathType Leaf) { $resolvedPython = $bundled }
}

if (-not $SkipOfficial -and $resolvedOfficial -and (Test-Path -LiteralPath $resolvedOfficial -PathType Leaf) -and $resolvedPython -and (Test-Path -LiteralPath $resolvedPython -PathType Leaf)) {
    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $yamlOutput = @(& $resolvedPython -c 'import yaml' 2>&1)
    $yamlExitCode = $LASTEXITCODE
    $ErrorActionPreference = $previousPreference
    if ($yamlExitCode -eq 0) {
        $officialAvailable = $true
        $ErrorActionPreference = 'Continue'
        $officialOutput = @(& $resolvedPython $resolvedOfficial $resolvedSkill 2>&1)
        $officialExitCode = $LASTEXITCODE
        $ErrorActionPreference = $previousPreference
        $validatorPath = 'official+vault-contract'
        if ($officialExitCode -eq 0) {
            $officialReason = 'official validator completed successfully'
        } else {
            $officialReason = 'official validator reported an error'
            Add-Issue error 'OFFICIAL_VALIDATOR_FAILED' ($officialOutput -join [Environment]::NewLine) (Get-RelativePath $skillFile)
        }
    } else {
        $officialReason = 'Python is available but the yaml module is missing'
    }
} elseif (-not $SkipOfficial) {
    $officialReason = 'official validator or Python runtime is unavailable'
} else {
    $officialReason = 'official validator disabled by caller'
}

$content = [IO.File]::ReadAllText($skillFile, [Text.Encoding]::UTF8)
$match = [regex]::Match($content, '^---\r?\n(?<yaml>.*?)\r?\n---', [Text.RegularExpressions.RegexOptions]::Singleline)
if (-not $match.Success) {
    Add-Issue error 'SKILL_FRONTMATTER_INVALID' 'SKILL.md must start with closed YAML frontmatter.' (Get-RelativePath $skillFile)
} else {
    $frontmatter = @{}
    foreach ($line in $match.Groups['yaml'].Value -split '\r?\n') {
        if ($line -notmatch '^(?<key>[A-Za-z0-9_-]+):\s*(?<value>.*)$') {
            Add-Issue error 'SKILL_FRONTMATTER_UNSUPPORTED' "Unsupported frontmatter line: $line" (Get-RelativePath $skillFile)
            continue
        }
        $frontmatter[$matches.key] = $matches.value.Trim().Trim('"').Trim("'")
    }
    foreach ($key in $frontmatter.Keys) {
        if ($key -notin @('name', 'description')) { Add-Issue error 'SKILL_FRONTMATTER_KEY_INVALID' "Unexpected frontmatter key: $key" (Get-RelativePath $skillFile) }
    }
    if (-not $frontmatter.name -or -not $frontmatter.description) { Add-Issue error 'SKILL_FRONTMATTER_REQUIRED' 'Skill name and description are required.' (Get-RelativePath $skillFile) }
    if ($frontmatter.name -ne $skillName) { Add-Issue error 'SKILL_NAME_FOLDER_MISMATCH' 'Skill name must match its folder.' (Get-RelativePath $skillFile) }
    if ($frontmatter.name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$' -or $frontmatter.name.Length -gt 64) { Add-Issue error 'SKILL_NAME_INVALID' 'Skill name must be lowercase hyphen-case and at most 64 characters.' (Get-RelativePath $skillFile) }
    if ($frontmatter.description.Contains('<') -or $frontmatter.description.Contains('>') -or $frontmatter.description.Length -gt 1024) { Add-Issue error 'SKILL_DESCRIPTION_INVALID' 'Skill description contains invalid characters or is too long.' (Get-RelativePath $skillFile) }
}

$contractPath = Resolve-VaultPath $Contract
$contractData = $null
if (Test-Path -LiteralPath $contractPath -PathType Leaf) {
    $contractData = Get-Content -LiteralPath $contractPath -Raw | ConvertFrom-Json
} else {
    Add-Issue warning 'SKILL_CONTRACT_MISSING' 'No vault skill contract was found; dependency checks were skipped.' (Get-RelativePath $contractPath)
}
$contractEntry = if ($contractData) { $contractData.skills.PSObject.Properties[$skillName].Value } else { $null }
if ($contractData -and -not $contractEntry) { Add-Issue warning 'SKILL_CONTRACT_ENTRY_MISSING' 'No dependency contract exists for this skill.' (Get-RelativePath $skillFile) }

$agentPath = Join-Path $resolvedSkill 'agents\openai.yaml'
$requireAgent = $contractEntry -and $contractEntry.require_openai_yaml
if ($requireAgent -and -not (Test-Path -LiteralPath $agentPath -PathType Leaf)) {
    Add-Issue error 'OPENAI_YAML_MISSING' 'agents/openai.yaml is required by the vault contract.' (Get-RelativePath $agentPath)
} elseif (Test-Path -LiteralPath $agentPath -PathType Leaf) {
    $agent = [IO.File]::ReadAllText($agentPath, [Text.Encoding]::UTF8)
    foreach ($field in @('display_name', 'short_description', 'default_prompt')) {
        $fieldMatch = [regex]::Match($agent, ('(?m)^\s+{0}:\s+"(?<value>.*)"\r?$' -f [regex]::Escape($field)))
        if (-not $fieldMatch.Success) { Add-Issue error 'OPENAI_FIELD_INVALID' "Missing or unquoted openai.yaml field: $field" (Get-RelativePath $agentPath) }
    }
    $short = [regex]::Match($agent, '(?m)^\s+short_description:\s+"(?<value>.*)"\r?$').Groups['value'].Value
    if ($short -and ($short.Length -lt 25 -or $short.Length -gt 64)) { Add-Issue error 'OPENAI_SHORT_DESCRIPTION_INVALID' 'short_description must contain 25-64 characters.' (Get-RelativePath $agentPath) }
    $prompt = [regex]::Match($agent, '(?m)^\s+default_prompt:\s+"(?<value>.*)"\r?$').Groups['value'].Value
    if ($prompt -and -not $prompt.Contains('$' + $skillName)) { Add-Issue error 'OPENAI_DEFAULT_PROMPT_INVALID' ('default_prompt must mention $' + $skillName + '.') (Get-RelativePath $agentPath) }
    foreach ($icon in [regex]::Matches($agent, '(?m)^\s+icon_(?:small|large):\s+"(?<value>.+)"\r?$')) {
        $iconPath = [IO.Path]::GetFullPath((Join-Path $resolvedSkill $icon.Groups['value'].Value))
        if (-not $iconPath.StartsWith($resolvedSkill + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $iconPath -PathType Leaf)) {
            Add-Issue error 'OPENAI_ICON_MISSING' 'Referenced skill icon is missing or outside the skill folder.' $icon.Groups['value'].Value
        }
    }
}

foreach ($required in @($contractEntry.required_paths)) {
    $requiredPath = Resolve-VaultPath $required
    if (-not (Test-Path -LiteralPath $requiredPath)) { Add-Issue error 'SKILL_DEPENDENCY_MISSING' 'Required skill dependency is missing.' $required }
}

$result = [pscustomobject][ordered]@{
    contract_version = if ($contractData) { $contractData.contract_version } else { $null }
    skill = $skillName
    passed = ($errors.Count -eq 0)
    validator_path = $validatorPath
    official_available = $officialAvailable
    official_reason = $officialReason
    errors = @($errors)
    warnings = @($warnings)
}
if ($Json) { $result | ConvertTo-Json -Depth 8 } else {
    $result | Format-List skill, passed, validator_path, official_available, official_reason
    if ($errors.Count) { $errors | Format-Table -AutoSize -Wrap }
    if ($warnings.Count) { $warnings | Format-Table -AutoSize -Wrap }
}
if ($errors.Count) { exit 2 }