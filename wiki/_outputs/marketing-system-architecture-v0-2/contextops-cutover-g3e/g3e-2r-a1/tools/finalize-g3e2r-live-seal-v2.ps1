[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('Validate','Prepare','Seal')][string]$Mode,
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$OverlayRoot,
    [string]$InputPath,
    [string]$OutputPath,
    [string]$PythonExecutable,
    [string]$ExpectedA1Hash,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($OverlayRoot)) { $OverlayRoot = Join-Path $PSScriptRoot '..' }
Import-Module (Join-Path $OverlayRoot 'tools/g3e2r-a1-guard-lib.psm1') -Force
$context = Get-G3E2RA1Context -VaultRoot $VaultRoot -OverlayRoot $OverlayRoot -ExpectedA1Hash $ExpectedA1Hash

function Write-ExclusiveUtf8 {
    param([string]$LiteralPath,[string]$Text)
    $parent = Split-Path -Parent $LiteralPath
    if (-not (Test-Path -LiteralPath $parent -PathType Container)) { throw "Seal output parent is missing: $parent" }
    $bytes = [Text.UTF8Encoding]::new($false).GetBytes($Text)
    $stream = [IO.File]::Open($LiteralPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::None)
    try { $stream.Write($bytes,0,$bytes.Length); $stream.Flush($true) } finally { $stream.Dispose() }
}

