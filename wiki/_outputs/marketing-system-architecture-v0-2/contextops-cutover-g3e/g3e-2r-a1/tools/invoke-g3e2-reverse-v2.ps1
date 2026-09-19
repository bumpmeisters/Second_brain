[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('Validate', 'Simulate', 'Apply')][string]$Mode,
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$RepairRoot,
    [string]$SealEnvelope,
    [string]$PythonExecutable,
    [string]$ExpectedA1Hash,
    [string]$ExpectedSealHash,
    [switch]$AllowLiveMutation,
    [switch]$AllowReverse,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($RepairRoot)) { $RepairRoot = Join-Path $PSScriptRoot '..' }
$overlay = (Resolve-Path -LiteralPath $RepairRoot).Path.TrimEnd('\')
$root = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
Import-Module (Join-Path $overlay 'tools/g3e2r-a1-guard-lib.psm1') -Force
$context = Get-G3E2RA1Context -VaultRoot $root -OverlayRoot $overlay -ExpectedA1Hash $ExpectedA1Hash
$repair = $context.ARoot
Import-Module (Join-Path $repair 'tools/g3e2r-transaction-lib.psm1') -Force

$dependencyPath = Join-Path $repair 'dependency-lock.csv'
$bundlePath = Join-Path $repair 'repair-bundle-manifest.csv'
$componentPath = Join-Path $repair 'manifests/component-transition-manifest.csv'
$forwardPath = Join-Path $repair 'manifests/forward-transaction.csv'
$reversePath = Join-Path $repair 'manifests/reverse-transaction.csv'
$snapshotTool = Join-Path $repair 'tools/manage-scoped-cutover-snapshot.ps1'
$wrapperTool = Join-Path $repair 'tools/sync_agents_skills.py'
$powerShellExecutable = (Get-Process -Id $PID).Path

function Test-RepairBundle {
    $rows = @(Import-Csv -LiteralPath $bundlePath)
    Assert-G3E2RColumns -Rows $rows -Expected @('role', 'overlay_path', 'sha256', 'bytes') -Label 'Repair bundle manifest'
    if ($rows.Count -ne 14 -or @($rows.overlay_path | Sort-Object -Unique).Count -ne 14) {
        throw 'Repair bundle must bind fourteen unique files.'
    }
    foreach ($row in $rows) {
        $path = [IO.Path]::GetFullPath((Join-Path $repair ([string]$row.overlay_path).Replace('/', '\')))
        if (-not $path.StartsWith($repair + '\', [StringComparison]::OrdinalIgnoreCase)) { throw "Repair bundle path escapes: $($row.overlay_path)" }
        if ((Get-Item -LiteralPath $path).Length -ne [int64]$row.bytes -or (Get-G3E2RSha256 -LiteralPath $path) -ne $row.sha256) {
            throw "Repair bundle identity mismatch: $($row.overlay_path)"
        }
    }
}

function Assert-SealFileBindings {
    param([object]$Seal)
    foreach ($binding in @(
        @('snapshot_selection_path', 'snapshot_selection_sha256'),
        @('exact_poststate_manifest_path', 'exact_poststate_manifest_sha256'),
        @('exact_poststate_archive_path', 'exact_poststate_archive_sha256'),
        @('hard_reference_manifest_path', 'hard_reference_manifest_sha256'),
        @('restore_current_manifest_path', 'restore_current_manifest_sha256'),
        @('rollback_witness_manifest_path', 'rollback_witness_manifest_sha256')
    )) {
        $path = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.($binding[0]))
        if ((Get-G3E2RSha256 -LiteralPath $path) -cne [string]$Seal.($binding[1])) { throw "Seal file binding mismatch: $($binding[0])" }
    }
    $envelope = Resolve-G3E2RInRoot -Root $root -RepositoryPath (([string]$Seal.snapshot_directory).TrimEnd('/') + '/snapshot-envelope.json')
    if ((Get-G3E2RSha256 -LiteralPath $envelope) -cne [string]$Seal.snapshot_envelope_sha256) { throw 'Seal snapshot envelope hash mismatch.' }
}

function Invoke-PowerShellTool {
    param([string]$Script, [string[]]$Arguments, [int]$Timeout)
    return Invoke-G3E2RBoundProcess -FilePath $powerShellExecutable -ArgumentList (@('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $Script) + $Arguments) -TimeoutSeconds $Timeout -WorkingDirectory $root
}

function Invoke-RootFast {
    $result = Invoke-PowerShellTool -Script (Join-Path $root 'tools/test-wiki-integrity.ps1') -Arguments @('-Profile', 'Fast') -Timeout 300
    if ($result.StdOut -notmatch '(?im)0\s+errors?' -or $result.StdOut -notmatch '(?im)0\s+warnings?') {
        throw "Root Fast output does not prove 0/0.`n$($result.StdOut)"
    }
}

function Invoke-MosRegression {
    $null = Invoke-PowerShellTool -Script (Join-Path $root 'projects/marketing-operating-system/tools/test-federation-contracts.ps1') -Arguments @() -Timeout 180
}

function Invoke-Snapshot {
    param([string]$Command, [object]$Seal, [switch]$Restore)
    $arguments = @(
        '-Command', $Command, '-VaultRoot', $root,
        '-SelectionManifest', (Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.snapshot_selection_path)),
        '-SnapshotDirectory', (Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.snapshot_directory))
    )
    if ($Restore) {
        $arguments += @('-AllowedCurrentManifest', (Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.restore_current_manifest_path)), '-AllowRestore')
    }
    return Invoke-PowerShellTool -Script $snapshotTool -Arguments $arguments -Timeout 300
}

function Remove-ApprovedComponentTargets {
    param([object[]]$Components)
    foreach ($row in $Components) {
        $source = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.source_path) -ForMutation
        $target = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.target_path) -ForMutation
        if (-not (Test-Path -LiteralPath $source -PathType Leaf) -or (Get-G3E2RSha256 -LiteralPath $source) -ne $row.pre_sha256) {
            throw "Reverse source prestate mismatch: $($row.move_id)"
        }
        if (Test-Path -LiteralPath $target -PathType Leaf) {
            $hash = Get-G3E2RSha256 -LiteralPath $target
            if ($hash -notin @($row.pre_sha256, $row.post_sha256)) { throw "Reverse refuses unknown target bytes: $($row.target_path)" }
            Remove-Item -LiteralPath $target -Force
        }
        if (Test-Path -LiteralPath $target) { throw "Reverse target remains: $($row.target_path)" }
    }
}

function Remove-ApprovedCreatedPaths {
    param([object]$Seal)
    $manifest = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.exact_poststate_manifest_path)
    $rows = @(Import-Csv -LiteralPath $manifest | Where-Object forward_mode -eq 'create-exact')
    foreach ($row in $rows) {
        $target = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.repository_path) -ForMutation
        if (-not (Test-Path -LiteralPath $target)) { continue }
        if (-not (Test-Path -LiteralPath $target -PathType Leaf) -or (Get-G3E2RSha256 -LiteralPath $target) -ne $row.post_sha256) {
            throw "Reverse refuses unknown created-path bytes: $($row.repository_path)"
        }
        Remove-Item -LiteralPath $target -Force
    }
}

