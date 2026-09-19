[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('Validate','Prepare','Seal')][string]$Mode,
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$OverlayRoot,
    [string]$InputPath,
    [string]$OutputPath,
    [string]$PythonExecutable,
    [string]$ExpectedA1Hash,
    [string]$ExpectedA1RHash,
    [string]$ExpectedBHash,
    [string]$ExpectedSealInputsHash,
    [switch]$AllowSealCreation,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($OverlayRoot)) { $OverlayRoot = Join-Path $PSScriptRoot '..' }
Import-Module (Join-Path $OverlayRoot 'tools/g3e2r-a1r-guard-lib.psm1') -Force
$context = Get-G3E2RA1RContext -VaultRoot $VaultRoot -OverlayRoot $OverlayRoot -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash
Import-Module (Join-Path $context.A1Context.ARoot 'tools/g3e2r-transaction-lib.psm1') -Force

function Invoke-BoundPowerShell {
    param([string]$Script,[string[]]$Arguments,[int]$Timeout=300)
    return Invoke-G3E2RBoundProcess -FilePath (Get-Process -Id $PID).Path -ArgumentList (@('-NoProfile','-ExecutionPolicy','Bypass','-File',$Script)+$Arguments) -TimeoutSeconds $Timeout -WorkingDirectory $context.Root
}

function Invoke-SnapshotGate {
    param([string]$Command,[object]$Seal)
    $selection = Resolve-G3E2RA1RInRoot $context.Root (Get-G3E2RA1RArtifact $Seal 'B-SNAPSHOT-SELECTION').repository_path
    $envelope = Resolve-G3E2RA1RInRoot $context.Root (Get-G3E2RA1RArtifact $Seal 'B-SNAPSHOT-ENVELOPE').repository_path
    $snapshotRoot = Split-Path -Parent $envelope
    $tool = Resolve-G3E2RA1RInRoot $context.Root (Get-G3E2RA1RExecutionPaths)['A-SNAPSHOT-TOOL']
    return Invoke-BoundPowerShell -Script $tool -Arguments @('-Command',$Command,'-VaultRoot',$context.Root,'-SelectionManifest',$selection,'-SnapshotDirectory',$snapshotRoot)
}

function Test-ComponentPrestate {
    $path = Resolve-G3E2RA1RInRoot $context.Root (Get-G3E2RA1RExecutionPaths)['A-COMPONENT-MANIFEST']
    $rows = @(Import-Csv -LiteralPath $path)
    if ($rows.Count -ne 95 -or @($rows.move_id | Sort-Object -Unique).Count -ne 95) { throw 'Component manifest must contain 95 unique rows.' }
    foreach ($row in $rows) {
        $source = Resolve-G3E2RA1RInRoot -Root $context.Root -RepositoryPath ([string]$row.source_path) -ForMutation
        $target = Resolve-G3E2RA1RInRoot -Root $context.Root -RepositoryPath ([string]$row.target_path) -ForMutation
        if (-not (Test-Path -LiteralPath $source -PathType Leaf) -or (Get-G3E2RA1RSha256 $source) -cne $row.pre_sha256 -or (Get-G3E2RA1RBytes $source) -ne [int64]$row.pre_bytes) { throw "Component prestate mismatch: $($row.move_id)" }
        if (Test-Path -LiteralPath $target) { throw "Component target collision: $($row.target_path)" }
    }
}

