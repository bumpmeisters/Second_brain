Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-G3E2RA1R2Sha256 {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    if(-not(Test-Path -LiteralPath $LiteralPath -PathType Leaf)){throw "File is missing: $LiteralPath"}
    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Get-G3E2RA1R2Bytes { param([string]$LiteralPath) return (Get-Item -LiteralPath $LiteralPath -Force).Length }

function Resolve-G3E2RA1R2InRoot {
    param([string]$Root,[string]$RepositoryPath,[switch]$ForMutation)
    $base=[IO.Path]::GetFullPath($Root).TrimEnd('\')
    if([IO.Path]::IsPathRooted($RepositoryPath)){throw "Repository path must be relative: $RepositoryPath"}
    $full=[IO.Path]::GetFullPath((Join-Path $base $RepositoryPath.Replace('/','\')))
    if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "Repository path escapes the Vault: $RepositoryPath"}
    if($ForMutation-and$RepositoryPath-match'^(raw|research/assets)(/|$)'){throw "Protected source mutation is forbidden: $RepositoryPath"}
    return $full
}

function Get-G3E2RA1R2RepositoryPath {
    param([string]$Root,[string]$LiteralPath)
    $base=[IO.Path]::GetFullPath($Root).TrimEnd('\');$full=[IO.Path]::GetFullPath($LiteralPath)
    if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "Path is outside the Vault: $LiteralPath"}
    return $full.Substring($base.Length+1).Replace('\','/')
}

function Assert-G3E2RA1R2ExactProperties {
    param([object]$Value,[string[]]$Expected,[string]$Label)
    $actual=@($Value.PSObject.Properties.Name)
    if(@(Compare-Object ($Expected|Sort-Object) ($actual|Sort-Object)).Count-ne 0){throw "$Label properties differ from contract."}
}

function Import-G3E2RA1R2ExactCsv {
    param([string]$LiteralPath,[string[]]$Columns,[Nullable[int]]$Count,[string]$Label)
    $rows=@(Import-Csv -LiteralPath $LiteralPath)
    if($null-ne$Count-and$rows.Count-ne[int]$Count){throw "$Label must contain $Count rows; found $($rows.Count)."}
    foreach($row in $rows){Assert-G3E2RA1R2ExactProperties $row $Columns $Label}
    return $rows
}

function Test-G3E2RA1R2BoundManifest {
    param([string]$ManifestPath,[string]$BaseDirectory,[string]$PathColumn,[string[]]$Columns,[int]$Count,[string]$Label)
    $rows=Import-G3E2RA1R2ExactCsv $ManifestPath $Columns $Count $Label;$base=[IO.Path]::GetFullPath($BaseDirectory).TrimEnd('\')
    foreach($row in $rows){$relative=[string]$row.$PathColumn;if([IO.Path]::IsPathRooted($relative)){throw "$Label path must be relative: $relative"};$full=[IO.Path]::GetFullPath((Join-Path $base $relative.Replace('/','\')));if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "$Label path escapes its root: $relative"};if((Get-G3E2RA1R2Sha256 $full)-cne([string]$row.sha256).ToUpperInvariant()-or(Get-G3E2RA1R2Bytes $full)-ne[int64]$row.bytes){throw "$Label identity mismatch: $relative"}}
    return $rows
}

function Get-G3E2RA1R2Context {
    param([string]$VaultRoot,[string]$OverlayRoot,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedA1R2Hash)
    $root=(Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\');$overlay=(Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
    $canonical=Resolve-G3E2RA1R2InRoot $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r2'
    if($overlay-cne$canonical){throw 'A1R2 overlay is not at its canonical repository path.'}
    $lock=Import-G3E2RA1R2ExactCsv (Join-Path $overlay 'dependency-lock.csv') @('dependency_id','role','repository_path','sha256','bytes','reuse_mode','required_by') 1 'A1R2 dependency lock'
    if($lock[0].dependency_id-cne'G3E2R-A1R-BUNDLE'-or$lock[0].reuse_mode-cne'verify-transitively-never-modify'){throw 'A1R2 dependency lock must bind only the immutable A1R root.'}
    $a1rManifest=Resolve-G3E2RA1R2InRoot $root ([string]$lock[0].repository_path)
    if((Get-G3E2RA1R2Sha256 $a1rManifest)-cne[string]$lock[0].sha256-or(Get-G3E2RA1R2Bytes $a1rManifest)-ne[int64]$lock[0].bytes){throw 'A1R dependency root mismatch.'}
    if(-not[string]::IsNullOrWhiteSpace($ExpectedA1RHash)-and(Get-G3E2RA1R2Sha256 $a1rManifest)-cne$ExpectedA1RHash.ToUpperInvariant()){throw 'Expected-A1R-Hash mismatch.'}
    $a1rRoot=Split-Path -Parent $a1rManifest;Import-Module (Join-Path $a1rRoot 'tools/g3e2r-a1r-guard-lib.psm1') -Force
    $a1rContext=Get-G3E2RA1RContext -VaultRoot $root -OverlayRoot $a1rRoot -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash ([string]$lock[0].sha256)
    $manifest=Join-Path $overlay 'a1r2-bundle-manifest.csv'
    if(Test-Path -LiteralPath $manifest -PathType Leaf){if(-not[string]::IsNullOrWhiteSpace($ExpectedA1R2Hash)-and(Get-G3E2RA1R2Sha256 $manifest)-cne$ExpectedA1R2Hash.ToUpperInvariant()){throw 'Expected-A1R2-Hash mismatch.'};$rows=Test-G3E2RA1R2BoundManifest $manifest $overlay 'overlay_path' @('role','overlay_path','sha256','bytes') 14 'A1R2 bundle';$actual=@(Get-ChildItem -LiteralPath $overlay -Recurse -File|ForEach-Object{$_.FullName.Substring($overlay.Length+1).Replace('\','/')});$expected=@($rows.overlay_path)+'a1r2-bundle-manifest.csv';if($actual.Count-ne 15-or@(Compare-Object ($actual|Sort-Object) ($expected|Sort-Object)).Count-ne 0){throw 'A1R2 overlay differs from its exact fifteen-file inventory.'}}
    $seal=Get-Content -LiteralPath (Join-Path $overlay 'contracts/live-seal-v2-a1r2-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $invariant=Get-Content -LiteralPath (Join-Path $overlay 'contracts/live-invariant-v2-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $wrapper=Get-Content -LiteralPath (Join-Path $overlay 'contracts/wrapper-full-tree-v1-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $gates=Import-G3E2RA1R2ExactCsv (Join-Path $overlay 'manifests/gate-map-v3.csv') @('direction','sequence','step_id','mutation_state','gate_function','success_contract','failure_action') 40 'A1R2 gate map'
    if(@($gates|Where-Object direction -CEQ 'SEAL').Count-ne 9-or@($gates|Where-Object direction -CEQ 'FWD').Count-ne 19-or@($gates|Where-Object direction -CEQ 'REV').Count-ne 12-or@($gates.step_id|Sort-Object -Unique).Count-ne 40-or@($gates|Where-Object step_id -CEQ 'FWD-020').Count-ne 0){throw 'A1R2 gate map does not have the exact 9/19/12 shape.'}
    if($seal.ttl_seconds-ne 900-or$seal.bundle_binding_count-ne 7-or$seal.execution_binding_count-ne 36-or$seal.artifact_binding_count-ne 15-or$seal.runtime_binding_count-ne 4){throw 'A1R2 seal contract cardinality differs from approval.'}
    $transition=Resolve-G3E2RA1R2InRoot $root ([string]$invariant.transition_manifest_repository_path)
    if((Get-G3E2RA1R2Sha256 $transition)-cne'5DA801A1CE4160181EEB098CD17EE7EFFDAADAA0AC756B543FB537B08DFC9EA1'){throw 'G3E1 wrapper transition manifest changed.'}
    return [pscustomobject]@{Root=$root;Overlay=$overlay;Manifest=$manifest;A1RManifest=$a1rManifest;A1RRoot=$a1rRoot;A1RContext=$a1rContext;SealContract=$seal;InvariantContract=$invariant;WrapperContract=$wrapper;Gates=$gates;TransitionManifest=$transition;BContract=$a1rContext.BContract;HardReferenceContract=$a1rContext.HardReferenceContract}
}

function Get-G3E2RA1R2WrapperInventory {
    param([object]$Context,[string]$InventoryRoot)
    $root=if([string]::IsNullOrWhiteSpace($InventoryRoot)){Resolve-G3E2RA1R2InRoot $Context.Root ([string]$Context.WrapperContract.inventory_root)}else{[IO.Path]::GetFullPath($InventoryRoot)}
    if(-not(Test-Path -LiteralPath $root -PathType Container)-or((Get-Item -LiteralPath $root -Force).Attributes-band[IO.FileAttributes]::ReparsePoint)){throw 'Wrapper inventory root is missing or reparse-backed.'}
    $rows=[Collections.Generic.List[object]]::new();$all=@(Get-ChildItem -LiteralPath $root -Force -Recurse)
    foreach($item in @($all|Where-Object{$_.Attributes-band[IO.FileAttributes]::ReparsePoint})){throw "Wrapper tree contains a reparse point: $($item.FullName)"}
    foreach($file in @($all|Where-Object{-not$_.PSIsContainer}|Sort-Object FullName)){
        $relative=$file.FullName.Substring($root.TrimEnd('\').Length+1).Replace('\','/');$parts=$relative.Split('/')
        if($parts.Count-ne 2-or$parts[1]-cne'SKILL.md'-or[string]::IsNullOrWhiteSpace($parts[0])){throw "Every wrapper-tree file must be <skill>/SKILL.md: $relative"}
        $repo=if($root.StartsWith($Context.Root+'\',[StringComparison]::OrdinalIgnoreCase)){Get-G3E2RA1R2RepositoryPath $Context.Root $file.FullName}else{'.agents/skills/'+$relative}
        $rows.Add([pscustomobject][ordered]@{skill_id=$parts[0];repository_path=$repo;sha256=Get-G3E2RA1R2Sha256 $file.FullName;bytes=Get-G3E2RA1R2Bytes $file.FullName;literal_path=$file.FullName})
    }
    if($rows.Count-eq 0-or@($rows.skill_id|Sort-Object -Unique).Count-ne$rows.Count){throw 'Wrapper inventory is empty or duplicated.'}
    return @($rows)
}

function Get-G3E2RA1R2TransitionRows {
    param([object]$Context,[string]$LiteralPath)
    $path=if([string]::IsNullOrWhiteSpace($LiteralPath)){$Context.TransitionManifest}else{$LiteralPath}
    $columns=@('skill_id','action','wrapper_path','canonical_pre_path','canonical_post_path','wrapper_pre_sha256','canonical_pre_sha256','canonical_post_sha256','wrapper_post_sha256')
    $rows=Import-G3E2RA1R2ExactCsv $path $columns $null 'G3E1 wrapper transition manifest'
    if(@($rows.skill_id|Sort-Object -Unique).Count-ne$rows.Count-or@($rows.wrapper_path|Sort-Object -Unique).Count-ne$rows.Count-or@($rows|Where-Object action -CEQ 'transition').Count-ne 10-or@($rows|Where-Object action -CEQ 'verify-only').Count-ne 1){throw 'Transition manifest action split is not the accepted 10/1 set.'}
    foreach($row in $rows){if($row.action-notin@('transition','verify-only')-or$row.wrapper_path-cne('.agents/skills/'+$row.skill_id+'/SKILL.md')-or$row.wrapper_pre_sha256-notmatch'^[A-F0-9]{64}$'-or$row.wrapper_post_sha256-notmatch'^[A-F0-9]{64}$'){throw "Transition manifest row is invalid: $($row.skill_id)"};if($row.action-ceq'verify-only'-and$row.wrapper_pre_sha256-cne$row.wrapper_post_sha256){throw 'Verify-only wrapper hashes must be identical.'}}
    return $rows
}

function Get-G3E2RA1R2WrapperFingerprintV2 {
    param([object[]]$Inventory)
    $lines=@($Inventory|Sort-Object repository_path|ForEach-Object{[string]$_.repository_path+[char]9+[string]$_.bytes+[char]9+([string]$_.sha256).ToUpperInvariant()})
    $sha=[Security.Cryptography.SHA256]::Create();try{return([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes(($lines-join[char]10))))).Replace('-','')}finally{$sha.Dispose()}
}

function Get-G3E2RA1R2TreeFingerprintV2 {
    param([string]$LiteralPath)
    if(-not(Test-Path -LiteralPath $LiteralPath -PathType Container)){return 'ABSENT'}
    $base=[IO.Path]::GetFullPath($LiteralPath).TrimEnd('\');$lines=@(Get-ChildItem -LiteralPath $base -Recurse -File -Force|Sort-Object FullName|ForEach-Object{$_.FullName.Substring($base.Length+1).Replace('\','/')+[char]9+$_.Length+[char]9+(Get-G3E2RA1R2Sha256 $_.FullName)})
    $sha=[Security.Cryptography.SHA256]::Create();try{return([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes(($lines-join[char]10))))).Replace('-','')}finally{$sha.Dispose()}
}

function Test-G3E2RA1R2InvariantSchema {
    param([object]$Context,[string]$LiteralPath,[object[]]$Inventory,[object[]]$Transitions)
    if($null-eq$Inventory){$Inventory=Get-G3E2RA1R2WrapperInventory $Context};if($null-eq$Transitions){$Transitions=Get-G3E2RA1R2TransitionRows $Context}
    $rows=Import-G3E2RA1R2ExactCsv $LiteralPath @($Context.InvariantContract.columns) $null 'A1R2 live invariant manifest'
    $transitionActions=@($Transitions|Where-Object action -CEQ 'transition');$expectedTotal=[int]$Context.InvariantContract.fixed_invariant_row_count+$Inventory.Count+$transitionActions.Count
    if($rows.Count-ne$expectedTotal-or@($rows.invariant_id|Sort-Object -Unique).Count-ne$rows.Count){throw 'Dynamic live-invariant row count or ids differ from derived inventory.'}
    if(@($rows|Where-Object{$_.state_scope-notin@($Context.InvariantContract.allowed_state_scopes)-or$_.subject_type-notin@($Context.InvariantContract.allowed_subject_types)-or$_.mutation_policy-notin@($Context.InvariantContract.allowed_mutation_policies)}).Count-ne 0){throw 'Live-invariant enumeration differs from contract.'}
    foreach($row in $rows){$null=Resolve-G3E2RA1R2InRoot $Context.Root ([string]$row.repository_path);if([string]::IsNullOrWhiteSpace([string]$row.invariant_id)-or[string]::IsNullOrWhiteSpace([string]$row.basis)){throw 'Live-invariant identity is incomplete.'};if($row.subject_type-ceq'file-exact'){if($row.expected_sha256-notmatch'^[A-F0-9]{64}$'-or$row.expected_bytes-notmatch'^\d+$'-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_fingerprint_v2)-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_file_count)){throw "File invariant identity is invalid: $($row.invariant_id)"}}elseif($row.subject_type-ceq'tree-fingerprint'){if($row.expected_fingerprint_v2-notmatch'^(ABSENT|[A-F0-9]{64})$'-or$row.expected_file_count-notmatch'^\d+$'-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_sha256)-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_bytes)){throw "Tree invariant identity is invalid: $($row.invariant_id)"}}}
    $fixed=@($rows|Where-Object basis -CNE ([string]$Context.InvariantContract.wrapper_basis));$wrapperRows=@($rows|Where-Object basis -CEQ ([string]$Context.InvariantContract.wrapper_basis))
    if($fixed.Count-ne[int]$Context.InvariantContract.fixed_invariant_row_count-or@($fixed|Where-Object{$_.basis-ceq$Context.InvariantContract.protected_basis-and$_.subject_type-ceq'file-exact'}).Count-ne[int]$Context.InvariantContract.protected_file_count-or@($fixed|Where-Object{$_.basis-ceq$Context.InvariantContract.sibling_basis-and$_.subject_type-ceq'file-exact'}).Count-ne[int]$Context.InvariantContract.sibling_controller_count-or@($fixed|Where-Object subject_type -CEQ 'tree-fingerprint').Count-ne[int]$Context.InvariantContract.tree_state_count){throw 'Fixed 14/3/9 invariant partition differs from contract.'}
    $inventoryPaths=@($Inventory.repository_path|Sort-Object);$manifestPaths=@($Transitions.wrapper_path|Sort-Object)
    if(@(Compare-Object $manifestPaths @($inventoryPaths|Where-Object{$_-in$manifestPaths})).Count-ne 0){throw 'A transition-manifest wrapper is absent from the full live inventory.'}
    foreach($item in $Inventory){$transition=@($Transitions|Where-Object wrapper_path -CEQ $item.repository_path);$actual=@($wrapperRows|Where-Object repository_path -CEQ $item.repository_path);if($transition.Count-eq 1-and$transition[0].action-ceq'transition'){if($actual.Count-ne 2-or@($actual.state_scope|Sort-Object)-join','-cne'post,pre-reverse'){throw "Transition wrapper must have pre/reverse and post rows: $($item.repository_path)"};$pre=@($actual|Where-Object state_scope -CEQ 'pre-reverse')[0];$post=@($actual|Where-Object state_scope -CEQ 'post')[0];if($pre.expected_sha256-cne$transition[0].wrapper_pre_sha256-or$post.expected_sha256-cne$transition[0].wrapper_post_sha256){throw "Transition wrapper identity differs from G3E1: $($item.repository_path)"}}else{if($actual.Count-ne 1-or$actual[0].state_scope-cne'all'-or$actual[0].expected_sha256-cne$item.sha256-or[int64]$actual[0].expected_bytes-ne[int64]$item.bytes){throw "Nonparticipant wrapper is not an exact all-state invariant: $($item.repository_path)"}}}
    $virtualDiff=@($transitionActions.wrapper_path|Sort-Object);$derivedDiff=@($wrapperRows|Group-Object repository_path|Where-Object{$_.Count-eq 2}|ForEach-Object{$_.Name}|Sort-Object)
    if(@(Compare-Object $virtualDiff $derivedDiff).Count-ne 0){throw 'Virtual wrapper poststate diff differs from transition actions.'}
    return [pscustomobject]@{Rows=@($rows);Fixed=@($fixed);WrapperRows=@($wrapperRows);Inventory=@($Inventory);Transitions=@($Transitions);TransitionActions=@($transitionActions);VirtualPostDiff=@($virtualDiff);DerivedTotal=$expectedTotal;FingerprintV2=Get-G3E2RA1R2WrapperFingerprintV2 $Inventory}
}

function Test-G3E2RA1R2LiveInvariants {
    param([object]$Context,[object]$Seal,[ValidateSet('pre','post','reverse','pre-reverse')][string]$State,[switch]$AdvisoryExternalDrift)
    $artifact=Get-G3E2RA1RArtifact $Seal 'B-LIVE-INVARIANT-MANIFEST';$path=Test-G3E2RA1RBoundArtifact $Context.A1RContext $artifact;$schema=Test-G3E2RA1R2InvariantSchema $Context $path
    $external=[Collections.Generic.List[object]]::new();$active=if($State-ceq'pre-reverse'){@($schema.Rows|Where-Object state_scope -CEQ 'all')}else{@($schema.Rows|Where-Object{$_.state_scope-ceq'all'-or$_.state_scope-ceq$State-or($_.state_scope-ceq'pre-reverse'-and$State-in@('pre','reverse'))})}
    foreach($row in $active){$full=Resolve-G3E2RA1R2InRoot $Context.Root ([string]$row.repository_path);try{if($row.subject_type-ceq'file-exact'){if(-not(Test-Path -LiteralPath $full -PathType Leaf)-or(Get-G3E2RA1R2Sha256 $full)-cne$row.expected_sha256-or(Get-G3E2RA1R2Bytes $full)-ne[int64]$row.expected_bytes){throw "Live file invariant mismatch: $($row.invariant_id)"}}elseif($row.subject_type-ceq'tree-fingerprint'){if((Get-G3E2RA1R2TreeFingerprintV2 $full)-cne$row.expected_fingerprint_v2-or@(Get-ChildItem -LiteralPath $full -Recurse -File -Force).Count-ne[int]$row.expected_file_count){throw "Live tree invariant mismatch: $($row.invariant_id)"}}else{throw "Unknown subject type: $($row.subject_type)"}}catch{if($AdvisoryExternalDrift-and$row.mutation_policy-ceq'must-not-change'){$external.Add([pscustomobject]@{invariant_id=[string]$row.invariant_id;repository_path=[string]$row.repository_path;finding='external-drift'})}else{throw}}}
    if($State-ceq'pre-reverse'){foreach($transition in $schema.TransitionActions){$full=Resolve-G3E2RA1R2InRoot $Context.Root ([string]$transition.wrapper_path);$hash=Get-G3E2RA1R2Sha256 $full;if($hash-notin@([string]$transition.wrapper_pre_sha256,[string]$transition.wrapper_post_sha256)){throw "Unknown transition-wrapper bytes block reverse: $($transition.wrapper_path)"}}}
    return @($external)
}

function Get-G3E2RA1R2ExecutionPaths {
    $paths=[ordered]@{};foreach($item in (Get-G3E2RA1RExecutionPaths).GetEnumerator()){$paths[$item.Key]=$item.Value}
    $base='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r2/'
    $paths['A1R2-SEAL-CONTRACT']=$base+'contracts/live-seal-v2-a1r2-contract.json';$paths['A1R2-INVARIANT-CONTRACT']=$base+'contracts/live-invariant-v2-contract.json';$paths['A1R2-WRAPPER-FULL-TREE-CONTRACT']=$base+'contracts/wrapper-full-tree-v1-contract.json';$paths['A1R2-GATE-MAP']=$base+'manifests/gate-map-v3.csv';$paths['A1R2-GUARD-LIB']=$base+'tools/g3e2r-a1r2-guard-lib.psm1';$paths['A1R2-FINALIZER']=$base+'tools/finalize-g3e2r-live-seal-a1r2.ps1';$paths['A1R2-FORWARD']=$base+'tools/invoke-g3e2-transaction-a1r2.ps1';$paths['A1R2-REVERSE']=$base+'tools/invoke-g3e2-reverse-a1r2.ps1'
    return $paths
}

function New-G3E2RA1R2FileBinding { param([string]$IdName,[string]$Id,[object]$Context,[string]$RepositoryPath);$full=Resolve-G3E2RA1R2InRoot $Context.Root $RepositoryPath;$value=[ordered]@{};$value[$IdName]=$Id;$value.repository_path=$RepositoryPath;$value.sha256=Get-G3E2RA1R2Sha256 $full;$value.bytes=Get-G3E2RA1R2Bytes $full;return [pscustomobject]$value }

function Assert-G3E2RA1R2Baseline {
    param([object]$Context,[object]$Baseline)
    Assert-G3E2RA1R2ExactProperties $Baseline @($Context.SealContract.required_baseline_fields) 'A1R2 seal baseline';$inventory=Get-G3E2RA1R2WrapperInventory $Context;$transitions=Get-G3E2RA1R2TransitionRows $Context;$actions=@($transitions|Where-Object action -CEQ 'transition')
    if($Baseline.mos_cleanup-isnot[bool]-or[int]$Baseline.git_staged_count-ne 0-or[int]$Baseline.root_fast_errors-ne 0-or[int]$Baseline.root_fast_warnings-ne 0-or[int]$Baseline.mos_passed-ne 16-or[int]$Baseline.mos_total-ne 16-or-not[bool]$Baseline.mos_cleanup-or[string]$Baseline.mos_vault_mutation-cne'none'-or[int]$Baseline.hard_reference_pre_paths-ne 41-or[int]$Baseline.hard_reference_pre_positive-ne 41-or[int]$Baseline.live_invariant_rows-ne([int]$Context.InvariantContract.fixed_invariant_row_count+$inventory.Count+$actions.Count)-or[int]$Baseline.wrapper_tree_files-ne$inventory.Count-or[int]$Baseline.wrapper_manifest_paths-ne$transitions.Count-or[int]$Baseline.wrapper_transition_actions-ne$actions.Count-or[int]$Baseline.wrapper_verify_only_actions-ne@($transitions|Where-Object action -CEQ 'verify-only').Count-or[int]$Baseline.wrapper_external_paths-ne($inventory.Count-$transitions.Count)-or[string]$Baseline.wrapper_pre_fingerprint_v2-cne(Get-G3E2RA1R2WrapperFingerprintV2 $inventory)-or[int]$Baseline.residue_count-ne 0-or[string]$Baseline.authority_pre-cne'frozen'){throw 'A1R2 seal baseline differs from the derived green prestate.'}
}

function Assert-G3E2RA1R2SealInput {
    param([object]$Context,[object]$SealInput)
    Assert-G3E2RA1R2ExactProperties $SealInput @($Context.SealContract.required_seal_input_top_level) 'A1R2 seal input'
    if($SealInput.seal_inputs_contract-cne$Context.SealContract.seal_inputs_contract-or$SealInput.state-cne'prepared'-or$SealInput.routing_state-cne'frozen'-or$SealInput.legacy_token-cne$Context.SealContract.legacy_token-or[IO.Path]::GetFullPath([string]$SealInput.vault_root).TrimEnd('\')-cne$Context.Root-or[string]::IsNullOrWhiteSpace([string]$SealInput.transaction_id)){throw 'A1R2 seal input identity is invalid.'}
    $prepared=[DateTimeOffset]::Parse([string]$SealInput.prepared_at_utc);if($prepared-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)){throw 'A1R2 seal input prepared time is in the future.'}
    Assert-G3E2RA1R2ExactProperties $SealInput.approval @($Context.SealContract.required_approval_fields) 'A1R2 approval';if([string]::IsNullOrWhiteSpace([string]$SealInput.approval.approval_id)-or[string]::IsNullOrWhiteSpace([string]$SealInput.approval.approved_by)){throw 'A1R2 approval provenance is incomplete.'};if([DateTimeOffset]::Parse([string]$SealInput.approval.approved_at_utc)-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)){throw 'A1R2 approval time is in the future.'};foreach($field in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if($SealInput.approval.$field-isnot[bool]){throw "A1R2 approval Boolean is invalid: $field"}};Assert-G3E2RA1R2Baseline $Context $SealInput.baseline
}

function New-G3E2RA1R2Seal {
    param([object]$Context,[object]$SealInput,[object[]]$RuntimeBindings,[object]$BState)
    $bundlePaths=[ordered]@{'G3E1-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE'];'G3E2R-A-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Context.Dependencies['G3E2R-A-BUNDLE'];'G3E2R-A-DEPENDENCY-LOCK'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK'];'G3E2R-A1-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Manifest;'G3E2R-A1R-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RManifest;'G3E2R-A1R2-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.Manifest;'G3E2R-B-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $BState.Manifest}
    $bundles=foreach($id in @($Context.SealContract.required_bundle_binding_ids)){New-G3E2RA1R2FileBinding bundle_id $id $Context $bundlePaths[$id]};$executions=foreach($id in @($Context.SealContract.required_execution_binding_ids)){New-G3E2RA1R2FileBinding execution_id $id $Context (Get-G3E2RA1R2ExecutionPaths)[$id]};$artifacts=foreach($id in @($Context.SealContract.required_artifact_binding_ids)){New-G3E2RA1R2FileBinding artifact_id $id $Context (Get-G3E2RA1RArtifactPaths $Context.A1RContext)[$id]}
    return [pscustomobject][ordered]@{seal_contract='g3e2r-live-seal/v2';state='sealed';transaction_id=[string]$SealInput.transaction_id;vault_root=$Context.Root;routing_state='frozen';legacy_token=[string]$SealInput.legacy_token;approval=$SealInput.approval;time=[pscustomobject][ordered]@{prepared_at_utc=[string]$SealInput.prepared_at_utc;sealed_at_utc='';not_after_utc='';ttl_seconds=900};bundle_bindings=@($bundles);execution_bindings=@($executions);artifact_bindings=@($artifacts);runtime_bindings=@($RuntimeBindings);baseline=$SealInput.baseline}
}

function Assert-G3E2RA1R2SealClosure {
    param([object]$Context,[object]$Seal,[switch]$AllowPreparedB)
    $sets=@(@(@($Context.SealContract.required_bundle_binding_ids),@($Seal.bundle_bindings.bundle_id),7,'bundle'),@(@($Context.SealContract.required_execution_binding_ids),@($Seal.execution_bindings.execution_id),36,'execution'),@(@($Context.SealContract.required_artifact_binding_ids),@($Seal.artifact_bindings.artifact_id),15,'artifact'),@(@($Context.SealContract.required_runtime_ids),@($Seal.runtime_bindings.runtime_id),4,'runtime'))
    foreach($set in $sets){if($set[1].Count-ne$set[2]-or@($set[1]|Sort-Object -Unique).Count-ne$set[2]-or@(Compare-Object ($set[0]|Sort-Object) ($set[1]|Sort-Object)).Count-ne 0){throw "Seal $($set[3]) ids differ from contract."}}
    foreach($row in @($Seal.bundle_bindings)){Assert-G3E2RA1R2ExactProperties $row @('bundle_id','repository_path','sha256','bytes') 'Seal bundle binding'};foreach($row in @($Seal.execution_bindings)){Assert-G3E2RA1R2ExactProperties $row @('execution_id','repository_path','sha256','bytes') 'Seal execution binding'};foreach($row in @($Seal.artifact_bindings)){Assert-G3E2RA1R2ExactProperties $row @('artifact_id','repository_path','sha256','bytes') 'Seal artifact binding'};foreach($row in @($Seal.runtime_bindings)){Assert-G3E2RA1R2ExactProperties $row @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Seal runtime binding'}
    foreach($row in @($Seal.bundle_bindings+$Seal.execution_bindings+$Seal.artifact_bindings)){$full=Resolve-G3E2RA1R2InRoot $Context.Root $row.repository_path;if((Get-G3E2RA1R2Sha256 $full)-cne$row.sha256-or(Get-G3E2RA1R2Bytes $full)-ne[int64]$row.bytes){throw "Seal file binding mismatch: $($row.repository_path)"}}
    $bRoot=Resolve-G3E2RA1R2InRoot $Context.Root ([string]$Context.BContract.canonical_root);$bManifest=Join-Path $bRoot ([string]$Context.BContract.bundle_manifest_filename)
    $bundlePaths=[ordered]@{'G3E1-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE'];'G3E2R-A-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Context.Dependencies['G3E2R-A-BUNDLE'];'G3E2R-A-DEPENDENCY-LOCK'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK'];'G3E2R-A1-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RContext.A1Manifest;'G3E2R-A1R-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.A1RManifest;'G3E2R-A1R2-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $Context.Manifest;'G3E2R-B-BUNDLE'=Get-G3E2RA1R2RepositoryPath $Context.Root $bManifest}
    foreach($id in $bundlePaths.Keys){$row=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$bundlePaths[$id]){throw "Seal bundle canonical path mismatch: $id"}}
    $executionPaths=Get-G3E2RA1R2ExecutionPaths;foreach($id in $executionPaths.Keys){$row=@($Seal.execution_bindings|Where-Object execution_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$executionPaths[$id]){throw "Seal execution canonical path mismatch: $id"}}
    $artifactPaths=Get-G3E2RA1RArtifactPaths $Context.A1RContext;foreach($id in $artifactPaths.Keys){$row=@($Seal.artifact_bindings|Where-Object artifact_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$artifactPaths[$id]){throw "Seal artifact canonical path mismatch: $id"}}
    $b=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE');$null=Test-G3E2RA1R2BManifest $Context ([string]$b[0].sha256) -AllowSealed:(-not$AllowPreparedB)
}

function Read-G3E2RA1R2Seal {
    param([object]$Context,[string]$LiteralPath,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedA1R2Hash,[string]$ExpectedSealHash,[object[]]$ActualRuntimeBindings,[ValidateSet('Forward','Reverse')][string]$Use='Forward')
    if((Get-G3E2RA1R2Sha256 $Context.A1RContext.A1Manifest)-cne$ExpectedA1Hash.ToUpperInvariant()){throw 'Expected-A1-Hash mismatch at seal consumption.'};if((Get-G3E2RA1R2Sha256 $Context.A1RManifest)-cne$ExpectedA1RHash.ToUpperInvariant()){throw 'Expected-A1R-Hash mismatch at seal consumption.'};if((Get-G3E2RA1R2Sha256 $Context.Manifest)-cne$ExpectedA1R2Hash.ToUpperInvariant()){throw 'Expected-A1R2-Hash mismatch at seal consumption.'};if((Get-G3E2RA1R2Sha256 $LiteralPath)-cne$ExpectedSealHash.ToUpperInvariant()){throw 'Expected-Seal-Hash mismatch.'}
    $seal=Get-Content -LiteralPath $LiteralPath -Raw -Encoding UTF8|ConvertFrom-Json;Assert-G3E2RA1R2ExactProperties $seal @($Context.SealContract.required_top_level) 'A1R2 live seal';if($seal.seal_contract-cne'g3e2r-live-seal/v2'-or$seal.state-cne'sealed'-or$seal.routing_state-cne'frozen'-or$seal.legacy_token-cne$Context.SealContract.legacy_token-or[IO.Path]::GetFullPath([string]$seal.vault_root).TrimEnd('\')-cne$Context.Root-or[string]::IsNullOrWhiteSpace([string]$seal.transaction_id)){throw 'A1R2 live seal identity is invalid.'};Assert-G3E2RA1R2ExactProperties $seal.approval @($Context.SealContract.required_approval_fields) 'A1R2 live seal approval';if([string]::IsNullOrWhiteSpace([string]$seal.approval.approval_id)-or[string]::IsNullOrWhiteSpace([string]$seal.approval.approved_by)){throw 'A1R2 live seal approval provenance is incomplete.'};Assert-G3E2RA1R2ExactProperties $seal.time @($Context.SealContract.required_time_fields) 'A1R2 live seal time';Assert-G3E2RA1R2Baseline $Context $seal.baseline
    $prepared=[DateTimeOffset]::Parse([string]$seal.time.prepared_at_utc);$sealed=[DateTimeOffset]::Parse([string]$seal.time.sealed_at_utc);$notAfter=[DateTimeOffset]::Parse([string]$seal.time.not_after_utc);if([int]$seal.time.ttl_seconds-ne 900-or($notAfter-$sealed).TotalSeconds-ne 900-or$prepared-gt$sealed-or$sealed-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)-or[DateTimeOffset]::Parse([string]$seal.approval.approved_at_utc)-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)){throw 'A1R2 live seal time boundary is invalid.'};if($Use-ceq'Forward'-and[DateTimeOffset]::UtcNow-gt$notAfter){throw 'A1R2 live seal has expired for forward.'};foreach($f in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if($seal.approval.$f-isnot[bool]-or-not[bool]$seal.approval.$f){throw "A1R2 live seal approval missing: $f"}}
    Assert-G3E2RA1R2SealClosure $Context $seal;Assert-G3E2RA1RRuntimeBindings -Expected @($seal.runtime_bindings) -Actual $ActualRuntimeBindings;return$seal
}

function Enter-G3E2RA1R2ClosureLock {
    param([object]$Context,[object]$Seal,[string]$SealPath,[string]$ExpectedSealHash)
    Assert-G3E2RA1R2SealClosure $Context $Seal -AllowPreparedB:([string]::IsNullOrWhiteSpace($SealPath));$map=@{}
    $add={param([string]$Path,[string]$Sha,[Nullable[long]]$Bytes);$full=[IO.Path]::GetFullPath($Path);if($map.ContainsKey($full)){if($map[$full].sha256-cne$Sha.ToUpperInvariant()-or($null-ne$Bytes-and$null-ne$map[$full].bytes-and[int64]$map[$full].bytes-ne[int64]$Bytes)){throw "Conflicting closure identity: $full"};return};$map[$full]=[pscustomobject]@{sha256=$Sha.ToUpperInvariant();bytes=$Bytes}}
    foreach($row in @($Seal.bundle_bindings+$Seal.execution_bindings+$Seal.artifact_bindings)){&$add (Resolve-G3E2RA1R2InRoot $Context.Root $row.repository_path) ([string]$row.sha256) ([int64]$row.bytes)}
    foreach($runtime in @($Seal.runtime_bindings)){&$add ([string]$runtime.executable_path) ([string]$runtime.executable_sha256) $null}
    if(-not[string]::IsNullOrWhiteSpace($SealPath)){&$add $SealPath $ExpectedSealHash $null}
    $bBinding=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')[0];$bManifest=Resolve-G3E2RA1R2InRoot $Context.Root ([string]$bBinding.repository_path)
    $manifestSpecs=@(@($Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE'],'candidate_path'),@($Context.A1RContext.A1Context.Dependencies['G3E2R-A-BUNDLE'],'overlay_path'),@($Context.A1RContext.A1Manifest,'overlay_path'),@($Context.A1RManifest,'overlay_path'),@($Context.Manifest,'overlay_path'),@($bManifest,'bundle_path'))
    foreach($spec in $manifestSpecs){$manifestPath=[string]$spec[0];$base=Split-Path -Parent $manifestPath;foreach($row in @(Import-Csv -LiteralPath $manifestPath)){&$add ([IO.Path]::GetFullPath((Join-Path $base ([string]$row.($spec[1])).Replace('/','\')))) ([string]$row.sha256) ([int64]$row.bytes)}}
    foreach($row in @(Import-Csv -LiteralPath $Context.A1RContext.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK'])){&$add (Resolve-G3E2RA1R2InRoot $Context.Root ([string]$row.repository_path)) ([string]$row.sha256) ([int64]$row.bytes)}
    $handles=[Collections.Generic.List[object]]::new();try{foreach($path in @($map.Keys|Sort-Object)){$stream=[IO.File]::Open($path,[IO.FileMode]::Open,[IO.FileAccess]::Read,[IO.FileShare]::Read);$sha=[Security.Cryptography.SHA256]::Create();try{$hash=([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','')}finally{$sha.Dispose()};if($hash-cne$map[$path].sha256-or($null-ne$map[$path].bytes-and$stream.Length-ne[int64]$map[$path].bytes)){throw "Locked closure identity mismatch: $path"};$handles.Add([pscustomobject]@{Path=$path;Stream=$stream;Sha256=$hash;Bytes=$map[$path].bytes})};return [pscustomobject]@{Handles=$handles;Count=$handles.Count}}catch{foreach($item in $handles){$item.Stream.Dispose()};throw}
}
function Test-G3E2RA1R2ClosureLock { param([object]$Lock);foreach($item in @($Lock.Handles)){$item.Stream.Position=0;$sha=[Security.Cryptography.SHA256]::Create();try{$hash=([BitConverter]::ToString($sha.ComputeHash($item.Stream))).Replace('-','')}finally{$sha.Dispose()};if($hash-cne$item.Sha256-or($null-ne$item.Bytes-and$item.Stream.Length-ne[int64]$item.Bytes)){throw "Held closure changed: $($item.Path)"}} }
function Exit-G3E2RA1R2ClosureLock { param([object]$Lock);if($null-ne$Lock){foreach($item in @($Lock.Handles|Sort-Object Path -Descending)){$item.Stream.Dispose()}} }

function Get-G3E2RA1R2RuntimeBindings { param([object]$Context,[string]$PythonExecutable);return @(Get-G3E2RA1RRuntimeBindings -Context $Context.A1RContext -PythonExecutable $PythonExecutable) }
function Test-G3E2RA1R2BManifest {
    param([object]$Context,[string]$ExpectedBHash,[switch]$AllowSealed)
    $bRoot=Resolve-G3E2RA1R2InRoot $Context.Root ([string]$Context.BContract.canonical_root);$bManifest=Join-Path $bRoot ([string]$Context.BContract.bundle_manifest_filename)
    if(-not[string]::IsNullOrWhiteSpace($ExpectedBHash)-and(Test-Path -LiteralPath $bManifest -PathType Leaf)-and(Get-G3E2RA1R2Sha256 $bManifest)-cne$ExpectedBHash.ToUpperInvariant()){throw 'Expected-B-Hash mismatch.'}
    return Test-G3E2RA1RBManifest -Context $Context.A1RContext -ExpectedBHash $ExpectedBHash -AllowSealed:$AllowSealed
}
function Get-G3E2RA1R2Artifact { param([object]$Seal,[string]$Id);return Get-G3E2RA1RArtifact $Seal $Id }
function Test-G3E2RA1R2BoundArtifact { param([object]$Context,[object]$Artifact);return Test-G3E2RA1RBoundArtifact $Context.A1RContext $Artifact }
function Test-G3E2RA1R2HardReferences { param([object]$Context,[object]$Seal,[string]$State,[string]$RipgrepExecutable);Test-G3E2RA1RHardReferences $Context.A1RContext $Seal $State $RipgrepExecutable }
function Test-G3E2RA1R2WorkspaceAdvisory { param([object]$Context,[object]$Seal);Test-G3E2RA1RWorkspaceAdvisory $Context.A1RContext $Seal }
function Assert-G3E2RA1R2GitStagingEmpty { param([string]$VaultRoot,[string]$GitExecutable);Assert-G3E2RA1RGitStagingEmpty $VaultRoot $GitExecutable }
function Assert-G3E2RA1R2NoResidue { param([string]$VaultRoot);Assert-G3E2RA1RNoResidue $VaultRoot }
function Enter-G3E2RA1R2Mutex { param([string]$VaultRoot);return Enter-G3E2RA1RMutex $VaultRoot }
function Exit-G3E2RA1R2Mutex { param([object]$Mutex);Exit-G3E2RA1RMutex $Mutex }
function Test-G3E2RA1R2Administrator { return Test-G3E2RA1RAdministrator }
function Add-G3E2RA1R2CompatibilityProperties { param([object]$Seal);return Add-G3E2RA1RCompatibilityProperties $Seal }

Export-ModuleMember -Function @('Get-G3E2RA1R2Sha256','Get-G3E2RA1R2Bytes','Resolve-G3E2RA1R2InRoot','Get-G3E2RA1R2RepositoryPath','Assert-G3E2RA1R2ExactProperties','Import-G3E2RA1R2ExactCsv','Test-G3E2RA1R2BoundManifest','Get-G3E2RA1R2Context','Get-G3E2RA1R2WrapperInventory','Get-G3E2RA1R2TransitionRows','Get-G3E2RA1R2WrapperFingerprintV2','Get-G3E2RA1R2TreeFingerprintV2','Test-G3E2RA1R2InvariantSchema','Test-G3E2RA1R2LiveInvariants','Get-G3E2RA1R2ExecutionPaths','Assert-G3E2RA1R2Baseline','Assert-G3E2RA1R2SealInput','New-G3E2RA1R2Seal','Assert-G3E2RA1R2SealClosure','Read-G3E2RA1R2Seal','Enter-G3E2RA1R2ClosureLock','Test-G3E2RA1R2ClosureLock','Exit-G3E2RA1R2ClosureLock','Get-G3E2RA1R2RuntimeBindings','Test-G3E2RA1R2BManifest','Get-G3E2RA1R2Artifact','Test-G3E2RA1R2BoundArtifact','Test-G3E2RA1R2HardReferences','Test-G3E2RA1R2WorkspaceAdvisory','Assert-G3E2RA1R2GitStagingEmpty','Assert-G3E2RA1R2NoResidue','Enter-G3E2RA1R2Mutex','Exit-G3E2RA1R2Mutex','Test-G3E2RA1R2Administrator','Add-G3E2RA1R2CompatibilityProperties')
