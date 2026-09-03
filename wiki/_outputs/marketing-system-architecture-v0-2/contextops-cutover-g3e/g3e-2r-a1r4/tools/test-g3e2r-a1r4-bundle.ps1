[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$VaultRoot,[string]$OverlayRoot,
    [Parameter(Mandatory=$true)][string]$PythonExecutable,[switch]$Json
)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
if([string]::IsNullOrWhiteSpace($OverlayRoot)){$OverlayRoot=Join-Path $PSScriptRoot '..'}
$root=(Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\');$overlay=(Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
$manifest=Join-Path $overlay 'a1r4-bundle-manifest.csv'
$expectedA1R4=(Get-FileHash -LiteralPath $manifest -Algorithm SHA256).Hash.ToUpperInvariant()
$expectedA1R3='7623ABE786EF793C9A2FEF8386C514C81A33F9ED437DC8D3133D6B0E738146EF'
$expectedA1R2='C907A384EC11C7265C05454ACD6984A1A7A61D3451A1EB60640CCAAF331A035C'
$expectedA1R='57DBC2BC3F91D6C201E9F7506576A9F2F07E55D17808B058E9F1933380249B2D'
$expectedA1='8878AA92D1F82DB4F9B3D8E4C1F5E707F36E77E3013195ABF7AD7784AE185AC7'
$expectedS5LocalSourceContract='12CB11614006F3643B5E159635D9451031C24C1E9DADEDFEFFAD9B1BA7A101FD'
$expectedS5NewsletterContract='F5FFDE88F2D827C9DF85BFD3F926B14B491EC4E577B88625E989AB4F47292592'
$ps7=(Get-Process -Id $PID).Path
$ps5='C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
if($PSVersionTable.PSEdition-cne'Core'){throw 'A1R4 test harness must run in the bound PS7 host.'}
Import-Module (Join-Path $overlay 'tools/g3e2r-a1r4-guard-lib.psm1') -Force
$context=Get-G3E2RA1R4Context $root $overlay $expectedA1 $expectedA1R $expectedA1R2 $expectedA1R3 $expectedA1R4
$checks=[Collections.Generic.List[string]]::new()

function Add-Check{param([string]$Id,[bool]$Passed,[string]$Evidence);if(-not$Passed){throw "$Id failed: $Evidence"};$checks.Add("$Id|$Evidence")}
function Expect-Failure{param([scriptblock]$Action);try{&$Action;$false}catch{$true}}
function Write-Utf8{param([string]$Path,[string]$Text);$null=[IO.Directory]::CreateDirectory((Split-Path -Parent $Path));[IO.File]::WriteAllText($Path,$Text,[Text.UTF8Encoding]::new($false))}
function Write-Json{param([string]$Path,[object]$Value);Write-Utf8 $Path (($Value|ConvertTo-Json -Depth 20)+[Environment]::NewLine)}
function Parse-Tool{param([string]$Path);$tokens=$null;$errors=$null;[void][Management.Automation.Language.Parser]::ParseFile($Path,[ref]$tokens,[ref]$errors);return @($errors)}
function Invoke-DirectJsonFile{
    param([string]$Executable,[string]$Script,[string[]]$Arguments)
    $saved=$ErrorActionPreference;$ErrorActionPreference='Continue'
    try{$out=&$Executable -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $Script @Arguments 2>&1;$code=$LASTEXITCODE}
    finally{$ErrorActionPreference=$saved}
    if($code-ne 0){throw "Child failed: $Script$([Environment]::NewLine)$($out-join[Environment]::NewLine)"}
    $line=@($out|ForEach-Object{[string]$_}|Where-Object{$_.TrimStart().StartsWith('{')}|Select-Object -Last 1)
    if($line.Count-ne 1){throw "Child returned no JSON: $Script"}
    return ($line[0]|ConvertFrom-Json)
}
function New-Baseline{
    $inventory=@(Get-G3E2RA1R4WrapperInventory $context);$transitions=@(Get-G3E2RA1R4TransitionRows $context);$actions=@($transitions|Where-Object action -CEQ 'transition')
    return [pscustomobject][ordered]@{
        git_staged_count=0;root_fast_errors=0;root_fast_warnings=0;mos_passed=16;mos_total=16;mos_cleanup=$true;mos_vault_mutation='none'
        hard_reference_pre_paths=41;hard_reference_pre_positive=41
        live_invariant_rows=([int]$context.InvariantContract.fixed_invariant_row_count+$inventory.Count+$actions.Count)
        wrapper_tree_files=$inventory.Count;wrapper_manifest_paths=$transitions.Count;wrapper_transition_actions=$actions.Count
        wrapper_verify_only_actions=@($transitions|Where-Object action -CEQ 'verify-only').Count
        wrapper_external_paths=($inventory.Count-$transitions.Count);wrapper_pre_fingerprint_v3=Get-G3E2RA1R4WrapperFingerprintV3 $inventory
        residue_count=0;authority_pre='frozen'
    }
}
function New-Approval{param([string]$ApprovedAt,[bool]$Approved=$true);return [pscustomobject][ordered]@{approval_id='fixture-a1r4';approved_by='fixture';approved_at_utc=$ApprovedAt;live_capability_probe_approved=$Approved;live_mutation_approved=$Approved;automatic_reverse_approved=$Approved;independent_reverse_approved=$Approved}}
function New-SealInput{
    param([string]$Prepared,[string]$Approved,[string]$Path,[switch]$WrongContract,[switch]$Extra)
    $value=[ordered]@{seal_inputs_contract=$(if($WrongContract){'g3e2r-seal-inputs/v2-a1r3'}else{'g3e2r-seal-inputs/v2-a1r4'});state='prepared';transaction_id='fixture-a1r4';vault_root=$root;routing_state='frozen';legacy_token='projects/No and low code_1st Marketing Agent';approval=New-Approval $Approved;prepared_at_utc=$Prepared;baseline=New-Baseline}
    if($Extra){$value.extra='forbidden'}
    Write-Json $Path ([pscustomobject]$value)
    return $Path
}
function New-LiveDocument{
    param([string]$Prepared,[string]$Approved,[string]$Sealed,[string]$NotAfter,[int]$Ttl=900,[string]$Path)
    $value=[pscustomobject][ordered]@{approval=New-Approval $Approved;time=[pscustomobject][ordered]@{prepared_at_utc=$Prepared;sealed_at_utc=$Sealed;not_after_utc=$NotAfter;ttl_seconds=$Ttl}}
    Write-Json $Path $value
    return Read-G3E2RA1R4JsonDocument $Path
}
function Invoke-RootFast{
    $out=&$ps5 -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'tools/test-wiki-integrity.ps1') -Profile Fast 2>&1
    if($LASTEXITCODE-ne 0-or($out-join[Environment]::NewLine)-notmatch'0 error\(s\), 0 warning\(s\)'){throw "Root Fast failed: $($out-join' ')"}
}
function Invoke-Mos{
    $out=&$ps5 -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') 2>&1
    if($LASTEXITCODE-ne 0-or($out-join[Environment]::NewLine)-notmatch'16/16'){throw "MOS failed: $($out-join' ')"}
}

