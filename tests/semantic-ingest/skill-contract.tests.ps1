$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$validator = Join-Path $repo 'tools\validate-local-skill.ps1'
$contract = Join-Path $repo 'tools\config\local-skill-contracts.json'
if (-not (Test-Path -LiteralPath $validator -PathType Leaf)) { throw 'Generic local-skill validator not found.' }
if (-not (Test-Path -LiteralPath $contract -PathType Leaf)) { throw 'Local-skill contract registry not found.' }
$output = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $validator -SkillPath 'skills/semantic-ingest' -Contract $contract '-SkipOfficial' -Json
if ($LASTEXITCODE -ne 0) { throw 'Semantic-ingest skill contract failed.' }
$result = ($output | Out-String) | ConvertFrom-Json
if (-not $result.passed) { throw 'Semantic-ingest skill did not pass the generic validator.' }
if ($result.validator_path -ne 'vault-contract-fallback') { throw 'Forced local fallback did not report its validator path.' }
if ($result.skill -ne 'semantic-ingest') { throw 'Validated skill identity is wrong.' }
if (@($result.errors).Count -ne 0) { throw 'Validated skill returned unexpected errors.' }
if ($result.contract_version -ne 'local-skill-contract/v1') { throw 'Local skill contract version is wrong.' }
Write-Host 'Semantic-ingest skill contract tests passed (6 assertions).'