[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('Validate','Simulate','Apply')][string]$Mode,
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$OverlayRoot,
    [string]$SealEnvelope,
    [string]$PythonExecutable,
    [string]$ExpectedA1Hash,
    [string]$ExpectedA1RHash,
    [string]$ExpectedSealHash,
    [switch]$AllowLiveMutation,
    [switch]$AllowReverse,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if([string]::IsNullOrWhiteSpace($OverlayRoot)){$OverlayRoot=Join-Path $PSScriptRoot '..'}
Import-Module (Join-Path $OverlayRoot 'tools/g3e2r-a1r-guard-lib.psm1') -Force
$context=Get-G3E2RA1RContext -VaultRoot $VaultRoot -OverlayRoot $OverlayRoot -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash
Import-Module (Join-Path $context.A1Context.ARoot 'tools/g3e2r-transaction-lib.psm1') -Force
$root=$context.Root;$paths=Get-G3E2RA1RExecutionPaths;$powerShellExecutable=(Get-Process -Id $PID).Path
$componentPath=Resolve-G3E2RA1RInRoot $root $paths['A-COMPONENT-MANIFEST'];$reversePath=Resolve-G3E2RA1RInRoot $root $paths['A-REVERSE-MANIFEST'];$snapshotTool=Resolve-G3E2RA1RInRoot $root $paths['A-SNAPSHOT-TOOL'];$wrapperTool=Resolve-G3E2RA1RInRoot $root $paths['A-WRAPPER-TOOL']

function Invoke-BoundPowerShell{param([string]$Script,[string[]]$Arguments,[int]$Timeout=300)return Invoke-G3E2RBoundProcess -FilePath $powerShellExecutable -ArgumentList (@('-NoProfile','-ExecutionPolicy','Bypass','-File',$Script)+$Arguments) -TimeoutSeconds $Timeout -WorkingDirectory $root}
function Invoke-RootFast{$r=Invoke-BoundPowerShell -Script (Join-Path $root 'tools/test-wiki-integrity.ps1') -Arguments @('-Profile','Fast');if($r.StdOut-notmatch'(?im)0\s+errors?'-or$r.StdOut-notmatch'(?im)0\s+warnings?'){throw 'Reverse Root Fast does not prove 0/0.'}}
function Invoke-MosRegression{$r=Invoke-BoundPowerShell -Script (Join-Path $root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') -Arguments @() -Timeout 180;if($r.StdOut-notmatch'(?im)16/16'){throw 'Reverse MOS does not prove 16/16.'}}

function Invoke-Snapshot{
    param([string]$Command,[object]$Seal,[switch]$Restore)
    $selection=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $Seal 'B-SNAPSHOT-SELECTION').repository_path;$envelope=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $Seal 'B-SNAPSHOT-ENVELOPE').repository_path
    $args=@('-Command',$Command,'-VaultRoot',$root,'-SelectionManifest',$selection,'-SnapshotDirectory',(Split-Path -Parent $envelope))
    if($Restore){$current=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $Seal 'B-RESTORE-CURRENT-MANIFEST').repository_path;$args+=@('-AllowedCurrentManifest',$current,'-AllowRestore')}
    return Invoke-BoundPowerShell -Script $snapshotTool -Arguments $args
}

function Remove-ApprovedComponentTargets{
    param([object[]]$Components)
    foreach($row in $Components){$source=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$row.source_path) -ForMutation;$target=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$row.target_path) -ForMutation;if(-not(Test-Path -LiteralPath $source -PathType Leaf)-or(Get-G3E2RA1RSha256 $source)-cne$row.pre_sha256){throw "Reverse source prestate mismatch: $($row.move_id)"};if(Test-Path -LiteralPath $target -PathType Leaf){$hash=Get-G3E2RA1RSha256 $target;if($hash-notin@($row.pre_sha256,$row.post_sha256)){throw "Reverse refuses unknown target bytes: $($row.target_path)"};Remove-Item -LiteralPath $target -Force};if(Test-Path -LiteralPath $target){throw "Reverse target remains: $($row.target_path)"}}
}