function Add-RollbackWitnesses {
    param([object]$Seal)
    $manifest = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.rollback_witness_manifest_path)
    $rows = @(Import-Csv -LiteralPath $manifest)
    Assert-G3E2RColumns -Rows $rows -Expected @(
        'repository_path', 'allowed_current_sha256', 'allowed_current_bytes', 'suffix_path',
        'suffix_sha256', 'expected_post_sha256', 'expected_post_bytes'
    ) -Label 'Rollback witness manifest'
    $groups = @($rows | Group-Object repository_path)
    if ($groups.Count -ne 3) { throw 'Rollback witness manifest must cover exactly three logs.' }
    foreach ($group in $groups) {
        $target = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$group.Name) -ForMutation
        $currentHash = Get-G3E2RSha256 -LiteralPath $target
        $currentBytes = [IO.File]::ReadAllBytes($target)
        $alreadyWritten = @($group.Group | Where-Object { $_.expected_post_sha256 -ceq $currentHash -and [int64]$_.expected_post_bytes -eq $currentBytes.Length })
        if ($alreadyWritten.Count -gt 0) { continue }
        $match = @($group.Group | Where-Object { $_.allowed_current_sha256 -ceq $currentHash -and [int64]$_.allowed_current_bytes -eq $currentBytes.Length })
        if ($match.Count -ne 1) { throw "No unique rollback-witness variant matches: $($group.Name)" }
        $suffixPath = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$match[0].suffix_path)
        $suffix = [IO.File]::ReadAllBytes($suffixPath)
        if ((Get-G3E2RBytesSha256 -Bytes $suffix) -ne $match[0].suffix_sha256) { throw "Rollback witness suffix mismatch: $($group.Name)" }
        $final = New-Object byte[] ($currentBytes.Length + $suffix.Length)
        [Array]::Copy($currentBytes, 0, $final, 0, $currentBytes.Length)
        [Array]::Copy($suffix, 0, $final, $currentBytes.Length, $suffix.Length)
        if ($final.Length -ne [int64]$match[0].expected_post_bytes -or (Get-G3E2RBytesSha256 -Bytes $final) -ne $match[0].expected_post_sha256) {
            throw "Prepared rollback witness differs from manifest: $($group.Name)"
        }
        $parent = Split-Path -Parent $target
        $temporary = Join-Path $parent ('.g3e2r-witness-' + [guid]::NewGuid().ToString('N') + '.tmp')
        $backup = Join-Path $parent ('.g3e2r-witness-' + [guid]::NewGuid().ToString('N') + '.bak')
        try {
            [IO.File]::WriteAllBytes($temporary, $final)
            [IO.File]::Replace($temporary, $target, $backup)
            Remove-Item -LiteralPath $backup -Force
        }
        finally {
            if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary -Force }
            if (Test-Path -LiteralPath $backup) { Remove-Item -LiteralPath $backup -Force }
        }
    }
}

