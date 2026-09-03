[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$VaultRoot,[string]$OverlayRoot,
    [Parameter(Mandatory=$true)][string]$PythonExecutable,[switch]$Json
)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
if([string]::IsNullOrWhiteSpace($OverlayRoot)){$OverlayRoot=Join-Path $PSScriptRoot '..'}
$root=(Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\');$overlay=(Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
Import-Module (Join-Path $overlay 'tools/g3e2r-a1r3-guard-lib.psm1') -Force
$manifest=Join-Path $overlay 'a1r3-bundle-manifest.csv'
$expectedA1R3=Get-G3E2RA1R3Sha256 $manifest
$expectedA1R2='C907A384EC11C7265C05454ACD6984A1A7A61D3451A1EB60640CCAAF331A035C'
$expectedA1R='57DBC2BC3F91D6C201E9F7506576A9F2F07E55D17808B058E9F1933380249B2D'
$expectedA1='8878AA92D1F82DB4F9B3D8E4C1F5E707F36E77E3013195ABF7AD7784AE185AC7'
$expectedS5LocalSourceContract='12CB11614006F3643B5E159635D9451031C24C1E9DADEDFEFFAD9B1BA7A101FD'
$expectedS5NewsletterContract='F5FFDE88F2D827C9DF85BFD3F926B14B491EC4E577B88625E989AB4F47292592'
$context=Get-G3E2RA1R3Context $root $overlay $expectedA1 $expectedA1R $expectedA1R2 $expectedA1R3
$checks=[Collections.Generic.List[string]]::new();$powerShell=(Get-Process -Id $PID).Path

function Add-Check {
    param([string]$Id,[bool]$Passed,[string]$Evidence)
    if(-not$Passed){throw "$Id failed: $Evidence"}
    $checks.Add("$Id|$Evidence")
}
function Expect-Failure { param([scriptblock]$Action);try{&$Action;$false}catch{$true} }
function Parse-Tool { param([string]$Path);$tokens=$null;$errors=$null;[void][Management.Automation.Language.Parser]::ParseFile($Path,[ref]$tokens,[ref]$errors);return @($errors) }
function Invoke-JsonScript {
    param([string]$Script,[string[]]$Arguments,[int]$TimeoutSeconds=1200)
    $saved=$ErrorActionPreference;$ErrorActionPreference='Continue'
    try{$out=&$powerShell -NoProfile -ExecutionPolicy Bypass -File $Script @Arguments 2>&1;$code=$LASTEXITCODE}
    finally{$ErrorActionPreference=$saved}
    if($code-ne 0){throw "Child failed: $Script$([Environment]::NewLine)$($out-join[Environment]::NewLine)"}
    $line=@($out|ForEach-Object{[string]$_}|Where-Object{$_.TrimStart().StartsWith('{')}|Select-Object -Last 1)
    if($line.Count-ne 1){throw "Child returned no JSON: $Script"}
    return ($line[0]|ConvertFrom-Json)
}
function Write-Utf8 {
    param([string]$Path,[string]$Text)
    $null=[IO.Directory]::CreateDirectory((Split-Path -Parent $Path))
    [IO.File]::WriteAllText($Path,$Text,[Text.UTF8Encoding]::new($false))
}
function Save-Csv { param([object[]]$Rows,[string]$Path);$Rows|Export-Csv -LiteralPath $Path -NoTypeInformation -Encoding UTF8 }
function Invoke-CultureTree {
    param([string]$Runner,[string]$Culture,[string]$Tree)
    $saved=$ErrorActionPreference;$ErrorActionPreference='Continue'
    try{$out=&$powerShell -NoProfile -ExecutionPolicy Bypass -File $Runner -ModulePath (Join-Path $overlay 'tools/g3e2r-a1r3-guard-lib.psm1') -Culture $Culture -Tree $Tree 2>&1;$code=$LASTEXITCODE}
    finally{$ErrorActionPreference=$saved}
    if($code-ne 0){throw "Culture child failed: $Culture / $Tree$([Environment]::NewLine)$($out-join[Environment]::NewLine)"}
    $line=@($out|ForEach-Object{[string]$_}|Where-Object{$_.TrimStart().StartsWith('{')}|Select-Object -Last 1)
    if($line.Count-ne 1){throw "Culture child returned no JSON: $Culture"}
    return ($line[0]|ConvertFrom-Json)
}
function Invoke-RootFast {
    $out=&$powerShell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'tools/test-wiki-integrity.ps1') -Profile Fast 2>&1
    if($LASTEXITCODE-ne 0){throw "Root Fast failed: $($out-join[Environment]::NewLine)"}
    return @($out)
}
function Invoke-Mos {
    $out=&$powerShell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') 2>&1
    if($LASTEXITCODE-ne 0){throw "MOS failed: $($out-join[Environment]::NewLine)"}
    return @($out)
}

$a1r2Before=Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Root
$a1rBefore=Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RRoot
$a1Before=Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RContext.A1Root
$aBefore=Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RContext.A1Context.ARoot
$g3e1Before=Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RContext.A1Context.G3E1Root

