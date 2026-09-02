[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$OverlayRoot,
    [Parameter(Mandatory = $true)][string]$PythonExecutable,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($OverlayRoot)) { $OverlayRoot = Join-Path $PSScriptRoot '..' }
$root = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
$overlay = (Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
Import-Module (Join-Path $overlay 'tools/g3e2r-a1-guard-lib.psm1') -Force
$a1Manifest = Join-Path $overlay 'a1-bundle-manifest.csv'
$expectedA1 = Get-G3E2RA1Sha256 -LiteralPath $a1Manifest
$context = Get-G3E2RA1Context -VaultRoot $root -OverlayRoot $overlay -ExpectedA1Hash $expectedA1
$powerShell = (Get-Process -Id $PID).Path
$checks = [Collections.Generic.List[string]]::new()

function Add-Check {
    param([string]$Id,[bool]$Passed,[string]$Evidence)
    if (-not $Passed) { throw "$Id failed: $Evidence" }
    $checks.Add("$Id|$Evidence")
}

function Invoke-JsonScript {
    param([string]$Script,[string[]]$Arguments)
    $output = & $powerShell -NoProfile -ExecutionPolicy Bypass -File $Script @Arguments 2>&1
    if ($LASTEXITCODE -ne 0) { throw "Child script failed: $Script $($output -join [Environment]::NewLine)" }
    return ($output -join [Environment]::NewLine) | ConvertFrom-Json
}

function Parse-Tool {
    param([string]$LiteralPath)
    $tokens = $null
    $errors = $null
    [void][Management.Automation.Language.Parser]::ParseFile($LiteralPath,[ref]$tokens,[ref]$errors)
    return @($errors)
}

$aFingerprintBefore = Get-G3E2RA1FingerprintV2 -LiteralPath $context.ARoot
$g3e1FingerprintBefore = Get-G3E2RA1FingerprintV2 -LiteralPath $context.G3E1Root
$git = [string]((Get-Command git -CommandType Application -ErrorAction Stop | Select-Object -First 1).Source)
Assert-G3E2RA1GitStagingEmpty -VaultRoot $root -GitExecutable $git

$manifestRows = @(Import-Csv -LiteralPath $a1Manifest)
Add-Check 'T01-EXACT-A1-INVENTORY' ($manifestRows.Count -eq 14 -and @(Get-ChildItem -LiteralPath $overlay -Recurse -File).Count -eq 15) '14 bound plus manifest'
Add-Check 'T02-THREE-ROOT-LOCK' ((Import-Csv -LiteralPath (Join-Path $overlay 'dependency-lock.csv')).Count -eq 3) 'three dependency rows'
Add-Check 'T03-A-TRANSITIVE-CLOSURE' ((Get-G3E2RA1Sha256 -LiteralPath $context.Dependencies['G3E2R-A-BUNDLE']) -ceq '5114660FB6968CF5979F17AC7ECC95833A69C26E5C94C633B1E955C48393C055') 'A root exact'
Add-Check 'T04-G3E1-TRANSITIVE-CLOSURE' ((Get-G3E2RA1Sha256 -LiteralPath $context.Dependencies['G3E1-BUNDLE']) -ceq 'D581C9535B6359F7058DA33C3CB9E229EC8EF1C8C2C6C4D49311C75189D20E50') 'G3E-1 root exact'

$sealContract = $context.SealContract
Add-Check 'T05-SEAL-V2-SCHEMA' ($sealContract.seal_contract -ceq 'g3e2r-live-seal/v2' -and @($sealContract.required_top_level).Count -eq 13) 'v2 and 13 exact top-level fields'
Add-Check 'T06-TTL-AND-REVERSE-SEMANTICS' ($sealContract.ttl_seconds -eq 900 -and $sealContract.forward_requires_unexpired_seal -and $sealContract.reverse_ignores_expiry) '900 seconds; reverse expiry-independent'
Add-Check 'T07-BUNDLE-BINDINGS' (@($sealContract.required_bundle_binding_ids).Count -eq 5 -and $sealContract.b_candidate_file_count -eq 19 -and $sealContract.b_sealed_file_count -eq 20 -and $sealContract.live_seal_filename -ceq 'live-seal-v2.json') '5 bindings; B 19 to exact sealed 20'
Add-Check 'T08-EXECUTION-BINDINGS' (@($sealContract.required_execution_binding_ids).Count -eq 20) '20 executable inputs'
Add-Check 'T09-ARTIFACT-BINDINGS' (@($sealContract.required_artifact_binding_ids).Count -eq 15) '15 B artifacts'
Add-Check 'T10-FOUR-RUNTIME-ROLES' (@($sealContract.required_runtime_ids).Count -eq 4 -and @($context.RuntimeRoles).Count -eq 4) 'four runtime roles'
$runtimeBindings = Get-G3E2RA1RuntimeBindings -Context $context -PythonExecutable $PythonExecutable
Add-Check 'T11-RUNTIME-IDENTITIES' (@($runtimeBindings | Where-Object { $_.executable_sha256 -match '^[A-F0-9]{64}$' -and -not [string]::IsNullOrWhiteSpace($_.version) }).Count -eq 4) 'path, hash, version and probe bound'

$invariant = $context.InvariantContract
Add-Check 'T12-INVARIANT-ROW-CONTRACT' ($invariant.row_count -eq 28 -and @($invariant.columns).Count -eq 10) '28 rows and exact columns'
Add-Check 'T13-INVARIANT-SPLIT' ($invariant.protected_file_count -eq 14 -and $invariant.sibling_controller_count -eq 3 -and $invariant.tree_state_count -eq 9 -and $invariant.wrapper_state_count -eq 2 -and $invariant.protected_basis -ceq 'protected-file' -and $invariant.sibling_basis -ceq 'sibling-controller') '14/3/9/2 with explicit basis'
Add-Check 'T14-INVARIANT-STATE-COVERAGE' (@($invariant.required_tree_ids).Count -eq 9 -and @($invariant.required_wrapper_ids).Count -eq 2 -and $invariant.expected_file_counts.'TREE-LEGACY-PRE' -eq 215 -and $invariant.expected_file_counts.'TREE-TARGET-POST' -eq 98) 'required tree and wrapper states'

$gates = @($context.Gates)
Add-Check 'T15-GATE-MAP-CARDINALITY' ($gates.Count -eq 40 -and @($gates.step_id | Sort-Object -Unique).Count -eq 40) '40 unique gates'
Add-Check 'T16-GATE-MAP-SPLIT' (@($gates | Where-Object direction -CEQ 'SEAL').Count -eq 9 -and @($gates | Where-Object direction -CEQ 'FWD').Count -eq 19 -and @($gates | Where-Object direction -CEQ 'REV').Count -eq 12) '9/19/12'
Add-Check 'T17-ROUTING-FROZEN' (@($gates | Where-Object step_id -CEQ 'FWD-020').Count -eq 0 -and $sealContract.routing_state -ceq 'frozen') 'FWD-020 absent'

$guardText = Get-Content -Raw -LiteralPath (Join-Path $overlay 'tools/g3e2r-a1-guard-lib.psm1') -Encoding UTF8
$forwardText = Get-Content -Raw -LiteralPath (Join-Path $overlay 'tools/invoke-g3e2-transaction-v2.ps1') -Encoding UTF8
$reverseText = Get-Content -Raw -LiteralPath (Join-Path $overlay 'tools/invoke-g3e2-reverse-v2.ps1') -Encoding UTF8
Add-Check 'T18-WORKSPACE-TRUE-ADVISORY' ($guardText.Contains("!.obsidian/workspace.json") -and $guardText.Contains('absent from the hard-reference manifest') -and $forwardText.Contains("continue }")) 'workspace excluded from hard literal and hash gates'
Add-Check 'T19-EXPECTED-HASH-ENFORCEMENT' ($guardText.Contains('Expected-A1-Hash mismatch') -and $guardText.Contains('Expected-Seal-Hash mismatch') -and $guardText.Contains('Seal execution ids differ from contract') -and $guardText.Contains("projects/No and low code_1st Marketing Agent") -and $forwardText.Contains('-ExpectedA1Hash') -and $reverseText.Contains('-ExpectedSealHash')) 'A1, seal, binding ids and canonical token fail closed'
Add-Check 'T20-B-AND-RESIDUE-GATES' ($guardText.Contains('nineteen files') -and $guardText.Contains('transaction residue') -and $forwardText.Contains('Test-G3E2RA1BManifest') -and (Get-Content -Raw -LiteralPath (Join-Path $overlay 'tools/finalize-g3e2r-live-seal-v2.ps1') -Encoding UTF8).Contains('Assert-G3E2RA1SealClosure')) 'B inventory, full closure and residue checks wired'

$forward = Join-Path $overlay 'tools/invoke-g3e2-transaction-v2.ps1'
$reverse = Join-Path $overlay 'tools/invoke-g3e2-reverse-v2.ps1'
$finalizer = Join-Path $overlay 'tools/finalize-g3e2r-live-seal-v2.ps1'
Add-Check 'T21-TOOL-PARSE' (@(Parse-Tool $forward).Count -eq 0 -and @(Parse-Tool $reverse).Count -eq 0 -and @(Parse-Tool $finalizer).Count -eq 0 -and @(Parse-Tool (Join-Path $overlay 'tools/g3e2r-a1-guard-lib.psm1')).Count -eq 0) 'four PowerShell tools parse'
$forwardValidate = Invoke-JsonScript -Script $forward -Arguments @('-Mode','Validate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-Json')
Add-Check 'T22-FORWARD-VALIDATE' ($forwardValidate.verdict -ceq 'PASS' -and $forwardValidate.forward -eq 19) 'v2 forward validates'
$preHold = Invoke-JsonScript -Script $forward -Arguments @('-Mode','Simulate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-FailAtStep','FWD-009','-Json')
Add-Check 'T23-PREMUTATION-HOLD' ($preHold.verdict -ceq 'HOLD_NO_MUTATION' -and -not $preHold.reverse_invoked) 'FWD-009 failure remains no-mutation'
$postReverse = Invoke-JsonScript -Script $forward -Arguments @('-Mode','Simulate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-FailAtStep','FWD-010','-Json')
Add-Check 'T24-POSTMUTATION-AUTO-REVERSE' ($postReverse.verdict -ceq 'REVERSED_ROUTING_FROZEN' -and $postReverse.reverse_invoked -and @($postReverse.reverse_steps).Count -eq 12) 'FWD-010 failure authorizes full reverse'
$reverseSimulation = Invoke-JsonScript -Script $reverse -Arguments @('-Mode','Simulate','-VaultRoot',$root,'-ExpectedA1Hash',$expectedA1,'-Json')
Add-Check 'T25-REVERSE-IDEMPOTENT-CONTRACT' ($reverseSimulation.verdict -ceq 'REVERSED_ROUTING_FROZEN' -and $reverseText.Contains('$alreadyWritten') -and $reverseText.Contains('-Use Reverse') -and $reverseText.Contains('-AdvisoryExternalDrift')) 'restartable witness, expiry-independent reverse and non-blocking external drift'

$aTest = Join-Path $context.ARoot 'tools/test-g3e2r-bundle.ps1'
$aResult = Invoke-JsonScript -Script $aTest -Arguments @('-VaultRoot',$root,'-RepairRoot',$context.ARoot,'-PythonExecutable',$PythonExecutable,'-Json')
Add-Check 'T26-UPSTREAM-ISOLATED-REGRESSION' ($aResult.verdict -ceq 'PASS' -and $aResult.temporary_fixture_removed) 'A temporary fixture suite passed and cleaned'

$rootFastOutput = & $powerShell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'tools/test-wiki-integrity.ps1') -Profile Fast 2>&1
if ($LASTEXITCODE -ne 0) { throw "Root Fast failed: $($rootFastOutput -join [Environment]::NewLine)" }
$mosOutput = & $powerShell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') 2>&1
if ($LASTEXITCODE -ne 0) { throw "MOS regression failed: $($mosOutput -join [Environment]::NewLine)" }
Assert-G3E2RA1GitStagingEmpty -VaultRoot $root -GitExecutable $git
$scopeUnchanged = (Get-G3E2RA1FingerprintV2 -LiteralPath $context.ARoot) -ceq $aFingerprintBefore -and (Get-G3E2RA1FingerprintV2 -LiteralPath $context.G3E1Root) -ceq $g3e1FingerprintBefore
$rootGreen = (($rootFastOutput -join [Environment]::NewLine) -match '(?im)0\s+errors?' -and ($rootFastOutput -join [Environment]::NewLine) -match '(?im)0\s+warnings?')
$mosGreen = (($mosOutput -join [Environment]::NewLine) -match '(?im)16/16')
Add-Check 'T27-LIVE-REGRESSION-AND-SCOPE' ($rootGreen -and $mosGreen -and $scopeUnchanged) 'Root Fast 0/0; MOS 16/16; A and G3E-1 unchanged; staging empty'

$result = [ordered]@{ contract='g3e2r-a1-test/v1'; verdict='PASS'; groups=$checks.Count; expected_a1_hash=$expectedA1; checks=@($checks); live_mutation='none'; live_capability_probe='not-run'; temporary_only=$true; routing_state='frozen'; git_staging='empty' }
if ($Json) { $result | ConvertTo-Json -Depth 8 -Compress } else { Write-Output "PASS | $($checks.Count)/27 A1 groups | static and temporary-only | routing frozen" }
