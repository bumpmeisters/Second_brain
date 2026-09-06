Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Import-G3E2RA1R3PlatformModules {
    $edition = [string]$PSVersionTable.PSEdition
    switch -CaseSensitive ($edition) {
        'Desktop' { $requiredVersion = [version]'3.1.0.0'; $expectedHashCommandType = 'Function' }
        'Core' { $requiredVersion = [version]'7.0.0.0'; $expectedHashCommandType = 'Cmdlet' }
        default { throw "Unsupported PowerShell edition: $edition" }
    }
    foreach ($moduleName in @('Microsoft.PowerShell.Management','Microsoft.PowerShell.Utility')) {
        $manifestPath = Join-Path $PSHOME ("Modules/{0}/{0}.psd1" -f $moduleName)
        if (-not [IO.File]::Exists($manifestPath)) { throw "Required platform module manifest is missing: $moduleName" }
        $expectedManifestPath = [IO.Path]::GetFullPath($manifestPath)
        $available = @(Get-Module -ListAvailable -Name $manifestPath | Where-Object { $_.Name -ceq $moduleName -and $_.Version -eq $requiredVersion -and @($_.CompatiblePSEditions) -ccontains $edition -and $_.Path -and [IO.Path]::GetFullPath($_.Path).Equals($expectedManifestPath,[StringComparison]::OrdinalIgnoreCase) })
        if ($available.Count -ne 1) { throw "Required platform module identity mismatch: $moduleName $requiredVersion $edition" }
        $imported = @(Import-Module -Name $manifestPath -RequiredVersion $requiredVersion -Scope Local -Force -PassThru -ErrorAction Stop)
        $matchingImported = @($imported | Where-Object { $_.Name -ceq $moduleName -and $_.Version -eq $requiredVersion -and @($_.CompatiblePSEditions) -ccontains $edition -and $_.Path -and [IO.Path]::GetFullPath($_.Path).Equals($expectedManifestPath,[StringComparison]::OrdinalIgnoreCase) })
        if ($imported.Count -ne 1 -or $matchingImported.Count -ne 1) { throw "Imported platform module identity mismatch: $moduleName $requiredVersion $edition" }
    }
    $hashCommands = @(Get-Command 'Microsoft.PowerShell.Utility\Get-FileHash' -All -ErrorAction Stop)
    if ($hashCommands.Count -ne 1 -or [string]$hashCommands[0].CommandType -cne $expectedHashCommandType -or $hashCommands[0].ModuleName -cne 'Microsoft.PowerShell.Utility' -or $hashCommands[0].Source -cne 'Microsoft.PowerShell.Utility') { throw 'Module-qualified SHA-256 command identity mismatch.' }
}
Import-G3E2RA1R3PlatformModules
$script:G3E2RA1R3Utf8NoBom = [Text.UTF8Encoding]::new($false)

function Get-G3E2RA1R3Sha256 {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    if(-not(Test-Path -LiteralPath $LiteralPath -PathType Leaf)){throw "File is missing: $LiteralPath"}
    return (Microsoft.PowerShell.Utility\Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Get-G3E2RA1R3Bytes {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    return (Get-Item -LiteralPath $LiteralPath -Force).Length
}

function Get-G3E2RA1R3BytesSha256 {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][byte[]]$Bytes)
    $sha=[Security.Cryptography.SHA256]::Create()
    try{return ([BitConverter]::ToString($sha.ComputeHash($Bytes))).Replace('-','')}
    finally{$sha.Dispose()}
}

function Get-G3E2RA1R3OrdinalStrings {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Values,[switch]$Descending)
    [string[]]$copy=@($Values|ForEach-Object{[string]$_})
    [Array]::Sort($copy,[StringComparer]::Ordinal)
    if($Descending){[Array]::Reverse($copy)}
    return @($copy)
}

function Test-G3E2RA1R3OrdinalUnique {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Values)
    $set=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach($value in @($Values)){if(-not$set.Add([string]$value)){return $false}}
    return $true
}

