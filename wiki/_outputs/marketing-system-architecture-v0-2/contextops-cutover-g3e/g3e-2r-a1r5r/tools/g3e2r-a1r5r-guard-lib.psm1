Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module Microsoft.PowerShell.Management -RequiredVersion 3.1.0.0 -Force
Import-Module Microsoft.PowerShell.Utility -RequiredVersion 3.1.0.0 -Force
$script:G3E2RA1R5RUtf8NoBom = [Text.UTF8Encoding]::new($false)

function Get-G3E2RA1R5RSha256 {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    if(-not(Test-Path -LiteralPath $LiteralPath -PathType Leaf)){throw "File is missing: $LiteralPath"}
    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Get-G3E2RA1R5RBytes {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    return (Get-Item -LiteralPath $LiteralPath -Force).Length
}

function Get-G3E2RA1R5RBytesSha256 {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][byte[]]$Bytes)
    $sha=[Security.Cryptography.SHA256]::Create()
    try{return ([BitConverter]::ToString($sha.ComputeHash($Bytes))).Replace('-','')}
    finally{$sha.Dispose()}
}

function Get-G3E2RA1R5ROrdinalStrings {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Values,[switch]$Descending)
    [string[]]$copy=@($Values|ForEach-Object{[string]$_})
    [Array]::Sort($copy,[StringComparer]::Ordinal)
    if($Descending){[Array]::Reverse($copy)}
    return @($copy)
}

function Test-G3E2RA1R5ROrdinalUnique {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Values)
    $set=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach($value in @($Values)){if(-not$set.Add([string]$value)){return $false}}
    return $true
}

function Test-G3E2RA1R5ROrdinalSetEqual {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Expected,[Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Actual)
    if($Expected.Count-ne$Actual.Count){return $false}
    if(-not(Test-G3E2RA1R5ROrdinalUnique $Expected)-or-not(Test-G3E2RA1R5ROrdinalUnique $Actual)){return $false}
    $left=@(Get-G3E2RA1R5ROrdinalStrings $Expected);$right=@(Get-G3E2RA1R5ROrdinalStrings $Actual)
    for($i=0;$i-lt$left.Count;$i++){if($left[$i]-cne$right[$i]){return $false}}
    return $true
}