$temp=Join-Path ([IO.Path]::GetTempPath()) ('g3e2r-a1r4-'+[guid]::NewGuid().ToString('N'))
$null=[IO.Directory]::CreateDirectory($temp)
$tempResolved=[IO.Path]::GetFullPath($temp);$tempBase=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
if(-not$tempResolved.StartsWith($tempBase,[StringComparison]::OrdinalIgnoreCase)){throw 'A1R4 fixture escaped the system temp root.'}

try{
    $rows=@(Import-Csv -LiteralPath $manifest);$actual=@(Get-ChildItem -LiteralPath $overlay -Recurse -File|ForEach-Object{$_.FullName.Substring($overlay.Length+1).Replace('\','/')})
    Add-Check T01-EXACT-A1R4-INVENTORY ($rows.Count-eq 14-and$actual.Count-eq 15-and(Test-G3E2RA1R4OrdinalSetEqual (@($rows.overlay_path)+'a1r4-bundle-manifest.csv') $actual)) '14 bound members plus manifest'
    $lock=@(Import-Csv -LiteralPath (Join-Path $overlay 'dependency-lock.csv'))
    Add-Check T02-ONE-LINE-A1R3-LOCK ($lock.Count-eq 1-and$lock[0].dependency_id-ceq'G3E2R-A1R3-BUNDLE'-and$lock[0].sha256-ceq$expectedA1R3-and[int64]$lock[0].bytes-eq 1738) 'one immutable A1R3 dependency'
    $a1r3Rows=Test-G3E2RA1R4BoundManifest $context.A1R3Manifest $context.A1R3Root 'overlay_path' @('role','overlay_path','sha256','bytes') 14 'A1R3 bundle'
    Add-Check T03-A1R3-EXACT-CLOSURE ($a1r3Rows.Count-eq 14) 'accepted A1R3 manifest and members'
    $upstreamOk=(Get-G3E2RA1R4Sha256 $context.A1R2Context.A1RContext.A1Manifest)-ceq$expectedA1-and(Get-G3E2RA1R4Sha256 $context.A1R2Context.A1RManifest)-ceq$expectedA1R-and(Get-G3E2RA1R4Sha256 $context.A1R2Manifest)-ceq$expectedA1R2
    Add-Check T04-TRANSITIVE-UPSTREAM-CLOSURE $upstreamOk 'A1 A1R A1R2 and transitive A G3E1 exact'
    Add-Check T05-CONTRACT-SCHEMAS ($context.JsonTimeContract.contract_id-ceq'g3e2r-json-time/v1'-and$context.TemporalContract.contract_id-ceq'g3e2r-temporal-boundary/v1'-and$context.SealContract.contract_id-ceq'g3e2r-live-seal-contract/v2-a1r4') 'three A1R4 contracts exact'
    Add-Check T06-VERSION-SEPARATION ($context.SealContract.seal_inputs_contract-ceq'g3e2r-seal-inputs/v2-a1r4'-and$context.SealContract.seal_inputs_contract-cne$context.A1R3Context.SealContract.seal_inputs_contract) 'A1R4 time profile is explicit'
    $bRoot=Resolve-G3E2RA1R4InRoot $root ([string]$context.BContract.canonical_root)
    Add-Check T07-CREATE-ONLY-SCOPE (-not(Test-Path -LiteralPath $bRoot)-and@(Get-ChildItem -LiteralPath (Split-Path -Parent $overlay) -Recurse -File -Filter 'live-seal-v2.json').Count-eq 0) 'B snapshot seal probe and FWD-020 absent'
    $execution=Get-G3E2RA1R4ExecutionPaths
    Add-Check T08-EXECUTION-PATH-CLOSURE ($execution.Count-eq 52-and(Test-G3E2RA1R4OrdinalUnique @($execution.Keys))-and@($execution.Keys|Where-Object{$_-clike'A1R4-*'}).Count-eq 8) '44 inherited plus eight A1R4 executions'

    $prepared='2026-08-26T19:00:00.1234567+00:00';$approved='2026-08-26T18:59:59.7654321+00:00';$sealed='2026-08-26T19:00:01.1234567+00:00';$notAfter='2026-08-26T19:15:01.1234567+00:00'
    $inputPath=Join-Path $temp 'seal-inputs.json';$null=New-SealInput $prepared $approved $inputPath
    $inputDoc=Read-G3E2RA1R4SealInputDocument $context $inputPath ([DateTimeOffset]::ParseExact($prepared,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))
    Add-Check T09-PREPARED-CANONICAL-PARSE ($inputDoc.Prepared.Lexeme-ceq$prepared) 'prepared raw lexeme parsed'
    Add-Check T10-APPROVAL-CANONICAL-PARSE ($inputDoc.Approved.Lexeme-ceq$approved) 'approval raw lexeme parsed'
    $live=New-LiveDocument $prepared $approved $sealed $notAfter 900 (Join-Path $temp 'live.json')
    $temporal=Test-G3E2RA1R4LiveSealTemporalDocument $context $live Forward ([DateTimeOffset]::ParseExact($sealed,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))
    Add-Check T11-SEALED-CANONICAL-PARSE ($temporal.Sealed.Lexeme-ceq$sealed) 'sealed raw lexeme parsed'
    Add-Check T12-NOTAFTER-CANONICAL-PARSE ($temporal.NotAfter.Lexeme-ceq$notAfter) 'not-after raw lexeme parsed'
    Add-Check T13-INVARIANT-PARSEEXACT ($context.JsonTimeContract.parse_method-ceq'System.DateTimeOffset.ParseExact'-and$context.JsonTimeContract.parse_culture-clike'*InvariantCulture'-and$context.JsonTimeContract.parse_styles-clike'*None') 'ParseExact invariant none'
    $formatted=ConvertTo-G3E2RA1R4CanonicalTimestamp ([DateTimeOffset]::Parse('2026-08-26T21:00:00.1234567+02:00',[Globalization.CultureInfo]::InvariantCulture))
    Add-Check T14-INVARIANT-FORMAT ($formatted-ceq$prepared) 'formatter normalizes absolute instant'
    Add-Check T15-SEVEN-FRACTIONAL-DIGITS ($formatted-match'\.\d{7}\+00:00$') 'seven fractional digits exact'
    Add-Check T16-UTC-PLUS-ZERO ($formatted.EndsWith('+00:00',[StringComparison]::Ordinal)) 'sole canonical offset'
    Add-Check T17-RAW-LEXEMES-RETAINED ($inputDoc.Prepared.Lexeme-ceq$prepared-and$inputDoc.Approved.Lexeme-ceq$approved) 'structural inference cannot alter input times'
    $minimal=[pscustomobject][ordered]@{approval=New-Approval $approved;time=[pscustomobject][ordered]@{prepared_at_utc=$prepared;sealed_at_utc='';not_after_utc='';ttl_seconds=900}}
    $completed=Complete-G3E2RA1R4SealTimes $minimal ([DateTimeOffset]::ParseExact($sealed,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))
    $completedPath=Join-Path $temp 'completed.json';Write-Json $completedPath $completed;$completedDoc=Read-G3E2RA1R4JsonDocument $completedPath;$completedTemporal=Test-G3E2RA1R4LiveSealTemporalDocument $context $completedDoc Forward ([DateTimeOffset]::ParseExact($sealed,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))
    Add-Check T18-MODEL-JSON-READ-ROUNDTRIP ($completedTemporal.Sealed.Lexeme-ceq$sealed-and$completedTemporal.NotAfter.Lexeme-ceq$notAfter) 'seal emission roundtrip exact'
    Add-Check T19-PS7-INFERRED-TYPE-IRRELEVANT ($inputDoc.Value.prepared_at_utc-is[DateTime]-and$inputDoc.Prepared.Lexeme-ceq$prepared) 'PS7 DateTime inference bypassed'

    $child=Join-Path $temp 'culture-child.ps1'
    Write-Utf8 $child @'
param([string]$Module,[string]$Culture,[string]$Mode,[string]$InputPath,[string]$VaultRoot,[string]$OverlayRoot,[string]$A1,[string]$A1R,[string]$A1R2,[string]$A1R3,[string]$A1R4)
$ci=[Globalization.CultureInfo]::GetCultureInfo($Culture);[Threading.Thread]::CurrentThread.CurrentCulture=$ci;[Threading.Thread]::CurrentThread.CurrentUICulture=$ci
Import-Module $Module -Force
$context=Get-G3E2RA1R4Context $VaultRoot $OverlayRoot $A1 $A1R $A1R2 $A1R3 $A1R4
$format="yyyy-MM-dd'T'HH:mm:ss.fffffffzzz";$prepared='2026-08-26T19:00:00.1234567+00:00';$approved='2026-08-26T18:59:59.7654321+00:00';$sealed='2026-08-26T19:00:01.1234567+00:00';$notAfter='2026-08-26T19:15:01.1234567+00:00'
if($Mode-ceq'Prepare'){
  $doc=Read-G3E2RA1R4SealInputDocument $context $InputPath ([DateTimeOffset]::ParseExact($prepared,$format,[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))
  $result=[ordered]@{mode=$Mode;culture=$Culture;prepared=$doc.Prepared.Lexeme;approved=$doc.Approved.Lexeme;inferred_type=$doc.Value.prepared_at_utc.GetType().FullName}
}else{
  $sealObject=[pscustomobject][ordered]@{approval=[pscustomobject][ordered]@{approval_id='fixture';approved_by='fixture';approved_at_utc=$approved;live_capability_probe_approved=$true;live_mutation_approved=$true;automatic_reverse_approved=$true;independent_reverse_approved=$true};time=[pscustomobject][ordered]@{prepared_at_utc=$prepared;sealed_at_utc='';not_after_utc='';ttl_seconds=900}}
  $sealObject=Complete-G3E2RA1R4SealTimes $sealObject ([DateTimeOffset]::ParseExact($sealed,$format,[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))
  $raw=($sealObject|ConvertTo-Json -Depth 8)+[Environment]::NewLine;$document=[pscustomobject]@{RawJson=$raw;Value=($raw|ConvertFrom-Json)}
  if($Mode-ceq'SealForward'){$time=Test-G3E2RA1R4LiveSealTemporalDocument $context $document Forward ([DateTimeOffset]::ParseExact($sealed,$format,[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))}
  elseif($Mode-ceq'ForwardBoundary'){$time=Test-G3E2RA1R4LiveSealTemporalDocument $context $document Forward ([DateTimeOffset]::ParseExact($notAfter,$format,[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))}
  elseif($Mode-ceq'ReverseExpired'){$time=Test-G3E2RA1R4LiveSealTemporalDocument $context $document Reverse ([DateTimeOffset]::ParseExact($notAfter,$format,[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None).AddSeconds(1))}
  else{throw 'Unknown mode'}
  $bytes=[Text.UTF8Encoding]::new($false).GetBytes($raw);$sha=[Security.Cryptography.SHA256]::Create();try{$hash=([BitConverter]::ToString($sha.ComputeHash($bytes))).Replace('-','')}finally{$sha.Dispose()}
  $result=[ordered]@{mode=$Mode;culture=$Culture;sealed=$time.Sealed.Lexeme;not_after=$time.NotAfter.Lexeme;sha256=$hash;raw=$raw}
}
$result|ConvertTo-Json -Depth 8 -Compress
'@
    $childBase=@('-Module',(Join-Path $overlay 'tools/g3e2r-a1r4-guard-lib.psm1'),'-InputPath',$inputPath,'-VaultRoot',$root,'-OverlayRoot',$overlay,'-A1',$expectedA1,'-A1R',$expectedA1R,'-A1R2',$expectedA1R2,'-A1R3',$expectedA1R3,'-A1R4',$expectedA1R4)
    function Invoke-CultureChild{param([string]$Executable,[string]$Culture,[string]$Mode);return Invoke-DirectJsonFile $Executable $child (@('-Culture',$Culture,'-Mode',$Mode)+$childBase)}
    $ps5Prepare=Invoke-CultureChild $ps5 'en-DE' 'Prepare'
    Add-Check T20-PS5-INFERRED-TYPE-IRRELEVANT ($ps5Prepare.inferred_type-ceq'System.String'-and$ps5Prepare.prepared-ceq$prepared) 'PS5 String inference bypassed'

    $exactFuture='2026-08-26T19:01:00.0000000+00:00';$futureInput=Join-Path $temp 'future-boundary.json';$null=New-SealInput $exactFuture $approved $futureInput
    $verificationBase=[DateTimeOffset]::ParseExact('2026-08-26T19:00:00.0000000+00:00',"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None)
    $accepted=Read-G3E2RA1R4SealInputDocument $context $futureInput $verificationBase
    $tooFuture=Join-Path $temp 'too-future.json';$null=New-SealInput '2026-08-26T19:01:00.0000001+00:00' $approved $tooFuture
    Add-Check T21-SINGLE-REFERENCE-FUTURE-BOUNDARY ($accepted.Prepared.Lexeme-ceq$exactFuture-and(Expect-Failure{Read-G3E2RA1R4SealInputDocument $context $tooFuture $verificationBase})) 'one captured now and inclusive sixty seconds'
    $orderOne=[pscustomobject][ordered]@{approval=New-Approval '2026-08-26T19:00:00.5000000+00:00';time=[pscustomobject][ordered]@{prepared_at_utc='2026-08-26T19:00:00.0000000+00:00';sealed_at_utc='';not_after_utc='';ttl_seconds=900}}
    $orderTwo=[pscustomobject][ordered]@{approval=New-Approval '2026-08-26T19:00:00.0000000+00:00';time=[pscustomobject][ordered]@{prepared_at_utc='2026-08-26T19:00:00.5000000+00:00';sealed_at_utc='';not_after_utc='';ttl_seconds=900}}
    $sealMoment=[DateTimeOffset]::ParseExact('2026-08-26T19:00:01.0000000+00:00',"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None)
    Add-Check T22-PREPARED-APPROVAL-INDEPENDENT ($null-ne(Complete-G3E2RA1R4SealTimes $orderOne $sealMoment)-and$null-ne(Complete-G3E2RA1R4SealTimes $orderTwo $sealMoment)) 'both legitimate orderings accepted'
    $late=[pscustomobject][ordered]@{approval=New-Approval '2026-08-26T19:00:01.0000001+00:00';time=[pscustomobject][ordered]@{prepared_at_utc='2026-08-26T19:00:00.0000000+00:00';sealed_at_utc='';not_after_utc='';ttl_seconds=900}}
    Add-Check T23-BOTH-NOT-AFTER-SEALED (Expect-Failure{Complete-G3E2RA1R4SealTimes $late $sealMoment}) 'approval or prepared after sealed rejected'
    Add-Check T24-TTL-EXACT-900 ($context.SealContract.ttl_seconds-eq 900-and$context.TemporalContract.ttl_seconds-eq 900) 'fixed TTL'
    Add-Check T25-FUTURE-SKEW-EXACT-60 ($context.SealContract.maximum_future_clock_skew_seconds-eq 60-and$context.TemporalContract.maximum_future_clock_skew_seconds-eq 60) 'fixed inclusive future skew'
    $atExpiry=Test-G3E2RA1R4LiveSealTemporalDocument $context $live Forward ([DateTimeOffset]::ParseExact($notAfter,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None))
    Add-Check T26-FORWARD-AT-EXPIRY-ACCEPTED ($atExpiry.Use-ceq'Forward') 'inclusive not-after boundary'
    Add-Check T27-FORWARD-AFTER-EXPIRY-REJECTED (Expect-Failure{Test-G3E2RA1R4LiveSealTemporalDocument $context $live Forward ([DateTimeOffset]::ParseExact($notAfter,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None).AddTicks(1))}) 'forward expires after boundary'
    $expiredReverse=Test-G3E2RA1R4LiveSealTemporalDocument $context $live Reverse ([DateTimeOffset]::ParseExact($notAfter,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None).AddDays(1))
    Add-Check T28-REVERSE-EXPIRED-ACCEPTED ($expiredReverse.Use-ceq'Reverse') 'reverse ignores expiry only'
    $badTtl=New-LiveDocument $prepared $approved $sealed $notAfter 899 (Join-Path $temp 'bad-ttl.json')
    Add-Check T29-REVERSE-RETAINS-TTL-CHECK (Expect-Failure{Test-G3E2RA1R4LiveSealTemporalDocument $context $badTtl Reverse ([DateTimeOffset]::ParseExact($notAfter,"yyyy-MM-dd'T'HH:mm:ss.fffffffzzz",[Globalization.CultureInfo]::InvariantCulture,[Globalization.DateTimeStyles]::None).AddDays(1))}) 'reverse rejects damaged TTL'
    Add-Check T30-NOTAFTER-EXACTLY-SEALED-PLUS-900 ($completed.time.not_after_utc-ceq$notAfter) 'not-after derives from one sealed instant'

    Add-Check T31-Z-SUFFIX-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-08-26T19:00:00.1234567Z"}' 'prepared_at_utc'}) 'Z is noncanonical'
    Add-Check T32-NONZERO-OFFSET-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-08-26T21:00:00.1234567+02:00"}' 'prepared_at_utc'}) 'nonzero offset rejected'
    Add-Check T33-MISSING-OFFSET-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-08-26T19:00:00.1234567"}' 'prepared_at_utc'}) 'missing offset rejected'
    Add-Check T34-FRACTION-PRECISION-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-08-26T19:00:00.123+00:00"}' 'prepared_at_utc'}) 'not seven digits rejected'
    Add-Check T35-US-LOCALE-DATE-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"08/26/2026 19:00:00"}' 'prepared_at_utc'}) 'US locale rejected'
    Add-Check T36-DE-LOCALE-DATE-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"26.08.2026 19:00:00"}' 'prepared_at_utc'}) 'DE locale rejected'
    Add-Check T37-INVALID-CALENDAR-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-02-30T19:00:00.1234567+00:00"}' 'prepared_at_utc'}) 'invalid calendar rejected'
    Add-Check T38-NONSTRING-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":20260826}' 'prepared_at_utc'}) 'non-string rejected'
    Add-Check T39-ESCAPED-LEXEME-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-08-26T19:00:00.1234567\u002b00:00"}' 'prepared_at_utc'}) 'escaped timestamp rejected'
    $canonicalDuplicate=Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-08-26T19:00:00.1234567+00:00","prepared_at_utc":"2026-08-26T19:00:00.1234567+00:00"}' 'prepared_at_utc'}
    $escapedAlias=Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{"prepared_at_utc":"2026-08-26T19:00:00.1234567+00:00","prepared_at_\u0075tc":"2026-08-26T19:00:00.1234567+00:00"}' 'prepared_at_utc'}
    Add-Check T40-DUPLICATE-KEY-REJECTED ($canonicalDuplicate-and$escapedAlias) 'canonical duplicate and escaped semantic alias rejected'
    Add-Check T41-MISSING-KEY-REJECTED (Expect-Failure{Get-G3E2RA1R4TimestampLexeme '{}' 'prepared_at_utc'}) 'missing key rejected'
    $preparedLate=New-LiveDocument '2026-08-26T19:00:01.1234568+00:00' $approved $sealed $notAfter 900 (Join-Path $temp 'prepared-late.json')
    Add-Check T42-PREPARED-AFTER-SEALED-REJECTED (Expect-Failure{Test-G3E2RA1R4LiveSealTemporalDocument $context $preparedLate Reverse $sealMoment}) 'prepared relation rejected'
    $approvalLate=New-LiveDocument $prepared '2026-08-26T19:00:01.1234568+00:00' $sealed $notAfter 900 (Join-Path $temp 'approval-late.json')
    Add-Check T43-APPROVAL-AFTER-SEALED-REJECTED (Expect-Failure{Test-G3E2RA1R4LiveSealTemporalDocument $context $approvalLate Reverse $sealMoment}) 'approval relation rejected'
    $wrong=Join-Path $temp 'wrong-contract.json';$null=New-SealInput $prepared $approved $wrong -WrongContract
    $extra=Join-Path $temp 'extra.json';$null=New-SealInput $prepared $approved $extra -Extra
    Add-Check T44-OLD-CONTRACT-AND-UNKNOWN-REJECTED ((Expect-Failure{Read-G3E2RA1R4SealInputDocument $context $wrong $sealMoment})-and(Expect-Failure{Read-G3E2RA1R4SealInputDocument $context $extra $sealMoment})) 'old profile and unknown fields fail closed'

    $pUs=Invoke-CultureChild $ps7 'en-US' 'Prepare';$pDe=Invoke-CultureChild $ps7 'en-DE' 'Prepare'
    Add-Check T45-ENUS-PREPARE-CHILD ($pUs.prepared-ceq$prepared-and$pUs.culture-ceq'en-US') 'separate PS7 en-US Prepare path'
    Add-Check T46-ENDE-PREPARE-CHILD ($pDe.prepared-ceq$prepared-and$pDe.culture-ceq'en-DE') 'separate PS7 en-DE Prepare path'
    Add-Check T47-PREPARE-CULTURE-EQUALITY ($pUs.prepared-ceq$pDe.prepared-and$pUs.approved-ceq$pDe.approved) 'Prepare lexemes equal'
    $sUs=Invoke-CultureChild $ps7 'en-US' 'SealForward';$sDe=Invoke-CultureChild $ps7 'en-DE' 'SealForward'
    Add-Check T48-ENUS-SEAL-FORWARD-CHILD ($sUs.sealed-ceq$sealed-and$sUs.not_after-ceq$notAfter) 'en-US seal emission and forward consumption'
    Add-Check T49-ENDE-SEAL-FORWARD-CHILD ($sDe.sealed-ceq$sealed-and$sDe.not_after-ceq$notAfter) 'en-DE seal emission and forward consumption'
    Add-Check T50-SEAL-BYTES-HASH-CULTURE-EQUALITY ($sUs.sha256-ceq$sDe.sha256-and$sUs.raw-ceq$sDe.raw) 'canonical seal bytes equal'
    $fUs=Invoke-CultureChild $ps7 'en-US' 'ForwardBoundary';$fDe=Invoke-CultureChild $ps7 'en-DE' 'ForwardBoundary'
    Add-Check T51-ENUS-FORWARD-BOUNDARY ($fUs.not_after-ceq$notAfter) 'en-US inclusive expiry'
    Add-Check T52-ENDE-FORWARD-BOUNDARY ($fDe.not_after-ceq$notAfter) 'en-DE inclusive expiry'
    $rUs=Invoke-CultureChild $ps7 'en-US' 'ReverseExpired';$rDe=Invoke-CultureChild $ps7 'en-DE' 'ReverseExpired'
    Add-Check T53-ENUS-REVERSE-EXPIRED ($rUs.sealed-ceq$sealed) 'en-US reverse expiry-independent'
    Add-Check T54-ENDE-REVERSE-EXPIRED ($rDe.sealed-ceq$sealed-and$rUs.sha256-ceq$rDe.sha256) 'en-DE reverse and cross-culture equality'

    $guardText=Get-Content -LiteralPath (Join-Path $overlay 'tools/g3e2r-a1r4-guard-lib.psm1') -Raw
    $finalizerText=Get-Content -LiteralPath (Join-Path $overlay 'tools/finalize-g3e2r-live-seal-a1r4.ps1') -Raw
    $forwardText=Get-Content -LiteralPath (Join-Path $overlay 'tools/invoke-g3e2-transaction-a1r4.ps1') -Raw
    $reverseText=Get-Content -LiteralPath (Join-Path $overlay 'tools/invoke-g3e2-reverse-a1r4.ps1') -Raw
    $parseErrors=@();foreach($tool in @('g3e2r-a1r4-guard-lib.psm1','finalize-g3e2r-live-seal-a1r4.ps1','invoke-g3e2-transaction-a1r4.ps1','invoke-g3e2-reverse-a1r4.ps1','test-g3e2r-a1r4-bundle.ps1')){$parseErrors+=@(Parse-Tool (Join-Path $overlay ('tools/'+$tool)))}
    $bindingOk=$finalizerText.Contains('Read-G3E2RA1R4SealInputDocument')-and$finalizerText.Contains('Complete-G3E2RA1R4SealTimes')-and$forwardText.Contains('Read-G3E2RA1R4Seal')-and$reverseText.Contains('Read-G3E2RA1R4Seal')-and$guardText-notmatch'\[DateTimeOffset\]::Parse\('-and$finalizerText-notmatch"\.ToString\('o'\)"
    Add-Check T55-PRODUCTION-CALL-PATH-BOUND ($parseErrors.Count-eq 0-and$bindingOk) 'five scripts parse and all time paths use shared exact helpers'
    Add-Check T56-NINE-FIFTYTWO-FIFTEEN-FOUR ($context.SealContract.bundle_binding_count-eq 9-and$context.SealContract.execution_binding_count-eq 52-and$context.SealContract.artifact_binding_count-eq 15-and$context.SealContract.runtime_binding_count-eq 4) 'seal closure cardinality exact'
    Add-Check T57-EIGHT-HASH-BOUNDARIES ($context.SealContract.expected_hash_boundary_count-eq 8-and$finalizerText.Contains('ExpectedA1R3Hash')-and$finalizerText.Contains('ExpectedA1R4Hash')) 'A1 A1R A1R2 A1R3 A1R4 B inputs seal'
    $gates=@($context.Gates)
    Add-Check T58-GATE-MAP-V5 ($gates.Count-eq 40-and@($gates|Where-Object direction -CEQ 'SEAL').Count-eq 9-and@($gates|Where-Object direction -CEQ 'FWD').Count-eq 19-and@($gates|Where-Object direction -CEQ 'REV').Count-eq 12-and@($gates|Where-Object step_id -CEQ 'FWD-020').Count-eq 0) 'Gate Map v5 9/19/12'
    Add-Check T59-B-COMPATIBILITY ($context.SealContract.b_candidate_file_count-eq 19-and$context.SealContract.b_bundle_bound_file_count-eq 18-and$context.SealContract.b_sealed_file_count-eq 20-and$context.SealContract.seal_inputs_contract-ceq'g3e2r-seal-inputs/v2-a1r4') 'B 19/18/20 with regenerated input profile'
    Add-Check T60-ORDINAL-V3-UNCHANGED ($context.FingerprintContract.contract_id-ceq'g3e2r-ordinal-fingerprint/v3'-and$context.InvariantContract.contract_id-ceq$context.A1R3Context.InvariantContract.contract_id) 'A1R3 ordinal and invariant contracts reused'
    $a1r3Test=Join-Path $context.A1R3Root 'tools/test-g3e2r-a1r3-bundle.ps1'
    $a1r3=Invoke-DirectJsonFile $ps5 $a1r3Test @('-VaultRoot',$root,'-OverlayRoot',$context.A1R3Root,'-PythonExecutable',$PythonExecutable,'-Json')
    Add-Check T61-UNCHANGED-A1R3-REGRESSION ($a1r3.verdict-ceq'PASS'-and[int]$a1r3.groups-eq 48-and$a1r3.expected_a1r3_hash-ceq$expectedA1R3) 'A1R3 48/48 in accepted historical runner'
    Invoke-RootFast;Invoke-Mos
    Add-Check T62-ROOT-AND-MOS $true 'Root Fast 0/0 and MOS 16/16'
    $hashesOk=(Get-G3E2RA1R4Sha256 $context.A1R3Manifest)-ceq$expectedA1R3-and(Get-G3E2RA1R4Sha256 $context.A1R2Manifest)-ceq$expectedA1R2-and(Get-G3E2RA1R4Sha256 $context.A1R2Context.A1RContext.A1Manifest)-ceq$expectedA1-and(Get-G3E2RA1R4Sha256 $context.A1R2Context.A1RManifest)-ceq$expectedA1R-and(Get-G3E2RA1R4Sha256 (Join-Path $root 'tools/config/local-source-integrity-contract.json'))-ceq$expectedS5LocalSourceContract-and(Get-G3E2RA1R4Sha256 (Join-Path $root 'tools/config/newsletter-index-contract.json'))-ceq$expectedS5NewsletterContract
    Add-Check T63-UPSTREAM-AND-POLICY-SAFE-S5-CONTRACTS $hashesOk 'A1R3 A1R2 A1R A1 and policy-safe S5 contracts exact'
}finally{
    if(Test-Path -LiteralPath $tempResolved){Remove-Item -LiteralPath $tempResolved -Recurse -Force}
}

$staged=@(git -C $root diff --cached --name-only)
Assert-G3E2RA1R4NoResidue $root
$bRoot=Resolve-G3E2RA1R4InRoot $root ([string]$context.BContract.canonical_root)
$seals=@(Get-ChildItem -LiteralPath (Split-Path -Parent $overlay) -Recurse -File -Filter 'live-seal-v2.json')
Add-Check T64-FINAL-LIVE-SCOPE ($checks.Count-eq 63-and-not(Test-Path -LiteralPath $tempResolved)-and-not(Test-Path -LiteralPath $bRoot)-and$seals.Count-eq 0-and$staged.Count-eq 0-and$context.SealContract.routing_state-ceq'frozen') 'fixtures removed B snapshot seal probe mutation staging residue absent routing frozen'
if($checks.Count-ne 64){throw "A1R4 test count differs from 64: $($checks.Count)"}
$result=[ordered]@{contract='g3e2r-a1r4-test/v1';verdict='PASS';groups=64;expected_a1_hash=$expectedA1;expected_a1r_hash=$expectedA1R;expected_a1r2_hash=$expectedA1R2;expected_a1r3_hash=$expectedA1R3;expected_a1r4_hash=$expectedA1R4;s5r_local_source_contract_hash=$expectedS5LocalSourceContract;s5r_newsletter_contract_hash=$expectedS5NewsletterContract;seal_closure='9/52/15/4';expected_hash_boundaries=8;gate_map='9/19/12';timestamp_format="yyyy-MM-dd'T'HH:mm:ss.fffffffzzz";ttl_seconds=900;future_skew_seconds=60;cross_culture=@('en-US','en-DE');checks=@($checks);temporary_fixture_removed=$true;live_mutation='none';live_capability_probe='not-run';b_candidate='absent';snapshot='absent';live_seal='absent';routing_state='frozen';git_staging='empty'}
if($Json){$result|ConvertTo-Json -Depth 12 -Compress}else{Write-Output "PASS | 64/64 | A1R4 $expectedA1R4 | routing frozen"}