function Remove-ApprovedCreatedPaths{
    param([object]$Seal)
    $manifest=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $Seal 'B-EXACT-POSTSTATE-MANIFEST').repository_path
    foreach($row in @(Import-Csv -LiteralPath $manifest|Where-Object forward_mode -CEQ 'create-exact')){$target=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$row.repository_path) -ForMutation;if(-not(Test-Path -LiteralPath $target)){continue};if(-not(Test-Path -LiteralPath $target -PathType Leaf)-or(Get-G3E2RA1RSha256 $target)-cne$row.post_sha256){throw "Reverse refuses unknown created-path bytes: $($row.repository_path)"};Remove-Item -LiteralPath $target -Force}
}

function Add-RollbackWitnesses{
    param([object]$Seal)
    $manifest=Resolve-G3E2RA1RInRoot $root (Get-G3E2RA1RArtifact $Seal 'B-ROLLBACK-WITNESS-MANIFEST').repository_path;$rows=@(Import-Csv -LiteralPath $manifest)
    Assert-G3E2RColumns -Rows $rows -Expected @('repository_path','allowed_current_sha256','allowed_current_bytes','suffix_path','suffix_sha256','expected_post_sha256','expected_post_bytes') -Label 'Rollback witness manifest'
    $groups=@($rows|Group-Object repository_path);if($groups.Count-ne 3){throw 'Rollback witnesses must cover exactly three logs.'}
    foreach($group in $groups){$target=Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$group.Name) -ForMutation;$currentHash=Get-G3E2RA1RSha256 $target;$currentBytes=[IO.File]::ReadAllBytes($target);$alreadyWritten=@($group.Group|Where-Object{$_.expected_post_sha256-ceq$currentHash-and[int64]$_.expected_post_bytes-eq$currentBytes.Length});if($alreadyWritten.Count-gt 0){continue};$match=@($group.Group|Where-Object{$_.allowed_current_sha256-ceq$currentHash-and[int64]$_.allowed_current_bytes-eq$currentBytes.Length});if($match.Count-ne 1){throw "No unique witness variant: $($group.Name)"};$suffixPath=Resolve-G3E2RA1RInRoot $root $match[0].suffix_path;$suffix=[IO.File]::ReadAllBytes($suffixPath);if((Get-G3E2RBytesSha256 $suffix)-cne$match[0].suffix_sha256){throw "Witness suffix mismatch: $($group.Name)"};$final=New-Object byte[] ($currentBytes.Length+$suffix.Length);[Array]::Copy($currentBytes,0,$final,0,$currentBytes.Length);[Array]::Copy($suffix,0,$final,$currentBytes.Length,$suffix.Length);if($final.Length-ne[int64]$match[0].expected_post_bytes-or(Get-G3E2RBytesSha256 $final)-cne$match[0].expected_post_sha256){throw "Witness result mismatch: $($group.Name)"};$parent=Split-Path -Parent $target;$temp=Join-Path $parent ('.g3e2r-witness-'+[guid]::NewGuid().ToString('N')+'.tmp');$backup=Join-Path $parent ('.g3e2r-witness-'+[guid]::NewGuid().ToString('N')+'.bak');try{[IO.File]::WriteAllBytes($temp,$final);[IO.File]::Replace($temp,$target,$backup);Remove-Item -LiteralPath $backup -Force}finally{if(Test-Path -LiteralPath $temp){Remove-Item -LiteralPath $temp -Force};if(Test-Path -LiteralPath $backup){Remove-Item -LiteralPath $backup -Force}}}
}

function Test-TransactionResidue{
    $residue=@(Get-ChildItem -LiteralPath $root -Recurse -Force -File|Where-Object{$_.Name-match'^\.g3e2r-.*\.(tmp|bak)$'-or$_.Name-match'^\.g3e1-.*\.(tmp|bak)$'})
    if($residue.Count-gt 0){throw "Transaction residue remains: $($residue[0].FullName)"}
}

$components=@(Import-Csv -LiteralPath $componentPath);if($components.Count-ne 95-or@($components.move_id|Sort-Object -Unique).Count-ne 95){throw 'Reverse component manifest must contain 95 unique rows.'}
$reverseRows=Import-G3E2RTransactionManifest -LiteralPath $reversePath -Prefix REV -ExpectedCount 12