function Resolve-G3E2RA1R5RInRoot {
    param([string]$Root,[string]$RepositoryPath,[switch]$ForMutation)
    $base=[IO.Path]::GetFullPath($Root).TrimEnd('\')
    if([IO.Path]::IsPathRooted($RepositoryPath)){throw "Repository path must be relative: $RepositoryPath"}
    $full=[IO.Path]::GetFullPath((Join-Path $base $RepositoryPath.Replace('/','\')))
    if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "Repository path escapes the Vault: $RepositoryPath"}
    if($ForMutation-and$RepositoryPath-match'^(raw|research/assets)(/|$)'){throw "Protected source mutation is forbidden: $RepositoryPath"}
    return $full
}

function Get-G3E2RA1R5RRepositoryPath {
    param([string]$Root,[string]$LiteralPath)
    $base=[IO.Path]::GetFullPath($Root).TrimEnd('\');$full=[IO.Path]::GetFullPath($LiteralPath)
    if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "Path is outside the Vault: $LiteralPath"}
    return $full.Substring($base.Length+1).Replace('\','/')
}

function Assert-G3E2RA1R5RExactProperties {
    param([object]$Value,[string[]]$Expected,[string]$Label)
    $actual=@($Value.PSObject.Properties.Name)
    if(-not(Test-G3E2RA1R5ROrdinalSetEqual $Expected $actual)){throw "$Label properties differ from contract."}
}

function Import-G3E2RA1R5RExactCsv {
    param([string]$LiteralPath,[string[]]$Columns,[Nullable[int]]$Count,[string]$Label)
    $rows=@(Import-Csv -LiteralPath $LiteralPath)
    if($null-ne$Count-and$rows.Count-ne[int]$Count){throw "$Label must contain $Count rows; found $($rows.Count)."}
    foreach($row in $rows){Assert-G3E2RA1R5RExactProperties $row $Columns $Label}
    return $rows
}

function Test-G3E2RA1R5RBoundManifest {
    param([string]$ManifestPath,[string]$BaseDirectory,[string]$PathColumn,[string[]]$Columns,[int]$Count,[string]$Label)
    $rows=Import-G3E2RA1R5RExactCsv $ManifestPath $Columns $Count $Label
    if(-not(Test-G3E2RA1R5ROrdinalUnique @($rows|ForEach-Object{[string]$_.$PathColumn}))){throw "$Label paths must be ordinal-unique."}
    $base=[IO.Path]::GetFullPath($BaseDirectory).TrimEnd('\')
    foreach($row in $rows){
        $relative=[string]$row.$PathColumn
        if([IO.Path]::IsPathRooted($relative)){throw "$Label path must be relative: $relative"}
        $full=[IO.Path]::GetFullPath((Join-Path $base $relative.Replace('/','\')))
        if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "$Label path escapes its root: $relative"}
        if((Get-G3E2RA1R5RSha256 $full)-cne([string]$row.sha256).ToUpperInvariant()-or(Get-G3E2RA1R5RBytes $full)-ne[int64]$row.bytes){throw "$Label identity mismatch: $relative"}
    }
    return $rows
}

function Get-G3E2RA1R5RContext {
    param([string]$VaultRoot,[string]$OverlayRoot,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedA1R2Hash,[string]$ExpectedA1R3Hash,[string]$ExpectedA1R4Hash,[string]$ExpectedA1R5RHash)
    $root=(Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\');$overlay=(Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
    $canonical=Resolve-G3E2RA1R5RInRoot $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r5r'
    if($overlay-cne$canonical){throw 'A1R5R overlay is not at its canonical repository path.'}
    $lock=Import-G3E2RA1R5RExactCsv (Join-Path $overlay 'dependency-lock.csv') @('dependency_id','role','repository_path','sha256','bytes','reuse_mode','required_by') 1 'A1R5R dependency lock'
    if($lock[0].dependency_id-cne'G3E2R-A1R4-BUNDLE'-or$lock[0].reuse_mode-cne'verify-transitively-never-modify'){throw 'A1R5R dependency lock must bind only the immutable A1R4 root.'}
    $a1r4Manifest=Resolve-G3E2RA1R5RInRoot $root ([string]$lock[0].repository_path)
    if((Get-G3E2RA1R5RSha256 $a1r4Manifest)-cne[string]$lock[0].sha256-or(Get-G3E2RA1R5RBytes $a1r4Manifest)-ne[int64]$lock[0].bytes){throw 'A1R4 dependency root mismatch.'}
    if(-not[string]::IsNullOrWhiteSpace($ExpectedA1R4Hash)-and(Get-G3E2RA1R5RSha256 $a1r4Manifest)-cne$ExpectedA1R4Hash.ToUpperInvariant()){throw 'Expected-A1R4-Hash mismatch.'}
    $a1r4Root=Split-Path -Parent $a1r4Manifest
    Import-Module (Join-Path $a1r4Root 'tools/g3e2r-a1r4-guard-lib.psm1') -Force
    $a1r4Context=Get-G3E2RA1R4Context -VaultRoot $root -OverlayRoot $a1r4Root -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash -ExpectedA1R2Hash $ExpectedA1R2Hash -ExpectedA1R3Hash $ExpectedA1R3Hash -ExpectedA1R4Hash ([string]$lock[0].sha256)
    $manifest=Join-Path $overlay 'a1r5r-bundle-manifest.csv'
    if(Test-Path -LiteralPath $manifest -PathType Leaf){
        if(-not[string]::IsNullOrWhiteSpace($ExpectedA1R5RHash)-and(Get-G3E2RA1R5RSha256 $manifest)-cne$ExpectedA1R5RHash.ToUpperInvariant()){throw 'Expected-A1R5R-Hash mismatch.'}
        $rows=Test-G3E2RA1R5RBoundManifest $manifest $overlay 'overlay_path' @('role','overlay_path','sha256','bytes') 15 'A1R5R bundle'
        $actual=@(Get-ChildItem -LiteralPath $overlay -Recurse -File|ForEach-Object{$_.FullName.Substring($overlay.Length+1).Replace('\','/')})
        $expected=@($rows.overlay_path)+'a1r5r-bundle-manifest.csv'
        if($actual.Count-ne 16-or-not(Test-G3E2RA1R5ROrdinalSetEqual $expected $actual)){throw 'A1R5R overlay differs from its exact sixteen-file inventory.'}
    }
    $runtime=Get-Content -LiteralPath (Join-Path $overlay 'contracts/entrypoint-runtime-closure-v1-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $seal=Get-Content -LiteralPath (Join-Path $overlay 'contracts/live-seal-v2-a1r5r-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $jsonTime=Get-Content -LiteralPath (Join-Path $overlay 'contracts/json-time-v1-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $temporal=Get-Content -LiteralPath (Join-Path $overlay 'contracts/temporal-boundary-v1-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $gates=Import-G3E2RA1R5RExactCsv (Join-Path $overlay 'manifests/gate-map-v6.csv') @('direction','sequence','step_id','mutation_state','gate_function','success_contract','failure_action') 40 'A1R5R gate map'
    if(@($gates|Where-Object direction -CEQ 'SEAL').Count-ne 9-or@($gates|Where-Object direction -CEQ 'FWD').Count-ne 19-or@($gates|Where-Object direction -CEQ 'REV').Count-ne 12-or-not(Test-G3E2RA1R5ROrdinalUnique @($gates.step_id))){throw 'A1R5R gate map does not have the exact 9/19/12 shape.'}
    if($seal.bundle_binding_count-ne 10-or$seal.execution_binding_count-ne 61-or$seal.artifact_binding_count-ne 15-or$seal.runtime_binding_count-ne 4-or$seal.expected_hash_boundary_count-ne 9){throw 'A1R5R seal contract cardinality differs from approval.'}
    if($runtime.contract_id-cne'g3e2r-entrypoint-runtime-closure/v1'-or$runtime.receipt_contract_id-cne'g3e2r-entrypoint-import-receipt/v2-a1r5r'-or@($runtime.components).Count-ne 5){throw 'A1R5R entrypoint runtime closure differs from approval.'}
    $invariant=$a1r4Context.InvariantContract;$fingerprint=$a1r4Context.FingerprintContract
    return [pscustomobject]@{Root=$root;Overlay=$overlay;Manifest=$manifest;A1R4Manifest=$a1r4Manifest;A1R4Root=$a1r4Root;A1R4Context=$a1r4Context;A1R3Manifest=$a1r4Context.A1R3Manifest;A1R3Root=$a1r4Context.A1R3Root;A1R3Context=$a1r4Context.A1R3Context;A1R2Manifest=$a1r4Context.A1R2Manifest;A1R2Root=$a1r4Context.A1R2Root;A1R2Context=$a1r4Context.A1R2Context;SealContract=$seal;RuntimeClosureContract=$runtime;JsonTimeContract=$jsonTime;TemporalContract=$temporal;InvariantContract=$invariant;FingerprintContract=$fingerprint;Gates=$gates;TransitionManifest=$a1r4Context.TransitionManifest;BContract=$a1r4Context.BContract;HardReferenceContract=$a1r4Context.HardReferenceContract}
}

function Initialize-G3E2RA1R5REntrypoint {
    param([Parameter(Mandatory=$true)][object]$Context,[Parameter(Mandatory=$true)][string]$ComponentId)
    $contract=$Context.RuntimeClosureContract
    if($ComponentId-notin@($contract.components.component_id)){throw 'Unknown A1R5R entrypoint component.'}
    $loaded=[Collections.Generic.List[object]]::new()
    foreach($binding in @($contract.operative_bindings)){
        $path=Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$binding.repository_path)
        if((Get-G3E2RA1R5RSha256 $path)-cne[string]$binding.sha256-or(Get-G3E2RA1R5RBytes $path)-ne[int64]$binding.bytes){throw "A1R5R operative binding mismatch: $($binding.binding_id)"}
        if($binding.binding_id-ceq'O20'){Import-Module $path}else{Import-Module $path -Force -Global}
        $loaded.Add([pscustomobject][ordered]@{binding_id=[string]$binding.binding_id;repository_path=[string]$binding.repository_path;sha256=[string]$binding.sha256;bytes=[int64]$binding.bytes})
    }
    return [pscustomobject][ordered]@{receipt_id=[string]$contract.receipt_contract_id;component_id=$ComponentId;platform_closure='P2/C5';import_order=@($contract.import_order);operative_bindings=@($loaded);verdict='PASS'}
}

function Get-G3E2RA1R5RTreeStateV3 {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    if(-not(Test-Path -LiteralPath $LiteralPath)){return [pscustomobject]@{Fingerprint='ABSENT';FileCount=0;Lines=@()}}
    if(-not(Test-Path -LiteralPath $LiteralPath -PathType Container)){throw "Tree root is not a directory: $LiteralPath"}
    $base=[IO.Path]::GetFullPath($LiteralPath).TrimEnd('\')
    if((Get-Item -LiteralPath $base -Force).Attributes-band[IO.FileAttributes]::ReparsePoint){throw "Tree root is reparse-backed: $base"}
    $all=@(Get-ChildItem -LiteralPath $base -Recurse -Force)
    foreach($item in $all){if($item.Attributes-band[IO.FileAttributes]::ReparsePoint){throw "Tree contains a reparse point: $($item.FullName)"}}
    $paths=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    $lines=[Collections.Generic.List[string]]::new()
    foreach($file in @($all|Where-Object{-not$_.PSIsContainer})){
        $relative=$file.FullName.Substring($base.Length+1).Replace('\','/')
        if([string]::IsNullOrWhiteSpace($relative)-or-not$paths.Add($relative)){throw "Tree path is empty or not ordinal-unique: $relative"}
        $lines.Add($relative+[char]9+[string]$file.Length+[char]9+(Get-G3E2RA1R5RSha256 $file.FullName))
    }
    $ordered=@(Get-G3E2RA1R5ROrdinalStrings @($lines))
    $fingerprint=Get-G3E2RA1R5RBytesSha256 $script:G3E2RA1R5RUtf8NoBom.GetBytes(($ordered-join[char]10))
    return [pscustomobject]@{Fingerprint=$fingerprint;FileCount=$ordered.Count;Lines=$ordered}
}

function Get-G3E2RA1R5RTreeFingerprintV3 {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    return (Get-G3E2RA1R5RTreeStateV3 $LiteralPath).Fingerprint
}

function Get-G3E2RA1R5RWrapperInventory {
    param([object]$Context,[string]$InventoryRoot)
    $root=if([string]::IsNullOrWhiteSpace($InventoryRoot)){Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$Context.InvariantContract.wrapper_inventory_root)}else{[IO.Path]::GetFullPath($InventoryRoot)}
    if(-not(Test-Path -LiteralPath $root -PathType Container)-or((Get-Item -LiteralPath $root -Force).Attributes-band[IO.FileAttributes]::ReparsePoint)){throw 'Wrapper inventory root is missing or reparse-backed.'}
    $all=@(Get-ChildItem -LiteralPath $root -Force -Recurse)
    foreach($item in $all){if($item.Attributes-band[IO.FileAttributes]::ReparsePoint){throw "Wrapper tree contains a reparse point: $($item.FullName)"}}
    $byPath=[Collections.Generic.Dictionary[string,object]]::new([StringComparer]::Ordinal)
    $skills=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach($file in @($all|Where-Object{-not$_.PSIsContainer})){
        $relative=$file.FullName.Substring($root.TrimEnd('\').Length+1).Replace('\','/');$parts=$relative.Split('/')
        if($parts.Count-ne 2-or$parts[1]-cne'SKILL.md'-or[string]::IsNullOrWhiteSpace($parts[0])){throw "Every wrapper-tree file must be <skill>/SKILL.md: $relative"}
        if(-not$skills.Add($parts[0])){throw "Wrapper skill id is not ordinal-unique: $($parts[0])"}
        $repo=if($root.StartsWith($Context.Root+'\',[StringComparison]::OrdinalIgnoreCase)){Get-G3E2RA1R5RRepositoryPath $Context.Root $file.FullName}else{'.agents/skills/'+$relative}
        if($byPath.ContainsKey($repo)){throw "Wrapper repository path is not ordinal-unique: $repo"}
        $byPath[$repo]=[pscustomobject][ordered]@{skill_id=$parts[0];repository_path=$repo;sha256=Get-G3E2RA1R5RSha256 $file.FullName;bytes=Get-G3E2RA1R5RBytes $file.FullName;literal_path=$file.FullName}
    }
    if($byPath.Count-eq 0){throw 'Wrapper inventory is empty.'}
    $rows=[Collections.Generic.List[object]]::new()
    foreach($path in @(Get-G3E2RA1R5ROrdinalStrings @($byPath.Keys))){$rows.Add($byPath[$path])}
    return @($rows)
}

function Get-G3E2RA1R5RTransitionRows {
    param([object]$Context,[string]$LiteralPath)
    $path=if([string]::IsNullOrWhiteSpace($LiteralPath)){$Context.TransitionManifest}else{$LiteralPath}
    $columns=@('skill_id','action','wrapper_path','canonical_pre_path','canonical_post_path','wrapper_pre_sha256','canonical_pre_sha256','canonical_post_sha256','wrapper_post_sha256')
    $rows=Import-G3E2RA1R5RExactCsv $path $columns $null 'G3E1 wrapper transition manifest'
    if(-not(Test-G3E2RA1R5ROrdinalUnique @($rows.skill_id))-or-not(Test-G3E2RA1R5ROrdinalUnique @($rows.wrapper_path))-or@($rows|Where-Object action -CEQ 'transition').Count-ne 10-or@($rows|Where-Object action -CEQ 'verify-only').Count-ne 1){throw 'Transition manifest action split is not the accepted 10/1 set.'}
    foreach($row in $rows){
        if($row.action-notin@('transition','verify-only')-or$row.wrapper_path-cne('.agents/skills/'+$row.skill_id+'/SKILL.md')-or$row.wrapper_pre_sha256-notmatch'^[A-F0-9]{64}$'-or$row.wrapper_post_sha256-notmatch'^[A-F0-9]{64}$'){throw "Transition manifest row is invalid: $($row.skill_id)"}
        if($row.action-ceq'verify-only'-and$row.wrapper_pre_sha256-cne$row.wrapper_post_sha256){throw 'Verify-only wrapper hashes must be identical.'}
    }
    return $rows
}

function Get-G3E2RA1R5RWrapperFingerprintV3 {
    param([Parameter(Mandatory=$true)][object[]]$Inventory)
    $paths=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    $lines=[Collections.Generic.List[string]]::new()
    foreach($row in @($Inventory)){
        $path=[string]$row.repository_path
        if([string]::IsNullOrWhiteSpace($path)-or-not$paths.Add($path)){throw "Wrapper fingerprint path is empty or not ordinal-unique: $path"}
        if([string]$row.sha256-notmatch'^[A-Fa-f0-9]{64}$'-or[string]$row.bytes-notmatch'^\d+$'){throw "Wrapper fingerprint identity is invalid: $path"}
        $lines.Add($path+[char]9+[string]$row.bytes+[char]9+([string]$row.sha256).ToUpperInvariant())
    }
    $ordered=@(Get-G3E2RA1R5ROrdinalStrings @($lines))
    return Get-G3E2RA1R5RBytesSha256 $script:G3E2RA1R5RUtf8NoBom.GetBytes(($ordered-join[char]10))
}

function Test-G3E2RA1R5RInvariantSchema {
    param([object]$Context,[string]$LiteralPath,[object[]]$Inventory,[object[]]$Transitions)
    if($null-eq$Inventory){$Inventory=Get-G3E2RA1R5RWrapperInventory $Context}
    if($null-eq$Transitions){$Transitions=Get-G3E2RA1R5RTransitionRows $Context}
    $rows=Import-G3E2RA1R5RExactCsv $LiteralPath @($Context.InvariantContract.columns) $null 'A1R5R live invariant manifest'
    $transitionActions=@($Transitions|Where-Object action -CEQ 'transition');$expectedTotal=[int]$Context.InvariantContract.fixed_invariant_row_count+$Inventory.Count+$transitionActions.Count
    if($rows.Count-ne$expectedTotal-or-not(Test-G3E2RA1R5ROrdinalUnique @($rows.invariant_id))){throw 'Dynamic live-invariant row count or ids differ from derived inventory.'}
    if(@($rows|Where-Object{$_.state_scope-notin@($Context.InvariantContract.allowed_state_scopes)-or$_.subject_type-notin@($Context.InvariantContract.allowed_subject_types)-or$_.mutation_policy-notin@($Context.InvariantContract.allowed_mutation_policies)}).Count-ne 0){throw 'Live-invariant enumeration differs from contract.'}
    foreach($row in $rows){
        $null=Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$row.repository_path)
        if([string]::IsNullOrWhiteSpace([string]$row.invariant_id)-or[string]::IsNullOrWhiteSpace([string]$row.basis)){throw 'Live-invariant identity is incomplete.'}
        if($row.subject_type-ceq'file-exact'){
            if($row.expected_sha256-notmatch'^[A-F0-9]{64}$'-or$row.expected_bytes-notmatch'^\d+$'-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_fingerprint_v3)-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_file_count)){throw "File invariant identity is invalid: $($row.invariant_id)"}
        }elseif($row.subject_type-ceq'tree-fingerprint'){
            if($row.expected_fingerprint_v3-notmatch'^(ABSENT|[A-F0-9]{64})$'-or$row.expected_file_count-notmatch'^\d+$'-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_sha256)-or-not[string]::IsNullOrWhiteSpace([string]$row.expected_bytes)){throw "Tree invariant identity is invalid: $($row.invariant_id)"}
        }
    }
    $fixed=@($rows|Where-Object basis -CNE ([string]$Context.InvariantContract.wrapper_basis));$wrapperRows=@($rows|Where-Object basis -CEQ ([string]$Context.InvariantContract.wrapper_basis))
    if($fixed.Count-ne[int]$Context.InvariantContract.fixed_invariant_row_count-or@($fixed|Where-Object{$_.basis-ceq$Context.InvariantContract.protected_basis-and$_.subject_type-ceq'file-exact'}).Count-ne[int]$Context.InvariantContract.protected_file_count-or@($fixed|Where-Object{$_.basis-ceq$Context.InvariantContract.sibling_basis-and$_.subject_type-ceq'file-exact'}).Count-ne[int]$Context.InvariantContract.sibling_controller_count-or@($fixed|Where-Object subject_type -CEQ 'tree-fingerprint').Count-ne[int]$Context.InvariantContract.tree_state_count){throw 'Fixed 14/3/9 invariant partition differs from contract.'}
    $inventorySet=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal);foreach($path in @($Inventory.repository_path)){$null=$inventorySet.Add([string]$path)}
    foreach($path in @($Transitions.wrapper_path)){if(-not$inventorySet.Contains([string]$path)){throw 'A transition-manifest wrapper is absent from the full live inventory.'}}
    $byWrapper=[Collections.Generic.Dictionary[string,object]]::new([StringComparer]::Ordinal)
    foreach($row in $wrapperRows){$path=[string]$row.repository_path;if(-not$byWrapper.ContainsKey($path)){$byWrapper[$path]=[Collections.Generic.List[object]]::new()};$byWrapper[$path].Add($row)}
    foreach($item in $Inventory){
        $transition=@($Transitions|Where-Object wrapper_path -CEQ $item.repository_path);$actual=@(if($byWrapper.ContainsKey([string]$item.repository_path)){@($byWrapper[[string]$item.repository_path])}else{@()})
        if($transition.Count-eq 1-and$transition[0].action-ceq'transition'){
            if($actual.Count-ne 2-or-not(Test-G3E2RA1R5ROrdinalSetEqual @($actual.state_scope) @('post','pre-reverse'))){throw "Transition wrapper must have pre/reverse and post rows: $($item.repository_path)"}
            $pre=@($actual|Where-Object state_scope -CEQ 'pre-reverse')[0];$post=@($actual|Where-Object state_scope -CEQ 'post')[0]
            if($pre.expected_sha256-cne$transition[0].wrapper_pre_sha256-or$post.expected_sha256-cne$transition[0].wrapper_post_sha256){throw "Transition wrapper identity differs from G3E1: $($item.repository_path)"}
        }else{
            if($actual.Count-ne 1-or$actual[0].state_scope-cne'all'-or$actual[0].expected_sha256-cne$item.sha256-or[int64]$actual[0].expected_bytes-ne[int64]$item.bytes){throw "Nonparticipant wrapper is not an exact all-state invariant: $($item.repository_path)"}
        }
    }
    $virtualDiff=@(Get-G3E2RA1R5ROrdinalStrings @($transitionActions.wrapper_path));$derived=[Collections.Generic.List[string]]::new()
    foreach($key in $byWrapper.Keys){if($byWrapper[$key].Count-eq 2){$derived.Add($key)}}
    $derivedDiff=@(Get-G3E2RA1R5ROrdinalStrings @($derived))
    if(-not(Test-G3E2RA1R5ROrdinalSetEqual $virtualDiff $derivedDiff)){throw 'Virtual wrapper poststate diff differs from transition actions.'}
    return [pscustomobject]@{Rows=@($rows);Fixed=@($fixed);WrapperRows=@($wrapperRows);Inventory=@($Inventory);Transitions=@($Transitions);TransitionActions=@($transitionActions);VirtualPostDiff=@($virtualDiff);DerivedTotal=$expectedTotal;FingerprintV3=Get-G3E2RA1R5RWrapperFingerprintV3 $Inventory}
}

function Test-G3E2RA1R5RLiveInvariants {
    param([object]$Context,[object]$Seal,[ValidateSet('pre','post','reverse','pre-reverse')][string]$State,[switch]$AdvisoryExternalDrift)
    $artifact=Get-G3E2RA1R5RArtifact $Seal 'B-LIVE-INVARIANT-MANIFEST';$path=Test-G3E2RA1R5RBoundArtifact $Context $artifact;$schema=Test-G3E2RA1R5RInvariantSchema $Context $path
    $external=[Collections.Generic.List[object]]::new()
    $active=if($State-ceq'pre-reverse'){@($schema.Rows|Where-Object state_scope -CEQ 'all')}else{@($schema.Rows|Where-Object{$_.state_scope-ceq'all'-or$_.state_scope-ceq$State-or($_.state_scope-ceq'pre-reverse'-and$State-in@('pre','reverse'))})}
    foreach($row in $active){
        $full=Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$row.repository_path)
        try{
            if($row.subject_type-ceq'file-exact'){
                if(-not(Test-Path -LiteralPath $full -PathType Leaf)-or(Get-G3E2RA1R5RSha256 $full)-cne$row.expected_sha256-or(Get-G3E2RA1R5RBytes $full)-ne[int64]$row.expected_bytes){throw "Live file invariant mismatch: $($row.invariant_id)"}
            }elseif($row.subject_type-ceq'tree-fingerprint'){
                $stateValue=Get-G3E2RA1R5RTreeStateV3 $full
                if($stateValue.Fingerprint-cne$row.expected_fingerprint_v3-or$stateValue.FileCount-ne[int]$row.expected_file_count){throw "Live tree invariant mismatch: $($row.invariant_id)"}
            }else{throw "Unknown subject type: $($row.subject_type)"}
        }catch{
            if($AdvisoryExternalDrift-and$row.mutation_policy-ceq'must-not-change'){$external.Add([pscustomobject]@{invariant_id=[string]$row.invariant_id;repository_path=[string]$row.repository_path;finding='external-drift'})}else{throw}
        }
    }
    if($State-ceq'pre-reverse'){
        foreach($transition in $schema.TransitionActions){
            $full=Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$transition.wrapper_path);$hash=Get-G3E2RA1R5RSha256 $full
            if($hash-notin@([string]$transition.wrapper_pre_sha256,[string]$transition.wrapper_post_sha256)){throw "Unknown transition-wrapper bytes block reverse: $($transition.wrapper_path)"}
        }
    }
    return @($external)
}

function Get-G3E2RA1R5RExecutionPaths {
    $paths=[ordered]@{};foreach($item in (Get-G3E2RA1R4ExecutionPaths).GetEnumerator()){$paths[$item.Key]=$item.Value}
    $base='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r5r/'
    $paths['A1R5R-RUNTIME-CLOSURE-CONTRACT']=$base+'contracts/entrypoint-runtime-closure-v1-contract.json'
    $paths['A1R5R-SEAL-CONTRACT']=$base+'contracts/live-seal-v2-a1r5r-contract.json'
    $paths['A1R5R-GATE-MAP']=$base+'manifests/gate-map-v6.csv'
    $paths['A1R5R-GUARD-LIB']=$base+'tools/g3e2r-a1r5r-guard-lib.psm1'
    $paths['A1R5R-FINALIZER']=$base+'tools/finalize-g3e2r-live-seal-a1r5r.ps1'
    $paths['A1R5R-FORWARD']=$base+'tools/invoke-g3e2-transaction-a1r5r.ps1'
    $paths['A1R5R-REVERSE']=$base+'tools/invoke-g3e2-reverse-a1r5r.ps1'
    $paths['A1R5R-O10-TRANSACTION-LIB']='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/tools/g3e2r-transaction-lib.psm1'
    $paths['A1R5R-O20-A1R4-GUARD-LIB']='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r4/tools/g3e2r-a1r4-guard-lib.psm1'
    return $paths
}

function New-G3E2RA1R5RFileBinding {
    param([string]$IdName,[string]$Id,[object]$Context,[string]$RepositoryPath)
    $full=Resolve-G3E2RA1R5RInRoot $Context.Root $RepositoryPath;$value=[ordered]@{};$value[$IdName]=$Id
    $value.repository_path=$RepositoryPath;$value.sha256=Get-G3E2RA1R5RSha256 $full;$value.bytes=Get-G3E2RA1R5RBytes $full
    return [pscustomobject]$value
}

function Assert-G3E2RA1R5RBaseline {
    param([object]$Context,[object]$Baseline)
    Assert-G3E2RA1R5RExactProperties $Baseline @($Context.SealContract.required_baseline_fields) 'A1R5R seal baseline'
    $inventory=Get-G3E2RA1R5RWrapperInventory $Context;$transitions=Get-G3E2RA1R5RTransitionRows $Context;$actions=@($transitions|Where-Object action -CEQ 'transition')
    if($Baseline.mos_cleanup-isnot[bool]-or[int]$Baseline.git_staged_count-ne 0-or[int]$Baseline.root_fast_errors-ne 0-or[int]$Baseline.root_fast_warnings-ne 0-or[int]$Baseline.mos_passed-ne 16-or[int]$Baseline.mos_total-ne 16-or-not[bool]$Baseline.mos_cleanup-or[string]$Baseline.mos_vault_mutation-cne'none'-or[int]$Baseline.hard_reference_pre_paths-ne 41-or[int]$Baseline.hard_reference_pre_positive-ne 41-or[int]$Baseline.live_invariant_rows-ne([int]$Context.InvariantContract.fixed_invariant_row_count+$inventory.Count+$actions.Count)-or[int]$Baseline.wrapper_tree_files-ne$inventory.Count-or[int]$Baseline.wrapper_manifest_paths-ne$transitions.Count-or[int]$Baseline.wrapper_transition_actions-ne$actions.Count-or[int]$Baseline.wrapper_verify_only_actions-ne@($transitions|Where-Object action -CEQ 'verify-only').Count-or[int]$Baseline.wrapper_external_paths-ne($inventory.Count-$transitions.Count)-or[string]$Baseline.wrapper_pre_fingerprint_v3-cne(Get-G3E2RA1R5RWrapperFingerprintV3 $inventory)-or[int]$Baseline.residue_count-ne 0-or[string]$Baseline.authority_pre-cne'frozen'){throw 'A1R5R seal baseline differs from the derived green prestate.'}
}

function ConvertTo-G3E2RA1R5RCanonicalTimestamp {
    param([Parameter(Mandatory=$true)][DateTimeOffset]$Value)
    return $Value.ToUniversalTime().ToString("yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture)
}

function Read-G3E2RA1R5RJsonDocument {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    if(-not(Test-Path -LiteralPath $LiteralPath -PathType Leaf)){throw "JSON document is missing: $LiteralPath"}
    $bytes=[IO.File]::ReadAllBytes($LiteralPath)
    if($bytes.Length-ge 3-and$bytes[0]-eq 0xEF-and$bytes[1]-eq 0xBB-and$bytes[2]-eq 0xBF){throw 'A1R5R JSON must be UTF-8 without BOM.'}
    try{$raw=[Text.UTF8Encoding]::new($false,$true).GetString($bytes)}catch{throw "A1R5R JSON is not strict UTF-8: $LiteralPath"}
    if([string]::IsNullOrWhiteSpace($raw)){throw "A1R5R JSON is empty: $LiteralPath"}
    try{$value=$raw|ConvertFrom-Json}catch{throw "A1R5R JSON is invalid: $LiteralPath"}
    return [pscustomobject]@{LiteralPath=[IO.Path]::GetFullPath($LiteralPath);RawJson=$raw;Value=$value}
}

function Get-G3E2RA1R5RTimestampLexeme {
    param([Parameter(Mandatory=$true)][string]$RawJson,[Parameter(Mandatory=$true)][string]$PropertyName)
    $escaped=[regex]::Escape($PropertyName);$options=[Text.RegularExpressions.RegexOptions]::CultureInvariant-bor[Text.RegularExpressions.RegexOptions]::Singleline
    $propertyPattern='(?<!\\)(?<token>"(?:\\["\\/bfnrt]|\\u[0-9A-Fa-f]{4}|[^"\\\x00-\x1F])*")\s*:'
    $semantic=[Collections.Generic.List[object]]::new()
    foreach($candidate in [regex]::Matches($RawJson,$propertyPattern,$options)){
        try{$decoded=[string]($candidate.Groups['token'].Value|ConvertFrom-Json)}catch{throw 'A1R5R JSON property token is invalid.'}
        if($decoded-ceq$PropertyName){$semantic.Add($candidate)}
    }
    if($semantic.Count-ne 1-or$semantic[0].Groups['token'].Value-cne('"'+$PropertyName+'"')){throw "A1R5R timestamp property must occur exactly once and unescaped: $PropertyName"}
    $valuePattern='(?<!\\)"'+$escaped+'"\s*:\s*"(?<value>[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{7}\+00:00)"'
    $matches=[regex]::Matches($RawJson,$valuePattern,$options)
    if($matches.Count-ne 1){throw "A1R5R timestamp is not one unescaped canonical UTC JSON string: $PropertyName"}
    $lexeme=$matches[0].Groups['value'].Value
    try{$parsed=[DateTimeOffset]::ParseExact($lexeme,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None)}catch{throw "A1R5R timestamp cannot be parsed exactly: $PropertyName"}
    if($parsed.Offset-ne[TimeSpan]::Zero-or(ConvertTo-G3E2RA1R5RCanonicalTimestamp $parsed)-cne$lexeme){throw "A1R5R timestamp is not canonical UTC: $PropertyName"}
    return [pscustomobject]@{PropertyName=$PropertyName;Lexeme=$lexeme;Value=$parsed}
}

function Assert-G3E2RA1R5RSealInput {
    param([object]$Context,[object]$SealInputDocument,[DateTimeOffset]$VerificationNowUtc=[DateTimeOffset]::UtcNow)
    $sealInput=$SealInputDocument.Value
    Assert-G3E2RA1R5RExactProperties $sealInput @($Context.SealContract.required_seal_input_top_level) 'A1R5R seal input'
    if($sealInput.seal_inputs_contract-cne$Context.SealContract.seal_inputs_contract-or$sealInput.state-cne'prepared'-or$sealInput.routing_state-cne'frozen'-or$sealInput.legacy_token-cne$Context.SealContract.legacy_token-or[IO.Path]::GetFullPath([string]$sealInput.vault_root).TrimEnd('\')-cne$Context.Root-or[string]::IsNullOrWhiteSpace([string]$sealInput.transaction_id)){throw 'A1R5R seal input identity is invalid.'}
    Assert-G3E2RA1R5RExactProperties $sealInput.approval @($Context.SealContract.required_approval_fields) 'A1R5R approval'
    if([string]::IsNullOrWhiteSpace([string]$sealInput.approval.approval_id)-or[string]::IsNullOrWhiteSpace([string]$sealInput.approval.approved_by)){throw 'A1R5R approval provenance is incomplete.'}
    foreach($field in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if($sealInput.approval.$field-isnot[bool]){throw "A1R5R approval Boolean is invalid: $field"}}
    $prepared=Get-G3E2RA1R5RTimestampLexeme $SealInputDocument.RawJson 'prepared_at_utc';$approved=Get-G3E2RA1R5RTimestampLexeme $SealInputDocument.RawJson 'approved_at_utc'
    $verificationNow=$VerificationNowUtc.ToUniversalTime();$future=$verificationNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)
    if($prepared.Value-gt$future-or$approved.Value-gt$future){throw 'A1R5R seal input timestamp exceeds future skew.'}
    Assert-G3E2RA1R5RBaseline $Context $sealInput.baseline
    return [pscustomobject]@{Value=$sealInput;RawJson=$SealInputDocument.RawJson;Prepared=$prepared;Approved=$approved;VerificationNowUtc=$verificationNow}
}

function Read-G3E2RA1R5RSealInputDocument {
    param([object]$Context,[string]$LiteralPath,[DateTimeOffset]$VerificationNowUtc=[DateTimeOffset]::UtcNow)
    return Assert-G3E2RA1R5RSealInput $Context (Read-G3E2RA1R5RJsonDocument $LiteralPath) $VerificationNowUtc
}

function Get-G3E2RA1R5RBundlePaths {
    param([object]$Context,[object]$BState)
    return [ordered]@{
        'G3E1-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE']
        'G3E2R-A-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-BUNDLE']
        'G3E2R-A-DEPENDENCY-LOCK'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK']
        'G3E2R-A1-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Manifest
        'G3E2R-A1R-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R2Context.A1RManifest
        'G3E2R-A1R2-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R2Manifest
        'G3E2R-A1R3-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R3Manifest
        'G3E2R-A1R4-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.A1R4Manifest
        'G3E2R-A1R5R-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $Context.Manifest
        'G3E2R-B-BUNDLE'=Get-G3E2RA1R5RRepositoryPath $Context.Root $BState.Manifest
    }
}

function New-G3E2RA1R5RSeal {
    param([object]$Context,[object]$SealInputDocument,[object[]]$RuntimeBindings,[object]$BState)
    $sealInput=$SealInputDocument.Value
    $bundlePaths=Get-G3E2RA1R5RBundlePaths $Context $BState
    $bundles=foreach($id in @($Context.SealContract.required_bundle_binding_ids)){New-G3E2RA1R5RFileBinding bundle_id $id $Context $bundlePaths[$id]}
    $executionPaths=Get-G3E2RA1R5RExecutionPaths;$executions=foreach($id in @($Context.SealContract.required_execution_binding_ids)){New-G3E2RA1R5RFileBinding execution_id $id $Context $executionPaths[$id]}
    $artifactPaths=Get-G3E2RA1RArtifactPaths $Context.A1R2Context.A1RContext;$artifacts=foreach($id in @($Context.SealContract.required_artifact_binding_ids)){New-G3E2RA1R5RFileBinding artifact_id $id $Context $artifactPaths[$id]}
    $approval=[pscustomobject][ordered]@{approval_id=[string]$sealInput.approval.approval_id;approved_by=[string]$sealInput.approval.approved_by;approved_at_utc=$SealInputDocument.Approved.Lexeme;live_capability_probe_approved=[bool]$sealInput.approval.live_capability_probe_approved;live_mutation_approved=[bool]$sealInput.approval.live_mutation_approved;automatic_reverse_approved=[bool]$sealInput.approval.automatic_reverse_approved;independent_reverse_approved=[bool]$sealInput.approval.independent_reverse_approved}
    return [pscustomobject][ordered]@{seal_contract='g3e2r-live-seal/v2';state='sealed';transaction_id=[string]$sealInput.transaction_id;vault_root=$Context.Root;routing_state='frozen';legacy_token=[string]$sealInput.legacy_token;approval=$approval;time=[pscustomobject][ordered]@{prepared_at_utc=$SealInputDocument.Prepared.Lexeme;sealed_at_utc='';not_after_utc='';ttl_seconds=900};bundle_bindings=@($bundles);execution_bindings=@($executions);artifact_bindings=@($artifacts);runtime_bindings=@($RuntimeBindings);baseline=$sealInput.baseline}
}

function Complete-G3E2RA1R5RSealTimes {
    param([object]$Seal,[DateTimeOffset]$SealedAtUtc=[DateTimeOffset]::UtcNow)
    $prepared=[DateTimeOffset]::ParseExact([string]$Seal.time.prepared_at_utc,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None)
    $approved=[DateTimeOffset]::ParseExact([string]$Seal.approval.approved_at_utc,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None)
    $sealed=$SealedAtUtc.ToUniversalTime()
    if($prepared-gt$sealed-or$approved-gt$sealed){throw 'A1R5R prepared and approval timestamps must not be after sealed.'}
    $Seal.time.sealed_at_utc=ConvertTo-G3E2RA1R5RCanonicalTimestamp $sealed
    $Seal.time.not_after_utc=ConvertTo-G3E2RA1R5RCanonicalTimestamp $sealed.AddSeconds(900)
    return $Seal
}

function Test-G3E2RA1R5RLiveSealTemporalDocument {
    param([object]$Context,[object]$JsonDocument,[ValidateSet('Forward','Reverse')][string]$Use='Forward',[DateTimeOffset]$VerificationNowUtc=[DateTimeOffset]::UtcNow)
    $seal=$JsonDocument.Value
    Assert-G3E2RA1R5RExactProperties $seal.approval @($Context.SealContract.required_approval_fields) 'A1R5R live seal approval'
    Assert-G3E2RA1R5RExactProperties $seal.time @($Context.SealContract.required_time_fields) 'A1R5R live seal time'
    $prepared=Get-G3E2RA1R5RTimestampLexeme $JsonDocument.RawJson 'prepared_at_utc';$approved=Get-G3E2RA1R5RTimestampLexeme $JsonDocument.RawJson 'approved_at_utc';$sealed=Get-G3E2RA1R5RTimestampLexeme $JsonDocument.RawJson 'sealed_at_utc';$notAfter=Get-G3E2RA1R5RTimestampLexeme $JsonDocument.RawJson 'not_after_utc'
    $verificationNow=$VerificationNowUtc.ToUniversalTime();$future=$verificationNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)
    if([int]$seal.time.ttl_seconds-ne 900-or$notAfter.Value-ne$sealed.Value.AddSeconds(900)-or$prepared.Value-gt$sealed.Value-or$approved.Value-gt$sealed.Value-or$sealed.Value-gt$future){throw 'A1R5R live seal time boundary is invalid.'}
    if($Use-ceq'Forward'-and$verificationNow-gt$notAfter.Value){throw 'A1R5R live seal has expired for forward.'}
    return [pscustomobject]@{Prepared=$prepared;Approved=$approved;Sealed=$sealed;NotAfter=$notAfter;VerificationNowUtc=$verificationNow;Use=$Use}
}

function Assert-G3E2RA1R5RRuntimeBindings {
    param([object[]]$Expected,[object[]]$Actual)
    if($Expected.Count-ne 4-or$Actual.Count-ne 4){throw 'Runtime binding cardinality differs from four.'}
    $expectedIds=@($Expected.runtime_id);$actualIds=@($Actual.runtime_id)
    if(-not(Test-G3E2RA1R5ROrdinalSetEqual $expectedIds $actualIds)){throw 'Runtime binding ids differ.'}
    foreach($row in $Expected){
        Assert-G3E2RA1R5RExactProperties $row @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Expected runtime binding'
        $match=@($Actual|Where-Object runtime_id -CEQ $row.runtime_id)
        if($match.Count-ne 1){throw "Runtime binding is missing: $($row.runtime_id)"}
        Assert-G3E2RA1R5RExactProperties $match[0] @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Actual runtime binding'
        foreach($name in @('executable_path','executable_sha256','version','version_probe_id')){if([string]$row.$name-cne[string]$match[0].$name){throw "Runtime binding differs: $($row.runtime_id)/$name"}}
    }
}

function Assert-G3E2RA1R5RSealClosure {
    param([object]$Context,[object]$Seal,[switch]$AllowPreparedB)
    $sets=@(
        @(@($Context.SealContract.required_bundle_binding_ids),@($Seal.bundle_bindings.bundle_id),10,'bundle'),
        @(@($Context.SealContract.required_execution_binding_ids),@($Seal.execution_bindings.execution_id),61,'execution'),
        @(@($Context.SealContract.required_artifact_binding_ids),@($Seal.artifact_bindings.artifact_id),15,'artifact'),
        @(@($Context.SealContract.required_runtime_ids),@($Seal.runtime_bindings.runtime_id),4,'runtime')
    )
    foreach($set in $sets){if($set[1].Count-ne$set[2]-or-not(Test-G3E2RA1R5ROrdinalSetEqual $set[0] $set[1])){throw "Seal $($set[3]) ids differ from contract."}}
    foreach($row in @($Seal.bundle_bindings)){Assert-G3E2RA1R5RExactProperties $row @('bundle_id','repository_path','sha256','bytes') 'Seal bundle binding'}
    foreach($row in @($Seal.execution_bindings)){Assert-G3E2RA1R5RExactProperties $row @('execution_id','repository_path','sha256','bytes') 'Seal execution binding'}
    foreach($row in @($Seal.artifact_bindings)){Assert-G3E2RA1R5RExactProperties $row @('artifact_id','repository_path','sha256','bytes') 'Seal artifact binding'}
    foreach($row in @($Seal.runtime_bindings)){Assert-G3E2RA1R5RExactProperties $row @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Seal runtime binding'}
    foreach($row in @($Seal.bundle_bindings+$Seal.execution_bindings+$Seal.artifact_bindings)){
        $full=Resolve-G3E2RA1R5RInRoot $Context.Root $row.repository_path
        if((Get-G3E2RA1R5RSha256 $full)-cne$row.sha256-or(Get-G3E2RA1R5RBytes $full)-ne[int64]$row.bytes){throw "Seal file binding mismatch: $($row.repository_path)"}
    }
    $bRoot=Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$Context.BContract.canonical_root);$bManifest=Join-Path $bRoot ([string]$Context.BContract.bundle_manifest_filename)
    $bundlePaths=Get-G3E2RA1R5RBundlePaths $Context ([pscustomobject]@{Manifest=$bManifest})
    foreach($id in $bundlePaths.Keys){$row=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$bundlePaths[$id]){throw "Seal bundle canonical path mismatch: $id"}}
    $executionPaths=Get-G3E2RA1R5RExecutionPaths;foreach($id in $executionPaths.Keys){$row=@($Seal.execution_bindings|Where-Object execution_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$executionPaths[$id]){throw "Seal execution canonical path mismatch: $id"}}
    $artifactPaths=Get-G3E2RA1RArtifactPaths $Context.A1R2Context.A1RContext;foreach($id in $artifactPaths.Keys){$row=@($Seal.artifact_bindings|Where-Object artifact_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$artifactPaths[$id]){throw "Seal artifact canonical path mismatch: $id"}}
    $b=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE');$null=Test-G3E2RA1R5RBManifest $Context ([string]$b[0].sha256) -AllowSealed:(-not$AllowPreparedB)
}

function Read-G3E2RA1R5RSeal {
    param([object]$Context,[string]$LiteralPath,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedA1R2Hash,[string]$ExpectedA1R3Hash,[string]$ExpectedA1R4Hash,[string]$ExpectedA1R5RHash,[string]$ExpectedSealHash,[object[]]$ActualRuntimeBindings,[ValidateSet('Forward','Reverse')][string]$Use='Forward',[DateTimeOffset]$VerificationNowUtc=[DateTimeOffset]::UtcNow)
    if((Get-G3E2RA1R5RSha256 $Context.A1R2Context.A1RContext.A1Manifest)-cne$ExpectedA1Hash.ToUpperInvariant()){throw 'Expected-A1-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R5RSha256 $Context.A1R2Context.A1RManifest)-cne$ExpectedA1RHash.ToUpperInvariant()){throw 'Expected-A1R-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R5RSha256 $Context.A1R2Manifest)-cne$ExpectedA1R2Hash.ToUpperInvariant()){throw 'Expected-A1R2-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R5RSha256 $Context.A1R3Manifest)-cne$ExpectedA1R3Hash.ToUpperInvariant()){throw 'Expected-A1R3-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R5RSha256 $Context.A1R4Manifest)-cne$ExpectedA1R4Hash.ToUpperInvariant()){throw 'Expected-A1R4-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R5RSha256 $Context.Manifest)-cne$ExpectedA1R5RHash.ToUpperInvariant()){throw 'Expected-A1R5R-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R5RSha256 $LiteralPath)-cne$ExpectedSealHash.ToUpperInvariant()){throw 'Expected-Seal-Hash mismatch.'}
    $document=Read-G3E2RA1R5RJsonDocument $LiteralPath;$seal=$document.Value
    Assert-G3E2RA1R5RExactProperties $seal @($Context.SealContract.required_top_level) 'A1R5R live seal'
    if($seal.seal_contract-cne'g3e2r-live-seal/v2'-or$seal.state-cne'sealed'-or$seal.routing_state-cne'frozen'-or$seal.legacy_token-cne$Context.SealContract.legacy_token-or[IO.Path]::GetFullPath([string]$seal.vault_root).TrimEnd('\')-cne$Context.Root-or[string]::IsNullOrWhiteSpace([string]$seal.transaction_id)){throw 'A1R5R live seal identity is invalid.'}
    Assert-G3E2RA1R5RExactProperties $seal.approval @($Context.SealContract.required_approval_fields) 'A1R5R live seal approval'
    if([string]::IsNullOrWhiteSpace([string]$seal.approval.approval_id)-or[string]::IsNullOrWhiteSpace([string]$seal.approval.approved_by)){throw 'A1R5R live seal approval provenance is incomplete.'}
    Assert-G3E2RA1R5RExactProperties $seal.time @($Context.SealContract.required_time_fields) 'A1R5R live seal time'
    Assert-G3E2RA1R5RBaseline $Context $seal.baseline
    $null=Test-G3E2RA1R5RLiveSealTemporalDocument $Context $document $Use $VerificationNowUtc
    foreach($f in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if($seal.approval.$f-isnot[bool]-or-not[bool]$seal.approval.$f){throw "A1R5R live seal approval missing: $f"}}
    Assert-G3E2RA1R5RSealClosure $Context $seal;Assert-G3E2RA1R5RRuntimeBindings @($seal.runtime_bindings) $ActualRuntimeBindings
    return $seal
}

function Enter-G3E2RA1R5RClosureLock {
    param([object]$Context,[object]$Seal,[string]$SealPath,[string]$ExpectedSealHash)
    Assert-G3E2RA1R5RSealClosure $Context $Seal -AllowPreparedB:([string]::IsNullOrWhiteSpace($SealPath))
    $map=[Collections.Generic.Dictionary[string,object]]::new([StringComparer]::OrdinalIgnoreCase)
    $add={
        param([string]$Path,[string]$Sha,[Nullable[long]]$Bytes)
        $full=[IO.Path]::GetFullPath($Path)
        if($map.ContainsKey($full)){
            if($map[$full].sha256-cne$Sha.ToUpperInvariant()-or($null-ne$Bytes-and$null-ne$map[$full].bytes-and[int64]$map[$full].bytes-ne[int64]$Bytes)){throw "Conflicting closure identity: $full"}
            return
        }
        $map[$full]=[pscustomobject]@{sha256=$Sha.ToUpperInvariant();bytes=$Bytes}
    }
    foreach($row in @($Seal.bundle_bindings+$Seal.execution_bindings+$Seal.artifact_bindings)){&$add (Resolve-G3E2RA1R5RInRoot $Context.Root $row.repository_path) ([string]$row.sha256) ([int64]$row.bytes)}
    foreach($runtime in @($Seal.runtime_bindings)){&$add ([string]$runtime.executable_path) ([string]$runtime.executable_sha256) $null}
    if(-not[string]::IsNullOrWhiteSpace($SealPath)){&$add $SealPath $ExpectedSealHash $null}
    $bBinding=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')[0];$bManifest=Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$bBinding.repository_path)
    $manifestSpecs=@(
        @($Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE'],'candidate_path'),
        @($Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-BUNDLE'],'overlay_path'),
        @($Context.A1R2Context.A1RContext.A1Manifest,'overlay_path'),
        @($Context.A1R2Context.A1RManifest,'overlay_path'),
        @($Context.A1R2Manifest,'overlay_path'),
        @($Context.A1R3Manifest,'overlay_path'),
        @($Context.A1R4Manifest,'overlay_path'),
        @($Context.Manifest,'overlay_path'),
        @($bManifest,'bundle_path')
    )
    foreach($spec in $manifestSpecs){$manifestPath=[string]$spec[0];$base=Split-Path -Parent $manifestPath;foreach($row in @(Import-Csv -LiteralPath $manifestPath)){&$add ([IO.Path]::GetFullPath((Join-Path $base ([string]$row.($spec[1])).Replace('/','\')))) ([string]$row.sha256) ([int64]$row.bytes)}}
    foreach($lockPath in @($Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK'],(Join-Path $Context.Overlay 'dependency-lock.csv'))){foreach($row in @(Import-Csv -LiteralPath $lockPath)){&$add (Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$row.repository_path)) ([string]$row.sha256) ([int64]$row.bytes)}}
    $handles=[Collections.Generic.List[object]]::new()
    try{
        foreach($path in @(Get-G3E2RA1R5ROrdinalStrings @($map.Keys))){
            $stream=[IO.File]::Open($path,[IO.FileMode]::Open,[IO.FileAccess]::Read,[IO.FileShare]::Read);$sha=[Security.Cryptography.SHA256]::Create()
            try{$hash=([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','')}finally{$sha.Dispose()}
            if($hash-cne$map[$path].sha256-or($null-ne$map[$path].bytes-and$stream.Length-ne[int64]$map[$path].bytes)){throw "Locked closure identity mismatch: $path"}
            $handles.Add([pscustomobject]@{Path=$path;Stream=$stream;Sha256=$hash;Bytes=$map[$path].bytes})
        }
        return [pscustomobject]@{Handles=$handles;Count=$handles.Count}
    }catch{foreach($item in $handles){$item.Stream.Dispose()};throw}
}

function Test-G3E2RA1R5RClosureLock {
    param([object]$Lock)
    foreach($item in @($Lock.Handles)){
        $item.Stream.Position=0;$sha=[Security.Cryptography.SHA256]::Create()
        try{$hash=([BitConverter]::ToString($sha.ComputeHash($item.Stream))).Replace('-','')}finally{$sha.Dispose()}
        if($hash-cne$item.Sha256-or($null-ne$item.Bytes-and$item.Stream.Length-ne[int64]$item.Bytes)){throw "Held closure changed: $($item.Path)"}
    }
}

function Exit-G3E2RA1R5RClosureLock {
    param([object]$Lock)
    if($null-ne$Lock){$paths=@(Get-G3E2RA1R5ROrdinalStrings @($Lock.Handles.Path) -Descending);foreach($path in $paths){@($Lock.Handles|Where-Object Path -CEQ $path)[0].Stream.Dispose()}}
}

function Get-G3E2RA1R5RRuntimeBindings {
    param([object]$Context,[string]$PythonExecutable)
    return @(Get-G3E2RA1R4RuntimeBindings -Context $Context.A1R4Context -PythonExecutable $PythonExecutable)
}

function Test-G3E2RA1R5RBManifest {
    param([object]$Context,[string]$ExpectedBHash,[switch]$AllowSealed)
    $bRoot=Resolve-G3E2RA1R5RInRoot $Context.Root ([string]$Context.BContract.canonical_root);$bManifest=Join-Path $bRoot ([string]$Context.BContract.bundle_manifest_filename)
    if(-not[string]::IsNullOrWhiteSpace($ExpectedBHash)-and(Test-Path -LiteralPath $bManifest -PathType Leaf)-and(Get-G3E2RA1R5RSha256 $bManifest)-cne$ExpectedBHash.ToUpperInvariant()){throw 'Expected-B-Hash mismatch.'}
    return Test-G3E2RA1R4BManifest -Context $Context.A1R4Context -ExpectedBHash $ExpectedBHash -AllowSealed:$AllowSealed
}

function Get-G3E2RA1R5RArtifact { param([object]$Seal,[string]$Id);return Get-G3E2RA1R4Artifact $Seal $Id }
function Test-G3E2RA1R5RBoundArtifact { param([object]$Context,[object]$Artifact);return Test-G3E2RA1R4BoundArtifact $Context.A1R4Context $Artifact }
function Test-G3E2RA1R5RHardReferences { param([object]$Context,[object]$Seal,[string]$State,[string]$RipgrepExecutable);Test-G3E2RA1R4HardReferences $Context.A1R4Context $Seal $State $RipgrepExecutable }
function Test-G3E2RA1R5RWorkspaceAdvisory { param([object]$Context,[object]$Seal);Test-G3E2RA1R4WorkspaceAdvisory $Context.A1R4Context $Seal }
function Assert-G3E2RA1R5RGitStagingEmpty { param([string]$VaultRoot,[string]$GitExecutable);Assert-G3E2RA1R4GitStagingEmpty $VaultRoot $GitExecutable }
function Assert-G3E2RA1R5RNoResidue { param([string]$VaultRoot);Assert-G3E2RA1R4NoResidue $VaultRoot }
function Enter-G3E2RA1R5RMutex { param([string]$VaultRoot);return Enter-G3E2RA1R4Mutex $VaultRoot }
function Exit-G3E2RA1R5RMutex { param([object]$Mutex);Exit-G3E2RA1R4Mutex $Mutex }
function Test-G3E2RA1R5RAdministrator { return Test-G3E2RA1R4Administrator }
function Add-G3E2RA1R5RCompatibilityProperties { param([object]$Seal);return Add-G3E2RA1R4CompatibilityProperties $Seal }

Export-ModuleMember -Function @(
    'Get-G3E2RA1R5RSha256','Get-G3E2RA1R5RBytes','Get-G3E2RA1R5RBytesSha256',
    'Get-G3E2RA1R5ROrdinalStrings','Test-G3E2RA1R5ROrdinalUnique','Test-G3E2RA1R5ROrdinalSetEqual',
    'Resolve-G3E2RA1R5RInRoot','Get-G3E2RA1R5RRepositoryPath','Assert-G3E2RA1R5RExactProperties',
    'Import-G3E2RA1R5RExactCsv','Test-G3E2RA1R5RBoundManifest','Get-G3E2RA1R5RContext','Initialize-G3E2RA1R5REntrypoint',
    'Get-G3E2RA1R5RTreeStateV3','Get-G3E2RA1R5RTreeFingerprintV3','Get-G3E2RA1R5RWrapperInventory',
    'Get-G3E2RA1R5RTransitionRows','Get-G3E2RA1R5RWrapperFingerprintV3','Test-G3E2RA1R5RInvariantSchema',
    'Test-G3E2RA1R5RLiveInvariants','Get-G3E2RA1R5RExecutionPaths','Assert-G3E2RA1R5RBaseline',
    'ConvertTo-G3E2RA1R5RCanonicalTimestamp','Read-G3E2RA1R5RJsonDocument','Get-G3E2RA1R5RTimestampLexeme',
    'Assert-G3E2RA1R5RSealInput','Read-G3E2RA1R5RSealInputDocument','New-G3E2RA1R5RSeal','Complete-G3E2RA1R5RSealTimes','Test-G3E2RA1R5RLiveSealTemporalDocument','Assert-G3E2RA1R5RRuntimeBindings',
    'Assert-G3E2RA1R5RSealClosure','Read-G3E2RA1R5RSeal','Enter-G3E2RA1R5RClosureLock',
    'Test-G3E2RA1R5RClosureLock','Exit-G3E2RA1R5RClosureLock','Get-G3E2RA1R5RRuntimeBindings',
    'Test-G3E2RA1R5RBManifest','Get-G3E2RA1R5RArtifact','Test-G3E2RA1R5RBoundArtifact',
    'Test-G3E2RA1R5RHardReferences','Test-G3E2RA1R5RWorkspaceAdvisory','Assert-G3E2RA1R5RGitStagingEmpty',
    'Assert-G3E2RA1R5RNoResidue','Enter-G3E2RA1R5RMutex','Exit-G3E2RA1R5RMutex',
    'Test-G3E2RA1R5RAdministrator','Add-G3E2RA1R5RCompatibilityProperties'
)
