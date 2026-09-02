[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('Validate','Simulate','Apply')][string]$Mode,
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$OverlayRoot,
    [string]$SealEnvelope,
    [string]$PythonExecutable,
    [string]$FailAtStep,
    [string]$ExpectedA1Hash,
    [string]$ExpectedA1RHash,
    [string]$ExpectedSealHash,
    [switch]$AllowLiveMutation,
    [switch]$AllowAutomaticReverse,
    [switch]$AllowCapabilityProbe,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($OverlayRoot)) { $OverlayRoot = Join-Path $PSScriptRoot '..' }
Import-Module (Join-Path $OverlayRoot 'tools/g3e2r-a1r-guard-lib.psm1') -Force
$context = Get-G3E2RA1RContext -VaultRoot $VaultRoot -OverlayRoot $OverlayRoot -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash
Import-Module (Join-Path $context.A1Context.ARoot 'tools/g3e2r-transaction-lib.psm1') -Force
$root = $context.Root
$repair = $context.A1Context.ARoot
$paths = Get-G3E2RA1RExecutionPaths
$componentPath = Resolve-G3E2RA1RInRoot $root $paths['A-COMPONENT-MANIFEST']
$forwardPath = Resolve-G3E2RA1RInRoot $root $paths['A-FORWARD-MANIFEST']
$reversePath = Resolve-G3E2RA1RInRoot $root $paths['A-REVERSE-MANIFEST']
$snapshotTool = Resolve-G3E2RA1RInRoot $root $paths['A-SNAPSHOT-TOOL']
$wrapperTool = Resolve-G3E2RA1RInRoot $root $paths['A-WRAPPER-TOOL']
$reverseTool = Join-Path $context.Overlay 'tools/invoke-g3e2-reverse-v2r.ps1'
$powerShellExecutable = (Get-Process -Id $PID).Path

function Get-StaticState {
    $components = @(Import-Csv -LiteralPath $componentPath)
    if ($components.Count -ne 95 -or @($components.move_id | Sort-Object -Unique).Count -ne 95 -or @($components | Where-Object identity_state -CEQ 'byte-identical').Count -ne 74 -or @($components | Where-Object identity_state -CEQ 'reviewed-refactor-candidate').Count -ne 21) { throw 'Component transition must contain the exact 95-row 74/21 split.' }
    $forward = Import-G3E2RTransactionManifest -LiteralPath $forwardPath -Prefix FWD -ExpectedCount 19
    $reverse = Import-G3E2RTransactionManifest -LiteralPath $reversePath -Prefix REV -ExpectedCount 12
    return [pscustomobject]@{ Components=$components; Forward=$forward; Reverse=$reverse }
}

function Assert-ComponentPrestate {
    param([object[]]$Rows)
    foreach ($row in $Rows) {
        $source=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$row.source_path) -ForMutation
        $target=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$row.target_path) -ForMutation
        if(-not(Test-Path -LiteralPath $source -PathType Leaf)-or(Get-G3E2RA1RSha256 $source)-cne$row.pre_sha256-or(Get-G3E2RA1RBytes $source)-ne[int64]$row.pre_bytes){throw "Component prestate mismatch: $($row.move_id)"}
        if(Test-Path -LiteralPath $target){throw "Component target collision: $($row.target_path)"}
    }
}

function Assert-ComponentPoststate {
    param([object[]]$Rows)
    foreach($row in $Rows){$source=Resolve-G3E2RA1RInRoot $root $row.source_path;$target=Resolve-G3E2RA1RInRoot $root $row.target_path;if(Test-Path -LiteralPath $source){throw "Component source remains: $($row.source_path)"};if(-not(Test-Path -LiteralPath $target -PathType Leaf)-or(Get-G3E2RA1RSha256 $target)-cne$row.post_sha256){throw "Component poststate mismatch: $($row.move_id)"}}
}

function Move-Components {
    param([object[]]$Rows)
    foreach($row in $Rows){$source=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$row.source_path) -ForMutation;$target=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$row.target_path) -ForMutation;$parent=Split-Path -Parent $target;if(-not(Test-Path -LiteralPath $parent -PathType Container)){$null=New-Item -ItemType Directory -Path $parent -Force};[IO.File]::Move($source,$target)}
}

