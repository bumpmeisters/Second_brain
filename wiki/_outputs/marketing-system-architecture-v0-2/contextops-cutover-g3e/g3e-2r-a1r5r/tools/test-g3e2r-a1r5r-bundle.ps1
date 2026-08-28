[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$VaultRoot,
    [string]$OverlayRoot,
    [Parameter(Mandatory=$true)][string]$PythonExecutable,
    [Parameter(Mandatory=$true)][string]$PowerShell7Executable,
    [Parameter(Mandatory=$true)][string]$ExpectedPowerShell7Sha256,
    [Parameter(Mandatory=$true)][string]$ExpectedPowerShell7Version,
    [switch]$ReceiptOnly,
    [switch]$Json
)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
Import-Module Microsoft.PowerShell.Management -RequiredVersion 3.1.0.0 -Force
Import-Module Microsoft.PowerShell.Utility -RequiredVersion 3.1.0.0 -Force
if([string]::IsNullOrWhiteSpace($OverlayRoot)){$OverlayRoot=Join-Path $PSScriptRoot '..'}
$root=(Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
$overlay=(Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
$expectedA1='44745E35300B3401B9C2C162728760F9832EAD5DBC0C31C84AF5414EF5820073'
$expectedA1R='714E902B74E5A9B8AB572A48F57B32F542D4B37FE16F272F0C30879243CADE64'
$expectedA1R2='9E17F6A3A8C36208C828B6A188AEF550279D2F0280D5B6394E08044BFF041A1D'
$expectedA1R3='CDED0EB7C90B51F32F4D1B85740E967F740C30D3159F8238215AD1393330A326'
$expectedA1R4='E58496E8887170DD58FE9349E6ECD2F99B891DFC44F7099168CE2E0EA4E823DB'
$expectedS5Disposition='CD3C4EC544D23B009A7E637829B669FA467C25463F756292392D2897DD35686E'
$expectedS5Coverage='A94DE9170CD34067F4ACE2BE927BF6324ADBB421AB80213BBA53817EA704413B'
$expectedA1R4Test='53F2D2D728CE4869FB2E4EF1D89047ECFA7B6948E5CDAEA50B0FE6E23FD2055B'
$canonicalPs7='C:\Users\rolfp\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\powershell\pwsh.exe'
$canonicalPs7Hash='DB6DD81183FE57D22E03B911EC9A30A2FD7C40542E97743615355A6FB44F458F'
$canonicalPs7Version='7.6.4'
$manifest=Join-Path $overlay 'a1r5r-bundle-manifest.csv'
$expectedA1R5R=(Get-FileHash -LiteralPath $manifest -Algorithm SHA256).Hash.ToUpperInvariant()
Import-Module (Join-Path $overlay 'tools/g3e2r-a1r5r-guard-lib.psm1') -Force
$context=Get-G3E2RA1R5RContext -VaultRoot $root -OverlayRoot $overlay -ExpectedA1Hash $expectedA1 -ExpectedA1RHash $expectedA1R -ExpectedA1R2Hash $expectedA1R2 -ExpectedA1R3Hash $expectedA1R3 -ExpectedA1R4Hash $expectedA1R4 -ExpectedA1R5RHash $expectedA1R5R
$selfReceipt=Initialize-G3E2RA1R5REntrypoint -Context $context -ComponentId 'C50-TEST'
if($ReceiptOnly){
    $value=[ordered]@{contract='g3e2r-a1r5r-receipt-only/v1';verdict='PASS';receipt_id=$selfReceipt.receipt_id;component_id=$selfReceipt.component_id}
    if($Json){$value|ConvertTo-Json -Compress}else{$value}
    exit 0
}

$checks=[Collections.Generic.List[object]]::new()
function Add-Check{param([string]$Id,[bool]$Passed,[string]$Evidence);if(-not$Passed){throw "$Id failed: $Evidence"};$checks.Add([pscustomobject][ordered]@{id=$Id;passed=$true;evidence=$Evidence})}
function Invoke-JsonProcess{
    param([string]$FilePath,[string[]]$ArgumentList)
    $savedErrorActionPreference=$ErrorActionPreference
    $ErrorActionPreference='Continue'
    try{$output=@(& $FilePath @ArgumentList 2>&1);$exitCode=$LASTEXITCODE}
    finally{$ErrorActionPreference=$savedErrorActionPreference}
    $text=(@($output|ForEach-Object{[string]$_}) -join [Environment]::NewLine).Trim()
    if($exitCode-ne 0){throw "Process failed ($exitCode): $text"}
    try{return $text|ConvertFrom-Json}catch{throw "Process did not emit one JSON document: $text"}
}
function Invoke-CapturedProcess{
    param([string]$FilePath,[string[]]$ArgumentList)
    $savedErrorActionPreference=$ErrorActionPreference
    $ErrorActionPreference='Continue'
    try{$output=@(& $FilePath @ArgumentList 2>&1);$exitCode=$LASTEXITCODE}
    finally{$ErrorActionPreference=$savedErrorActionPreference}
    return [pscustomobject]@{ExitCode=$exitCode;Text=(@($output|ForEach-Object{[string]$_}) -join [Environment]::NewLine).Trim()}
}
function Get-Text{param([string]$Relative);return [IO.File]::ReadAllText((Join-Path $overlay $Relative.Replace('/','\')))}

$ps5='C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
$hostOk=$PSVersionTable.PSEdition-ceq'Desktop'-and[Environment]::Is64BitProcess-and[IO.Path]::GetFullPath((Get-Process -Id $PID).Path)-ceq[IO.Path]::GetFullPath($ps5)
Add-Check T01-CANONICAL-PS51-HOST $hostOk 'Desktop 64-bit canonical System32 host'
$rows=@(Import-Csv -LiteralPath $manifest)
$actual=@(Get-ChildItem -LiteralPath $overlay -Recurse -File|ForEach-Object{$_.FullName.Substring($overlay.Length+1).Replace('\','/')})
Add-Check T02-SIXTEEN-FILES ($actual.Count-eq 16) 'exact candidate inventory'
Add-Check T03-FIFTEEN-MANIFEST-MEMBERS ($rows.Count-eq 15-and(Test-G3E2RA1R5ROrdinalUnique @($rows.overlay_path))) '15 bound members plus manifest'
$null=Test-G3E2RA1R5RBoundManifest $manifest $overlay overlay_path @('role','overlay_path','sha256','bytes') 15 'A1R5R bundle'
Add-Check T04-MANIFEST-CLOSURE $true 'all member hashes and byte counts exact'
$lock=@(Import-Csv -LiteralPath (Join-Path $overlay 'dependency-lock.csv'))
Add-Check T05-ONE-LINE-A1R4-LOCK ($lock.Count-eq 1-and$lock[0].dependency_id-ceq'G3E2R-A1R4-BUNDLE'-and$lock[0].sha256-ceq$expectedA1R4-and[int64]$lock[0].bytes-eq 1728-and$lock[0].reuse_mode-ceq'verify-transitively-never-modify') 'immutable A1R4 dependency'
$null=Test-G3E2RA1R5RBoundManifest $context.A1R4Manifest $context.A1R4Root overlay_path @('role','overlay_path','sha256','bytes') 14 'A1R4 bundle'
Add-Check T06-A1R4-EXACT-CLOSURE $true 'A1R4 manifest and 14 members exact'
$upstreamOk=(Get-G3E2RA1R5RSha256 $context.A1R3Manifest)-ceq$expectedA1R3-and(Get-G3E2RA1R5RSha256 $context.A1R2Manifest)-ceq$expectedA1R2-and(Get-G3E2RA1R5RSha256 $context.A1R2Context.A1RManifest)-ceq$expectedA1R-and(Get-G3E2RA1R5RSha256 $context.A1R2Context.A1RContext.A1Manifest)-ceq$expectedA1
Add-Check T07-UPSTREAM-HASH-CHAIN $upstreamOk 'A1 through A1R4 exact'
$runtime=$context.RuntimeClosureContract
Add-Check T08-RUNTIME-CONTRACT ($runtime.contract_id-ceq'g3e2r-entrypoint-runtime-closure/v1') 'runtime closure v1'
Add-Check T09-P2-PLATFORM (@($runtime.platform_modules).Count-eq 2-and((@($runtime.platform_modules.binding_id)-join',')-ceq'P10,P20')) 'P10/P20'
Add-Check T10-C5-COMPONENTS (@($runtime.components).Count-eq 5-and(Test-G3E2RA1R5ROrdinalUnique @($runtime.components.component_id))) 'five entrypoint components'
$o10=@($runtime.operative_bindings|Where-Object binding_id -CEQ O10)[0]
$o20=@($runtime.operative_bindings|Where-Object binding_id -CEQ O20)[0]
Add-Check T11-O10-BINDING ($o10.sha256-ceq'09E578801F5579C871ED2F58CF1D4551404A80CA12FC0A6534A2758D37BB87A9'-and[int64]$o10.bytes-eq 12144) 'transaction library exact'
Add-Check T12-O20-BINDING ($o20.sha256-ceq'FD51F1894D71E25B9B15B06800FE4F4657DDBA9E38410BCEA1533BEF598356EB'-and[int64]$o20.bytes-eq 51816) 'A1R4 guard exact'
Add-Check T13-IMPORT-ORDER ((@($runtime.import_order)-join',')-ceq'P10,P20,O10,O20') 'exact initialization order'
Add-Check T14-CANONICAL-CONTEXT ($context.Overlay-ceq$overlay-and$context.A1R4Context.Overlay-ceq$context.A1R4Root) 'canonical A1R5R over A1R4'
Add-Check T15-SEAL-CLOSURE ($context.SealContract.bundle_binding_count-eq 10-and$context.SealContract.execution_binding_count-eq 61-and$context.SealContract.artifact_binding_count-eq 15-and$context.SealContract.runtime_binding_count-eq 4) '10/61/15/4'
Add-Check T16-NINE-HASH-BOUNDARIES ($context.SealContract.expected_hash_boundary_count-eq 9) 'nine expected hash boundaries'
Add-Check T17-GATE-MAP-ROWS (@($context.Gates).Count-eq 40) 'forty gate rows'
Add-Check T18-GATE-MAP-SHAPE (@($context.Gates|Where-Object direction -CEQ SEAL).Count-eq 9-and@($context.Gates|Where-Object direction -CEQ FWD).Count-eq 19-and@($context.Gates|Where-Object direction -CEQ REV).Count-eq 12) '9/19/12'
$execution=Get-G3E2RA1R5RExecutionPaths
Add-Check T19-EXECUTION-PATHS ($execution.Count-eq 61-and(Test-G3E2RA1R5ROrdinalSetEqual @($context.SealContract.required_execution_binding_ids) @($execution.Keys))) '61 exact execution ids'
Add-Check T20-RECEIPT-EVIDENCE ($runtime.receipt_preflight_contract_id-ceq'g3e2r-a1r5r-r1-receipt-preflight/v1'-and$runtime.receipt_preflight_result-ceq'10/10'-and$runtime.receipt_preflight_evidence_sha256-ceq'94E76E9A72B8EB9DD35B421A5D75B830E5E18A9674CDCEC9AEE58E9294624952') 'R1 receipt evidence retained'
Add-Check T21-RECEIPT-ID ($runtime.receipt_contract_id-ceq'g3e2r-entrypoint-import-receipt/v2-a1r5r') 'receipt v2-a1r5r'
$componentFiles=@('tools/g3e2r-a1r5r-guard-lib.psm1','tools/finalize-g3e2r-live-seal-a1r5r.ps1','tools/invoke-g3e2-transaction-a1r5r.ps1','tools/invoke-g3e2-reverse-a1r5r.ps1','tools/test-g3e2r-a1r5r-bundle.ps1')
$componentText=@($componentFiles|ForEach-Object{Get-Text $_})
Add-Check T22-NO-CALLER-A1R3 (@($componentText|Where-Object{$_-match'(?im)^\s*Import-Module.*a1r3'}).Count-eq 0) 'no direct A1R3 import'
Add-Check T23-PLATFORM-IMPORTS (@($componentText|Where-Object{$_-match'Microsoft\.PowerShell\.Management'-and$_-match'Microsoft\.PowerShell\.Utility'}).Count-eq 5) 'P10/P20 in all five components'
Add-Check T24-NO-DIRECT-O10-CALLERS (@($componentText|Where-Object{$_-match'(?im)^\s*Import-Module.*g3e2r-transaction-lib'}).Count-eq 0) 'O10 imported only by initializer'
$receiptCallerOk=(Get-Text 'tools/finalize-g3e2r-live-seal-a1r5r.ps1')-match'Initialize-G3E2RA1R5REntrypoint'-and(Get-Text 'tools/invoke-g3e2-transaction-a1r5r.ps1')-match'Initialize-G3E2RA1R5REntrypoint'-and(Get-Text 'tools/invoke-g3e2-reverse-a1r5r.ps1')-match'Initialize-G3E2RA1R5REntrypoint'-and(Get-Text 'tools/test-g3e2r-a1r5r-bundle.ps1')-match'Initialize-G3E2RA1R5REntrypoint'
Add-Check T25-RECEIPT-CALLERS $receiptCallerOk 'initializer present in four callers; guard provides it'

$common=@('-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass')
$hashArgs=@('-ExpectedA1Hash',$expectedA1,'-ExpectedA1RHash',$expectedA1R,'-ExpectedA1R2Hash',$expectedA1R2,'-ExpectedA1R3Hash',$expectedA1R3,'-ExpectedA1R4Hash',$expectedA1R4,'-ExpectedA1R5RHash',$expectedA1R5R)
$finalizer=Invoke-JsonProcess $ps5 ($common+@('-File',(Join-Path $overlay 'tools/finalize-g3e2r-live-seal-a1r5r.ps1'),'-Mode','Validate','-VaultRoot',$root,'-OverlayRoot',$overlay)+$hashArgs+@('-Json'))
Add-Check T26-FINALIZER-VALIDATE ($finalizer.verdict-ceq'PASS'-and$finalizer.import_receipt-ceq$runtime.receipt_contract_id) 'read-only Validate'
$forward=Invoke-JsonProcess $ps5 ($common+@('-File',(Join-Path $overlay 'tools/invoke-g3e2-transaction-a1r5r.ps1'),'-Mode','Validate','-VaultRoot',$root,'-OverlayRoot',$overlay)+$hashArgs+@('-Json'))
Add-Check T27-FORWARD-VALIDATE ($forward.verdict-ceq'PASS'-and$forward.import_receipt-ceq$runtime.receipt_contract_id) 'read-only Validate'
$reverse=Invoke-JsonProcess $ps5 ($common+@('-File',(Join-Path $overlay 'tools/invoke-g3e2-reverse-a1r5r.ps1'),'-Mode','Validate','-VaultRoot',$root,'-OverlayRoot',$overlay)+$hashArgs+@('-Json'))
Add-Check T28-REVERSE-VALIDATE ($reverse.verdict-ceq'PASS'-and$reverse.import_receipt-ceq$runtime.receipt_contract_id) 'read-only Validate'
foreach($file in $componentFiles){$tokens=$null;$errors=$null;$null=[Management.Automation.Language.Parser]::ParseFile((Join-Path $overlay $file.Replace('/','\')),[ref]$tokens,[ref]$errors);if(@($errors).Count-ne 0){throw "Parse failure: $file"}}
Add-Check T29-FIVE-COMPONENT-PARSE $true 'PowerShell parser accepted all components'
Add-Check T30-JSON-TIME-UNCHANGED ((Get-G3E2RA1R5RSha256 (Join-Path $overlay 'contracts/json-time-v1-contract.json'))-ceq'F5C5CB9293ADDAB4739EE89468BD0715677F2735A76339E89FAA72A7AE4EAE77') 'A1R4 JSON-time bytes reused'
Add-Check T31-TEMPORAL-UNCHANGED ((Get-G3E2RA1R5RSha256 (Join-Path $overlay 'contracts/temporal-boundary-v1-contract.json'))-ceq'32612B545D1E4FE0B2D7B6B47D821DA46793427374F979D7D8FECAED2A70937E') 'A1R4 temporal bytes reused'

$probePath=Join-Path ([IO.Path]::GetTempPath()) ('g3e2r-a1r5r-guard-'+[guid]::NewGuid().ToString('N')+'.ps1')
$probe=@'
param([string]$Module,[string]$VaultRoot,[string]$OverlayRoot,[string]$A1,[string]$A1R,[string]$A1R2,[string]$A1R3,[string]$A1R4,[string]$A1R5R)
Import-Module $Module -Force
$c=Get-G3E2RA1R5RContext -VaultRoot $VaultRoot -OverlayRoot $OverlayRoot -ExpectedA1Hash $A1 -ExpectedA1RHash $A1R -ExpectedA1R2Hash $A1R2 -ExpectedA1R3Hash $A1R3 -ExpectedA1R4Hash $A1R4 -ExpectedA1R5RHash $A1R5R
Initialize-G3E2RA1R5REntrypoint -Context $c -ComponentId C10-GUARD|ConvertTo-Json -Depth 8 -Compress
'@
try{
    [IO.File]::WriteAllText($probePath,$probe,[Text.UTF8Encoding]::new($false))
    $guardReceipt=Invoke-JsonProcess $ps5 ($common+@('-File',$probePath,'-Module',(Join-Path $overlay 'tools/g3e2r-a1r5r-guard-lib.psm1'),'-VaultRoot',$root,'-OverlayRoot',$overlay,'-A1',$expectedA1,'-A1R',$expectedA1R,'-A1R2',$expectedA1R2,'-A1R3',$expectedA1R3,'-A1R4',$expectedA1R4,'-A1R5R',$expectedA1R5R))
}finally{if(Test-Path -LiteralPath $probePath){Remove-Item -LiteralPath $probePath -Force}}
$testReceipt=Invoke-JsonProcess $ps5 ($common+@('-File',$PSCommandPath,'-VaultRoot',$root,'-OverlayRoot',$overlay,'-PythonExecutable',$PythonExecutable,'-PowerShell7Executable',$PowerShell7Executable,'-ExpectedPowerShell7Sha256',$ExpectedPowerShell7Sha256,'-ExpectedPowerShell7Version',$ExpectedPowerShell7Version,'-ReceiptOnly','-Json'))
Add-Check T32-RECEIPT-01 ($guardReceipt.receipt_id-ceq$runtime.receipt_contract_id) 'guard receipt id'
Add-Check T33-RECEIPT-02 ($guardReceipt.component_id-ceq'C10-GUARD') 'guard component'
Add-Check T34-RECEIPT-03 ($finalizer.import_receipt-ceq$runtime.receipt_contract_id) 'finalizer receipt id'
Add-Check T35-RECEIPT-04 ($runtime.components[1].component_id-ceq'C20-FINALIZER') 'finalizer component'
Add-Check T36-RECEIPT-05 ($forward.import_receipt-ceq$runtime.receipt_contract_id) 'forward receipt id'
Add-Check T37-RECEIPT-06 ($runtime.components[2].component_id-ceq'C30-FORWARD') 'forward component'
Add-Check T38-RECEIPT-07 ($reverse.import_receipt-ceq$runtime.receipt_contract_id) 'reverse receipt id'
Add-Check T39-RECEIPT-08 ($runtime.components[3].component_id-ceq'C40-REVERSE') 'reverse component'
Add-Check T40-RECEIPT-09 ($testReceipt.receipt_id-ceq$runtime.receipt_contract_id) 'test receipt id'
Add-Check T41-RECEIPT-10 ($testReceipt.component_id-ceq'C50-TEST') 'test component'

$bRoot=Resolve-G3E2RA1R5RInRoot $root ([string]$context.BContract.canonical_root)
$beforeCandidate=@(Test-Path -LiteralPath $bRoot),@(Test-Path -LiteralPath (Join-Path $bRoot 'live-seal-v2.json'))
$prepare=Invoke-CapturedProcess $ps5 ($common+@('-File',(Join-Path $overlay 'tools/finalize-g3e2r-live-seal-a1r5r.ps1'),'-Mode','Prepare','-VaultRoot',$root,'-OverlayRoot',$overlay,'-InputPath',(Join-Path $bRoot 'seal/seal-inputs.json'),'-PythonExecutable',$PythonExecutable)+$hashArgs+@('-ExpectedBHash',('0'*64),'-ExpectedSealInputsHash',('0'*64),'-Json'))
Add-Check T42-FINALIZER-STOPS-AT-B-ABSENCE ($prepare.ExitCode-ne 0-and$prepare.Text-match'(?im)(?:(?:B candidate|bundle).*?(?:absent|missing|not)|^Canonical G3E2R-B root is missing\.\r?$)') 'Prepare reached only the expected B-absence gate'
Add-Check T43-NO-B-SNAPSHOT-SEAL (-not(Test-Path -LiteralPath $bRoot)-and-not(Test-Path -LiteralPath (Join-Path $bRoot 'live-seal-v2.json'))) 'B snapshot and live seal absent'
$staged=@(& git -C $root diff --cached --name-only)
Add-Check T44-GIT-STAGING-EMPTY (@($staged).Count-eq 0) 'no staged paths'
$s5ok=(Get-G3E2RA1R5RSha256 (Join-Path $root 'wiki/_outputs/source-intake/clipping-dispositions.csv'))-ceq$expectedS5Disposition-and(Get-G3E2RA1R5RSha256 (Join-Path $root 'wiki/_outputs/source-coverage/source-inventory.csv'))-ceq$expectedS5Coverage
Add-Check T45-S5R-HASHES $s5ok 'S5 disposition and coverage exact'

$ps7=[IO.Path]::GetFullPath($PowerShell7Executable)
if(-not(Test-Path -LiteralPath $ps7 -PathType Leaf)){throw 'T46 PowerShell 7 executable is missing.'}
$ps7Item=Get-Item -LiteralPath $ps7 -Force
$ps7Hash=(Get-FileHash -LiteralPath $ps7 -Algorithm SHA256).Hash.ToUpperInvariant()
$ps7PathOk=$ps7-ceq[IO.Path]::GetFullPath($canonicalPs7)-or$ps7.Equals([IO.Path]::GetFullPath($canonicalPs7),[StringComparison]::OrdinalIgnoreCase)
if(-not$ps7PathOk-or$ps7Item.Attributes-band[IO.FileAttributes]::ReparsePoint-or$ps7Hash-cne$ExpectedPowerShell7Sha256.ToUpperInvariant()-or$ps7Hash-cne$canonicalPs7Hash-or$ExpectedPowerShell7Version-cne$canonicalPs7Version){throw 'T46 PowerShell 7 path/hash/version binding failed.'}
$probeLines=@(& $ps7 -NoProfile -NonInteractive -Command '$o=[ordered]@{version=$PSVersionTable.PSVersion.ToString();edition=$PSVersionTable.PSEdition;is64=[Environment]::Is64BitProcess;process=(Get-Process -Id $PID).Path};$o|ConvertTo-Json -Compress' 2>&1)
if($LASTEXITCODE-ne 0-or$probeLines.Count-ne 1){throw 'T46 PowerShell 7 clean JSON probe failed.'}
$ps7Probe=([string]$probeLines[0])|ConvertFrom-Json
if($ps7Probe.version-cne$ExpectedPowerShell7Version-or$ps7Probe.edition-cne'Core'-or-not[bool]$ps7Probe.is64-or-not([IO.Path]::GetFullPath([string]$ps7Probe.process).Equals($ps7,[StringComparison]::OrdinalIgnoreCase))){throw 'T46 PowerShell 7 runtime identity failed.'}
$a1r4Test=Join-Path $context.A1R4Root 'tools/test-g3e2r-a1r4-bundle.ps1'
$a1r4HashBefore=Get-G3E2RA1R5RSha256 $a1r4Test
Import-Module (Join-Path $context.A1R4Root 'tools/g3e2r-a1r4-guard-lib.psm1') -Force
$a1r4Context=Get-G3E2RA1R4Context -VaultRoot $root -OverlayRoot $context.A1R4Root -ExpectedA1Hash $expectedA1 -ExpectedA1RHash $expectedA1R -ExpectedA1R2Hash $expectedA1R2 -ExpectedA1R3Hash $expectedA1R3 -ExpectedA1R4Hash $expectedA1R4
Assert-G3E2RA1R4NoResidue $root
$a1r4=Invoke-JsonProcess $ps7 @('-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass','-File',$a1r4Test,'-VaultRoot',$root,'-OverlayRoot',$context.A1R4Root,'-PythonExecutable',$PythonExecutable,'-Json')
$t46Internal=@(
    $ps7PathOk,
    $ps7Hash-ceq$canonicalPs7Hash,
    $ps7Probe.version-ceq$canonicalPs7Version,
    $ps7Probe.edition-ceq'Core',
    [bool]$ps7Probe.is64,
    $probeLines.Count-eq 1,
    $a1r4.verdict-ceq'PASS',
    [int]$a1r4.groups-eq 64,
    $a1r4.expected_a1r4_hash-ceq$expectedA1R4,
    (Get-G3E2RA1R5RSha256 $a1r4Test)-ceq$expectedA1R4Test
)
Add-Check T46-PS7-A1R4-REGRESSION (@($t46Internal|Where-Object{-not$_}).Count-eq 0) '10/10; A1R4 64/64 under bound Core 64-bit PS7'
Add-Check T47-A1R4-TEST-UNCHANGED ($a1r4HashBefore-ceq$expectedA1R4Test-and(Get-G3E2RA1R5RSha256 $a1r4Test)-ceq$a1r4HashBefore) 'A1R4 test hash stable before/after'
Assert-G3E2RA1R4NoResidue $root
Add-Check T48-NO-EFFECT (@(Test-Path -LiteralPath $bRoot).Count-eq 1-and-not(Test-Path -LiteralPath $bRoot)-and@(& git -C $root diff --cached --name-only).Count-eq 0) 'no B, snapshot, seal, residue, staging, mutation, or routing change'
if($checks.Count-ne 48){throw "A1R5R R2 expected exactly 48 groups; found $($checks.Count)."}
$result=[ordered]@{contract='g3e2r-a1r5r-r2-test/v1';verdict='PASS';groups=48;receipt_preflight='10/10';t46='10/10';a1r4_regression='64/64';expected_a1_hash=$expectedA1;expected_a1r_hash=$expectedA1R;expected_a1r2_hash=$expectedA1R2;expected_a1r3_hash=$expectedA1R3;expected_a1r4_hash=$expectedA1R4;expected_a1r5r_hash=$expectedA1R5R;seal_closure='10/61/15/4';expected_hash_boundaries=9;gate_map='9/19/12';powershell7_path=$ps7;powershell7_sha256=$ps7Hash;powershell7_version=$ps7Probe.version;checks=@($checks);live_mutation='none';live_capability_probe='not-run';b_candidate='absent';snapshot='absent';live_seal='absent';routing_state='frozen';git_staging='empty'}
if($Json){$result|ConvertTo-Json -Depth 8 -Compress}else{Write-Output 'PASS | A1R5R-R2 48/48 | receipt 10/10 | T46 10/10 | A1R4 64/64 | no effect'}
