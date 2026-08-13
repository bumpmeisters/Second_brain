$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$fixture = Join-Path $repo '.tmp\local-skill-validator-tests'
$validator = Join-Path $repo 'tools\validate-local-skill.ps1'

function Write-Utf8([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Force $parent | Out-Null }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

function New-Fixture {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
    $skill = Join-Path $fixture 'sample-skill'
    New-Item -ItemType Directory -Force (Join-Path $skill 'agents') | Out-Null
    Write-Utf8 (Join-Path $skill 'SKILL.md') "---`nname: sample-skill`ndescription: Validate a small reusable sample skill for deterministic local contract tests.`n---`n`n# Sample Skill`n`nFollow the sample workflow."
    $agentYaml = @'
interface:
  display_name: "Sample Skill"
  short_description: "Validate a deterministic local sample skill"
  default_prompt: "Use $sample-skill to validate this sample."
'@
    Write-Utf8 (Join-Path $skill 'agents\openai.yaml') $agentYaml
    Write-Utf8 (Join-Path $fixture 'dependency.txt') 'required'
    $contract = [ordered]@{ contract_version = 'local-skill-contract/v1'; skills = [ordered]@{ 'sample-skill' = [ordered]@{ require_openai_yaml = $true; required_paths = @('.tmp/local-skill-validator-tests/dependency.txt') } } }
    Write-Utf8 (Join-Path $fixture 'contract.json') ($contract | ConvertTo-Json -Depth 6)
}

function Invoke-Validation {
    $arguments = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $validator, '-SkillPath', (Join-Path $fixture 'sample-skill'), '-Contract', (Join-Path $fixture 'contract.json'), '-SkipOfficial', '-Json')
    $output = & powershell.exe @arguments 2>$null
    $code = $LASTEXITCODE
    $result = ($output | Out-String) | ConvertFrom-Json
    return [pscustomobject]@{ code = $code; result = $result }
}

try {
    New-Fixture
    $run = Invoke-Validation
    if ($run.code -ne 0 -or -not $run.result.passed -or $run.result.validator_path -ne 'vault-contract-fallback') { throw 'Valid generic skill fixture did not pass through the local fallback.' }

    New-Fixture
    $agentPath = Join-Path $fixture 'sample-skill\agents\openai.yaml'; $agent = [IO.File]::ReadAllText($agentPath); Write-Utf8 $agentPath ($agent.Replace('$sample-skill', '$wrong-skill'))
    $run = Invoke-Validation
    if ($run.code -ne 2 -or $run.result.errors.code -notcontains 'OPENAI_DEFAULT_PROMPT_INVALID') { throw 'Invalid default prompt was not rejected.' }

    New-Fixture
    Remove-Item -LiteralPath (Join-Path $fixture 'dependency.txt') -Force
    $run = Invoke-Validation
    if ($run.code -ne 2 -or $run.result.errors.code -notcontains 'SKILL_DEPENDENCY_MISSING') { throw 'Missing skill dependency was not rejected.' }

    New-Fixture
    $skillPath = Join-Path $fixture 'sample-skill\SKILL.md'; $skill = [IO.File]::ReadAllText($skillPath); Write-Utf8 $skillPath ($skill.Replace('name: sample-skill', 'name: other-skill'))
    $run = Invoke-Validation
    if ($run.code -ne 2 -or $run.result.errors.code -notcontains 'SKILL_NAME_FOLDER_MISMATCH') { throw 'Skill/folder mismatch was not rejected.' }
}
finally {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}
Write-Host 'Generic local-skill validator tests passed (4 assertions).'