$bundleRows=@(Import-Csv -LiteralPath $manifest)
Add-Check T01-EXACT-A1R3-INVENTORY ($bundleRows.Count-eq 14-and@(Get-ChildItem -LiteralPath $overlay -Recurse -File).Count-eq 15) '14 bound members plus manifest'
$lock=@(Import-Csv -LiteralPath (Join-Path $overlay 'dependency-lock.csv'))
Add-Check T02-ONE-LINE-A1R2-LOCK ($lock.Count-eq 1-and$lock[0].dependency_id-ceq'G3E2R-A1R2-BUNDLE'-and$lock[0].sha256-ceq$expectedA1R2) 'one immutable A1R2 dependency'
Add-Check T03-A1R2-EXACT-CLOSURE ((Get-G3E2RA1R3Sha256 $context.A1R2Manifest)-ceq$expectedA1R2-and@(Import-Csv -LiteralPath $context.A1R2Manifest).Count-eq 14) 'accepted A1R2 manifest and members'
Add-Check T04-TRANSITIVE-UPSTREAM-CLOSURE ((Get-G3E2RA1R3Sha256 $context.A1R2Context.A1RManifest)-ceq$expectedA1R-and(Get-G3E2RA1R3Sha256 $context.A1R2Context.A1RContext.A1Manifest)-ceq$expectedA1-and(Get-G3E2RA1R3Sha256 $context.A1R2Context.A1RContext.A1Context.Dependencies['G3E1-BUNDLE'])-ceq'D581C9535B6359F7058DA33C3CB9E229EC8EF1C8C2C6C4D49311C75189D20E50') 'A1R A1 A and G3E1 exact'
Add-Check T05-CONTRACT-SCHEMAS ($context.SealContract.contract_id-ceq'g3e2r-live-seal-contract/v2-a1r3'-and$context.InvariantContract.contract_id-ceq'g3e2r-live-invariant-manifest/v3'-and$context.FingerprintContract.contract_id-ceq'g3e2r-ordinal-fingerprint/v3') 'three A1R3 contracts exact'
$invRaw=Get-Content -LiteralPath (Join-Path $overlay 'contracts/live-invariant-v3-contract.json') -Raw
Add-Check T06-V3-VERSION-SEPARATION ($invRaw.Contains('expected_fingerprint_v3')-and(-not$invRaw.Contains('expected_fingerprint_v2'))-and$context.SealContract.required_baseline_fields-contains'wrapper_pre_fingerprint_v3') 'v3 fields replace v2 fields'
$bRoot=Resolve-G3E2RA1R3InRoot $root ([string]$context.BContract.canonical_root)
Add-Check T07-CREATE-ONLY-SCOPE (-not(Test-Path -LiteralPath $bRoot)-and@(Get-ChildItem -LiteralPath (Split-Path -Parent $overlay) -Recurse -File -Filter 'live-seal-v2.json').Count-eq 0-and@($context.Gates|Where-Object step_id -CEQ 'FWD-020').Count-eq 0) 'B seal and FWD-020 absent'

