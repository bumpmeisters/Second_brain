[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$OverlayRoot,
    [Parameter(Mandatory = $true)][string]$PythonExecutable,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if([string]::IsNullOrWhiteSpace($OverlayRoot)){$OverlayRoot=Join-Path $PSScriptRoot '..'}
$root=(Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\');$overlay=(Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
Import-Module (Join-Path $overlay 'tools/g3e2r-a1r-guard-lib.psm1') -Force
$manifest=Join-Path $overlay 'a1r-bundle-manifest.csv';$expectedA1R=Get-G3E2RA1RSha256 $manifest;$expectedA1='B1D22A6616CF91D78F1C484ED0E8CAECDC1D607D5195834F8255E9BF0558EE06'
$context=Get-G3E2RA1RContext -VaultRoot $root -OverlayRoot $overlay -ExpectedA1Hash $expectedA1 -ExpectedA1RHash $expectedA1R
$checks=[Collections.Generic.List[string]]::new();$powerShell=(Get-Process -Id $PID).Path

function Add-Check{param([string]$Id,[bool]$Passed,[string]$Evidence)if(-not$Passed){throw "$Id failed: $Evidence"};$checks.Add("$Id|$Evidence")}
function Expect-Failure{param([scriptblock]$Action)try{&$Action;$false}catch{$true}}
function Parse-Tool{param([string]$LiteralPath)$tokens=$null;$errors=$null;[void][Management.Automation.Language.Parser]::ParseFile($LiteralPath,[ref]$tokens,[ref]$errors);return @($errors)}
function Invoke-JsonScript{param([string]$Script,[string[]]$Arguments)$saved=$ErrorActionPreference;$ErrorActionPreference='Continue';try{$output=&$powerShell -NoProfile -ExecutionPolicy Bypass -File $Script @Arguments 2>&1;$code=$LASTEXITCODE}finally{$ErrorActionPreference=$saved};if($code-ne 0){throw "Child script failed: $Script`n$($output-join[Environment]::NewLine)"};$jsonLine=@($output|ForEach-Object{[string]$_}|Where-Object{$_.TrimStart().StartsWith('{')}|Select-Object -Last 1);if($jsonLine.Count-ne 1){throw "Child script returned no JSON object: $Script`n$($output-join[Environment]::NewLine)"};return ($jsonLine[0]|ConvertFrom-Json)}

$a1FingerprintBefore=Get-G3E2RA1RFingerprintV2 $context.A1Root;$aFingerprintBefore=Get-G3E2RA1RFingerprintV2 $context.A1Context.ARoot;$g3e1FingerprintBefore=Get-G3E2RA1RFingerprintV2 $context.A1Context.G3E1Root
$git=[string]((Get-Command git -CommandType Application -ErrorAction Stop|Select-Object -First 1).Source);Assert-G3E2RA1RGitStagingEmpty $root $git

$rows=@(Import-Csv -LiteralPath $manifest)
Add-Check 'T01-EXACT-A1R-INVENTORY' ($rows.Count-eq 14-and@(Get-ChildItem -LiteralPath $overlay -Recurse -File).Count-eq 15) '14 bound members plus manifest'
$lock=@(Import-Csv -LiteralPath (Join-Path $overlay 'dependency-lock.csv'))
Add-Check 'T02-ONE-ROOT-LOCK' ($lock.Count-eq 1-and$lock[0].dependency_id-ceq'G3E2R-A1-BUNDLE') 'one immutable A1 dependency'
Add-Check 'T03-A1-EXACT-CLOSURE' ((Get-G3E2RA1RSha256 $context.A1Manifest)-ceq$expectedA1-and@(Import-Csv -LiteralPath $context.A1Manifest).Count-eq 14) 'accepted A1 manifest and fourteen members'
Add-Check 'T04-UPSTREAM-TRANSITIVE-CLOSURE' ((Get-G3E2RA1RSha256 $context.A1Context.Dependencies['G3E2R-A-BUNDLE'])-ceq'5114660FB6968CF5979F17AC7ECC95833A69C26E5C94C633B1E955C48393C055'-and(Get-G3E2RA1RSha256 $context.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK'])-ceq'2F1744BAA5E2A787DFC573530F9DC43DDB9F78C3A83C46D883326CB6512A78BB'-and(Get-G3E2RA1RSha256 $context.A1Context.Dependencies['G3E1-BUNDLE'])-ceq'D581C9535B6359F7058DA33C3CB9E229EC8EF1C8C2C6C4D49311C75189D20E50') 'A, dependency lock and G3E-1 exact'

$sealContract=$context.SealContract
$temp=Join-Path ([IO.Path]::GetTempPath()) ('g3e2r-a1r-'+[guid]::NewGuid().ToString('N'))
try{
    $null=[IO.Directory]::CreateDirectory($temp)
    $approval=[pscustomobject][ordered]@{approval_id='fixture';approved_by='fixture';approved_at_utc=[DateTimeOffset]::UtcNow.ToString('o');live_capability_probe_approved=$true;live_mutation_approved=$true;automatic_reverse_approved=$true;independent_reverse_approved=$true}
    $baseline=[pscustomobject][ordered]@{git_staged_count=0;root_fast_errors=0;root_fast_warnings=0;mos_passed=16;mos_total=16;mos_cleanup=$true;mos_vault_mutation='none';hard_reference_pre_paths=41;hard_reference_pre_positive=41;live_invariant_pre=28;residue_count=0;authority_pre='frozen'}
    $sealInput=[pscustomobject][ordered]@{seal_inputs_contract='g3e2r-seal-inputs/v2-a1r';state='prepared';transaction_id='fixture-a1r';vault_root=$temp;routing_state='frozen';legacy_token='projects/No and low code_1st Marketing Agent';approval=$approval;prepared_at_utc=[DateTimeOffset]::UtcNow.ToString('o');baseline=$baseline}
    $fake=[pscustomobject]@{Root=$temp;SealContract=$sealContract;BContract=$context.BContract;HardReferenceContract=$context.HardReferenceContract}
    Assert-G3E2RA1RSealInput -Context $fake -SealInput $sealInput
    $badInput=($sealInput|ConvertTo-Json -Depth 8|ConvertFrom-Json);$badInput.baseline.mos_cleanup='true';$strictTypeReject=Expect-Failure{Assert-G3E2RA1RSealInput -Context $fake -SealInput $badInput}
    Add-Check 'T05-DETACHED-INPUT-SCHEMA' (@($sealInput.PSObject.Properties.Name).Count-eq 9-and@($sealContract.required_seal_input_top_level).Count-eq 9-and$strictTypeReject) 'exact nine-field detached input and strict Boolean baseline'
    Add-Check 'T06-FINAL-SEAL-SCHEMA' ($sealContract.seal_contract-ceq'g3e2r-live-seal/v2'-and@($sealContract.required_top_level).Count-eq 13) 'v2 final seal with thirteen fields'
    $toolText=@((Get-Content -LiteralPath (Join-Path $overlay 'tools/g3e2r-a1r-guard-lib.psm1') -Raw),(Get-Content -LiteralPath (Join-Path $overlay 'tools/finalize-g3e2r-live-seal-v2r.ps1') -Raw),(Get-Content -LiteralPath (Join-Path $overlay 'tools/invoke-g3e2-transaction-v2r.ps1') -Raw),(Get-Content -LiteralPath (Join-Path $overlay 'tools/invoke-g3e2-reverse-v2r.ps1') -Raw))-join"`n"
    Add-Check 'T07-EXPECTED-HASH-BOUNDARY' ($toolText.Contains('Expected-A1-Hash mismatch')-and$toolText.Contains('Expected-A1R-Hash mismatch')-and$toolText.Contains('Expected-B-Hash mismatch')-and$toolText.Contains('Expected-Seal-Inputs-Hash')-and$toolText.Contains('Expected-Seal-Hash mismatch')) 'all five expected hashes enforced'
    Add-Check 'T08-SIX-BUNDLE-BINDINGS' (@($sealContract.required_bundle_binding_ids).Count-eq 6-and@($sealContract.required_bundle_binding_ids|Sort-Object -Unique).Count-eq 6-and$toolText.Contains('Seal bundle path mismatch')) 'six exact bundle ids and canonical paths'
    Add-Check 'T09-TWENTY-EIGHT-EXECUTION-BINDINGS' (@($sealContract.required_execution_binding_ids).Count-eq 28-and$sealContract.compatibility_execution_binding_count-eq 20-and(Get-G3E2RA1RExecutionPaths).Count-eq 28) 'twenty compatibility plus eight A1R bindings'
    Add-Check 'T10-FIFTEEN-ARTIFACT-BINDINGS' (@($sealContract.required_artifact_binding_ids).Count-eq 15-and(Get-G3E2RA1RArtifactPaths -Context $context).Count-eq 15-and$toolText.Contains('Seal artifact path mismatch')) 'fifteen exact artifacts at canonical paths'
    $runtime=Get-G3E2RA1RRuntimeBindings -Context $context -PythonExecutable $PythonExecutable
    Add-Check 'T11-FOUR-RUNTIME-BINDINGS' (@($runtime).Count-eq 4-and@($runtime|Where-Object{$_.executable_sha256-match'^[A-F0-9]{64}$'-and-not[string]::IsNullOrWhiteSpace($_.version)}).Count-eq 4) 'four absolute runtime identities'
    Add-Check 'T12-TTL-AND-REVERSE' ($sealContract.ttl_seconds-eq 900-and$sealContract.forward_requires_unexpired_seal-and$sealContract.reverse_ignores_expiry) '900 seconds and reverse expiry-independent'

    $bRoot=Join-Path $temp ([string]$context.BContract.canonical_root).Replace('/','\');$null=[IO.Directory]::CreateDirectory($bRoot)
    foreach($member in @($context.BContract.members)){$path=Join-Path $bRoot ([string]$member.bundle_path).Replace('/','\');$null=[IO.Directory]::CreateDirectory((Split-Path -Parent $path));if($member.role-ceq'B-SEAL-INPUTS'){[IO.File]::WriteAllText($path,(($sealInput|ConvertTo-Json -Depth 8)+[Environment]::NewLine),[Text.UTF8Encoding]::new($false))}else{[IO.File]::WriteAllText($path,"fixture $($member.role)`n",[Text.UTF8Encoding]::new($false))}}
    $bRows=foreach($member in @($context.BContract.members)){$path=Join-Path $bRoot ([string]$member.bundle_path).Replace('/','\');[pscustomobject][ordered]@{role=[string]$member.role;bundle_path=[string]$member.bundle_path;sha256=Get-G3E2RA1RSha256 $path;bytes=Get-G3E2RA1RBytes $path}}
    $bManifest=Join-Path $bRoot 'bundle-manifest.csv';$bRows|Export-Csv -LiteralPath $bManifest -NoTypeInformation -Encoding UTF8
    $bState=Test-G3E2RA1RBManifest -Context $fake -ExpectedBHash (Get-G3E2RA1RSha256 $bManifest)
    Add-Check 'T13-CANONICAL-B-ROOT' ($bState.Root-ceq$bRoot-and$bState.Manifest-ceq$bManifest) 'canonical B root only'
    Add-Check 'T14-EXACT-B-ROLE-PATH-INVENTORY' ($bState.Rows.Count-eq 18-and@($bState.Rows.role|Sort-Object -Unique).Count-eq 18-and@($bState.Rows.bundle_path|Sort-Object -Unique).Count-eq 18) 'eighteen unique role/path pairs'
    Add-Check 'T15-B-NINETEEN-TO-TWENTY' (@(Get-ChildItem -LiteralPath $bRoot -Recurse -File).Count-eq 19-and$context.BContract.sealed_file_count-eq 20-and$context.BContract.live_seal_filename-ceq'live-seal-v2.json') 'prepared 19 and exact sealed 20 contract'
    $negative=$true
    $extra=Join-Path $bRoot 'extra.txt';[IO.File]::WriteAllText($extra,'x');$negative=$negative-and(Expect-Failure{Test-G3E2RA1RBManifest -Context $fake});[IO.File]::Delete($extra)
    $early=Join-Path $bRoot 'live-seal-v2.json';[IO.File]::WriteAllText($early,'{}');$negative=$negative-and(Expect-Failure{Test-G3E2RA1RBManifest -Context $fake});[IO.File]::Delete($early)
    $missing=Join-Path $bRoot ([string]$bRows[0].bundle_path).Replace('/','\');$missingBytes=[IO.File]::ReadAllBytes($missing);[IO.File]::Delete($missing);$negative=$negative-and(Expect-Failure{Test-G3E2RA1RBManifest -Context $fake});[IO.File]::WriteAllBytes($missing,$missingBytes)
    $originalPath=$bRows[0].bundle_path;$bRows[0].bundle_path='../escape.md';$bRows|Export-Csv $bManifest -NoTypeInformation -Encoding UTF8;$negative=$negative-and(Expect-Failure{Test-G3E2RA1RBManifest -Context $fake});$bRows[0].bundle_path=$originalPath
    $bRows[0].bundle_path=(Join-Path $temp 'absolute.md');$bRows|Export-Csv $bManifest -NoTypeInformation -Encoding UTF8;$negative=$negative-and(Expect-Failure{Test-G3E2RA1RBManifest -Context $fake});$bRows[0].bundle_path=$originalPath
    $originalRole=$bRows[0].role;$bRows[0].role='unknown-role';$bRows|Export-Csv $bManifest -NoTypeInformation -Encoding UTF8;$negative=$negative-and(Expect-Failure{Test-G3E2RA1RBManifest -Context $fake});$bRows[0].role=$originalRole;$bRows|Export-Csv $bManifest -NoTypeInformation -Encoding UTF8
    Add-Check 'T16-B-NEGATIVE-PATH-CASES' ($negative-and$context.BContract.reject_absolute_paths-and$context.BContract.reject_reparse_points-and$toolText.Contains('ReparsePoint')) 'extra missing traversal unknown early-seal and declared absolute/reparse rejection'
    $inputNames=@($sealInput.PSObject.Properties.Name);$forbidden=@($sealContract.forbidden_seal_input_fields)
    Add-Check 'T17-NO-SEAL-HASH-CYCLE' (@($inputNames|Where-Object{$_-in$forbidden}).Count-eq 0-and-not$inputNames.Contains('bundle_bindings')-and-not$inputNames.Contains('expected_b_hash')) 'input has no self or B-manifest binding'

    $refs=Join-Path $temp 'refs';$null=[IO.Directory]::CreateDirectory($refs);$legacy=[string]$sealInput.legacy_token
    for($i=1;$i-le 48;$i++){$content=if($i-le 41){"$legacy`n"}else{"clean`n"};[IO.File]::WriteAllText((Join-Path $refs ('ref-{0:D3}.md'-f$i)),$content,[Text.UTF8Encoding]::new($false))}
    $hardRows=[Collections.Generic.List[object]]::new()
    foreach($state in @('pre','post','reverse')){$count=if($state-ceq'post'){48}else{41};$positive=if($state-ceq'post'){31}else{41};for($i=1;$i-le$count;$i++){$p='refs/ref-{0:D3}.md'-f$i;$full=Join-Path $temp $p.Replace('/','\');$hardRows.Add([pscustomobject][ordered]@{repository_path=$p;state=$state;policy='exact';expected_sha256=Get-G3E2RA1RSha256 $full;expected_bytes=Get-G3E2RA1RBytes $full;expected_legacy_tokens=if($i-le$positive){1}else{0}})}}
    $hardPath=Join-Path $temp 'hard-reference.csv';$hardRows|Export-Csv $hardPath -NoTypeInformation -Encoding UTF8;$schema=@(Test-G3E2RA1RHardReferenceManifestSchema -Context $fake -LiteralPath $hardPath)
    Add-Check 'T18-HARD-REFERENCE-SCHEMA' ($schema.Count-eq 130-and@($schema|ForEach-Object{$_.repository_path+[char]0+$_.state}|Sort-Object -Unique).Count-eq 130-and@($context.HardReferenceContract.columns).Count-eq 6) '130 unique composite rows and six columns'
    Add-Check 'T19-HARD-REFERENCE-PRE' (@($schema|Where-Object state -CEQ 'pre').Count-eq 41-and@($schema|Where-Object{$_.state-ceq'pre'-and[int]$_.expected_legacy_tokens-gt 0}).Count-eq 41) 'pre 41/41'
    Add-Check 'T20-HARD-REFERENCE-POST' (@($schema|Where-Object state -CEQ 'post').Count-eq 48-and@($schema|Where-Object{$_.state-ceq'post'-and[int]$_.expected_legacy_tokens-gt 0}).Count-eq 31-and@($schema|Where-Object{$_.state-ceq'post'-and[int]$_.expected_legacy_tokens-eq 0}).Count-eq 17) 'post 48/31 with seventeen zero rows'
    Add-Check 'T21-HARD-REFERENCE-REVERSE' (@($schema|Where-Object state -CEQ 'reverse').Count-eq 41-and@($schema|Where-Object{$_.state-ceq'reverse'-and[int]$_.expected_legacy_tokens-gt 0}).Count-eq 41) 'reverse 41/41'
    $hardSeal=[pscustomobject]@{legacy_token=$legacy;artifact_bindings=@([pscustomobject]@{artifact_id='B-HARD-REFERENCE-MANIFEST';repository_path='hard-reference.csv';sha256=Get-G3E2RA1RSha256 $hardPath;bytes=Get-G3E2RA1RBytes $hardPath})}
    $rg=[string]((Get-Command rg -CommandType Application -ErrorAction Stop|Select-Object -First 1).Source);Test-G3E2RA1RHardReferences -Context $fake -Seal $hardSeal -State pre -RipgrepExecutable $rg
    $unexpected=Join-Path $refs 'unexpected.md';[IO.File]::WriteAllText($unexpected,"$legacy`n");$exactReject=Expect-Failure{Test-G3E2RA1RHardReferences -Context $fake -Seal $hardSeal -State pre -RipgrepExecutable $rg};[IO.File]::Delete($unexpected)
    Add-Check 'T22-GLOBAL-LITERAL-SET' $exactReject 'unmanifested positive literal is rejected'
    $advisoryPath=Join-Path $temp 'workspace-advisory.csv';[pscustomobject][ordered]@{repository_path='.obsidian/workspace.json';policy='advisory';observed_sha256=('A'*64);observed_bytes=1;observed_legacy_tokens=0;observed_at_utc=[DateTimeOffset]::UtcNow.ToString('o')}|Export-Csv $advisoryPath -NoTypeInformation -Encoding UTF8
    $advisorySeal=[pscustomobject]@{artifact_bindings=@([pscustomobject]@{artifact_id='B-ADVISORY-REFERENCE-REPORT';repository_path='workspace-advisory.csv';sha256=Get-G3E2RA1RSha256 $advisoryPath;bytes=Get-G3E2RA1RBytes $advisoryPath})};Test-G3E2RA1RWorkspaceAdvisory $fake $advisorySeal
    Add-Check 'T23-WORKSPACE-ADVISORY' (@($context.HardReferenceContract.advisory_columns).Count-eq 6-and$context.HardReferenceContract.advisory_row_count-eq 1-and-not$context.HardReferenceContract.workspace_in_hard_manifest) 'one separate advisory row'

    $gates=@($context.Gates)
    Add-Check 'T24-GATE-MAP-SHAPE' ($gates.Count-eq 40-and@($gates.step_id|Sort-Object -Unique).Count-eq 40-and@($gates|Where-Object direction -CEQ 'SEAL').Count-eq 9-and@($gates|Where-Object direction -CEQ 'FWD').Count-eq 19-and@($gates|Where-Object direction -CEQ 'REV').Count-eq 12-and@($gates|Where-Object step_id -CEQ 'FWD-020').Count-eq 0) '40 unique gates split 9/19/12'
    $seal8=@($gates|Where-Object step_id -CEQ 'SEAL-008')[0];$seal9=@($gates|Where-Object step_id -CEQ 'SEAL-009')[0];$fwd9=@($gates|Where-Object step_id -CEQ 'FWD-009')[0]
    Add-Check 'T25-CORRECTED-GATE-SEMANTICS' ($seal8.gate_function-ceq'Lock-And-Rehash-CompleteClosure'-and$seal9.success_contract.Contains('live-seal-v2.json')-and-not$seal9.success_contract.Contains(' live-seal.json')-and$fwd9.success_contract.Contains('snapshot')-and$fwd9.success_contract.Contains('MOS')-and$fwd9.success_contract.Contains('Root Fast')) 'CTR-02 CTR-04 CTR-05 gates corrected'
    $lockFile=Join-Path $temp 'lock-test.txt';[IO.File]::WriteAllText($lockFile,'locked');$readLock=Enter-G3E2RA1RSingleFileReadLock $lockFile;$writeDenied=Expect-Failure{$s=[IO.File]::Open($lockFile,[IO.FileMode]::Open,[IO.FileAccess]::Write,[IO.FileShare]::ReadWrite);$s.Dispose()};Exit-G3E2RA1RClosureLock $readLock
    Add-Check 'T26-CLOSURE-READ-LOCK' $writeDenied 'held read stream denies concurrent write'
    $finalizerText=Get-Content -LiteralPath (Join-Path $overlay 'tools/finalize-g3e2r-live-seal-v2r.ps1') -Raw
    Add-Check 'T27-FINALIZER-BOUNDARY' ($finalizerText.Contains('Enter-G3E2RA1RClosureLock')-and$finalizerText.Contains('Test-G3E2RA1RClosureLock')-and$finalizerText.Contains('Write-ExclusiveUtf8')-and$finalizerText.Contains('[IO.File]::Delete($resolvedOutput)')) 'locked rehash exclusive write and safe cleanup wired'
    $forwardText=Get-Content -LiteralPath (Join-Path $overlay 'tools/invoke-g3e2-transaction-v2r.ps1') -Raw;$iLock=$forwardText.IndexOf('Enter-G3E2RA1RClosureLock');$iRepeat=$forwardText.IndexOf('Invoke-PreMutationChecks',$iLock);$iRehash=$forwardText.IndexOf('Test-G3E2RA1RClosureLock',$iRepeat);$iMutation=$forwardText.IndexOf('$mutationStarted=$true',$iRehash);$iMove=$forwardText.IndexOf('Move-Components',$iMutation)
    Add-Check 'T28-FWD009-COMPLETE-ORDER' ($iLock-ge 0-and$iRepeat-gt$iLock-and$iRehash-gt$iRepeat-and$iMutation-gt$iRehash-and$iMove-gt$iMutation-and$forwardText.Contains("'CheckFunctionalPrestate'")) 'full repeated boundary ends directly before FWD-010'

    $forward=Join-Path $overlay 'tools/invoke-g3e2-transaction-v2r.ps1';$reverse=Join-Path $overlay 'tools/invoke-g3e2-reverse-v2r.ps1';$finalizer=Join-Path $overlay 'tools/finalize-g3e2r-live-seal-v2r.ps1';$guard=Join-Path $overlay 'tools/g3e2r-a1r-guard-lib.psm1'
    $pre=Invoke-JsonScript $forward @('-Mode','Simulate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-FailAtStep','FWD-009','-Json')
    Add-Check 'T29-PREMUTATION-HOLD' ($pre.verdict-ceq'HOLD_NO_MUTATION'-and-not$pre.reverse_invoked) 'FWD-009 failure does not invoke reverse'
    $post=Invoke-JsonScript $forward @('-Mode','Simulate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-FailAtStep','FWD-010','-Json')
    Add-Check 'T30-POSTMUTATION-AUTO-REVERSE' ($post.verdict-ceq'REVERSED_ROUTING_FROZEN'-and$post.reverse_invoked-and@($post.reverse_steps).Count-eq 12) 'FWD-010 failure invokes twelve reverse steps'
    $reverseText=Get-Content -LiteralPath $reverse -Raw;$reverseSim=Invoke-JsonScript $reverse @('-Mode','Simulate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-Json')
    Add-Check 'T31-REVERSE-RECOVERY' ($reverseSim.verdict-ceq'REVERSED_ROUTING_FROZEN'-and$reverseText.Contains('-Use Reverse')-and$reverseText.Contains('alreadyWritten')-and$reverseText.Contains('unknown target bytes')) 'expiry-independent idempotent restart and unknown-byte stop'
    $parseOk=@(Parse-Tool $guard).Count-eq 0-and@(Parse-Tool $finalizer).Count-eq 0-and@(Parse-Tool $forward).Count-eq 0-and@(Parse-Tool $reverse).Count-eq 0-and@(Parse-Tool $PSCommandPath).Count-eq 0
    $fv=Invoke-JsonScript $forward @('-Mode','Validate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-Json');$rv=Invoke-JsonScript $reverse @('-Mode','Validate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-Json');$sv=Invoke-JsonScript $finalizer @('-Mode','Validate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-Json')
    Add-Check 'T32-TOOL-PARSE-AND-STATIC' ($parseOk-and$fv.verdict-ceq'PASS'-and$rv.verdict-ceq'PASS'-and$sv.verdict-ceq'PASS') 'five tools parse and Validate remains non-mutating'

    $a1Test=Join-Path $context.A1Root 'tools/test-g3e2r-a1-bundle.ps1';$a1=Invoke-JsonScript $a1Test @('-VaultRoot',$root,'-OverlayRoot',$context.A1Root,'-PythonExecutable',$PythonExecutable,'-Json')
    Add-Check 'T33-UPSTREAM-A1-REGRESSION' ($a1.verdict-ceq'PASS'-and$a1.groups-eq 27-and$a1.temporary_only) 'unchanged A1 27/27 passed and cleaned fixture'
}
finally{if(Test-Path -LiteralPath $temp){Remove-Item -LiteralPath $temp -Recurse -Force}}

$rootFast=&$powerShell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'tools/test-wiki-integrity.ps1') -Profile Fast 2>&1;if($LASTEXITCODE-ne 0){throw "Root Fast failed: $($rootFast-join[Environment]::NewLine)"}
$mos=&$powerShell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') 2>&1;if($LASTEXITCODE-ne 0){throw "MOS failed: $($mos-join[Environment]::NewLine)"}
Assert-G3E2RA1RGitStagingEmpty $root $git;Assert-G3E2RA1RNoResidue $root
$unchanged=(Get-G3E2RA1RFingerprintV2 $context.A1Root)-ceq$a1FingerprintBefore-and(Get-G3E2RA1RFingerprintV2 $context.A1Context.ARoot)-ceq$aFingerprintBefore-and(Get-G3E2RA1RFingerprintV2 $context.A1Context.G3E1Root)-ceq$g3e1FingerprintBefore
$bRootLive=Resolve-G3E2RA1RInRoot $root ([string]$context.BContract.canonical_root)
$rootGreen=($rootFast-join"`n")-match'(?im)0\s+errors?'-and($rootFast-join"`n")-match'(?im)0\s+warnings?';$mosGreen=($mos-join"`n")-match'(?im)16/16'
Add-Check 'T34-LIVE-REGRESSION-AND-SCOPE' ($rootGreen-and$mosGreen-and$unchanged-and-not(Test-Path -LiteralPath $bRootLive)-and@($checks).Count-eq 33) 'Root 0/0 MOS 16/16 upstreams exact staging/residue zero B absent routing frozen'

$result=[ordered]@{contract='g3e2r-a1r-test/v1';verdict='PASS';groups=$checks.Count;expected_a1_hash=$expectedA1;expected_a1r_hash=$expectedA1R;checks=@($checks);temporary_fixture_removed=(-not(Test-Path -LiteralPath $temp));live_mutation='none';live_capability_probe='not-run';b_candidate='absent';routing_state='frozen';git_staging='empty'}
if($Json){$result|ConvertTo-Json -Depth 8 -Compress}else{Write-Output "PASS | $($checks.Count)/34 A1R groups | static and temporary-only | routing frozen"}