if ($Mode -eq 'Validate') {
    $result = [ordered]@{ contract='g3e2r-live-seal-finalizer/v2'; verdict='PASS'; mode='Validate'; state_effect='none'; ttl_seconds=900; runtime_bindings=4; artifact_bindings=15 }
}
else {
    $sealMutex = $null
    if ($Mode -eq 'Seal') { $sealMutex = Enter-G3E2RA1Mutex -VaultRoot $context.Root }
    if ([string]::IsNullOrWhiteSpace($InputPath) -or [string]::IsNullOrWhiteSpace($PythonExecutable) -or [string]::IsNullOrWhiteSpace($ExpectedA1Hash)) { throw "$Mode requires InputPath, PythonExecutable, and ExpectedA1Hash." }
    $resolvedInput = [IO.Path]::GetFullPath($InputPath)
    if (-not $resolvedInput.StartsWith($context.Root + '\',[StringComparison]::OrdinalIgnoreCase)) { throw 'Seal input must remain inside the Vault.' }
    $seal = Get-Content -Raw -LiteralPath $resolvedInput -Encoding UTF8 | ConvertFrom-Json
    Assert-G3E2RA1ExactProperties -Value $seal -Expected @($context.SealContract.required_top_level) -Label 'Seal input'
    if ($seal.seal_contract -cne 'g3e2r-live-seal/v2' -or $seal.routing_state -cne 'frozen' -or [int]$seal.time.ttl_seconds -ne 900) { throw 'Seal input identity, routing state, or TTL is invalid.' }
    if (@($seal.bundle_bindings).Count -ne 5 -or @($seal.execution_bindings).Count -ne 20 -or @($seal.artifact_bindings).Count -ne 15) { throw 'Seal input binding cardinality is invalid.' }
    $runtimeBindings = Get-G3E2RA1RuntimeBindings -Context $context -PythonExecutable $PythonExecutable
    Assert-G3E2RA1SealClosure -Context $context -Seal $seal
    $sealInputArtifact = Get-G3E2RA1Artifact -Seal $seal -Id 'B-SEAL-INPUTS'
    $boundInput = Test-G3E2RA1BoundArtifact -Context $context -Artifact $sealInputArtifact
    if ($resolvedInput -cne $boundInput) { throw 'InputPath must be the exact B-SEAL-INPUTS artifact.' }
    Assert-G3E2RA1RuntimeBindings -Expected @($seal.runtime_bindings) -Actual $runtimeBindings
    Test-G3E2RA1BManifest -Context $context -Seal $seal
    Test-G3E2RA1WorkspaceAdvisory -Context $context -Seal $seal
    Test-G3E2RA1LiveInvariants -Context $context -Seal $seal -State pre
    $gitPath = [string](@($runtimeBindings | Where-Object runtime_id -CEQ 'GIT')[0].executable_path)
    $rgPath = [string](@($runtimeBindings | Where-Object runtime_id -CEQ 'RIPGREP')[0].executable_path)
    $psPath = [string](@($runtimeBindings | Where-Object runtime_id -CEQ 'POWERSHELL_HOST')[0].executable_path)
    Assert-G3E2RA1GitStagingEmpty -VaultRoot $context.Root -GitExecutable $gitPath
    Assert-G3E2RA1NoResidue -VaultRoot $context.Root
    Test-G3E2RA1HardReferences -Context $context -Seal $seal -State pre -RipgrepExecutable $rgPath
    $rootFast = & $psPath -NoProfile -ExecutionPolicy Bypass -File (Join-Path $context.Root 'tools/test-wiki-integrity.ps1') -Profile Fast 2>&1
    if ($LASTEXITCODE -ne 0 -or ($rootFast -join [Environment]::NewLine) -notmatch '(?im)0\s+errors?' -or ($rootFast -join [Environment]::NewLine) -notmatch '(?im)0\s+warnings?') { throw 'Seal gate Root Fast does not prove 0/0.' }
    $mos = & $psPath -NoProfile -ExecutionPolicy Bypass -File (Join-Path $context.Root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') 2>&1
    if ($LASTEXITCODE -ne 0 -or ($mos -join [Environment]::NewLine) -notmatch '(?im)16/16') { throw 'Seal gate MOS does not prove 16/16.' }
    Assert-G3E2RA1ExactProperties -Value $seal.baseline -Expected @($context.SealContract.required_baseline_fields) -Label 'Seal baseline'
    if ([int]$seal.baseline.git_staged_count -ne 0 -or [int]$seal.baseline.root_fast_errors -ne 0 -or [int]$seal.baseline.root_fast_warnings -ne 0 -or [int]$seal.baseline.mos_passed -ne 16 -or [int]$seal.baseline.mos_total -ne 16 -or -not [bool]$seal.baseline.mos_cleanup -or [string]$seal.baseline.mos_vault_mutation -cne 'none' -or [int]$seal.baseline.residue_count -ne 0 -or [string]$seal.baseline.authority_pre -cne 'frozen') { throw 'Seal input baseline differs from current required prestate.' }
    if ($Mode -eq 'Prepare') {
        if ($seal.state -cne 'prepared') { throw 'Prepare mode requires a prepared seal input.' }
        $result = [ordered]@{ contract='g3e2r-live-seal-finalizer/v2'; verdict='PREPARED_READ_ONLY'; mode='Prepare'; state_effect='none'; expected_a1_hash=$ExpectedA1Hash.ToUpperInvariant(); prepared_sha256=Get-G3E2RA1Sha256 -LiteralPath $resolvedInput }
    }
    else {
        if ([string]::IsNullOrWhiteSpace($OutputPath)) { throw 'Seal mode requires OutputPath.' }
        $resolvedOutput = [IO.Path]::GetFullPath($OutputPath)
        if (-not $resolvedOutput.StartsWith($context.Root + '\',[StringComparison]::OrdinalIgnoreCase)) { throw 'Seal output must remain inside the Vault.' }
        if (Test-Path -LiteralPath $resolvedOutput) { throw 'Seal output already exists; overwrite is forbidden.' }
        $bBundle = @($seal.bundle_bindings | Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')[0]
        $bManifest = Resolve-G3E2RA1InRoot -Root $context.Root -RepositoryPath ([string]$bBundle.repository_path)
        $bRoot = Split-Path -Parent $bManifest
        if ((Split-Path -Parent $resolvedOutput) -cne $bRoot -or (Split-Path -Leaf $resolvedOutput) -cne [string]$context.SealContract.live_seal_filename) { throw 'Live seal must be the exact twentieth file at the reviewed B root.' }
        if ($seal.state -cne 'prepared') { throw 'Seal mode requires a prepared seal input.' }
        Assert-G3E2RA1ExactProperties -Value $seal.approval -Expected @($context.SealContract.required_approval_fields) -Label 'Seal approval'
        foreach ($field in @('live_mutation_approved','automatic_reverse_approved','live_capability_probe_approved','independent_reverse_approved')) { if (-not [bool]$seal.approval.$field) { throw "Seal approval is missing: $field" } }
        $now = [DateTimeOffset]::UtcNow
        $seal.state = 'sealed'
        $seal.time.sealed_at_utc = $now.ToString('o')
        $seal.time.not_after_utc = $now.AddSeconds(900).ToString('o')
        $seal.time.ttl_seconds = 900
        Write-ExclusiveUtf8 -LiteralPath $resolvedOutput -Text (($seal | ConvertTo-Json -Depth 16) + [Environment]::NewLine)
        if (@(Get-ChildItem -LiteralPath $bRoot -Recurse -File).Count -ne 20) { throw 'Sealed B inventory must contain exactly twenty files.' }
        $result = [ordered]@{ contract='g3e2r-live-seal-finalizer/v2'; verdict='SEALED_ROUTING_FROZEN'; mode='Seal'; state_effect='new-live-seal-only'; expected_a1_hash=$ExpectedA1Hash.ToUpperInvariant(); expected_seal_hash=Get-G3E2RA1Sha256 -LiteralPath $resolvedOutput; not_after_utc=$seal.time.not_after_utc }
    }
    if ($null -ne $sealMutex) { Exit-G3E2RA1Mutex -Mutex $sealMutex }
}

if ($Json) { $result | ConvertTo-Json -Depth 8 -Compress } else { Write-Output "$($result.verdict) | mode=$Mode | routing frozen" }