if($Mode-eq'Validate'){$result=[ordered]@{contract='g3e2r-reverse/v2r';verdict='PASS';mode='Validate';reverse=12;expiry_policy='ignored';authority_effect='none'}}
elseif($Mode-eq'Simulate'){$result=[ordered]@{contract='g3e2r-reverse/v2r';verdict='REVERSED_ROUTING_FROZEN';mode='Simulate';completed=@($reverseRows.step_id);routing_state='frozen';authority_effect='none'}}
else{
    if(-not$AllowLiveMutation-or-not$AllowReverse){throw 'Reverse Apply requires -AllowLiveMutation and -AllowReverse.'}
    if(-not(Test-G3E2RA1RAdministrator)){throw 'Reverse Apply requires one explicitly elevated runner.'}
    foreach($value in @($SealEnvelope,$PythonExecutable,$ExpectedA1Hash,$ExpectedA1RHash,$ExpectedSealHash)){if([string]::IsNullOrWhiteSpace([string]$value)){throw 'Reverse Apply requires SealEnvelope, PythonExecutable, ExpectedA1Hash, ExpectedA1RHash, and ExpectedSealHash.'}}
    $mutex=$null;$closureLock=$null
    try{
        $mutex=Enter-G3E2RA1RMutex $root;$sealPath=[IO.Path]::GetFullPath($SealEnvelope);if(-not$sealPath.StartsWith($root+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Live seal must remain inside the Vault.'}
        $runtimeBindings=Get-G3E2RA1RRuntimeBindings -Context $context -PythonExecutable $PythonExecutable
        $seal=Read-G3E2RA1RSealV2 -Context $context -LiteralPath $sealPath -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash -ExpectedSealHash $ExpectedSealHash -ActualRuntimeBindings $runtimeBindings -Use Reverse
        $seal=Add-G3E2RA1RCompatibilityProperties $seal
        $closureLock=Enter-G3E2RA1RClosureLock -Context $context -Seal $seal -SealPath $sealPath -ExpectedSealHash $ExpectedSealHash
        $git=[string](@($runtimeBindings|Where-Object runtime_id -CEQ 'GIT')[0].executable_path);$rg=[string](@($runtimeBindings|Where-Object runtime_id -CEQ 'RIPGREP')[0].executable_path)
        Assert-G3E2RA1RGitStagingEmpty $root $git;Test-G3E2RA1RWorkspaceAdvisory $context $seal
        $externalBefore=@(Test-G3E2RA1RLiveInvariants -Context $context -Seal $seal -State pre-reverse -AdvisoryExternalDrift)
        $null=Invoke-Snapshot -Command VerifyBundle -Seal $seal;$null=Invoke-Snapshot -Command RestorePlan -Seal $seal;$null=Invoke-Snapshot -Command Restore -Seal $seal -Restore
        Remove-ApprovedComponentTargets $components;Remove-ApprovedCreatedPaths $seal;Add-RollbackWitnesses $seal
        $python=[string](@($runtimeBindings|Where-Object runtime_id -CEQ 'PYTHON_AGENT')[0].executable_path);$wrapperManifest=(Get-G3E2RDependency -Lock $context.ADependencies -Id 'G3E1-WRAPPER').Path
        $null=Invoke-G3E2RBoundProcess -FilePath $python -ArgumentList @($wrapperTool,'--vault-root',$root,'--manifest',$wrapperManifest,'--mode','check','--state','pre') -TimeoutSeconds 90 -WorkingDirectory $root
        $null=Invoke-Snapshot -Command CheckFunctionalPrestate -Seal $seal
        Invoke-MosRegression;Test-G3E2RA1RHardReferences -Context $context -Seal $seal -State reverse -RipgrepExecutable $rg
        $externalAfter=@(Test-G3E2RA1RLiveInvariants -Context $context -Seal $seal -State reverse -AdvisoryExternalDrift)
        Assert-G3E2RA1RGitStagingEmpty $root $git;Assert-G3E2RA1RNoResidue $root;Test-TransactionResidue;Invoke-RootFast;Test-G3E2RA1RClosureLock $closureLock
        $result=[ordered]@{contract='g3e2r-reverse/v2r';verdict='REVERSED_ROUTING_FROZEN';mode='Apply';transaction_id=$seal.transaction_id;completed=@($reverseRows.step_id);routing_state='frozen';external_drift=@($externalBefore+$externalAfter|Sort-Object invariant_id,repository_path -Unique)}
    }
    finally{Exit-G3E2RA1RClosureLock $closureLock;if($null-ne$mutex){Exit-G3E2RA1RMutex $mutex}}
}

if($Json){$result|ConvertTo-Json -Depth 8 -Compress}else{Write-Output "$($result.verdict) | mode=$Mode | reverse steps=$(@($reverseRows).Count) | routing frozen"}