function Test-ReferencePrestate {
    param([object]$Seal)
    $manifest = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.hard_reference_manifest_path)
    $rows = @(Import-Csv -LiteralPath $manifest | Where-Object { $_.state -in @('pre', 'both') })
    Assert-G3E2RColumns -Rows $rows -Expected @('repository_path', 'state', 'policy', 'expected_sha256', 'expected_legacy_tokens') -Label 'Hard-reference manifest'
    foreach ($row in $rows) {
        if ($row.policy -eq 'advisory' -and $row.repository_path -cne '.obsidian/workspace.json') { throw 'Only workspace.json may be Advisory.' }
        if ($row.policy -eq 'advisory' -and $row.repository_path -ceq '.obsidian/workspace.json') { continue }
        $path = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.repository_path)
        $text = Get-Content -Raw -LiteralPath $path -Encoding UTF8
        $count = ([regex]::Matches($text, [regex]::Escape([string]$Seal.legacy_token))).Count
        if ($count -ne [int]$row.expected_legacy_tokens) { throw "Reverse reference token mismatch: $($row.repository_path)" }
        if ($row.policy -eq 'exact' -and (Get-G3E2RSha256 -LiteralPath $path) -cne $row.expected_sha256) {
            throw "Reverse reference hash mismatch: $($row.repository_path)"
        }
    }
}

function Test-NoResidue {
    $residue = @(Get-ChildItem -LiteralPath $root -Recurse -Force -File -ErrorAction Stop | Where-Object {
        $_.Name -match '^\.g3e2r-.*\.(tmp|bak)$' -or $_.Name -match '^\.g3e1-.*\.(tmp|bak)$'
    })
    if ($residue.Count -gt 0) { throw "Transaction residue remains: $($residue[0].FullName)" }
}