function Invoke-BoundPowerShell {
    param([string]$Script,[string[]]$Arguments,[int]$Timeout=300)
    return Invoke-G3E2RBoundProcess -FilePath $powerShellExecutable -ArgumentList (@('-NoProfile','-ExecutionPolicy','Bypass','-File',$Script)+$Arguments) -TimeoutSeconds $Timeout -WorkingDirectory $root
}

function Invoke-RootFast {
    $result=Invoke-BoundPowerShell -Script (Join-Path $root 'tools/test-wiki-integrity.ps1') -Arguments @('-Profile','Fast')
    if($result.StdOut-notmatch'(?im)0\s+errors?'-or$result.StdOut-notmatch'(?im)0\s+warnings?'){throw 'Root Fast does not prove 0/0.'}
}

function Invoke-MosRegression {
    $result=Invoke-BoundPowerShell -Script (Join-Path $root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') -Arguments @() -Timeout 180
    if($result.StdOut-notmatch'(?im)16/16'){throw 'MOS does not prove 16/16.'}
}

function Invoke-Snapshot {
    param([string]$Command,[object]$Seal)
    $selection=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $Seal 'B-SNAPSHOT-SELECTION').repository_path
    $envelope=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $Seal 'B-SNAPSHOT-ENVELOPE').repository_path
    return Invoke-BoundPowerShell -Script $snapshotTool -Arguments @('-Command',$Command,'-VaultRoot',$root,'-SelectionManifest',$selection,'-SnapshotDirectory',(Split-Path -Parent $envelope))
}