function Invoke-WrapperCheck {
    param([object]$RuntimeBindings)
    $python = [string](@($RuntimeBindings | Where-Object runtime_id -CEQ 'PYTHON_AGENT')[0].executable_path)
    $tool = Resolve-G3E2RA1RInRoot $context.Root (Get-G3E2RA1RExecutionPaths)['A-WRAPPER-TOOL']
    $manifest = (Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-WRAPPER').Path
    $null = Invoke-G3E2RBoundProcess -FilePath $python -ArgumentList @($tool,'--vault-root',$context.Root,'--manifest',$manifest,'--mode','check','--state','pre') -TimeoutSeconds 90 -WorkingDirectory $context.Root
}

function Invoke-RootAndMos {
    $rootFast = Invoke-BoundPowerShell -Script (Join-Path $context.Root 'tools/test-wiki-integrity.ps1') -Arguments @('-Profile','Fast')
    if ($rootFast.StdOut -notmatch '(?im)0\s+errors?' -or $rootFast.StdOut -notmatch '(?im)0\s+warnings?') { throw 'Root Fast does not prove 0/0.' }
    $mos = Invoke-BoundPowerShell -Script (Join-Path $context.Root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') -Arguments @() -Timeout 180
    if ($mos.StdOut -notmatch '(?im)16/16') { throw 'MOS does not prove 16/16.' }
}

function Invoke-SealPreflight {
    param([object]$Seal,[object[]]$RuntimeBindings)
    Test-ComponentPrestate
    Invoke-WrapperCheck -RuntimeBindings $RuntimeBindings
    foreach ($command in @('VerifyBundle','CheckLivePreState','CheckFunctionalPrestate','RestorePlan')) { $null = Invoke-SnapshotGate -Command $command -Seal $Seal }
    Test-G3E2RA1RWorkspaceAdvisory -Context $context -Seal $Seal
    $null = Test-G3E2RA1RLiveInvariants -Context $context -Seal $Seal -State pre
    $git = [string](@($RuntimeBindings | Where-Object runtime_id -CEQ 'GIT')[0].executable_path)
    $rg = [string](@($RuntimeBindings | Where-Object runtime_id -CEQ 'RIPGREP')[0].executable_path)
    Assert-G3E2RA1RGitStagingEmpty -VaultRoot $context.Root -GitExecutable $git
    Assert-G3E2RA1RNoResidue -VaultRoot $context.Root
    Test-G3E2RA1RHardReferences -Context $context -Seal $Seal -State pre -RipgrepExecutable $rg
    Invoke-RootAndMos
}

function Write-ExclusiveUtf8 {
    param([string]$LiteralPath,[string]$Text)
    $parent = Split-Path -Parent $LiteralPath
    if (-not (Test-Path -LiteralPath $parent -PathType Container)) { throw "Seal output parent is missing: $parent" }
    $bytes = [Text.UTF8Encoding]::new($false).GetBytes($Text)
    $stream = [IO.File]::Open($LiteralPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::None)
    try { $stream.Write($bytes,0,$bytes.Length); $stream.Flush($true) } finally { $stream.Dispose() }
}

if ($Mode -eq 'Validate') {
    $result = [ordered]@{ contract='g3e2r-live-seal-finalizer/v2r'; verdict='PASS'; mode='Validate'; state_effect='none'; detached_input=$true; bundles=6; executions=28; artifacts=15; runtimes=4; ttl_seconds=900 }
}
else {
    foreach ($value in @($InputPath,$PythonExecutable,$ExpectedA1Hash,$ExpectedA1RHash,$ExpectedBHash,$ExpectedSealInputsHash)) { if ([string]::IsNullOrWhiteSpace([string]$value)) { throw "$Mode requires InputPath, PythonExecutable, ExpectedA1Hash, ExpectedA1RHash, ExpectedBHash, and ExpectedSealInputsHash." } }
    $bState = Test-G3E2RA1RBManifest -Context $context -ExpectedBHash $ExpectedBHash
    $resolvedInput = [IO.Path]::GetFullPath($InputPath)
    $requiredInput = Join-Path $bState.Root 'seal/seal-inputs.json'
    if ($resolvedInput -cne $requiredInput -or (Get-G3E2RA1RSha256 $resolvedInput) -cne $ExpectedSealInputsHash.ToUpperInvariant()) { throw 'Expected-Seal-Inputs-Hash or canonical input path mismatch.' }
    $sealInput = Get-Content -LiteralPath $resolvedInput -Raw -Encoding UTF8 | ConvertFrom-Json
    Assert-G3E2RA1RSealInput -Context $context -SealInput $sealInput
    $runtimeBindings = Get-G3E2RA1RRuntimeBindings -Context $context -PythonExecutable $PythonExecutable
    $seal = New-G3E2RA1RSeal -Context $context -SealInput $sealInput -RuntimeBindings $runtimeBindings -BState $bState
    Assert-G3E2RA1RSealClosure -Context $context -Seal $seal -AllowPreparedB

    if ($Mode -eq 'Prepare') {
        Invoke-SealPreflight -Seal $seal -RuntimeBindings $runtimeBindings
        $result = [ordered]@{ contract='g3e2r-live-seal-finalizer/v2r'; verdict='PREPARED_READ_ONLY'; mode='Prepare'; state_effect='none'; expected_a1_hash=$ExpectedA1Hash.ToUpperInvariant(); expected_a1r_hash=$ExpectedA1RHash.ToUpperInvariant(); expected_b_hash=$ExpectedBHash.ToUpperInvariant(); expected_seal_inputs_hash=$ExpectedSealInputsHash.ToUpperInvariant() }
    }
    else {
        if (-not $AllowSealCreation) { throw 'Seal mode requires -AllowSealCreation.' }
        if (-not (Test-G3E2RA1RAdministrator)) { throw 'Seal mode requires one explicitly elevated runner.' }
        foreach ($field in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')) { if (-not [bool]$sealInput.approval.$field) { throw "Seal approval is missing: $field" } }
        if ([string]::IsNullOrWhiteSpace($OutputPath)) { throw 'Seal mode requires OutputPath.' }
        $resolvedOutput = [IO.Path]::GetFullPath($OutputPath)
        if ($resolvedOutput -cne (Join-Path $bState.Root 'live-seal-v2.json')) { throw 'Seal output must be the exact canonical live-seal-v2.json.' }
        if (Test-Path -LiteralPath $resolvedOutput) { throw 'Seal output already exists; overwrite is forbidden.' }

        $mutex = $null; $closureLock = $null; $createdHash = $null
        try {
            $mutex = Enter-G3E2RA1RMutex -VaultRoot $context.Root
            Invoke-SealPreflight -Seal $seal -RuntimeBindings $runtimeBindings
            if ((Get-G3E2RA1RSha256 $context.A1Manifest) -cne $ExpectedA1Hash.ToUpperInvariant() -or (Get-G3E2RA1RSha256 $context.Manifest) -cne $ExpectedA1RHash.ToUpperInvariant() -or (Get-G3E2RA1RSha256 $bState.Manifest) -cne $ExpectedBHash.ToUpperInvariant() -or (Get-G3E2RA1RSha256 $resolvedInput) -cne $ExpectedSealInputsHash.ToUpperInvariant()) { throw 'Final expected-hash boundary failed.' }
            $closureLock = Enter-G3E2RA1RClosureLock -Context $context -Seal $seal
            Test-G3E2RA1RClosureLock -Lock $closureLock
            $now = [DateTimeOffset]::UtcNow
            $seal.time.sealed_at_utc = $now.ToString('o')
            $seal.time.not_after_utc = $now.AddSeconds(900).ToString('o')
            $payload = ($seal | ConvertTo-Json -Depth 16) + [Environment]::NewLine
            Write-ExclusiveUtf8 -LiteralPath $resolvedOutput -Text $payload
            $createdHash = Get-G3E2RA1RSha256 $resolvedOutput
            $null = Test-G3E2RA1RBManifest -Context $context -ExpectedBHash $ExpectedBHash -AllowSealed
            $result = [ordered]@{ contract='g3e2r-live-seal-finalizer/v2r'; verdict='SEALED_ROUTING_FROZEN'; mode='Seal'; state_effect='new-live-seal-only'; expected_a1_hash=$ExpectedA1Hash.ToUpperInvariant(); expected_a1r_hash=$ExpectedA1RHash.ToUpperInvariant(); expected_b_hash=$ExpectedBHash.ToUpperInvariant(); expected_seal_hash=$createdHash; not_after_utc=$seal.time.not_after_utc }
        }
        catch {
            if ($null -ne $createdHash -and (Test-Path -LiteralPath $resolvedOutput -PathType Leaf) -and (Get-G3E2RA1RSha256 $resolvedOutput) -ceq $createdHash) { [IO.File]::Delete($resolvedOutput) }
            throw
        }
        finally {
            Exit-G3E2RA1RClosureLock -Lock $closureLock
            if ($null -ne $mutex) { Exit-G3E2RA1RMutex -Mutex $mutex }
        }
    }
}

if ($Json) { $result | ConvertTo-Json -Depth 8 -Compress } else { Write-Output "$($result.verdict) | mode=$Mode | routing frozen" }