$null = Test-RepairBundle
$dependencies = Import-G3E2RDependencyLock -VaultRoot $root -LockPath $dependencyPath
$components = @(Import-Csv -LiteralPath $componentPath)
if ($components.Count -ne 95 -or @($components.move_id | Sort-Object -Unique).Count -ne 95) {
    throw 'Reverse component manifest must contain 95 unique rows.'
}
$reverseRows = Import-G3E2RTransactionManifest -LiteralPath $reversePath -Prefix REV -ExpectedCount 12
if ($Mode -eq 'Validate') {
    $result = [ordered]@{ contract = 'g3e2r-reverse/v2'; verdict = 'PASS'; mode = $Mode; reverse = 12; authority_effect = 'none' }
}
elseif ($Mode -eq 'Simulate') {
    $result = [ordered]@{ contract = 'g3e2r-reverse/v2'; verdict = 'REVERSED_ROUTING_FROZEN'; mode = $Mode; completed = @($reverseRows.step_id); routing_state = 'frozen'; authority_effect = 'none' }
}
else {
    if (-not $AllowLiveMutation -or -not $AllowReverse) { throw 'Apply requires -AllowLiveMutation and -AllowReverse.' }
    if (-not (Test-G3E2RAdministrator)) { throw 'Reverse Apply requires an explicitly elevated process.' }
    if ([string]::IsNullOrWhiteSpace($SealEnvelope) -or [string]::IsNullOrWhiteSpace($PythonExecutable) -or [string]::IsNullOrWhiteSpace($ExpectedA1Hash) -or [string]::IsNullOrWhiteSpace($ExpectedSealHash)) { throw 'Reverse Apply requires SealEnvelope, PythonExecutable, ExpectedA1Hash, and ExpectedSealHash.' }
    $mutex = Enter-G3E2RA1Mutex -VaultRoot $root
    $resolvedSeal = [IO.Path]::GetFullPath($SealEnvelope)
    if (-not $resolvedSeal.StartsWith($root + '\', [StringComparison]::OrdinalIgnoreCase)) { throw 'Live seal must remain inside the Vault.' }
    $SealEnvelope = $resolvedSeal
    $expected = @{
        repair_bundle_manifest_sha256 = Get-G3E2RSha256 -LiteralPath $bundlePath
        dependency_lock_sha256 = Get-G3E2RSha256 -LiteralPath $dependencyPath
        component_transition_manifest_sha256 = Get-G3E2RSha256 -LiteralPath $componentPath
        forward_transaction_sha256 = Get-G3E2RSha256 -LiteralPath $forwardPath
        reverse_transaction_sha256 = Get-G3E2RSha256 -LiteralPath $reversePath
    }
    $runtimeBindings = Get-G3E2RA1RuntimeBindings -Context $context -PythonExecutable $PythonExecutable
    $seal = Read-G3E2RA1SealV2 -Context $context -LiteralPath $SealEnvelope -ExpectedA1Hash $ExpectedA1Hash -ExpectedSealHash $ExpectedSealHash -ActualRuntimeBindings $runtimeBindings -Use Reverse
    $seal = Add-G3E2RA1CompatibilityProperties -Seal $seal
    Test-G3E2RA1BManifest -Context $context -Seal $seal
    Test-G3E2RA1WorkspaceAdvisory -Context $context -Seal $seal
    $gitRuntime = [string](@($runtimeBindings | Where-Object runtime_id -CEQ 'GIT')[0].executable_path)
    $rgRuntime = [string](@($runtimeBindings | Where-Object runtime_id -CEQ 'RIPGREP')[0].executable_path)
    Assert-G3E2RA1GitStagingEmpty -VaultRoot $root -GitExecutable $gitRuntime
    $externalDriftBefore = @(Test-G3E2RA1LiveInvariants -Context $context -Seal $seal -State pre-reverse -AdvisoryExternalDrift)
    Assert-SealFileBindings -Seal $seal
    $null = Invoke-Snapshot -Command VerifyBundle -Seal $seal
    $null = Invoke-Snapshot -Command RestorePlan -Seal $seal
    $null = Invoke-Snapshot -Command Restore -Seal $seal -Restore
    Remove-ApprovedComponentTargets -Components $components
    Remove-ApprovedCreatedPaths -Seal $seal
    Add-RollbackWitnesses -Seal $seal
    $wrapperManifest = (Get-G3E2RDependency -Lock $dependencies -Id 'G3E1-WRAPPER').Path
    $null = Invoke-G3E2RBoundProcess -FilePath $PythonExecutable -ArgumentList @(
        $wrapperTool, '--vault-root', $root, '--manifest', $wrapperManifest, '--mode', 'check', '--state', 'pre'
    ) -TimeoutSeconds 90 -WorkingDirectory $root
    $null = Invoke-Snapshot -Command CheckFunctionalPrestate -Seal $seal
    Invoke-MosRegression
    Test-ReferencePrestate -Seal $seal
    Test-G3E2RA1HardReferences -Context $context -Seal $seal -State reverse -RipgrepExecutable $rgRuntime
    $externalDriftAfter = @(Test-G3E2RA1LiveInvariants -Context $context -Seal $seal -State reverse -AdvisoryExternalDrift)
    Assert-G3E2RA1GitStagingEmpty -VaultRoot $root -GitExecutable $gitRuntime
    Assert-G3E2RA1NoResidue -VaultRoot $root
    Test-NoResidue
    Invoke-RootFast
    $result = [ordered]@{ contract = 'g3e2r-reverse/v2'; verdict = 'REVERSED_ROUTING_FROZEN'; mode = $Mode; transaction_id = $seal.transaction_id; completed = @($reverseRows.step_id); routing_state = 'frozen'; external_drift = @($externalDriftBefore + $externalDriftAfter | Sort-Object invariant_id,repository_path -Unique) }
    Exit-G3E2RA1Mutex -Mutex $mutex
}

if ($Json) { $result | ConvertTo-Json -Depth 6 -Compress }
else { Write-Output "$($result.verdict) | mode=$Mode | reverse steps=$(@($reverseRows).Count) | routing frozen" }