function Invoke-Wrapper {
    param([ValidateSet('check','capability-probe','apply')][string]$ModeName,[ValidateSet('pre','post')][string]$State,[object[]]$RuntimeBindings)
    $python=[string](@($RuntimeBindings|Where-Object runtime_id -CEQ 'PYTHON_AGENT')[0].executable_path)
    $manifest=(Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-WRAPPER').Path
    return Invoke-G3E2RBoundProcess -FilePath $python -ArgumentList @($wrapperTool,'--vault-root',$root,'--manifest',$manifest,'--mode',$ModeName,'--state',$State) -TimeoutSeconds 90 -WorkingDirectory $root
}

function Assert-SealArtifacts {
    param([object]$Seal)
    foreach($id in @('B-SNAPSHOT-SELECTION','B-SNAPSHOT-MANIFEST','B-SNAPSHOT-ARCHIVE','B-SNAPSHOT-ENVELOPE','B-EXACT-POSTSTATE-MANIFEST','G3E1-EXACT-POSTSTATE-ARCHIVE','B-HARD-REFERENCE-MANIFEST','B-ADVISORY-REFERENCE-REPORT','B-LIVE-INVARIANT-MANIFEST','B-RESTORE-CURRENT-MANIFEST','B-ROLLBACK-WITNESS-MANIFEST','B-WITNESS-LEGACY','B-WITNESS-TARGET','B-WITNESS-MOS','B-SEAL-INPUTS')){$null=Test-G3E2RA1RBoundArtifact $context (Get-G3E2RA1RArtifact $Seal $id)}
}

function Invoke-PreMutationChecks {
    param([object]$Seal,[object[]]$RuntimeBindings,[object[]]$Components,[switch]$CapabilityProbe)
    $bBinding=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')[0]
    $null=Test-G3E2RA1RBManifest -Context $context -ExpectedBHash ([string]$bBinding.sha256) -AllowSealed
    Assert-G3E2RA1RSealClosure -Context $context -Seal $Seal
    Assert-SealArtifacts -Seal $Seal
    Assert-ComponentPrestate -Rows $Components
    $git=[string](@($RuntimeBindings|Where-Object runtime_id -CEQ 'GIT')[0].executable_path);$rg=[string](@($RuntimeBindings|Where-Object runtime_id -CEQ 'RIPGREP')[0].executable_path)
    Assert-G3E2RA1RGitStagingEmpty $root $git
    Assert-G3E2RA1RNoResidue $root
    $null=Test-G3E2RA1RLiveInvariants -Context $context -Seal $Seal -State pre
    $null=Invoke-Wrapper -ModeName check -State pre -RuntimeBindings $RuntimeBindings
    if($CapabilityProbe){$null=Invoke-Wrapper -ModeName capability-probe -State pre -RuntimeBindings $RuntimeBindings;Assert-G3E2RA1RNoResidue $root}
    foreach($command in @('VerifyBundle','CheckLivePreState','CheckFunctionalPrestate','RestorePlan')){$null=Invoke-Snapshot -Command $command -Seal $Seal}
    Test-G3E2RA1RWorkspaceAdvisory -Context $context -Seal $Seal
    Test-G3E2RA1RHardReferences -Context $context -Seal $Seal -State pre -RipgrepExecutable $rg
    Invoke-MosRegression
    Invoke-RootFast
    Assert-G3E2RA1RGitStagingEmpty $root $git
    Assert-G3E2RA1RNoResidue $root
}

$static=Get-StaticState
if($Mode -eq 'Validate'){
    $result=[ordered]@{contract='g3e2r-transaction/v2r';verdict='PASS';mode='Validate';components=95;forward=19;reverse=12;immediate_boundary='complete';authority_effect='none'}
}
elseif($Mode -eq 'Simulate'){
    if(-not[string]::IsNullOrWhiteSpace($FailAtStep)-and$FailAtStep-notin@($static.Forward.step_id)){throw "Unknown simulation failure step: $FailAtStep"}
    $mutationStarted=$false;$completed=[Collections.Generic.List[string]]::new()
    foreach($step in $static.Forward){if([int]$step.sequence-ge 10){$mutationStarted=$true};if($step.step_id-ceq$FailAtStep){break};$completed.Add([string]$step.step_id)}
    if([string]::IsNullOrWhiteSpace($FailAtStep)){$result=[ordered]@{contract='g3e2r-transaction/v2r';verdict='PASS_ROUTING_FROZEN';mode='Simulate';completed=@($completed);reverse_invoked=$false;authority_effect='none'}}
    elseif(-not$mutationStarted){$result=[ordered]@{contract='g3e2r-transaction/v2r';verdict='HOLD_NO_MUTATION';mode='Simulate';failed_step=$FailAtStep;completed=@($completed);reverse_invoked=$false;authority_effect='none'}}
    else{$reverse=&$reverseTool -Mode Simulate -VaultRoot $root -OverlayRoot $context.Overlay -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash -Json|ConvertFrom-Json;if($reverse.verdict-cne'REVERSED_ROUTING_FROZEN'-or@($reverse.completed).Count-ne 12){throw 'A1R reverse simulation failed.'};$result=[ordered]@{contract='g3e2r-transaction/v2r';verdict='REVERSED_ROUTING_FROZEN';mode='Simulate';failed_step=$FailAtStep;completed=@($completed);reverse_invoked=$true;reverse_steps=@($reverse.completed);authority_effect='none'}}
}
else{
    if(-not$AllowLiveMutation-or-not$AllowAutomaticReverse-or-not$AllowCapabilityProbe){throw 'Apply requires -AllowLiveMutation, -AllowAutomaticReverse, and -AllowCapabilityProbe.'}
    if(-not(Test-G3E2RA1RAdministrator)){throw 'Apply requires one explicitly elevated runner.'}
    foreach($value in @($SealEnvelope,$PythonExecutable,$ExpectedA1Hash,$ExpectedA1RHash,$ExpectedSealHash)){if([string]::IsNullOrWhiteSpace([string]$value)){throw 'Apply requires SealEnvelope, PythonExecutable, ExpectedA1Hash, ExpectedA1RHash, and ExpectedSealHash.'}}
    $mutex=$null;$closureLock=$null;$mutationStarted=$false;$mutexReleased=$false
    try{
        $mutex=Enter-G3E2RA1RMutex $root
        $sealPath=[IO.Path]::GetFullPath($SealEnvelope);if(-not$sealPath.StartsWith($root+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Live seal must remain inside the Vault.'}
        $runtimeBindings=Get-G3E2RA1RRuntimeBindings -Context $context -PythonExecutable $PythonExecutable
        $seal=Read-G3E2RA1RSealV2 -Context $context -LiteralPath $sealPath -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash -ExpectedSealHash $ExpectedSealHash -ActualRuntimeBindings $runtimeBindings -Use Forward
        $seal=Add-G3E2RA1RCompatibilityProperties $seal
        Invoke-PreMutationChecks -Seal $seal -RuntimeBindings $runtimeBindings -Components $static.Components -CapabilityProbe

        $closureLock=Enter-G3E2RA1RClosureLock -Context $context -Seal $seal -SealPath $sealPath -ExpectedSealHash $ExpectedSealHash
        Invoke-PreMutationChecks -Seal $seal -RuntimeBindings $runtimeBindings -Components $static.Components
        $null=Read-G3E2RA1RSealV2 -Context $context -LiteralPath $sealPath -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash -ExpectedSealHash $ExpectedSealHash -ActualRuntimeBindings $runtimeBindings -Use Forward
        Test-G3E2RA1RClosureLock $closureLock
        $mutationStarted=$true
        Move-Components -Rows $static.Components

        $componentTool=(Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-APPLY-COMPONENT').Path
        $null=Invoke-BoundPowerShell -Script $componentTool -Arguments @('-Mode','Apply','-VaultRoot',$root,'-MoveManifest',(Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-MOVE').Path,'-RefactorSpec',(Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-REFACTOR-SPEC').Path,'-PostHashManifest',(Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-COMPONENT-POST').Path) -Timeout 180
        $postTool=(Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-APPLY-POSTSTATE').Path
        $postManifest=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $seal 'B-EXACT-POSTSTATE-MANIFEST').repository_path
        $postArchive=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $seal 'G3E1-EXACT-POSTSTATE-ARCHIVE').repository_path
        $null=Invoke-BoundPowerShell -Script $postTool -Arguments @('-Mode','Apply','-VaultRoot',$root,'-ManifestPath',$postManifest,'-ArchivePath',$postArchive) -Timeout 180
        $null=Invoke-Wrapper -ModeName apply -State post -RuntimeBindings $runtimeBindings
        Assert-ComponentPoststate $static.Components
        $null=Invoke-BoundPowerShell -Script $postTool -Arguments @('-Mode','CheckPost','-VaultRoot',$root,'-ManifestPath',$postManifest,'-ArchivePath',$postArchive) -Timeout 180
        $null=Invoke-Wrapper -ModeName check -State post -RuntimeBindings $runtimeBindings
        $rg=[string](@($runtimeBindings|Where-Object runtime_id -CEQ 'RIPGREP')[0].executable_path);$git=[string](@($runtimeBindings|Where-Object runtime_id -CEQ 'GIT')[0].executable_path)
        Test-G3E2RA1RHardReferences -Context $context -Seal $seal -State post -RipgrepExecutable $rg
        $null=Test-G3E2RA1RLiveInvariants -Context $context -Seal $seal -State post
        Assert-G3E2RA1RGitStagingEmpty $root $git;Assert-G3E2RA1RNoResidue $root;Invoke-MosRegression;Invoke-RootFast
        $result=[ordered]@{contract='g3e2r-transaction/v2r';verdict='PASS_ROUTING_FROZEN';mode='Apply';transaction_id=$seal.transaction_id;seal_sha256=Get-G3E2RA1RSha256 $sealPath;completed=@($static.Forward.step_id);reverse_invoked=$false;routing_state='frozen'}
    }
    catch{
        $forwardError=$_
        if($mutationStarted){
            Exit-G3E2RA1RClosureLock $closureLock;$closureLock=$null
            if($null-ne$mutex){Exit-G3E2RA1RMutex $mutex;$mutex=$null;$mutexReleased=$true}
            try{$reverseResult=Invoke-BoundPowerShell -Script $reverseTool -Arguments @('-Mode','Apply','-VaultRoot',$root,'-OverlayRoot',$context.Overlay,'-SealEnvelope',$sealPath,'-PythonExecutable',$PythonExecutable,'-ExpectedA1Hash',$ExpectedA1Hash,'-ExpectedA1RHash',$ExpectedA1RHash,'-ExpectedSealHash',$ExpectedSealHash,'-AllowLiveMutation','-AllowReverse') -Timeout 900}catch{throw "Forward and automatic reverse failed. Forward: $forwardError Reverse: $_"}
            throw "Forward failed after mutation; complete reverse passed and routing remains frozen. Cause: $forwardError"
        }
        throw $forwardError
    }
    finally{Exit-G3E2RA1RClosureLock $closureLock;if($null-ne$mutex-and-not$mutexReleased){Exit-G3E2RA1RMutex $mutex}}
}

if($Json){$result|ConvertTo-Json -Depth 8 -Compress}else{Write-Output "$($result.verdict) | mode=$Mode | routing frozen"}