function Test-G3E2RA1R3OrdinalSetEqual {
    param([Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Expected,[Parameter(Mandatory=$true)][AllowEmptyCollection()][object[]]$Actual)
    if($Expected.Count-ne$Actual.Count){return $false}
    if(-not(Test-G3E2RA1R3OrdinalUnique $Expected)-or-not(Test-G3E2RA1R3OrdinalUnique $Actual)){return $false}
    $left=@(Get-G3E2RA1R3OrdinalStrings $Expected);$right=@(Get-G3E2RA1R3OrdinalStrings $Actual)
    for($i=0;$i-lt$left.Count;$i++){if($left[$i]-cne$right[$i]){return $false}}
    return $true
}

function Resolve-G3E2RA1R3InRoot {
    param([string]$Root,[string]$RepositoryPath,[switch]$ForMutation)
    $base=[IO.Path]::GetFullPath($Root).TrimEnd('\')
    if([IO.Path]::IsPathRooted($RepositoryPath)){throw "Repository path must be relative: $RepositoryPath"}
    $full=[IO.Path]::GetFullPath((Join-Path $base $RepositoryPath.Replace('/','\')))
    if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "Repository path escapes the Vault: $RepositoryPath"}
    if($ForMutation-and$RepositoryPath-match'^(raw|research/assets)(/|$)'){throw "Protected source mutation is forbidden: $RepositoryPath"}
    return $full
}

function Get-G3E2RA1R3RepositoryPath {
    param([string]$Root,[string]$LiteralPath)
    $base=[IO.Path]::GetFullPath($Root).TrimEnd('\');$full=[IO.Path]::GetFullPath($LiteralPath)
    if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "Path is outside the Vault: $LiteralPath"}
    return $full.Substring($base.Length+1).Replace('\','/')
}

function Assert-G3E2RA1R3ExactProperties {
    param([object]$Value,[string[]]$Expected,[string]$Label)
    $actual=@($Value.PSObject.Properties.Name)
    if(-not(Test-G3E2RA1R3OrdinalSetEqual $Expected $actual)){throw "$Label properties differ from contract."}
}

function Import-G3E2RA1R3ExactCsv {
    param([string]$LiteralPath,[string[]]$Columns,[Nullable[int]]$Count,[string]$Label)
    $rows=@(Import-Csv -LiteralPath $LiteralPath)
    if($null-ne$Count-and$rows.Count-ne[int]$Count){throw "$Label must contain $Count rows; found $($rows.Count)."}
    foreach($row in $rows){Assert-G3E2RA1R3ExactProperties $row $Columns $Label}
    return $rows
}

function Test-G3E2RA1R3BoundManifest {
    param([string]$ManifestPath,[string]$BaseDirectory,[string]$PathColumn,[string[]]$Columns,[int]$Count,[string]$Label)
    $rows=Import-G3E2RA1R3ExactCsv $ManifestPath $Columns $Count $Label
    if(-not(Test-G3E2RA1R3OrdinalUnique @($rows|ForEach-Object{[string]$_.$PathColumn}))){throw "$Label paths must be ordinal-unique."}
    $base=[IO.Path]::GetFullPath($BaseDirectory).TrimEnd('\')
    foreach($row in $rows){
        $relative=[string]$row.$PathColumn
        if([IO.Path]::IsPathRooted($relative)){throw "$Label path must be relative: $relative"}
        $full=[IO.Path]::GetFullPath((Join-Path $base $relative.Replace('/','\')))
        if(-not$full.StartsWith($base+'\',[StringComparison]::OrdinalIgnoreCase)){throw "$Label path escapes its root: $relative"}
        if((Get-G3E2RA1R3Sha256 $full)-cne([string]$row.sha256).ToUpperInvariant()-or(Get-G3E2RA1R3Bytes $full)-ne[int64]$row.bytes){throw "$Label identity mismatch: $relative"}
    }
    return $rows
}

function Get-G3E2RA1R3Context {
    param([string]$VaultRoot,[string]$OverlayRoot,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedA1R2Hash,[string]$ExpectedA1R3Hash)
    $root=(Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\');$overlay=(Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
    $canonical=Resolve-G3E2RA1R3InRoot $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r3'
    if($overlay-cne$canonical){throw 'A1R3 overlay is not at its canonical repository path.'}
    $lock=Import-G3E2RA1R3ExactCsv (Join-Path $overlay 'dependency-lock.csv') @('dependency_id','role','repository_path','sha256','bytes','reuse_mode','required_by') 1 'A1R3 dependency lock'
    if($lock[0].dependency_id-cne'G3E2R-A1R2-BUNDLE'-or$lock[0].reuse_mode-cne'verify-transitively-never-modify'){throw 'A1R3 dependency lock must bind only the immutable A1R2 root.'}
    $a1r2Manifest=Resolve-G3E2RA1R3InRoot $root ([string]$lock[0].repository_path)
    if((Get-G3E2RA1R3Sha256 $a1r2Manifest)-cne[string]$lock[0].sha256-or(Get-G3E2RA1R3Bytes $a1r2Manifest)-ne[int64]$lock[0].bytes){throw 'A1R2 dependency root mismatch.'}
    if(-not[string]::IsNullOrWhiteSpace($ExpectedA1R2Hash)-and(Get-G3E2RA1R3Sha256 $a1r2Manifest)-cne$ExpectedA1R2Hash.ToUpperInvariant()){throw 'Expected-A1R2-Hash mismatch.'}
    $a1r2Root=Split-Path -Parent $a1r2Manifest
    Import-Module (Join-Path $a1r2Root 'tools/g3e2r-a1r2-guard-lib.psm1') -Force
    $a1r2Context=Get-G3E2RA1R2Context -VaultRoot $root -OverlayRoot $a1r2Root -ExpectedA1Hash $ExpectedA1Hash -ExpectedA1RHash $ExpectedA1RHash -ExpectedA1R2Hash ([string]$lock[0].sha256)

    $manifest=Join-Path $overlay 'a1r3-bundle-manifest.csv'
    if(Test-Path -LiteralPath $manifest -PathType Leaf){
        if(-not[string]::IsNullOrWhiteSpace($ExpectedA1R3Hash)-and(Get-G3E2RA1R3Sha256 $manifest)-cne$ExpectedA1R3Hash.ToUpperInvariant()){throw 'Expected-A1R3-Hash mismatch.'}
        $rows=Test-G3E2RA1R3BoundManifest $manifest $overlay 'overlay_path' @('role','overlay_path','sha256','bytes') 14 'A1R3 bundle'
        $actual=@(Get-ChildItem -LiteralPath $overlay -Recurse -File|ForEach-Object{$_.FullName.Substring($overlay.Length+1).Replace('\','/')})
        $expected=@($rows.overlay_path)+'a1r3-bundle-manifest.csv'
        if($actual.Count-ne 15-or-not(Test-G3E2RA1R3OrdinalSetEqual $expected $actual)){throw 'A1R3 overlay differs from its exact fifteen-file inventory.'}
    }

    $seal=Get-Content -LiteralPath (Join-Path $overlay 'contracts/live-seal-v2-a1r3-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $invariant=Get-Content -LiteralPath (Join-Path $overlay 'contracts/live-invariant-v3-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $fingerprint=Get-Content -LiteralPath (Join-Path $overlay 'contracts/ordinal-fingerprint-v3-contract.json') -Raw -Encoding UTF8|ConvertFrom-Json
    $gates=Import-G3E2RA1R3ExactCsv (Join-Path $overlay 'manifests/gate-map-v4.csv') @('direction','sequence','step_id','mutation_state','gate_function','success_contract','failure_action') 40 'A1R3 gate map'
    if(@($gates|Where-Object direction -CEQ 'SEAL').Count-ne 9-or@($gates|Where-Object direction -CEQ 'FWD').Count-ne 19-or@($gates|Where-Object direction -CEQ 'REV').Count-ne 12-or-not(Test-G3E2RA1R3OrdinalUnique @($gates.step_id))-or@($gates|Where-Object step_id -CEQ 'FWD-020').Count-ne 0){throw 'A1R3 gate map does not have the exact 9/19/12 shape.'}
    if($seal.ttl_seconds-ne 900-or$seal.bundle_binding_count-ne 8-or$seal.execution_binding_count-ne 44-or$seal.artifact_binding_count-ne 15-or$seal.runtime_binding_count-ne 4){throw 'A1R3 seal contract cardinality differs from approval.'}
    if($fingerprint.contract_id-cne'g3e2r-ordinal-fingerprint/v3'-or$fingerprint.comparer-cne'System.StringComparer.Ordinal'-or$fingerprint.encoding-cne'UTF-8-no-BOM'-or$fingerprint.line_separator-cne'LF'-or$fingerprint.trailing_line_separator-ne$false){throw 'A1R3 ordinal fingerprint contract differs from approval.'}
    $transition=Resolve-G3E2RA1R3InRoot $root ([string]$invariant.transition_manifest_repository_path)
    if((Get-G3E2RA1R3Sha256 $transition)-cne'5DA801A1CE4160181EEB098CD17EE7EFFDAADAA0AC756B543FB537B08DFC9EA1'){throw 'G3E1 wrapper transition manifest changed.'}
    return [pscustomobject]@{Root=$root;Overlay=$overlay;Manifest=$manifest;A1R2Manifest=$a1r2Manifest;A1R2Root=$a1r2Root;A1R2Context=$a1r2Context;SealContract=$seal;InvariantContract=$invariant;FingerprintContract=$fingerprint;Gates=$gates;TransitionManifest=$transition;BContract=$a1r2Context.BContract;HardReferenceContract=$a1r2Context.HardReferenceContract}
}

function Get-G3E2RA1R3TreeStateV3 {
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
        $lines.Add($relative+[char]9+[string]$file.Length+[char]9+(Get-G3E2RA1R3Sha256 $file.FullName))
    }
    $ordered=@(Get-G3E2RA1R3OrdinalStrings @($lines))
    $fingerprint=Get-G3E2RA1R3BytesSha256 $script:G3E2RA1R3Utf8NoBom.GetBytes(($ordered-join[char]10))
    return [pscustomobject]@{Fingerprint=$fingerprint;FileCount=$ordered.Count;Lines=$ordered}
}

function Get-G3E2RA1R3TreeFingerprintV3 {
    param([Parameter(Mandatory=$true)][string]$LiteralPath)
    return (Get-G3E2RA1R3TreeStateV3 $LiteralPath).Fingerprint
}

function Get-G3E2RA1R3WrapperInventory {
    param([object]$Context,[string]$InventoryRoot)
    $root=if([string]::IsNullOrWhiteSpace($InventoryRoot)){Resolve-G3E2RA1R3InRoot $Context.Root ([string]$Context.InvariantContract.wrapper_inventory_root)}else{[IO.Path]::GetFullPath($InventoryRoot)}
    if(-not(Test-Path -LiteralPath $root -PathType Container)-or((Get-Item -LiteralPath $root -Force).Attributes-band[IO.FileAttributes]::ReparsePoint)){throw 'Wrapper inventory root is missing or reparse-backed.'}
    $all=@(Get-ChildItem -LiteralPath $root -Force -Recurse)
    foreach($item in $all){if($item.Attributes-band[IO.FileAttributes]::ReparsePoint){throw "Wrapper tree contains a reparse point: $($item.FullName)"}}
    $byPath=[Collections.Generic.Dictionary[string,object]]::new([StringComparer]::Ordinal)
    $skills=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach($file in @($all|Where-Object{-not$_.PSIsContainer})){
        $relative=$file.FullName.Substring($root.TrimEnd('\').Length+1).Replace('\','/');$parts=$relative.Split('/')
        if($parts.Count-ne 2-or$parts[1]-cne'SKILL.md'-or[string]::IsNullOrWhiteSpace($parts[0])){throw "Every wrapper-tree file must be <skill>/SKILL.md: $relative"}
        if(-not$skills.Add($parts[0])){throw "Wrapper skill id is not ordinal-unique: $($parts[0])"}
        $repo=if($root.StartsWith($Context.Root+'\',[StringComparison]::OrdinalIgnoreCase)){Get-G3E2RA1R3RepositoryPath $Context.Root $file.FullName}else{'.agents/skills/'+$relative}
        if($byPath.ContainsKey($repo)){throw "Wrapper repository path is not ordinal-unique: $repo"}
        $byPath[$repo]=[pscustomobject][ordered]@{skill_id=$parts[0];repository_path=$repo;sha256=Get-G3E2RA1R3Sha256 $file.FullName;bytes=Get-G3E2RA1R3Bytes $file.FullName;literal_path=$file.FullName}
    }
    if($byPath.Count-eq 0){throw 'Wrapper inventory is empty.'}
    $rows=[Collections.Generic.List[object]]::new()
    foreach($path in @(Get-G3E2RA1R3OrdinalStrings @($byPath.Keys))){$rows.Add($byPath[$path])}
    return @($rows)
}

function Get-G3E2RA1R3TransitionRows {
    param([object]$Context,[string]$LiteralPath)
    $path=if([string]::IsNullOrWhiteSpace($LiteralPath)){$Context.TransitionManifest}else{$LiteralPath}
    $columns=@('skill_id','action','wrapper_path','canonical_pre_path','canonical_post_path','wrapper_pre_sha256','canonical_pre_sha256','canonical_post_sha256','wrapper_post_sha256')
    $rows=Import-G3E2RA1R3ExactCsv $path $columns $null 'G3E1 wrapper transition manifest'
    if(-not(Test-G3E2RA1R3OrdinalUnique @($rows.skill_id))-or-not(Test-G3E2RA1R3OrdinalUnique @($rows.wrapper_path))-or@($rows|Where-Object action -CEQ 'transition').Count-ne 10-or@($rows|Where-Object action -CEQ 'verify-only').Count-ne 1){throw 'Transition manifest action split is not the accepted 10/1 set.'}
    foreach($row in $rows){
        if($row.action-notin@('transition','verify-only')-or$row.wrapper_path-cne('.agents/skills/'+$row.skill_id+'/SKILL.md')-or$row.wrapper_pre_sha256-notmatch'^[A-F0-9]{64}$'-or$row.wrapper_post_sha256-notmatch'^[A-F0-9]{64}$'){throw "Transition manifest row is invalid: $($row.skill_id)"}
        if($row.action-ceq'verify-only'-and$row.wrapper_pre_sha256-cne$row.wrapper_post_sha256){throw 'Verify-only wrapper hashes must be identical.'}
    }
    return $rows
}

function Get-G3E2RA1R3WrapperFingerprintV3 {
    param([Parameter(Mandatory=$true)][object[]]$Inventory)
    $paths=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    $lines=[Collections.Generic.List[string]]::new()
    foreach($row in @($Inventory)){
        $path=[string]$row.repository_path
        if([string]::IsNullOrWhiteSpace($path)-or-not$paths.Add($path)){throw "Wrapper fingerprint path is empty or not ordinal-unique: $path"}
        if([string]$row.sha256-notmatch'^[A-Fa-f0-9]{64}$'-or[string]$row.bytes-notmatch'^\d+$'){throw "Wrapper fingerprint identity is invalid: $path"}
        $lines.Add($path+[char]9+[string]$row.bytes+[char]9+([string]$row.sha256).ToUpperInvariant())
    }
    $ordered=@(Get-G3E2RA1R3OrdinalStrings @($lines))
    return Get-G3E2RA1R3BytesSha256 $script:G3E2RA1R3Utf8NoBom.GetBytes(($ordered-join[char]10))
}

function Test-G3E2RA1R3InvariantSchema {
    param([object]$Context,[string]$LiteralPath,[object[]]$Inventory,[object[]]$Transitions)
    if($null-eq$Inventory){$Inventory=Get-G3E2RA1R3WrapperInventory $Context}
    if($null-eq$Transitions){$Transitions=Get-G3E2RA1R3TransitionRows $Context}
    $rows=Import-G3E2RA1R3ExactCsv $LiteralPath @($Context.InvariantContract.columns) $null 'A1R3 live invariant manifest'
    $transitionActions=@($Transitions|Where-Object action -CEQ 'transition');$expectedTotal=[int]$Context.InvariantContract.fixed_invariant_row_count+$Inventory.Count+$transitionActions.Count
    if($rows.Count-ne$expectedTotal-or-not(Test-G3E2RA1R3OrdinalUnique @($rows.invariant_id))){throw 'Dynamic live-invariant row count or ids differ from derived inventory.'}
    if(@($rows|Where-Object{$_.state_scope-notin@($Context.InvariantContract.allowed_state_scopes)-or$_.subject_type-notin@($Context.InvariantContract.allowed_subject_types)-or$_.mutation_policy-notin@($Context.InvariantContract.allowed_mutation_policies)}).Count-ne 0){throw 'Live-invariant enumeration differs from contract.'}
    foreach($row in $rows){
        $null=Resolve-G3E2RA1R3InRoot $Context.Root ([string]$row.repository_path)
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
            if($actual.Count-ne 2-or-not(Test-G3E2RA1R3OrdinalSetEqual @($actual.state_scope) @('post','pre-reverse'))){throw "Transition wrapper must have pre/reverse and post rows: $($item.repository_path)"}
            $pre=@($actual|Where-Object state_scope -CEQ 'pre-reverse')[0];$post=@($actual|Where-Object state_scope -CEQ 'post')[0]
            if($pre.expected_sha256-cne$transition[0].wrapper_pre_sha256-or$post.expected_sha256-cne$transition[0].wrapper_post_sha256){throw "Transition wrapper identity differs from G3E1: $($item.repository_path)"}
        }else{
            if($actual.Count-ne 1-or$actual[0].state_scope-cne'all'-or$actual[0].expected_sha256-cne$item.sha256-or[int64]$actual[0].expected_bytes-ne[int64]$item.bytes){throw "Nonparticipant wrapper is not an exact all-state invariant: $($item.repository_path)"}
        }
    }
    $virtualDiff=@(Get-G3E2RA1R3OrdinalStrings @($transitionActions.wrapper_path));$derived=[Collections.Generic.List[string]]::new()
    foreach($key in $byWrapper.Keys){if($byWrapper[$key].Count-eq 2){$derived.Add($key)}}
    $derivedDiff=@(Get-G3E2RA1R3OrdinalStrings @($derived))
    if(-not(Test-G3E2RA1R3OrdinalSetEqual $virtualDiff $derivedDiff)){throw 'Virtual wrapper poststate diff differs from transition actions.'}
    return [pscustomobject]@{Rows=@($rows);Fixed=@($fixed);WrapperRows=@($wrapperRows);Inventory=@($Inventory);Transitions=@($Transitions);TransitionActions=@($transitionActions);VirtualPostDiff=@($virtualDiff);DerivedTotal=$expectedTotal;FingerprintV3=Get-G3E2RA1R3WrapperFingerprintV3 $Inventory}
}

function Test-G3E2RA1R3LiveInvariants {
    param([object]$Context,[object]$Seal,[ValidateSet('pre','post','reverse','pre-reverse')][string]$State,[switch]$AdvisoryExternalDrift)
    $artifact=Get-G3E2RA1R3Artifact $Seal 'B-LIVE-INVARIANT-MANIFEST';$path=Test-G3E2RA1R3BoundArtifact $Context $artifact;$schema=Test-G3E2RA1R3InvariantSchema $Context $path
    $external=[Collections.Generic.List[object]]::new()
    $active=if($State-ceq'pre-reverse'){@($schema.Rows|Where-Object state_scope -CEQ 'all')}else{@($schema.Rows|Where-Object{$_.state_scope-ceq'all'-or$_.state_scope-ceq$State-or($_.state_scope-ceq'pre-reverse'-and$State-in@('pre','reverse'))})}
    foreach($row in $active){
        $full=Resolve-G3E2RA1R3InRoot $Context.Root ([string]$row.repository_path)
        try{
            if($row.subject_type-ceq'file-exact'){
                if(-not(Test-Path -LiteralPath $full -PathType Leaf)-or(Get-G3E2RA1R3Sha256 $full)-cne$row.expected_sha256-or(Get-G3E2RA1R3Bytes $full)-ne[int64]$row.expected_bytes){throw "Live file invariant mismatch: $($row.invariant_id)"}
            }elseif($row.subject_type-ceq'tree-fingerprint'){
                $stateValue=Get-G3E2RA1R3TreeStateV3 $full
                if($stateValue.Fingerprint-cne$row.expected_fingerprint_v3-or$stateValue.FileCount-ne[int]$row.expected_file_count){throw "Live tree invariant mismatch: $($row.invariant_id)"}
            }else{throw "Unknown subject type: $($row.subject_type)"}
        }catch{
            if($AdvisoryExternalDrift-and$row.mutation_policy-ceq'must-not-change'){$external.Add([pscustomobject]@{invariant_id=[string]$row.invariant_id;repository_path=[string]$row.repository_path;finding='external-drift'})}else{throw}
        }
    }
    if($State-ceq'pre-reverse'){
        foreach($transition in $schema.TransitionActions){
            $full=Resolve-G3E2RA1R3InRoot $Context.Root ([string]$transition.wrapper_path);$hash=Get-G3E2RA1R3Sha256 $full
            if($hash-notin@([string]$transition.wrapper_pre_sha256,[string]$transition.wrapper_post_sha256)){throw "Unknown transition-wrapper bytes block reverse: $($transition.wrapper_path)"}
        }
    }
    return @($external)
}

function Get-G3E2RA1R3ExecutionPaths {
    $paths=[ordered]@{};foreach($item in (Get-G3E2RA1R2ExecutionPaths).GetEnumerator()){$paths[$item.Key]=$item.Value}
    $base='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r3/'
    $paths['A1R3-SEAL-CONTRACT']=$base+'contracts/live-seal-v2-a1r3-contract.json'
    $paths['A1R3-INVARIANT-CONTRACT']=$base+'contracts/live-invariant-v3-contract.json'
    $paths['A1R3-ORDINAL-FINGERPRINT-CONTRACT']=$base+'contracts/ordinal-fingerprint-v3-contract.json'
    $paths['A1R3-GATE-MAP']=$base+'manifests/gate-map-v4.csv'
    $paths['A1R3-GUARD-LIB']=$base+'tools/g3e2r-a1r3-guard-lib.psm1'
    $paths['A1R3-FINALIZER']=$base+'tools/finalize-g3e2r-live-seal-a1r3.ps1'
    $paths['A1R3-FORWARD']=$base+'tools/invoke-g3e2-transaction-a1r3.ps1'
    $paths['A1R3-REVERSE']=$base+'tools/invoke-g3e2-reverse-a1r3.ps1'
    return $paths
}

function New-G3E2RA1R3FileBinding {
    param([string]$IdName,[string]$Id,[object]$Context,[string]$RepositoryPath)
    $full=Resolve-G3E2RA1R3InRoot $Context.Root $RepositoryPath;$value=[ordered]@{};$value[$IdName]=$Id
    $value.repository_path=$RepositoryPath;$value.sha256=Get-G3E2RA1R3Sha256 $full;$value.bytes=Get-G3E2RA1R3Bytes $full
    return [pscustomobject]$value
}

function Assert-G3E2RA1R3Baseline {
    param([object]$Context,[object]$Baseline)
    Assert-G3E2RA1R3ExactProperties $Baseline @($Context.SealContract.required_baseline_fields) 'A1R3 seal baseline'
    $inventory=Get-G3E2RA1R3WrapperInventory $Context;$transitions=Get-G3E2RA1R3TransitionRows $Context;$actions=@($transitions|Where-Object action -CEQ 'transition')
    if($Baseline.mos_cleanup-isnot[bool]-or[int]$Baseline.git_staged_count-ne 0-or[int]$Baseline.root_fast_errors-ne 0-or[int]$Baseline.root_fast_warnings-ne 0-or[int]$Baseline.mos_passed-ne 16-or[int]$Baseline.mos_total-ne 16-or-not[bool]$Baseline.mos_cleanup-or[string]$Baseline.mos_vault_mutation-cne'none'-or[int]$Baseline.hard_reference_pre_paths-ne 41-or[int]$Baseline.hard_reference_pre_positive-ne 41-or[int]$Baseline.live_invariant_rows-ne([int]$Context.InvariantContract.fixed_invariant_row_count+$inventory.Count+$actions.Count)-or[int]$Baseline.wrapper_tree_files-ne$inventory.Count-or[int]$Baseline.wrapper_manifest_paths-ne$transitions.Count-or[int]$Baseline.wrapper_transition_actions-ne$actions.Count-or[int]$Baseline.wrapper_verify_only_actions-ne@($transitions|Where-Object action -CEQ 'verify-only').Count-or[int]$Baseline.wrapper_external_paths-ne($inventory.Count-$transitions.Count)-or[string]$Baseline.wrapper_pre_fingerprint_v3-cne(Get-G3E2RA1R3WrapperFingerprintV3 $inventory)-or[int]$Baseline.residue_count-ne 0-or[string]$Baseline.authority_pre-cne'frozen'){throw 'A1R3 seal baseline differs from the derived green prestate.'}
}

function Assert-G3E2RA1R3SealInput {
    param([object]$Context,[object]$SealInput)
    Assert-G3E2RA1R3ExactProperties $SealInput @($Context.SealContract.required_seal_input_top_level) 'A1R3 seal input'
    if($SealInput.seal_inputs_contract-cne$Context.SealContract.seal_inputs_contract-or$SealInput.state-cne'prepared'-or$SealInput.routing_state-cne'frozen'-or$SealInput.legacy_token-cne$Context.SealContract.legacy_token-or[IO.Path]::GetFullPath([string]$SealInput.vault_root).TrimEnd('\')-cne$Context.Root-or[string]::IsNullOrWhiteSpace([string]$SealInput.transaction_id)){throw 'A1R3 seal input identity is invalid.'}
    $prepared=[DateTimeOffset]::Parse([string]$SealInput.prepared_at_utc)
    if($prepared-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)){throw 'A1R3 seal input prepared time is in the future.'}
    Assert-G3E2RA1R3ExactProperties $SealInput.approval @($Context.SealContract.required_approval_fields) 'A1R3 approval'
    if([string]::IsNullOrWhiteSpace([string]$SealInput.approval.approval_id)-or[string]::IsNullOrWhiteSpace([string]$SealInput.approval.approved_by)){throw 'A1R3 approval provenance is incomplete.'}
    if([DateTimeOffset]::Parse([string]$SealInput.approval.approved_at_utc)-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)){throw 'A1R3 approval time is in the future.'}
    foreach($field in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if($SealInput.approval.$field-isnot[bool]){throw "A1R3 approval Boolean is invalid: $field"}}
    Assert-G3E2RA1R3Baseline $Context $SealInput.baseline
}

function Get-G3E2RA1R3BundlePaths {
    param([object]$Context,[object]$BState)
    return [ordered]@{
        'G3E1-BUNDLE'=Get-G3E2RA1R3RepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE']
        'G3E2R-A-BUNDLE'=Get-G3E2RA1R3RepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-BUNDLE']
        'G3E2R-A-DEPENDENCY-LOCK'=Get-G3E2RA1R3RepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK']
        'G3E2R-A1-BUNDLE'=Get-G3E2RA1R3RepositoryPath $Context.Root $Context.A1R2Context.A1RContext.A1Manifest
        'G3E2R-A1R-BUNDLE'=Get-G3E2RA1R3RepositoryPath $Context.Root $Context.A1R2Context.A1RManifest
        'G3E2R-A1R2-BUNDLE'=Get-G3E2RA1R3RepositoryPath $Context.Root $Context.A1R2Manifest
        'G3E2R-A1R3-BUNDLE'=Get-G3E2RA1R3RepositoryPath $Context.Root $Context.Manifest
        'G3E2R-B-BUNDLE'=Get-G3E2RA1R3RepositoryPath $Context.Root $BState.Manifest
    }
}

function New-G3E2RA1R3Seal {
    param([object]$Context,[object]$SealInput,[object[]]$RuntimeBindings,[object]$BState)
    $bundlePaths=Get-G3E2RA1R3BundlePaths $Context $BState
    $bundles=foreach($id in @($Context.SealContract.required_bundle_binding_ids)){New-G3E2RA1R3FileBinding bundle_id $id $Context $bundlePaths[$id]}
    $executionPaths=Get-G3E2RA1R3ExecutionPaths;$executions=foreach($id in @($Context.SealContract.required_execution_binding_ids)){New-G3E2RA1R3FileBinding execution_id $id $Context $executionPaths[$id]}
    $artifactPaths=Get-G3E2RA1RArtifactPaths $Context.A1R2Context.A1RContext;$artifacts=foreach($id in @($Context.SealContract.required_artifact_binding_ids)){New-G3E2RA1R3FileBinding artifact_id $id $Context $artifactPaths[$id]}
    return [pscustomobject][ordered]@{seal_contract='g3e2r-live-seal/v2';state='sealed';transaction_id=[string]$SealInput.transaction_id;vault_root=$Context.Root;routing_state='frozen';legacy_token=[string]$SealInput.legacy_token;approval=$SealInput.approval;time=[pscustomobject][ordered]@{prepared_at_utc=[string]$SealInput.prepared_at_utc;sealed_at_utc='';not_after_utc='';ttl_seconds=900};bundle_bindings=@($bundles);execution_bindings=@($executions);artifact_bindings=@($artifacts);runtime_bindings=@($RuntimeBindings);baseline=$SealInput.baseline}
}

function Assert-G3E2RA1R3RuntimeBindings {
    param([object[]]$Expected,[object[]]$Actual)
    if($Expected.Count-ne 4-or$Actual.Count-ne 4){throw 'Runtime binding cardinality differs from four.'}
    $expectedIds=@($Expected.runtime_id);$actualIds=@($Actual.runtime_id)
    if(-not(Test-G3E2RA1R3OrdinalSetEqual $expectedIds $actualIds)){throw 'Runtime binding ids differ.'}
    foreach($row in $Expected){
        Assert-G3E2RA1R3ExactProperties $row @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Expected runtime binding'
        $match=@($Actual|Where-Object runtime_id -CEQ $row.runtime_id)
        if($match.Count-ne 1){throw "Runtime binding is missing: $($row.runtime_id)"}
        Assert-G3E2RA1R3ExactProperties $match[0] @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Actual runtime binding'
        foreach($name in @('executable_path','executable_sha256','version','version_probe_id')){if([string]$row.$name-cne[string]$match[0].$name){throw "Runtime binding differs: $($row.runtime_id)/$name"}}
    }
}

function Assert-G3E2RA1R3SealClosure {
    param([object]$Context,[object]$Seal,[switch]$AllowPreparedB)
    $sets=@(
        @(@($Context.SealContract.required_bundle_binding_ids),@($Seal.bundle_bindings.bundle_id),8,'bundle'),
        @(@($Context.SealContract.required_execution_binding_ids),@($Seal.execution_bindings.execution_id),44,'execution'),
        @(@($Context.SealContract.required_artifact_binding_ids),@($Seal.artifact_bindings.artifact_id),15,'artifact'),
        @(@($Context.SealContract.required_runtime_ids),@($Seal.runtime_bindings.runtime_id),4,'runtime')
    )
    foreach($set in $sets){if($set[1].Count-ne$set[2]-or-not(Test-G3E2RA1R3OrdinalSetEqual $set[0] $set[1])){throw "Seal $($set[3]) ids differ from contract."}}
    foreach($row in @($Seal.bundle_bindings)){Assert-G3E2RA1R3ExactProperties $row @('bundle_id','repository_path','sha256','bytes') 'Seal bundle binding'}
    foreach($row in @($Seal.execution_bindings)){Assert-G3E2RA1R3ExactProperties $row @('execution_id','repository_path','sha256','bytes') 'Seal execution binding'}
    foreach($row in @($Seal.artifact_bindings)){Assert-G3E2RA1R3ExactProperties $row @('artifact_id','repository_path','sha256','bytes') 'Seal artifact binding'}
    foreach($row in @($Seal.runtime_bindings)){Assert-G3E2RA1R3ExactProperties $row @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Seal runtime binding'}
    foreach($row in @($Seal.bundle_bindings+$Seal.execution_bindings+$Seal.artifact_bindings)){
        $full=Resolve-G3E2RA1R3InRoot $Context.Root $row.repository_path
        if((Get-G3E2RA1R3Sha256 $full)-cne$row.sha256-or(Get-G3E2RA1R3Bytes $full)-ne[int64]$row.bytes){throw "Seal file binding mismatch: $($row.repository_path)"}
    }
    $bRoot=Resolve-G3E2RA1R3InRoot $Context.Root ([string]$Context.BContract.canonical_root);$bManifest=Join-Path $bRoot ([string]$Context.BContract.bundle_manifest_filename)
    $bundlePaths=Get-G3E2RA1R3BundlePaths $Context ([pscustomobject]@{Manifest=$bManifest})
    foreach($id in $bundlePaths.Keys){$row=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$bundlePaths[$id]){throw "Seal bundle canonical path mismatch: $id"}}
    $executionPaths=Get-G3E2RA1R3ExecutionPaths;foreach($id in $executionPaths.Keys){$row=@($Seal.execution_bindings|Where-Object execution_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$executionPaths[$id]){throw "Seal execution canonical path mismatch: $id"}}
    $artifactPaths=Get-G3E2RA1RArtifactPaths $Context.A1R2Context.A1RContext;foreach($id in $artifactPaths.Keys){$row=@($Seal.artifact_bindings|Where-Object artifact_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$artifactPaths[$id]){throw "Seal artifact canonical path mismatch: $id"}}
    $b=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE');$null=Test-G3E2RA1R3BManifest $Context ([string]$b[0].sha256) -AllowSealed:(-not$AllowPreparedB)
}

function Read-G3E2RA1R3Seal {
    param([object]$Context,[string]$LiteralPath,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedA1R2Hash,[string]$ExpectedA1R3Hash,[string]$ExpectedSealHash,[object[]]$ActualRuntimeBindings,[ValidateSet('Forward','Reverse')][string]$Use='Forward')
    if((Get-G3E2RA1R3Sha256 $Context.A1R2Context.A1RContext.A1Manifest)-cne$ExpectedA1Hash.ToUpperInvariant()){throw 'Expected-A1-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R3Sha256 $Context.A1R2Context.A1RManifest)-cne$ExpectedA1RHash.ToUpperInvariant()){throw 'Expected-A1R-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R3Sha256 $Context.A1R2Manifest)-cne$ExpectedA1R2Hash.ToUpperInvariant()){throw 'Expected-A1R2-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R3Sha256 $Context.Manifest)-cne$ExpectedA1R3Hash.ToUpperInvariant()){throw 'Expected-A1R3-Hash mismatch at seal consumption.'}
    if((Get-G3E2RA1R3Sha256 $LiteralPath)-cne$ExpectedSealHash.ToUpperInvariant()){throw 'Expected-Seal-Hash mismatch.'}
    $seal=Get-Content -LiteralPath $LiteralPath -Raw -Encoding UTF8|ConvertFrom-Json
    Assert-G3E2RA1R3ExactProperties $seal @($Context.SealContract.required_top_level) 'A1R3 live seal'
    if($seal.seal_contract-cne'g3e2r-live-seal/v2'-or$seal.state-cne'sealed'-or$seal.routing_state-cne'frozen'-or$seal.legacy_token-cne$Context.SealContract.legacy_token-or[IO.Path]::GetFullPath([string]$seal.vault_root).TrimEnd('\')-cne$Context.Root-or[string]::IsNullOrWhiteSpace([string]$seal.transaction_id)){throw 'A1R3 live seal identity is invalid.'}
    Assert-G3E2RA1R3ExactProperties $seal.approval @($Context.SealContract.required_approval_fields) 'A1R3 live seal approval'
    if([string]::IsNullOrWhiteSpace([string]$seal.approval.approval_id)-or[string]::IsNullOrWhiteSpace([string]$seal.approval.approved_by)){throw 'A1R3 live seal approval provenance is incomplete.'}
    Assert-G3E2RA1R3ExactProperties $seal.time @($Context.SealContract.required_time_fields) 'A1R3 live seal time'
    Assert-G3E2RA1R3Baseline $Context $seal.baseline
    $prepared=[DateTimeOffset]::Parse([string]$seal.time.prepared_at_utc);$sealed=[DateTimeOffset]::Parse([string]$seal.time.sealed_at_utc);$notAfter=[DateTimeOffset]::Parse([string]$seal.time.not_after_utc)
    if([int]$seal.time.ttl_seconds-ne 900-or($notAfter-$sealed).TotalSeconds-ne 900-or$prepared-gt$sealed-or$sealed-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)-or[DateTimeOffset]::Parse([string]$seal.approval.approved_at_utc)-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)){throw 'A1R3 live seal time boundary is invalid.'}
    if($Use-ceq'Forward'-and[DateTimeOffset]::UtcNow-gt$notAfter){throw 'A1R3 live seal has expired for forward.'}
    foreach($f in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if($seal.approval.$f-isnot[bool]-or-not[bool]$seal.approval.$f){throw "A1R3 live seal approval missing: $f"}}
    Assert-G3E2RA1R3SealClosure $Context $seal;Assert-G3E2RA1R3RuntimeBindings @($seal.runtime_bindings) $ActualRuntimeBindings
    return $seal
}

function Enter-G3E2RA1R3ClosureLock {
    param([object]$Context,[object]$Seal,[string]$SealPath,[string]$ExpectedSealHash)
    Assert-G3E2RA1R3SealClosure $Context $Seal -AllowPreparedB:([string]::IsNullOrWhiteSpace($SealPath))
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
    foreach($row in @($Seal.bundle_bindings+$Seal.execution_bindings+$Seal.artifact_bindings)){&$add (Resolve-G3E2RA1R3InRoot $Context.Root $row.repository_path) ([string]$row.sha256) ([int64]$row.bytes)}
    foreach($runtime in @($Seal.runtime_bindings)){&$add ([string]$runtime.executable_path) ([string]$runtime.executable_sha256) $null}
    if(-not[string]::IsNullOrWhiteSpace($SealPath)){&$add $SealPath $ExpectedSealHash $null}
    $bBinding=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')[0];$bManifest=Resolve-G3E2RA1R3InRoot $Context.Root ([string]$bBinding.repository_path)
    $manifestSpecs=@(
        @($Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE'],'candidate_path'),
        @($Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-BUNDLE'],'overlay_path'),
        @($Context.A1R2Context.A1RContext.A1Manifest,'overlay_path'),
        @($Context.A1R2Context.A1RManifest,'overlay_path'),
        @($Context.A1R2Manifest,'overlay_path'),
        @($Context.Manifest,'overlay_path'),
        @($bManifest,'bundle_path')
    )
    foreach($spec in $manifestSpecs){$manifestPath=[string]$spec[0];$base=Split-Path -Parent $manifestPath;foreach($row in @(Import-Csv -LiteralPath $manifestPath)){&$add ([IO.Path]::GetFullPath((Join-Path $base ([string]$row.($spec[1])).Replace('/','\')))) ([string]$row.sha256) ([int64]$row.bytes)}}
    foreach($lockPath in @($Context.A1R2Context.A1RContext.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK'],(Join-Path $Context.Overlay 'dependency-lock.csv'))){foreach($row in @(Import-Csv -LiteralPath $lockPath)){&$add (Resolve-G3E2RA1R3InRoot $Context.Root ([string]$row.repository_path)) ([string]$row.sha256) ([int64]$row.bytes)}}
    $handles=[Collections.Generic.List[object]]::new()
    try{
        foreach($path in @(Get-G3E2RA1R3OrdinalStrings @($map.Keys))){
            $stream=[IO.File]::Open($path,[IO.FileMode]::Open,[IO.FileAccess]::Read,[IO.FileShare]::Read);$sha=[Security.Cryptography.SHA256]::Create()
            try{$hash=([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','')}finally{$sha.Dispose()}
            if($hash-cne$map[$path].sha256-or($null-ne$map[$path].bytes-and$stream.Length-ne[int64]$map[$path].bytes)){throw "Locked closure identity mismatch: $path"}
            $handles.Add([pscustomobject]@{Path=$path;Stream=$stream;Sha256=$hash;Bytes=$map[$path].bytes})
        }
        return [pscustomobject]@{Handles=$handles;Count=$handles.Count}
    }catch{foreach($item in $handles){$item.Stream.Dispose()};throw}
}

function Test-G3E2RA1R3ClosureLock {
    param([object]$Lock)
    foreach($item in @($Lock.Handles)){
        $item.Stream.Position=0;$sha=[Security.Cryptography.SHA256]::Create()
        try{$hash=([BitConverter]::ToString($sha.ComputeHash($item.Stream))).Replace('-','')}finally{$sha.Dispose()}
        if($hash-cne$item.Sha256-or($null-ne$item.Bytes-and$item.Stream.Length-ne[int64]$item.Bytes)){throw "Held closure changed: $($item.Path)"}
    }
}

function Exit-G3E2RA1R3ClosureLock {
    param([object]$Lock)
    if($null-ne$Lock){$paths=@(Get-G3E2RA1R3OrdinalStrings @($Lock.Handles.Path) -Descending);foreach($path in $paths){@($Lock.Handles|Where-Object Path -CEQ $path)[0].Stream.Dispose()}}
}

function Get-G3E2RA1R3RuntimeBindings {
    param([object]$Context,[string]$PythonExecutable)
    return @(Get-G3E2RA1R2RuntimeBindings -Context $Context.A1R2Context -PythonExecutable $PythonExecutable)
}

function Test-G3E2RA1R3BManifest {
    param([object]$Context,[string]$ExpectedBHash,[switch]$AllowSealed)
    $bRoot=Resolve-G3E2RA1R3InRoot $Context.Root ([string]$Context.BContract.canonical_root);$bManifest=Join-Path $bRoot ([string]$Context.BContract.bundle_manifest_filename)
    if(-not[string]::IsNullOrWhiteSpace($ExpectedBHash)-and(Test-Path -LiteralPath $bManifest -PathType Leaf)-and(Get-G3E2RA1R3Sha256 $bManifest)-cne$ExpectedBHash.ToUpperInvariant()){throw 'Expected-B-Hash mismatch.'}
    return Test-G3E2RA1R2BManifest -Context $Context.A1R2Context -ExpectedBHash $ExpectedBHash -AllowSealed:$AllowSealed
}

function Get-G3E2RA1R3Artifact { param([object]$Seal,[string]$Id);return Get-G3E2RA1R2Artifact $Seal $Id }
function Test-G3E2RA1R3BoundArtifact { param([object]$Context,[object]$Artifact);return Test-G3E2RA1R2BoundArtifact $Context.A1R2Context $Artifact }
function Test-G3E2RA1R3HardReferences { param([object]$Context,[object]$Seal,[string]$State,[string]$RipgrepExecutable);Test-G3E2RA1R2HardReferences $Context.A1R2Context $Seal $State $RipgrepExecutable }
function Test-G3E2RA1R3WorkspaceAdvisory { param([object]$Context,[object]$Seal);Test-G3E2RA1R2WorkspaceAdvisory $Context.A1R2Context $Seal }
function Assert-G3E2RA1R3GitStagingEmpty { param([string]$VaultRoot,[string]$GitExecutable);Assert-G3E2RA1R2GitStagingEmpty $VaultRoot $GitExecutable }
function Assert-G3E2RA1R3NoResidue { param([string]$VaultRoot);Assert-G3E2RA1R2NoResidue $VaultRoot }
function Enter-G3E2RA1R3Mutex { param([string]$VaultRoot);return Enter-G3E2RA1R2Mutex $VaultRoot }
function Exit-G3E2RA1R3Mutex { param([object]$Mutex);Exit-G3E2RA1R2Mutex $Mutex }
function Test-G3E2RA1R3Administrator { return Test-G3E2RA1R2Administrator }
function Add-G3E2RA1R3CompatibilityProperties { param([object]$Seal);return Add-G3E2RA1R2CompatibilityProperties $Seal }

Export-ModuleMember -Function @(
    'Get-G3E2RA1R3Sha256','Get-G3E2RA1R3Bytes','Get-G3E2RA1R3BytesSha256',
    'Get-G3E2RA1R3OrdinalStrings','Test-G3E2RA1R3OrdinalUnique','Test-G3E2RA1R3OrdinalSetEqual',
    'Resolve-G3E2RA1R3InRoot','Get-G3E2RA1R3RepositoryPath','Assert-G3E2RA1R3ExactProperties',
    'Import-G3E2RA1R3ExactCsv','Test-G3E2RA1R3BoundManifest','Get-G3E2RA1R3Context',
    'Get-G3E2RA1R3TreeStateV3','Get-G3E2RA1R3TreeFingerprintV3','Get-G3E2RA1R3WrapperInventory',
    'Get-G3E2RA1R3TransitionRows','Get-G3E2RA1R3WrapperFingerprintV3','Test-G3E2RA1R3InvariantSchema',
    'Test-G3E2RA1R3LiveInvariants','Get-G3E2RA1R3ExecutionPaths','Assert-G3E2RA1R3Baseline',
    'Assert-G3E2RA1R3SealInput','New-G3E2RA1R3Seal','Assert-G3E2RA1R3RuntimeBindings',
    'Assert-G3E2RA1R3SealClosure','Read-G3E2RA1R3Seal','Enter-G3E2RA1R3ClosureLock',
    'Test-G3E2RA1R3ClosureLock','Exit-G3E2RA1R3ClosureLock','Get-G3E2RA1R3RuntimeBindings',
    'Test-G3E2RA1R3BManifest','Get-G3E2RA1R3Artifact','Test-G3E2RA1R3BoundArtifact',
    'Test-G3E2RA1R3HardReferences','Test-G3E2RA1R3WorkspaceAdvisory','Assert-G3E2RA1R3GitStagingEmpty',
    'Assert-G3E2RA1R3NoResidue','Enter-G3E2RA1R3Mutex','Exit-G3E2RA1R3Mutex',
    'Test-G3E2RA1R3Administrator','Add-G3E2RA1R3CompatibilityProperties'
)
