$ErrorActionPreference = 'Stop'

$vault = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$resolver = Join-Path $vault 'tools\resolve-python-runtime.ps1'
$contract = Join-Path $vault 'tools\config\python-runtime-contract.json'

if (-not (Test-Path -LiteralPath $resolver -PathType Leaf)) {
    throw "Python runtime resolver not found: $resolver"
}
if (-not (Test-Path -LiteralPath $contract -PathType Leaf)) {
    throw "Python runtime contract not found: $contract"
}

$agent = & $resolver -Purpose Agent -Json | ConvertFrom-Json
if ($agent.status -ne 'ready') {
    throw "Agent Python runtime is not ready: $($agent.status)"
}
if ([version]$agent.version -lt [version]'3.11.0') {
    throw "Agent Python runtime is too old: $($agent.version)"
}
if (-not $agent.sqlite_version) {
    throw 'Agent Python runtime did not report SQLite support.'
}
if (-not [IO.Path]::IsPathRooted([string]$agent.executable)) {
    throw 'Agent Python resolver did not return an absolute path.'
}

$agentPath = & $resolver -Purpose Agent -PathOnly
if ($agentPath -ne $agent.executable) {
    throw 'Path-only and JSON resolution returned different Agent executables.'
}

$pathOnlyContract = Join-Path ([IO.Path]::GetTempPath()) (
    'python-runtime-path-' + [guid]::NewGuid().ToString('N') + '.json'
)
$previousPath = $env:PATH
try {
    $env:PATH = (Split-Path -Parent $agent.executable) + [IO.Path]::PathSeparator + $previousPath
    @{
        schema_version = 1
        minimum_version = '3.11.0'
        required_modules = @('sqlite3')
        purposes = @{ Agent = @('python.exe'); ScheduledTask = @('python.exe') }
    } | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $pathOnlyContract -Encoding utf8
    $pathAgent = & $resolver -Purpose Agent -ContractPath $pathOnlyContract -Json | ConvertFrom-Json
    if ($pathAgent.status -ne 'ready' -or -not [IO.Path]::IsPathRooted([string]$pathAgent.executable)) {
        throw 'PATH-only Python fallback did not resolve to a ready absolute executable.'
    }
}
finally {
    $env:PATH = $previousPath
    if (Test-Path -LiteralPath $pathOnlyContract) {
        Remove-Item -LiteralPath $pathOnlyContract -Force
    }
}

$scheduled = & $resolver -Purpose ScheduledTask -InspectOnly -Json | ConvertFrom-Json
if ($scheduled.status -ne 'present-not-executed') {
    throw "Scheduled-task inspection returned an unexpected status: $($scheduled.status)"
}
if (-not (Test-Path -LiteralPath $scheduled.executable -PathType Leaf)) {
    throw "Configured scheduled-task Python does not exist: $($scheduled.executable)"
}

$invalidContract = Join-Path ([IO.Path]::GetTempPath()) (
    'python-runtime-invalid-' + [guid]::NewGuid().ToString('N') + '.json'
)
try {
    '{"schema_version":99}' | Set-Content -LiteralPath $invalidContract -Encoding utf8
    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $resolver `
        -ContractPath $invalidContract `
        -Purpose Agent 2>&1 | Out-Null
    $invalidExitCode = $LASTEXITCODE
    $ErrorActionPreference = $previousPreference
    if ($invalidExitCode -eq 0) {
        throw 'Resolver accepted an unsupported runtime-contract schema.'
    }
}
finally {
    if (Test-Path -LiteralPath $invalidContract) {
        Remove-Item -LiteralPath $invalidContract -Force
    }
}

Write-Host 'Python runtime contract tests passed.'
