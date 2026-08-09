param(
    [ValidateSet('Agent', 'ScheduledTask')]
    [string]$Purpose = 'Agent',

    [string]$VaultRoot = '',

    [string]$ContractPath = '',

    [switch]$InspectOnly,

    [switch]$PathOnly,

    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ($PathOnly -and $Json) {
    throw 'Use either -PathOnly or -Json, not both.'
}

if (-not $VaultRoot) {
    $VaultRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
}
else {
    $VaultRoot = [IO.Path]::GetFullPath($VaultRoot)
}

if (-not $ContractPath) {
    $ContractPath = Join-Path $VaultRoot 'tools\config\python-runtime-contract.json'
}

if (-not (Test-Path -LiteralPath $ContractPath -PathType Leaf)) {
    throw "Python runtime contract not found: $ContractPath"
}

$contract = Get-Content -LiteralPath $ContractPath -Raw -Encoding utf8 | ConvertFrom-Json
if ($contract.schema_version -ne 1) {
    throw "Unsupported Python runtime contract schema: $($contract.schema_version)"
}

$minimumVersion = [version]$contract.minimum_version
$requiredModules = @($contract.required_modules | ForEach-Object { [string]$_ })
$purposeProperty = $contract.purposes.PSObject.Properties[$Purpose]
if (-not $purposeProperty -or @($purposeProperty.Value).Count -eq 0) {
    throw "Python runtime contract has no candidates for purpose: $Purpose"
}

function Resolve-CandidatePath {
    param([Parameter(Mandatory = $true)][string]$Candidate)

    $expanded = [Environment]::ExpandEnvironmentVariables($Candidate)
    $looksLikePath = [IO.Path]::IsPathRooted($expanded) -or
        $expanded.Contains([IO.Path]::DirectorySeparatorChar) -or
        $expanded.Contains([IO.Path]::AltDirectorySeparatorChar)

    if ($looksLikePath) {
        $fullPath = [IO.Path]::GetFullPath($expanded)
        if (Test-Path -LiteralPath $fullPath -PathType Leaf) {
            return $fullPath
        }
        return $null
    }

    $command = Get-Command $expanded -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1
    if ($command) {
        return $command.Source
    }

    return $null
}

$resolvedCandidates = [Collections.Generic.List[string]]::new()
foreach ($candidate in @($purposeProperty.Value)) {
    $resolved = Resolve-CandidatePath -Candidate ([string]$candidate)
    if ($resolved -and -not $resolvedCandidates.Contains($resolved)) {
        $resolvedCandidates.Add($resolved)
    }
}

if ($resolvedCandidates.Count -eq 0) {
    throw "No configured Python executable exists for purpose '$Purpose'. Checked contract: $ContractPath"
}

if ($InspectOnly) {
    $result = [ordered]@{
        status = 'present-not-executed'
        purpose = $Purpose
        executable = $resolvedCandidates[0]
        minimum_version = $minimumVersion.ToString()
        required_modules = $requiredModules
        contract = [IO.Path]::GetFullPath($ContractPath)
    }

    if ($PathOnly) {
        $result.executable
    }
    elseif ($Json) {
        $result | ConvertTo-Json -Depth 4
    }
    else {
        [pscustomobject]$result
    }
    exit 0
}

$requiredModulesJson = ConvertTo-Json -Compress -InputObject @($requiredModules)
$probe = @"
import importlib.util, json, sqlite3, sys
required = $requiredModulesJson
missing = [name for name in required if importlib.util.find_spec(name) is None]
print(json.dumps({
    "version": ".".join(map(str, sys.version_info[:3])),
    "executable": sys.executable,
    "sqlite_version": sqlite3.sqlite_version,
    "missing_modules": missing
}))
"@
$encodedProbe = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($probe))
$probeCommand = "import base64;exec(base64.b64decode('$encodedProbe'))"

$diagnostics = [Collections.Generic.List[object]]::new()
$ready = $null

foreach ($executable in $resolvedCandidates) {
    try {
        $probeOutput = & $executable -c $probeCommand 2>&1 | Out-String
        if ($LASTEXITCODE -ne 0) {
            throw "Python probe exited with code $LASTEXITCODE. $($probeOutput.Trim())"
        }

        $details = $probeOutput.Trim() | ConvertFrom-Json
        $version = [version]$details.version
        if ($version -lt $minimumVersion) {
            $diagnostics.Add([pscustomobject]@{
                executable = $executable
                status = 'version-too-old'
                message = "Found $version; require at least $minimumVersion."
            })
            continue
        }

        $missingModules = @($details.missing_modules)
        if ($missingModules.Count -gt 0) {
            $diagnostics.Add([pscustomobject]@{
                executable = $executable
                status = 'missing-modules'
                message = "Missing required modules: $($missingModules -join ', ')."
            })
            continue
        }

        $ready = [ordered]@{
            status = 'ready'
            purpose = $Purpose
            executable = [IO.Path]::GetFullPath([string]$details.executable)
            version = $version.ToString()
            sqlite_version = [string]$details.sqlite_version
            minimum_version = $minimumVersion.ToString()
            required_modules = $requiredModules
            contract = [IO.Path]::GetFullPath($ContractPath)
        }
        break
    }
    catch {
        $diagnostics.Add([pscustomobject]@{
            executable = $executable
            status = 'launch-failed'
            message = $_.Exception.Message
        })
    }
}

if (-not $ready) {
    $diagnosticText = $diagnostics | ConvertTo-Json -Depth 4 -Compress
    throw @"
No configured Python runtime passed the preflight for purpose '$Purpose'.
Diagnostics: $diagnosticText
If an executable exists under AppData but launch failed with 'Access is denied' inside Codex, this is a sandbox restriction, not proof that Python is absent. Retry the exact preflight with elevated sandbox permission.
"@
}

if ($PathOnly) {
    $ready.executable
}
elseif ($Json) {
    $ready | ConvertTo-Json -Depth 4
}
else {
    [pscustomobject]$ready
}
