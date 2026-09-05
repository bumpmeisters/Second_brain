[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][ValidateSet('Validate','CapabilityProbe')][string]$Mode,
    [Parameter(Mandatory=$true)][string]$ControlRoot,
    [string]$OverlayRoot,[string]$TargetVaultRoot,[string]$ProbeAuthorityPath,
    [string]$ExpectedProbeAuthorityHash,[string]$PythonExecutable,
    [string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedA1R2Hash,[string]$ExpectedA1R3Hash,
    [string]$ExpectedA1R4Hash,[string]$ExpectedA1R5RHash,[string]$ExpectedBHash,[string]$ExpectedSealInputsHash,
    [switch]$AllowCapabilityProbe,[switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
$completed=[Collections.Generic.List[string]]::new()
$receipt=[ordered]@{contract='g3e2r-capability-probe-receipt/v1-a1r5r';exit_code=1;verdict='HOLD_NO_PROBE';mode=$Mode;completed=@();authority_effect='none';state_effect='none';target_prestate=$null;target_poststate=$null;wrapper_prestate=$null;wrapper_poststate=$null;residue_count=$null;import_receipt=$null;error=$null}
$probeStarted=$false;$context=$null;$target=$null;$authority=$null

function Complete-Receipt {
    param([int]$ExitCode)
    $receipt.exit_code=$ExitCode;$receipt.completed=@($completed)
    if($Json-or$Mode-ceq'CapabilityProbe'){$receipt|ConvertTo-Json -Depth 12 -Compress}else{Write-Output "$($receipt.verdict) | mode=$Mode | exit=$ExitCode"}
    exit $ExitCode
}

function Assert-CanonicalProbeHost {
    $canonical='C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe';$actual=[IO.Path]::GetFullPath((Get-Process -Id $PID).Path)
    if(-not$actual.Equals([IO.Path]::GetFullPath($canonical),[StringComparison]::OrdinalIgnoreCase)-or$PSVersionTable.PSEdition-cne'Desktop'-or-not[Environment]::Is64BitProcess-or-not(Test-G3E2RA1R5RAdministrator)){throw 'CapabilityProbe requires the elevated canonical 64-bit Windows PowerShell 5.1 host.'}
    foreach($name in @('Microsoft.PowerShell.Management','Microsoft.PowerShell.Utility')){$module=@(Get-Module -ListAvailable -Name $name|Where-Object{$_.Version.ToString()-ceq'3.1.0.0'-and$_.CompatiblePSEditions-contains'Desktop'});if($module.Count-eq 0){throw "Canonical Desktop module binding is missing: $name"}}
}

function Get-TargetGitState {
    param([string]$GitExecutable,[string]$Root)
    $invoke={param([string[]]$Arguments);(Invoke-G3E2RBoundProcess -FilePath $GitExecutable -ArgumentList $Arguments -TimeoutSeconds 30 -WorkingDirectory $Root).StdOut.TrimEnd("`r","`n")}
    $branch=&$invoke @('-C',$Root,'branch','--show-current');$head=&$invoke @('-C',$Root,'rev-parse','HEAD');$status=&$invoke @('-C',$Root,'status','--porcelain=v1','--untracked-files=all');$staged=&$invoke @('-C',$Root,'diff','--cached','--name-only')
    $statusLines=if([string]::IsNullOrEmpty($status)){@()}else{@($status-split"`r?`n")};$stagedLines=if([string]::IsNullOrEmpty($staged)){@()}else{@($staged-split"`r?`n")}
    $statusHash=Get-G3E2RA1R5RBytesSha256 ([Text.UTF8Encoding]::new($false).GetBytes(($statusLines-join[char]10)))
    return [pscustomobject]@{git_branch=$branch;git_head=$head;git_status_line_count=$statusLines.Count;git_status_sha256=$statusHash;git_staged_count=$stagedLines.Count}
}

function Test-TargetGitStateEqual {
    param([object]$Expected,[object]$Actual)
    foreach($field in @('git_branch','git_head','git_status_line_count','git_status_sha256','git_staged_count')){if([string]$Expected.$field-cne[string]$Actual.$field){return $false}}
    return $true
}

function Assert-TargetPrestate {
    param([object]$Authority,[object[]]$Runtimes)
    $git=[string](@($Runtimes|Where-Object runtime_id -CEQ 'GIT')[0].executable_path);$state=Get-TargetGitState $git $target
    foreach($field in @('git_branch','git_head','git_status_line_count','git_status_sha256','git_staged_count')){if([string]$state.$field-cne[string]$Authority.target_prestate.$field){throw "Target Git prestate mismatch: $field"}}
    if([int]$state.git_staged_count-ne 0){throw 'Target Git staging is not empty.'}
    $componentPath=Resolve-G3E2RA1R5RInRoot $context.Root (Get-G3E2RA1R5RExecutionPaths)['A-COMPONENT-MANIFEST'];$rows=@(Import-Csv -LiteralPath $componentPath)
    if($rows.Count-ne 95-or[int]$Authority.target_prestate.component_count-ne 95-or-not(Test-G3E2RA1R5ROrdinalUnique @($rows.move_id))){throw 'Target component prestate does not bind the exact 95-row manifest.'}
    foreach($row in $rows){$source=Resolve-G3E2RA1R5RInRoot $target ([string]$row.source_path);$destination=Resolve-G3E2RA1R5RInRoot $target ([string]$row.target_path);if(-not(Test-Path -LiteralPath $source -PathType Leaf)-or(Get-G3E2RA1R5RSha256 $source)-cne[string]$row.pre_sha256-or(Get-G3E2RA1R5RBytes $source)-ne[int64]$row.pre_bytes-or(Test-Path -LiteralPath $destination)){throw "Target component prestate mismatch: $($row.move_id)"}}
    $residue=@(Get-G3E2RA1R5RProbeResiduePaths $target);if($residue.Count-ne 0-or[int]$Authority.target_prestate.residue_count-ne 0){throw 'Target residue prestate is not zero.'}
    $receipt.wrapper_prestate=Get-G3E2RA1R5RProbeWrapperState $context $target
    if($receipt.wrapper_prestate.matched-ne 11-or$receipt.wrapper_prestate.total-ne 11-or$receipt.wrapper_prestate.fingerprint_v3-cne[string]$Authority.target_prestate.wrapper_pre_fingerprint_v3){throw 'Target wrapper prestate differs from authority.'}
    $python=[string](@($Runtimes|Where-Object runtime_id -CEQ 'PYTHON_AGENT')[0].executable_path);$wrapper=Resolve-G3E2RA1R5RInRoot $context.Root (Get-G3E2RA1R5RExecutionPaths)['A-WRAPPER-TOOL']
    $check=Invoke-G3E2RBoundProcess -FilePath $python -ArgumentList @($wrapper,'--vault-root',$target,'--manifest',$context.TransitionManifest,'--mode','check','--state','pre') -TimeoutSeconds 90 -WorkingDirectory $target
    if($check.StdOut.Trim()-cne'PASS | 11/11 wrapper rows | mode=check | state=pre | residue=0'){throw 'Target wrapper check receipt is invalid.'}
    return $state
}

try{
    Import-Module Microsoft.PowerShell.Management -RequiredVersion 3.1.0.0 -Force
    Import-Module Microsoft.PowerShell.Utility -RequiredVersion 3.1.0.0 -Force
    if([string]::IsNullOrWhiteSpace($OverlayRoot)){$OverlayRoot=Join-Path $PSScriptRoot '..'}
    Import-Module (Join-Path $OverlayRoot 'tools/g3e2r-a1r5r-guard-lib.psm1') -Force
    $context=Get-G3E2RA1R5RContext -VaultRoot $ControlRoot -OverlayRoot $OverlayRoot -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash -ExpectedA1R2Hash $ExpectedA1R2Hash -ExpectedA1R3Hash $ExpectedA1R3Hash -ExpectedA1R4Hash $ExpectedA1R4Hash -ExpectedA1R5RHash $ExpectedA1R5RHash
    $importReceipt=Initialize-G3E2RA1R5REntrypoint -Context $context -ComponentId 'C60-CAPABILITY-PROBE';$receipt.import_receipt=$importReceipt.receipt_id
    if($Mode-ceq'Validate'){$receipt.exit_code=0;$receipt.verdict='PASS';$receipt.state_effect='none';Complete-Receipt 0}
    if(-not$Json-or-not$AllowCapabilityProbe){throw 'CapabilityProbe requires -Json and the explicit AllowCapabilityProbe switch.'}
    foreach($value in @($TargetVaultRoot,$ProbeAuthorityPath,$ExpectedProbeAuthorityHash,$PythonExecutable,$ExpectedA1Hash,$ExpectedA1RHash,$ExpectedA1R2Hash,$ExpectedA1R3Hash,$ExpectedA1R4Hash,$ExpectedA1R5RHash,$ExpectedBHash,$ExpectedSealInputsHash)){if([string]::IsNullOrWhiteSpace([string]$value)){throw 'CapabilityProbe requires target, authority, runtime, and all expected hash boundaries.'}}
    Assert-CanonicalProbeHost
    $roots=Resolve-G3E2RA1R5RProbeRoots $context.Root $TargetVaultRoot $ProbeAuthorityPath;$target=$roots.TargetVaultRoot
    $runtimes=@(Get-G3E2RA1R5RRuntimeBindings $context $PythonExecutable)
    $expected=[pscustomobject][ordered]@{a1=$ExpectedA1Hash.ToUpperInvariant();a1r=$ExpectedA1RHash.ToUpperInvariant();a1r2=$ExpectedA1R2Hash.ToUpperInvariant();a1r3=$ExpectedA1R3Hash.ToUpperInvariant();a1r4=$ExpectedA1R4Hash.ToUpperInvariant();a1r5r=$ExpectedA1R5RHash.ToUpperInvariant();b=$ExpectedBHash.ToUpperInvariant();seal_inputs=$ExpectedSealInputsHash.ToUpperInvariant()}
    $authority=(Read-G3E2RA1R5RProbeAuthority $context $target $roots.AuthorityPath $ExpectedProbeAuthorityHash $expected $runtimes).Value;$completed.Add('FWD-001')
    $bState=Test-G3E2RA1R5RBManifest $context $ExpectedBHash;$sealInputs=Join-Path $bState.Root 'seal/seal-inputs.json'
    if((Get-G3E2RA1R5RSha256 $sealInputs)-cne$ExpectedSealInputsHash.ToUpperInvariant()){throw 'CapabilityProbe seal-input identity mismatch.'}
    $execution=Get-G3E2RA1R5RExecutionPaths
    if($execution.Count-ne 63-or-not(Test-G3E2RA1R5ROrdinalSetEqual @($context.SealContract.required_execution_binding_ids) @($execution.Keys))){throw 'CapabilityProbe execution closure differs from 63.'}
    foreach($id in $execution.Keys){$null=Resolve-G3E2RA1R5RInRoot $context.Root $execution[$id];if(-not(Test-Path -LiteralPath (Resolve-G3E2RA1R5RInRoot $context.Root $execution[$id]) -PathType Leaf)){throw "Execution binding is missing: $id"}}
    $completed.Add('FWD-002')
    $receipt.target_prestate=Assert-TargetPrestate $authority $runtimes;$completed.Add('FWD-003')
    $probeStarted=$true;$receipt.authority_effect='capability_probe_only'
    $python=[string](@($runtimes|Where-Object runtime_id -CEQ 'PYTHON_AGENT')[0].executable_path);$wrapper=Resolve-G3E2RA1R5RInRoot $context.Root $execution['A-WRAPPER-TOOL']
    $probe=Invoke-G3E2RBoundProcess -FilePath $python -ArgumentList @($wrapper,'--vault-root',$target,'--manifest',$context.TransitionManifest,'--mode','capability-probe','--state','pre') -TimeoutSeconds 45 -WorkingDirectory $target
    if($probe.StdOut.Trim()-cne'PASS | capability-probe | 11/11 wrappers unchanged | state=pre | residue=0'){throw 'Capability probe child receipt is invalid.'}
    $receipt.wrapper_poststate=Get-G3E2RA1R5RProbeWrapperState $context $target;$receipt.target_poststate=Get-TargetGitState ([string](@($runtimes|Where-Object runtime_id -CEQ 'GIT')[0].executable_path)) $target;$residue=@(Get-G3E2RA1R5RProbeResiduePaths $target);$receipt.residue_count=$residue.Count
    if($receipt.wrapper_poststate.matched-ne 11-or$receipt.wrapper_poststate.total-ne 11-or$receipt.wrapper_poststate.fingerprint_v3-cne$receipt.wrapper_prestate.fingerprint_v3-or-not(Test-TargetGitStateEqual $receipt.target_prestate $receipt.target_poststate)-or$residue.Count-ne 0){throw 'Capability probe poststate is not an exact null delta.'}
    $completed.Add('FWD-004');$receipt.verdict='PASS_CAPABILITY_PROBE';$receipt.state_effect='transient_probe_final_delta_none';Complete-Receipt 0
}catch{
    $failure=$_;$receipt.error=[string]$failure.Exception.Message
    if($probeStarted){
        try{Remove-G3E2RA1R5RProbeResidue $context $target}catch{$receipt.error+=' | cleanup: '+[string]$_.Exception.Message}
        try{$receipt.wrapper_poststate=Get-G3E2RA1R5RProbeWrapperState $context $target;$receipt.target_poststate=Get-TargetGitState ([string](@($runtimes|Where-Object runtime_id -CEQ 'GIT')[0].executable_path)) $target;$receipt.residue_count=@(Get-G3E2RA1R5RProbeResiduePaths $target).Count}catch{$receipt.error+=' | poststate: '+[string]$_.Exception.Message;$receipt.verdict='BLOCK_PROBE_POSTSTATE';$receipt.state_effect='unknown';Complete-Receipt 2}
        if($receipt.residue_count-ne 0-or$receipt.wrapper_poststate.fingerprint_v3-cne$receipt.wrapper_prestate.fingerprint_v3-or-not(Test-TargetGitStateEqual $receipt.target_prestate $receipt.target_poststate)){$receipt.verdict='BLOCK_PROBE_POSTSTATE';$receipt.state_effect='residue_wrapper_or_git_delta';Complete-Receipt 2}
        $receipt.state_effect='transient_probe_final_delta_none'
        if($failure.Exception-is[Management.Automation.PipelineStoppedException]){$receipt.verdict='HOLD_PROBE_ABORTED';Complete-Receipt 130}
        if($receipt.error-match'watchdog timeout after 45 seconds'){$receipt.verdict='HOLD_PROBE_TIMEOUT';Complete-Receipt 124}
        $receipt.verdict='HOLD_PROBE_FAILED';Complete-Receipt 1
    }
    if($null-ne$target){try{$receipt.residue_count=@(Get-G3E2RA1R5RProbeResiduePaths $target).Count}catch{}}
    $receipt.verdict='HOLD_NO_PROBE';$receipt.state_effect='none';Complete-Receipt 1
}