$temp=Join-Path ([IO.Path]::GetTempPath()) ('g3e2r-a1r3-'+[guid]::NewGuid().ToString('N'))
$tempRemoved=$false
try{
    $null=[IO.Directory]::CreateDirectory($temp)
    $upperAumlaut=[string][char]0x00C4;$lowerAumlaut=[string][char]0x00E4;$lowerOumlaut=[string][char]0x00F6;$lowerUumlaut=[string][char]0x00FC
    $vector=$context.FingerprintContract.known_answer_vector
    $vectorRows=@($vector.records|ForEach-Object{$parts=([string]$_).Split([char]9);[pscustomobject]@{repository_path=$parts[0];bytes=$parts[1];sha256=$parts[2]}})
    $known=Get-G3E2RA1R3WrapperFingerprintV3 $vectorRows
    Add-Check T08-KNOWN-ANSWER-VECTOR ($known-ceq[string]$vector.sha256) 'PowerShell v3 matches fixed ordinal vector'

    $missing=Join-Path $temp 'missing';$empty=Join-Path $temp 'empty';$null=[IO.Directory]::CreateDirectory($empty)
    Add-Check T09-ABSENT-AND-EMPTY ((Get-G3E2RA1R3TreeFingerprintV3 $missing)-ceq'ABSENT'-and(Get-G3E2RA1R3TreeFingerprintV3 $empty)-ceq[string]$context.FingerprintContract.empty_tree_fingerprint) 'absent sentinel distinct from empty tree'

    $reordered=[object[]]$vectorRows.Clone();[Array]::Reverse($reordered)
    Add-Check T10-INPUT-ORDER-INDEPENDENCE ((Get-G3E2RA1R3WrapperFingerprintV3 $reordered)-ceq$known) 'record enumeration order does not affect fingerprint'

    $cultureTree=Join-Path $temp 'culture-tree'
    foreach($spec in @(@(($lowerUumlaut+'.txt'),'f'),@('z.txt','c'),@('A.txt','a'),@(($upperAumlaut+'.txt'),'d'),@(($lowerOumlaut+'.txt'),'e'),@('_.txt','b'))){Write-Utf8 (Join-Path $cultureTree $spec[0]) ([string]$spec[1])}
    $treeOriginal=Get-G3E2RA1R3TreeStateV3 $cultureTree
    Write-Utf8 (Join-Path $cultureTree 'A.txt') 'changed';$treeChanged=Get-G3E2RA1R3TreeFingerprintV3 $cultureTree;Write-Utf8 (Join-Path $cultureTree 'A.txt') 'a'
    Add-Check T11-CONTENT-SENSITIVITY ($treeChanged-cne$treeOriginal.Fingerprint-and(Get-G3E2RA1R3TreeFingerprintV3 $cultureTree)-ceq$treeOriginal.Fingerprint) 'content changes and restoration are detected'

    [IO.File]::Move((Join-Path $cultureTree 'z.txt'),(Join-Path $cultureTree 'y.txt'));$renamed=Get-G3E2RA1R3TreeFingerprintV3 $cultureTree;[IO.File]::Move((Join-Path $cultureTree 'y.txt'),(Join-Path $cultureTree 'z.txt'))
    Add-Check T12-PATH-SENSITIVITY ($renamed-cne$treeOriginal.Fingerprint-and(Get-G3E2RA1R3TreeFingerprintV3 $cultureTree)-ceq$treeOriginal.Fingerprint) 'rename changes and restoration are detected'

    Write-Utf8 (Join-Path $cultureTree 'new.txt') 'n';$added=Get-G3E2RA1R3TreeStateV3 $cultureTree;[IO.File]::Delete((Join-Path $cultureTree 'new.txt'))
    Add-Check T13-ADD-REMOVE-COUNT ($added.FileCount-eq($treeOriginal.FileCount+1)-and$added.Fingerprint-cne$treeOriginal.Fingerprint-and(Get-G3E2RA1R3TreeFingerprintV3 $cultureTree)-ceq$treeOriginal.Fingerprint) 'add remove and file count are bound'

    $orderedNames=@($treeOriginal.Lines|ForEach-Object{([string]$_).Split([char]9)[0]})
    $expectedNames=@('A.txt','_.txt','z.txt',($upperAumlaut+'.txt'),($lowerOumlaut+'.txt'),($lowerUumlaut+'.txt'));$orderedExact=$orderedNames.Count-eq$expectedNames.Count
    if($orderedExact){for($i=0;$i-lt$expectedNames.Count;$i++){if($orderedNames[$i]-cne$expectedNames[$i]){$orderedExact=$false;break}}}
    Add-Check T14-CANONICAL-SERIALIZATION ($orderedExact-and(-not(($treeOriginal.Lines-join[char]10).Contains([char]13)))) 'slash tab LF UTF8 ordinal serialization'
    Add-Check T15-UPPERCASE-HASHES ($treeOriginal.Fingerprint-cmatch'^[A-F0-9]{64}$'-and@($treeOriginal.Lines|Where-Object{([string]$_).Split([char]9)[2]-cnotmatch'^[A-F0-9]{64}$'}).Count-eq 0) 'record and final hashes uppercase'

    $junctionTarget=Join-Path $temp 'junction-target';$junctionPath=Join-Path $cultureTree 'junction';$null=[IO.Directory]::CreateDirectory($junctionTarget);Write-Utf8 (Join-Path $junctionTarget 'x.txt') 'x'
    $junction=$null
    try{$junction=New-Item -ItemType Junction -Path $junctionPath -Target $junctionTarget -ErrorAction Stop;Add-Check T16-REPARSE-FAIL-CLOSED (Expect-Failure{Get-G3E2RA1R3TreeFingerprintV3 $cultureTree}) 'tree reparse point rejected'}
    finally{if($null-ne$junction-and(Test-Path -LiteralPath $junctionPath)){[IO.Directory]::Delete($junctionPath)}}

    $twin=Join-Path $temp 'twin-tree';foreach($file in @(Get-ChildItem -LiteralPath $cultureTree -File)){Write-Utf8 (Join-Path $twin $file.Name) ([IO.File]::ReadAllText($file.FullName))}
    Add-Check T17-ROOT-INDEPENDENCE-AND-TRAVERSAL ((Get-G3E2RA1R3TreeFingerprintV3 $twin)-ceq$treeOriginal.Fingerprint-and(Expect-Failure{Resolve-G3E2RA1R3InRoot $root '../escape'})) 'root path excluded and traversal rejected'

    $wrapperFixture=Join-Path $temp 'wrappers';Write-Utf8 (Join-Path $wrapperFixture ($lowerAumlaut+'-skill/SKILL.md')) 'a';Write-Utf8 (Join-Path $wrapperFixture 'z-skill/SKILL.md') 'z';Write-Utf8 (Join-Path $wrapperFixture 'A-skill/SKILL.md') 'A'
    $wrapperInventory=@(Get-G3E2RA1R3WrapperInventory $context $wrapperFixture);$wrapperPaths=@($wrapperInventory.repository_path);$wrapperExpected=@(Get-G3E2RA1R3OrdinalStrings $wrapperPaths)
    Add-Check T18-WRAPPER-INVENTORY-ORDINAL ($wrapperInventory.Count-eq 3-and(Test-G3E2RA1R3OrdinalSetEqual $wrapperPaths $wrapperExpected)-and$wrapperPaths[0]-ceq$wrapperExpected[0]-and$wrapperPaths[2]-ceq$wrapperExpected[2]) 'wrapper inventory emitted in ordinal order'
    $wrapperReordered=[object[]]$wrapperInventory.Clone();[Array]::Reverse($wrapperReordered);$wrapperFp=Get-G3E2RA1R3WrapperFingerprintV3 $wrapperInventory
    Add-Check T19-WRAPPER-FINGERPRINT-METAMORPHIC ((Get-G3E2RA1R3WrapperFingerprintV3 $wrapperReordered)-ceq$wrapperFp-and(Expect-Failure{Get-G3E2RA1R3WrapperFingerprintV3 @($wrapperInventory[0],$wrapperInventory[0])})) 'wrapper identity is order independent and duplicate rejecting'

    $cultureRunner=Join-Path $temp 'culture-runner.ps1'
    Write-Utf8 $cultureRunner @'
param([string]$ModulePath,[string]$Culture,[string]$Tree)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
$ci=[Globalization.CultureInfo]::GetCultureInfo($Culture)
[Threading.Thread]::CurrentThread.CurrentCulture=$ci
[Threading.Thread]::CurrentThread.CurrentUICulture=$ci
Import-Module $ModulePath -Force
$state=Get-G3E2RA1R3TreeStateV3 $Tree
[ordered]@{culture=[Globalization.CultureInfo]::CurrentCulture.Name;fingerprint=$state.Fingerprint;file_count=$state.FileCount}|ConvertTo-Json -Compress
'@
    $enUS=Invoke-CultureTree $cultureRunner 'en-US' $cultureTree
    Add-Check T20-EN-US-CHILD ($enUS.culture-ceq'en-US'-and$enUS.fingerprint-cmatch'^[A-F0-9]{64}$') 'separate en-US child process passed'
    $enDE=Invoke-CultureTree $cultureRunner 'en-DE' $cultureTree
    Add-Check T21-EN-DE-CHILD ($enDE.culture-ceq'en-DE'-and$enDE.fingerprint-cmatch'^[A-F0-9]{64}$') 'separate en-DE child process passed'
    Add-Check T22-CROSS-CULTURE-EQUALITY ($enUS.fingerprint-ceq$enDE.fingerprint-and$enUS.file_count-eq$enDE.file_count) 'same runtime binary emits identical en-US and en-DE v3 identity'

    $oracle=Join-Path $temp 'oracle.py'
    Write-Utf8 $oracle @'
import hashlib, json, sys
with open(sys.argv[1], "r", encoding="utf-8") as handle:
    contract=json.load(handle)
records=contract["known_answer_vector"]["records"]
digest=hashlib.sha256("\n".join(sorted(records)).encode("utf-8")).hexdigest().upper()
print(json.dumps({"sha256": digest, "count": len(records)}))
'@
    $oracleOut=&$PythonExecutable $oracle (Join-Path $overlay 'contracts/ordinal-fingerprint-v3-contract.json')
    if($LASTEXITCODE-ne 0){throw 'Python oracle failed.'};$oracleResult=([string]$oracleOut|ConvertFrom-Json)
    Add-Check T23-INDEPENDENT-PYTHON-ORACLE ($oracleResult.sha256-ceq$known-and$oracleResult.count-eq 6) 'independent Python known-answer oracle agrees'

    $liveTrees=@(
        (Join-Path $root 'projects/No and low code_1st Marketing Agent'),
        (Join-Path $root 'projects/marketing-contextops'),
        (Join-Path $root 'projects/marketing-operating-system')
    )
    $liveEqual=$true
    foreach($tree in $liveTrees){$us=Invoke-CultureTree $cultureRunner 'en-US' $tree;$de=Invoke-CultureTree $cultureRunner 'en-DE' $tree;if($us.fingerprint-cne$de.fingerprint-or$us.file_count-ne$de.file_count){$liveEqual=$false}}
    Add-Check T24-LIVE-CROSS-CULTURE-REGRESSION $liveEqual 'Legacy Target and MOS v3 identities equal across en-US and en-DE'

    $inventory=@(Get-G3E2RA1R3WrapperInventory $context);$transitions=@(Get-G3E2RA1R3TransitionRows $context)
    $actions=@($transitions|Where-Object action -CEQ 'transition');$verify=@($transitions|Where-Object action -CEQ 'verify-only')
    $transitionPaths=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal);foreach($p in @($transitions.wrapper_path)){$null=$transitionPaths.Add([string]$p)}
    $external=@($inventory|Where-Object{-not$transitionPaths.Contains([string]$_.repository_path)})
    $invariantRows=[Collections.Generic.List[object]]::new()
    for($i=1;$i-le 14;$i++){$invariantRows.Add([pscustomobject][ordered]@{invariant_id=('PROTECTED-{0:D2}'-f$i);state_scope='all';subject_type='file-exact';repository_path=('fixture/protected-{0:D2}.txt'-f$i);expected_fingerprint_v3='';expected_file_count='';expected_sha256=('A'*64);expected_bytes=1;mutation_policy='must-not-change';basis='protected-file'})}
    for($i=1;$i-le 3;$i++){$invariantRows.Add([pscustomobject][ordered]@{invariant_id=('SIBLING-{0:D2}'-f$i);state_scope='all';subject_type='file-exact';repository_path=('fixture/sibling-{0:D2}.txt'-f$i);expected_fingerprint_v3='';expected_file_count='';expected_sha256=('B'*64);expected_bytes=1;mutation_policy='must-not-change';basis='sibling-controller'})}
    foreach($tree in @(@('LEGACY','pre'),@('LEGACY','post'),@('LEGACY','reverse'),@('TARGET','pre'),@('TARGET','post'),@('TARGET','reverse'),@('MOS','pre'),@('MOS','post'),@('MOS','reverse'))){$invariantRows.Add([pscustomobject][ordered]@{invariant_id=('TREE-'+$tree[0]+'-'+$tree[1].ToUpperInvariant());state_scope=$tree[1];subject_type='tree-fingerprint';repository_path=('fixture/'+$tree[0].ToLowerInvariant());expected_fingerprint_v3=('C'*64);expected_file_count=1;expected_sha256='';expected_bytes='';mutation_policy='transaction-scoped';basis='transaction-tree'})}
    foreach($item in $inventory){
        $match=@($transitions|Where-Object wrapper_path -CEQ $item.repository_path);$id=$item.skill_id.ToUpperInvariant().Replace('-','_')
        if($match.Count-eq 1-and$match[0].action-ceq'transition'){
            $invariantRows.Add([pscustomobject][ordered]@{invariant_id="WRAPPER-$id-PRE-REVERSE";state_scope='pre-reverse';subject_type='file-exact';repository_path=$item.repository_path;expected_fingerprint_v3='';expected_file_count='';expected_sha256=$match[0].wrapper_pre_sha256;expected_bytes=$item.bytes;mutation_policy='restore-functional-prestate';basis='wrapper-full-tree'})
            $invariantRows.Add([pscustomobject][ordered]@{invariant_id="WRAPPER-$id-POST";state_scope='post';subject_type='file-exact';repository_path=$item.repository_path;expected_fingerprint_v3='';expected_file_count='';expected_sha256=$match[0].wrapper_post_sha256;expected_bytes=$item.bytes;mutation_policy='transaction-scoped';basis='wrapper-full-tree'})
        }else{
            $invariantRows.Add([pscustomobject][ordered]@{invariant_id="WRAPPER-$id-ALL";state_scope='all';subject_type='file-exact';repository_path=$item.repository_path;expected_fingerprint_v3='';expected_file_count='';expected_sha256=$item.sha256;expected_bytes=$item.bytes;mutation_policy='must-not-change';basis='wrapper-full-tree'})
        }
    }
    $invariantPath=Join-Path $temp 'live-invariant.csv';Save-Csv $invariantRows $invariantPath
    $schema=Test-G3E2RA1R3InvariantSchema $context $invariantPath $inventory $transitions
    Add-Check T25-INVARIANT-V3-SCHEMA ($schema.Rows.Count-eq 52-and$schema.FingerprintV3-cmatch'^[A-F0-9]{64}$') 'v3 manifest schema accepted'
    $v2Path=Join-Path $temp 'live-invariant-v2.csv';$v2Raw=([IO.File]::ReadAllText($invariantPath)).Replace('expected_fingerprint_v3','expected_fingerprint_v2');Write-Utf8 $v2Path $v2Raw
    Add-Check T26-V2-COLUMN-REJECTED (Expect-Failure{Test-G3E2RA1R3InvariantSchema $context $v2Path $inventory $transitions}) 'v2 fingerprint column fails closed'
    Add-Check T27-FIXED-14-3-9 ($schema.Fixed.Count-eq 26-and@($schema.Fixed|Where-Object basis -CEQ 'protected-file').Count-eq 14-and@($schema.Fixed|Where-Object basis -CEQ 'sibling-controller').Count-eq 3-and@($schema.Fixed|Where-Object subject_type -CEQ 'tree-fingerprint').Count-eq 9) 'fixed invariant partition exact'
    Add-Check T28-DYNAMIC-16-10-1-5-52 ($inventory.Count-eq 16-and$actions.Count-eq 10-and$verify.Count-eq 1-and$external.Count-eq 5-and$schema.DerivedTotal-eq(26+$inventory.Count+$actions.Count)) 'current values observed and formula derived'
    $pre=@($schema.Rows|Where-Object{$_.state_scope-ceq'all'-or$_.state_scope-ceq'pre'-or$_.state_scope-ceq'pre-reverse'});$post=@($schema.Rows|Where-Object{$_.state_scope-ceq'all'-or$_.state_scope-ceq'post'});$reverse=@($schema.Rows|Where-Object{$_.state_scope-ceq'all'-or$_.state_scope-ceq'reverse'-or$_.state_scope-ceq'pre-reverse'})
    Add-Check T29-STATE-PROJECTIONS ($pre.Count-eq 36-and$post.Count-eq 36-and$reverse.Count-eq 36) 'pre post and reverse projections exact'
    Add-Check T30-VIRTUAL-TEN-PATH-DIFF ($schema.VirtualPostDiff.Count-eq 10-and(Test-G3E2RA1R3OrdinalSetEqual $schema.VirtualPostDiff @($actions.wrapper_path))) 'only ten transition paths may differ'
    Add-Check T31-PRE-REVERSE-KNOWN-STATE (@($schema.WrapperRows|Where-Object state_scope -CEQ 'pre-reverse').Count-eq 10-and@($schema.WrapperRows|Where-Object state_scope -CEQ 'post').Count-eq 10) 'known pre or post participants retained'

    $wrapperFingerprint=Get-G3E2RA1R3WrapperFingerprintV3 $inventory
    $baseline=[pscustomobject][ordered]@{git_staged_count=0;root_fast_errors=0;root_fast_warnings=0;mos_passed=16;mos_total=16;mos_cleanup=$true;mos_vault_mutation='none';hard_reference_pre_paths=41;hard_reference_pre_positive=41;live_invariant_rows=$schema.DerivedTotal;wrapper_tree_files=$inventory.Count;wrapper_manifest_paths=$transitions.Count;wrapper_transition_actions=$actions.Count;wrapper_verify_only_actions=$verify.Count;wrapper_external_paths=$external.Count;wrapper_pre_fingerprint_v3=$wrapperFingerprint;residue_count=0;authority_pre='frozen'}
    Assert-G3E2RA1R3Baseline $context $baseline
    Add-Check T32-V3-BASELINE-ACCEPTED ($baseline.wrapper_pre_fingerprint_v3-ceq$wrapperFingerprint) 'seal baseline binds wrapper v3'
    $v2Baseline=$baseline|ConvertTo-Json -Depth 5|ConvertFrom-Json;$v2Baseline.PSObject.Properties.Remove('wrapper_pre_fingerprint_v3');$v2Baseline|Add-Member -NotePropertyName wrapper_pre_fingerprint_v2 -NotePropertyValue $wrapperFingerprint
    Add-Check T33-V2-BASELINE-REJECTED (Expect-Failure{Assert-G3E2RA1R3Baseline $context $v2Baseline}) 'v2 seal baseline fails closed'

    $executionMap=Get-G3E2RA1R3ExecutionPaths
    Add-Check T34-EIGHT-FORTYFOUR-FIFTEEN-FOUR (@($context.SealContract.required_bundle_binding_ids).Count-eq 8-and$executionMap.Count-eq 44-and@($context.SealContract.required_artifact_binding_ids).Count-eq 15-and@($context.SealContract.required_runtime_ids).Count-eq 4) 'seal closure cardinality exact'
    $toolPaths=@(
        (Join-Path $overlay 'tools/g3e2r-a1r3-guard-lib.psm1'),
        (Join-Path $overlay 'tools/finalize-g3e2r-live-seal-a1r3.ps1'),
        (Join-Path $overlay 'tools/invoke-g3e2-transaction-a1r3.ps1'),
        (Join-Path $overlay 'tools/invoke-g3e2-reverse-a1r3.ps1')
    )
    $toolText=@($toolPaths|ForEach-Object{Get-Content -LiteralPath $_ -Raw})-join[char]10
    Add-Check T35-SEVEN-HASH-BOUNDARIES ($toolText.Contains('Expected-A1-Hash mismatch')-and$toolText.Contains('Expected-A1R-Hash mismatch')-and$toolText.Contains('Expected-A1R2-Hash mismatch')-and$toolText.Contains('Expected-A1R3-Hash mismatch')-and$toolText.Contains('Expected-B-Hash mismatch')-and$toolText.Contains('Expected-Seal-Inputs-Hash')-and$toolText.Contains('Expected-Seal-Hash mismatch')) 'A1 A1R A1R2 A1R3 B inputs and seal exact'
    Add-Check T36-TTL-INDEPENDENT-REVERSE ($context.SealContract.ttl_seconds-eq 900-and$context.SealContract.forward_requires_unexpired_seal-and$context.SealContract.reverse_ignores_expiry-and$toolText.Contains('$Use-ceq''Forward''')) 'forward TTL only and reverse expiry-independent'
    $gates=@($context.Gates)
    Add-Check T37-GATE-MAP-V4 ($gates.Count-eq 40-and@($gates|Where-Object direction -CEQ 'SEAL').Count-eq 9-and@($gates|Where-Object direction -CEQ 'FWD').Count-eq 19-and@($gates|Where-Object direction -CEQ 'REV').Count-eq 12-and@($gates|Where-Object step_id -CEQ 'FWD-020').Count-eq 0-and@($gates.success_contract|Where-Object{$_-match'ordinal-v3'}).Count-gt 0) 'Gate Map v4 exact and ordinal aware'
    Add-Check T38-B-COMPATIBILITY-ABSENCE ($context.BContract.bound_member_count-eq 18-and$context.BContract.prepared_file_count-eq 19-and$context.BContract.sealed_file_count-eq 20-and(-not(Test-Path -LiteralPath $bRoot))) 'B 19/18/20 contract retained and candidate absent'

    $finalizer=Join-Path $overlay 'tools/finalize-g3e2r-live-seal-a1r3.ps1';$forward=Join-Path $overlay 'tools/invoke-g3e2-transaction-a1r3.ps1';$reverseTool=Join-Path $overlay 'tools/invoke-g3e2-reverse-a1r3.ps1'
    $parseOk=@($toolPaths+(Join-Path $overlay 'tools/test-g3e2r-a1r3-bundle.ps1')|ForEach-Object{@(Parse-Tool $_).Count-eq 0}|Where-Object{-not$_}).Count-eq 0
    $common=@('-VaultRoot',$root,'-OverlayRoot',$overlay,'-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-ExpectedA1R2Hash',$expectedA1R2,'-ExpectedA1R3Hash',$expectedA1R3,'-Json')
    $fv=Invoke-JsonScript $finalizer (@('-Mode','Validate')+$common);$fwv=Invoke-JsonScript $forward (@('-Mode','Validate')+$common);$rv=Invoke-JsonScript $reverseTool (@('-Mode','Validate')+$common)
    Add-Check T39-PARSE-AND-VALIDATE ($parseOk-and$fv.verdict-ceq'PASS'-and$fv.bundles-eq 8-and$fv.executions-eq 44-and$fwv.verdict-ceq'PASS'-and$rv.verdict-ceq'PASS') 'five scripts parse and three entrypoints validate read-only'

    $preSim=Invoke-JsonScript $forward (@('-Mode','Simulate','-FailAtStep','FWD-009')+$common);$postSim=Invoke-JsonScript $forward (@('-Mode','Simulate','-FailAtStep','FWD-010')+$common);$revSim=Invoke-JsonScript $reverseTool (@('-Mode','Simulate')+$common)
    Add-Check T40-SIMULATION-BOUNDARIES ($preSim.verdict-ceq'HOLD_NO_MUTATION'-and(-not$preSim.reverse_invoked)-and$postSim.verdict-ceq'REVERSED_ROUTING_FROZEN'-and$postSim.reverse_invoked-and@($revSim.completed).Count-eq 12) 'pre holds post failure reverses and routing remains frozen'
    Add-Check T41-REVERSE-RESTART-SEMANTICS ($toolText.Contains('AllowReverse')-and$toolText.Contains('pre-reverse')-and$toolText.Contains('expiry_policy=''ignored''')-and$context.SealContract.reverse_ignores_expiry) 'reverse remains authorized idempotent and expiry independent'

    $ordinalProbe=@(Get-G3E2RA1R3OrdinalStrings @($lowerAumlaut,'z','A','_','a',$upperAumlaut));$ordinalExpected=@('A','_','a','z',$upperAumlaut,$lowerAumlaut);$ordinalExact=$ordinalProbe.Count-eq$ordinalExpected.Count
    if($ordinalExact){for($i=0;$i-lt$ordinalExpected.Count;$i++){if($ordinalProbe[$i]-cne$ordinalExpected[$i]){$ordinalExact=$false;break}}}
    Add-Check T42-ORDINAL-LOCK-ORDER ($toolText.Contains('Get-G3E2RA1R3OrdinalStrings @($map.Keys)')-and$ordinalExact) 'closure locks and direct probe use ordinal order'
    Add-Check T43-NO-SORTOBJECT-IN-IDENTITY-PATH (-not$toolText.Contains('Sort-Object')-and$toolText.Contains('[StringComparer]::Ordinal')) 'A1R3 operational identity path has no culture-sensitive Sort-Object'

    Add-Check T44-HASH-BOUNDARY-NEGATIVES ((Expect-Failure{Get-G3E2RA1R3Context $root $overlay $expectedA1 $expectedA1R ('D'*64) $expectedA1R3})-and(Expect-Failure{Get-G3E2RA1R3Context $root $overlay $expectedA1 $expectedA1R $expectedA1R2 ('D'*64)})) 'wrong A1R2 and A1R3 boundaries fail closed'
    $badInvariant=Join-Path $temp 'bad-invariant.csv';Save-Csv @($invariantRows|Select-Object -Skip 1) $badInvariant
    $badWrapper=Join-Path $wrapperFixture 'A-skill/extra.txt';Write-Utf8 $badWrapper 'x'
    $negativeOk=(Expect-Failure{Test-G3E2RA1R3InvariantSchema $context $badInvariant $inventory $transitions})-and(Expect-Failure{Get-G3E2RA1R3WrapperInventory $context $wrapperFixture})
    Add-Check T45-NEGATIVE-SCHEMA-AND-INVENTORY $negativeOk 'missing invariant and extra wrapper file fail closed'
}
finally{
    if(Test-Path -LiteralPath $temp){Remove-Item -LiteralPath $temp -Recurse -Force}
    $tempRemoved=-not(Test-Path -LiteralPath $temp)
}

Add-Check T46-TEMP-CLEANUP-AND-NO-LIVE-EFFECT ($tempRemoved-and(-not(Test-Path -LiteralPath $bRoot))-and@(Get-ChildItem -LiteralPath (Split-Path -Parent $overlay) -Recurse -File -Filter 'live-seal-v2.json').Count-eq 0) 'fixtures removed and no B snapshot seal probe or mutation'

$a1r2Test=Join-Path $context.A1R2Root 'tools/test-g3e2r-a1r2-bundle.ps1'
$a1r2Result=Invoke-JsonScript $a1r2Test @('-VaultRoot',$root,'-OverlayRoot',$context.A1R2Root,'-PythonExecutable',$PythonExecutable,'-Json') 1800
Add-Check T47-UNCHANGED-A1R2-REGRESSION ($a1r2Result.verdict-ceq'PASS'-and$a1r2Result.groups-eq 40-and@($a1r2Result.checks|Where-Object{$_-match'^T39-UPSTREAM-REGRESSIONS'}).Count-eq 1) 'A1R2 40/40 includes A1R 34/34 and A1 27/27'

$rootFast=Invoke-RootFast;$mos=Invoke-Mos
$git=[string]((Get-Command git -CommandType Application|Select-Object -First 1).Source)
Assert-G3E2RA1R3GitStagingEmpty $root $git;Assert-G3E2RA1R3NoResidue $root
$upstreamsExact=(Get-G3E2RA1R3Sha256 $context.A1R2Manifest)-ceq$expectedA1R2-and(Get-G3E2RA1R3Sha256 $context.A1R2Context.A1RManifest)-ceq$expectedA1R-and(Get-G3E2RA1R3Sha256 $context.A1R2Context.A1RContext.A1Manifest)-ceq$expectedA1
$treesExact=(Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Root)-ceq$a1r2Before-and(Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RRoot)-ceq$a1rBefore-and(Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RContext.A1Root)-ceq$a1Before-and(Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RContext.A1Context.ARoot)-ceq$aBefore-and(Get-G3E2RA1R3TreeFingerprintV3 $context.A1R2Context.A1RContext.A1Context.G3E1Root)-ceq$g3e1Before
$s5ContractsExact=(Get-G3E2RA1R3Sha256 (Join-Path $root 'tools/config/local-source-integrity-contract.json'))-ceq$expectedS5LocalSourceContract-and(Get-G3E2RA1R3Sha256 (Join-Path $root 'tools/config/newsletter-index-contract.json'))-ceq$expectedS5NewsletterContract
$rootGreen=($rootFast-join[char]10)-match'(?im)0\s+errors?'-and($rootFast-join[char]10)-match'(?im)0\s+warnings?';$mosGreen=($mos-join[char]10)-match'(?im)16/16'
Add-Check T48-FINAL-LIVE-SCOPE ($rootGreen-and$mosGreen-and$upstreamsExact-and$treesExact-and$s5ContractsExact-and(-not(Test-Path -LiteralPath $bRoot))-and@(git diff --cached --name-only).Count-eq 0-and$checks.Count-eq 47) 'Root 0/0 MOS 16/16 policy-safe S5 contracts exact B absent staging residue zero routing frozen'

$result=[ordered]@{
    contract='g3e2r-a1r3-test/v1'
    verdict='PASS'
    groups=$checks.Count
    expected_a1_hash=$expectedA1
    expected_a1r_hash=$expectedA1R
    expected_a1r2_hash=$expectedA1R2
    expected_a1r3_hash=$expectedA1R3
    s5r_local_source_contract_hash=$expectedS5LocalSourceContract
    s5r_newsletter_contract_hash=$expectedS5NewsletterContract
    wrapper_files=16
    transition_actions=10
    verify_only_actions=1
    external_wrappers=5
    derived_invariant_rows=52
    seal_closure='8/44/15/4'
    expected_hash_boundaries=7
    cross_culture=@('en-US','en-DE')
    checks=@($checks)
    temporary_fixture_removed=$tempRemoved
    live_mutation='none'
    live_capability_probe='not-run'
    b_candidate='absent'
    snapshot='absent'
    live_seal='absent'
    routing_state='frozen'
    git_staging='empty'
}
if($Json){$result|ConvertTo-Json -Depth 8 -Compress}else{Write-Output "PASS | 48/48 | ordinal v3 | en-US=en-DE | routing frozen"}
