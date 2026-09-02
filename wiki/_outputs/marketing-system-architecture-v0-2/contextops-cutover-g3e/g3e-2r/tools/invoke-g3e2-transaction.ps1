[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('Validate', 'Simulate', 'Apply')][string]$Mode,
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$RepairRoot,
    [string]$SealEnvelope,
    [string]$PythonExecutable,
    [string]$FailAtStep,
    [switch]$AllowLiveMutation,
    [switch]$AllowAutomaticReverse,
    [switch]$AllowCapabilityProbe,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($RepairRoot)) { $RepairRoot = Join-Path $PSScriptRoot '..' }
$repair = (Resolve-Path -LiteralPath $RepairRoot).Path.TrimEnd('\')
$root = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
Import-Module (Join-Path $repair 'tools/g3e2r-transaction-lib.psm1') -Force

$dependencyPath = Join-Path $repair 'dependency-lock.csv'
$bundlePath = Join-Path $repair 'repair-bundle-manifest.csv'
$componentPath = Join-Path $repair 'manifests/component-transition-manifest.csv'
$forwardPath = Join-Path $repair 'manifests/forward-transaction.csv'
$reversePath = Join-Path $repair 'manifests/reverse-transaction.csv'
$snapshotTool = Join-Path $repair 'tools/manage-scoped-cutover-snapshot.ps1'
$wrapperTool = Join-Path $repair 'tools/sync_agents_skills.py'
$reverseTool = Join-Path $repair 'tools/invoke-g3e2-reverse.ps1'
$powerShellExecutable = (Get-Process -Id $PID).Path

function Test-RepairBundle {
    $rows = @(Import-Csv -LiteralPath $bundlePath)
    Assert-G3E2RColumns -Rows $rows -Expected @('role', 'overlay_path', 'sha256', 'bytes') -Label 'Repair bundle manifest'
    if ($rows.Count -ne 14) { throw "Repair bundle must bind fourteen files; found $($rows.Count)." }
    if (@($rows.overlay_path | Sort-Object -Unique).Count -ne 14) { throw 'Repair bundle paths must be unique.' }
    foreach ($row in $rows) {
        $path = [IO.Path]::GetFullPath((Join-Path $repair ([string]$row.overlay_path).Replace('/', '\')))
        if (-not $path.StartsWith($repair + '\', [StringComparison]::OrdinalIgnoreCase)) { throw "Repair bundle path escapes: $($row.overlay_path)" }
        if ((Get-Item -LiteralPath $path).Length -ne [int64]$row.bytes -or (Get-G3E2RSha256 -LiteralPath $path) -ne $row.sha256) {
            throw "Repair bundle identity mismatch: $($row.overlay_path)"
        }
    }
    $actual = @(Get-ChildItem -LiteralPath $repair -Recurse -File | ForEach-Object {
        $_.FullName.Substring($repair.Length + 1).Replace('\', '/')
    })
    $expected = @($rows.overlay_path) + 'repair-bundle-manifest.csv'
    if ($actual.Count -ne 15 -or @(Compare-Object ($expected | Sort-Object) ($actual | Sort-Object)).Count -ne 0) {
        throw 'Overlay file inventory differs from the exact fifteen-file contract.'
    }
    return @($rows)
}

function Test-ComponentManifest {
    param([hashtable]$Dependencies)

    $rows = @(Import-Csv -LiteralPath $componentPath)
    Assert-G3E2RColumns -Rows $rows -Expected @(
        'move_id', 'source_path', 'target_path', 'move_mode', 'pre_sha256', 'pre_bytes',
        'post_sha256', 'post_bytes', 'refactor_id', 'operation_count', 'identity_state',
        'rollback_policy', 'dependency_binding'
    ) -Label 'Component transition manifest'
    if ($rows.Count -ne 95 -or @($rows.move_id | Sort-Object -Unique).Count -ne 95) {
        throw 'Component transition must contain 95 unique move ids.'
    }
    if (@($rows | Where-Object { $_.post_sha256 -notmatch '^[A-F0-9]{64}$' -or $_.post_sha256 -match 'pending' }).Count -gt 0) {
        throw 'Component transition contains a missing or placeholder post hash.'
    }
    if (@($rows | Where-Object identity_state -eq 'byte-identical').Count -ne 74 -or
        @($rows | Where-Object identity_state -eq 'reviewed-refactor-candidate').Count -ne 21) {
        throw 'Component identity split must be 74 byte-identical and 21 refactored.'
    }
    $moves = @(Import-Csv -LiteralPath (Get-G3E2RDependency -Lock $Dependencies -Id 'G3E1-MOVE').Path)
    $posts = @(Import-Csv -LiteralPath (Get-G3E2RDependency -Lock $Dependencies -Id 'G3E1-COMPONENT-POST').Path)
    foreach ($row in $rows) {
        $move = @($moves | Where-Object move_id -CEQ $row.move_id)
        $post = @($posts | Where-Object move_id -CEQ $row.move_id)
        if ($move.Count -ne 1 -or $post.Count -ne 1) { throw "Component join is not one-to-one: $($row.move_id)" }
        if ($row.source_path -cne $move[0].source_path -or $row.target_path -cne $move[0].target_path -or
            $row.pre_sha256 -cne $move[0].pre_sha256 -or [int64]$row.pre_bytes -ne [int64]$move[0].bytes -or
            $row.post_sha256 -cne $post[0].post_sha256 -or [int64]$row.post_bytes -ne [int64]$post[0].post_bytes -or
            $row.refactor_id -cne $post[0].refactor_id -or [int]$row.operation_count -ne [int]$post[0].operation_count) {
            throw "Component join differs from locked inputs: $($row.move_id)"
        }
        $null = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.source_path) -ForMutation
        $null = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.target_path) -ForMutation
    }
    return @($rows)
}

function Get-StaticState {
    $bundle = Test-RepairBundle
    $dependencies = Import-G3E2RDependencyLock -VaultRoot $root -LockPath $dependencyPath
    $components = Test-ComponentManifest -Dependencies $dependencies
    $forward = Import-G3E2RTransactionManifest -LiteralPath $forwardPath -Prefix FWD -ExpectedCount 19
    $reverse = Import-G3E2RTransactionManifest -LiteralPath $reversePath -Prefix REV -ExpectedCount 12
    return [pscustomobject]@{ Bundle = $bundle; Dependencies = $dependencies; Components = $components; Forward = $forward; Reverse = $reverse }
}

function Assert-ComponentPrestate {
    param([object[]]$Rows)
    foreach ($row in $Rows) {
        $source = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.source_path) -ForMutation
        $target = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.target_path) -ForMutation
        if (-not (Test-Path -LiteralPath $source -PathType Leaf) -or (Get-G3E2RSha256 -LiteralPath $source) -ne $row.pre_sha256 -or
            (Get-Item -LiteralPath $source).Length -ne [int64]$row.pre_bytes) {
            throw "Component prestate mismatch: $($row.move_id)"
        }
        if (Test-Path -LiteralPath $target) { throw "Component target collision: $($row.target_path)" }
    }
}

function Assert-ComponentPoststate {
    param([object[]]$Rows)
    foreach ($row in $Rows) {
        $source = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.source_path)
        $target = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.target_path)
        if (Test-Path -LiteralPath $source) { throw "Component source remains after move: $($row.source_path)" }
        if (-not (Test-Path -LiteralPath $target -PathType Leaf) -or (Get-G3E2RSha256 -LiteralPath $target) -ne $row.post_sha256) {
            throw "Component poststate mismatch: $($row.move_id)"
        }
    }
}

function Assert-SealFileBindings {
    param([object]$Seal)
    $bindings = @(
        @('snapshot_selection_path', 'snapshot_selection_sha256'),
        @('exact_poststate_manifest_path', 'exact_poststate_manifest_sha256'),
        @('exact_poststate_archive_path', 'exact_poststate_archive_sha256'),
        @('hard_reference_manifest_path', 'hard_reference_manifest_sha256'),
        @('restore_current_manifest_path', 'restore_current_manifest_sha256'),
        @('rollback_witness_manifest_path', 'rollback_witness_manifest_sha256')
    )
    foreach ($binding in $bindings) {
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

function Invoke-Wrapper {
    param([string]$ModeName, [string]$State, [object]$Static)
    if ([string]::IsNullOrWhiteSpace($PythonExecutable)) { throw 'Wrapper operation requires -PythonExecutable.' }
    $manifest = (Get-G3E2RDependency -Lock $Static.Dependencies -Id 'G3E1-WRAPPER').Path
    return Invoke-G3E2RBoundProcess -FilePath $PythonExecutable -ArgumentList @(
        $wrapperTool, '--vault-root', $root, '--manifest', $manifest, '--mode', $ModeName, '--state', $State
    ) -TimeoutSeconds 90 -WorkingDirectory $root
}

function Test-ReferenceState {
    param([object]$Seal, [ValidateSet('pre', 'post')][string]$State)
    $manifestPath = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$Seal.hard_reference_manifest_path)
    $rows = @(Import-Csv -LiteralPath $manifestPath | Where-Object { $_.state -in @($State, 'both') })
    Assert-G3E2RColumns -Rows $rows -Expected @('repository_path', 'state', 'policy', 'expected_sha256', 'expected_legacy_tokens') -Label 'Hard-reference manifest'
    $allowedPaths = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($row in $rows) {
        if ($row.policy -eq 'advisory' -and $row.repository_path -cne '.obsidian/workspace.json') { throw 'Only workspace.json may be Advisory.' }
        $path = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.repository_path)
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Reference path is missing: $($row.repository_path)" }
        $text = Get-Content -Raw -LiteralPath $path -Encoding UTF8
        $count = ([regex]::Matches($text, [regex]::Escape([string]$Seal.legacy_token))).Count
        if ($count -ne [int]$row.expected_legacy_tokens) { throw "Legacy token count mismatch: $($row.repository_path)" }
        if ($row.policy -eq 'exact' -and (Get-G3E2RSha256 -LiteralPath $path) -cne $row.expected_sha256) {
            throw "Reference exact hash mismatch: $($row.repository_path)"
        }
        $null = $allowedPaths.Add(([string]$row.repository_path).Replace('\', '/'))
    }
    $rg = (Get-Command rg -ErrorAction Stop).Source
    $scan = Invoke-G3E2RBoundProcess -FilePath $rg -ArgumentList @(
        '--files-with-matches', '--fixed-strings', '--hidden', '--no-ignore',
        '--glob', '!.git/**', '--glob', '!wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/**',
        [string]$Seal.legacy_token, $root
    ) -TimeoutSeconds 120 -WorkingDirectory $root
    $actualPaths = @($scan.StdOut -split "`r?`n" | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | ForEach-Object {
        $full = [IO.Path]::GetFullPath($_)
        $full.Substring($root.Length + 1).Replace('\', '/')
    })
    foreach ($path in $actualPaths) {
        if (-not $allowedPaths.Contains($path)) { throw "Unmanifested Legacy literal reference: $path" }
    }
    foreach ($path in $allowedPaths) {
        $row = @($rows | Where-Object repository_path -CEQ $path)
        if ($row.Count -gt 0 -and [int]$row[0].expected_legacy_tokens -gt 0 -and $path -notin $actualPaths) {
            throw "Expected Legacy literal reference was not discovered: $path"
        }
    }
}

function Move-Components {
    param([object[]]$Rows)
    foreach ($row in $Rows) {
        $source = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.source_path) -ForMutation
        $target = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.target_path) -ForMutation
        $parent = Split-Path -Parent $target
        if (-not (Test-Path -LiteralPath $parent -PathType Container)) { $null = New-Item -ItemType Directory -Path $parent -Force }
        [IO.File]::Move($source, $target)
    }
}

$static = Get-StaticState
if ($Mode -eq 'Validate') {
    $result = [ordered]@{ contract = 'g3e2r-transaction/v1'; verdict = 'PASS'; mode = $Mode; dependencies = 14; components = 95; forward = 19; reverse = 12; authority_effect = 'none' }
}
elseif ($Mode -eq 'Simulate') {
    if (-not [string]::IsNullOrWhiteSpace($FailAtStep) -and $FailAtStep -notin @($static.Forward.step_id)) { throw "Unknown simulation failure step: $FailAtStep" }
    $mutationStarted = $false
    $completed = [Collections.Generic.List[string]]::new()
    foreach ($step in $static.Forward) {
        if ([int]$step.sequence -ge 10) { $mutationStarted = $true }
        if ($step.step_id -ceq $FailAtStep) { break }
        $completed.Add([string]$step.step_id)
    }
    if ([string]::IsNullOrWhiteSpace($FailAtStep)) {
        $result = [ordered]@{ contract = 'g3e2r-transaction/v1'; verdict = 'PASS_ROUTING_FROZEN'; mode = $Mode; completed = @($completed); reverse_invoked = $false; authority_effect = 'none' }
    }
    elseif (-not $mutationStarted) {
        $result = [ordered]@{ contract = 'g3e2r-transaction/v1'; verdict = 'HOLD_NO_MUTATION'; mode = $Mode; failed_step = $FailAtStep; completed = @($completed); reverse_invoked = $false; authority_effect = 'none' }
    }
    else {
        $reverseResult = & $reverseTool -Mode Simulate -VaultRoot $root -RepairRoot $repair -Json | ConvertFrom-Json
        if ($reverseResult.verdict -cne 'REVERSED_ROUTING_FROZEN') { throw 'Reverse simulation did not reach its closed state.' }
        $result = [ordered]@{ contract = 'g3e2r-transaction/v1'; verdict = 'REVERSED_ROUTING_FROZEN'; mode = $Mode; failed_step = $FailAtStep; completed = @($completed); reverse_invoked = $true; reverse_steps = @($reverseResult.completed); authority_effect = 'none' }
    }
}
else {
    if (-not $AllowLiveMutation -or -not $AllowAutomaticReverse -or -not $AllowCapabilityProbe) {
        throw 'Apply requires -AllowLiveMutation, -AllowAutomaticReverse, and -AllowCapabilityProbe.'
    }
    if (-not (Test-G3E2RAdministrator)) { throw 'Apply requires one explicitly elevated runner process.' }
    if ([string]::IsNullOrWhiteSpace($SealEnvelope)) { throw 'Apply requires a G3E2R-B live seal.' }
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
    $seal = Read-G3E2RSeal -LiteralPath $SealEnvelope -ExpectedBindings $expected
    Assert-SealFileBindings -Seal $seal
    $mutationStarted = $false
    try {
        Assert-ComponentPrestate -Rows $static.Components
        $null = Invoke-Wrapper -ModeName check -State pre -Static $static
        $null = Invoke-Wrapper -ModeName capability-probe -State pre -Static $static
        $null = Invoke-Snapshot -Command VerifyBundle -Seal $seal
        $null = Invoke-Snapshot -Command CheckLivePreState -Seal $seal
        $null = Invoke-Snapshot -Command RestorePlan -Seal $seal
        Invoke-RootFast
        Invoke-MosRegression
        Test-ReferenceState -Seal $seal -State pre

        Assert-ComponentPrestate -Rows $static.Components
        $mutationStarted = $true
        Move-Components -Rows $static.Components
        $componentTool = (Get-G3E2RDependency -Lock $static.Dependencies -Id 'G3E1-APPLY-COMPONENT').Path
        $null = Invoke-PowerShellTool -Script $componentTool -Arguments @(
            '-Mode', 'Apply', '-VaultRoot', $root,
            '-MoveManifest', (Get-G3E2RDependency -Lock $static.Dependencies -Id 'G3E1-MOVE').Path,
            '-RefactorSpec', (Get-G3E2RDependency -Lock $static.Dependencies -Id 'G3E1-REFACTOR-SPEC').Path,
            '-PostHashManifest', (Get-G3E2RDependency -Lock $static.Dependencies -Id 'G3E1-COMPONENT-POST').Path
        ) -Timeout 180
        $postTool = (Get-G3E2RDependency -Lock $static.Dependencies -Id 'G3E1-APPLY-POSTSTATE').Path
        $null = Invoke-PowerShellTool -Script $postTool -Arguments @(
            '-Mode', 'Apply', '-VaultRoot', $root,
            '-ManifestPath', (Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$seal.exact_poststate_manifest_path)),
            '-ArchivePath', (Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$seal.exact_poststate_archive_path))
        ) -Timeout 180
        $null = Invoke-Wrapper -ModeName apply -State post -Static $static
        Assert-ComponentPoststate -Rows $static.Components
        $null = Invoke-PowerShellTool -Script $postTool -Arguments @(
            '-Mode', 'CheckPost', '-VaultRoot', $root,
            '-ManifestPath', (Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$seal.exact_poststate_manifest_path)),
            '-ArchivePath', (Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$seal.exact_poststate_archive_path))
        ) -Timeout 180
        $null = Invoke-Wrapper -ModeName check -State post -Static $static
        Test-ReferenceState -Seal $seal -State post
        Invoke-MosRegression
        Invoke-RootFast
        $result = [ordered]@{ contract = 'g3e2r-transaction/v1'; verdict = 'PASS_ROUTING_FROZEN'; mode = $Mode; transaction_id = $seal.transaction_id; seal_sha256 = Get-G3E2RSha256 -LiteralPath $SealEnvelope; completed = @($static.Forward.step_id); reverse_invoked = $false; routing_state = 'frozen' }
    }
    catch {
        $forwardError = $_
        if ($mutationStarted) {
            try {
                $null = Invoke-PowerShellTool -Script $reverseTool -Arguments @(
                    '-Mode', 'Apply', '-VaultRoot', $root, '-RepairRoot', $repair,
                    '-SealEnvelope', $SealEnvelope, '-PythonExecutable', $PythonExecutable,
                    '-AllowLiveMutation', '-AllowReverse'
                ) -Timeout 900
            }
            catch { throw "Forward failed and automatic reverse also failed. Forward: $forwardError Reverse: $_" }
            throw "Forward failed after mutation; complete reverse passed and routing remains frozen. Cause: $forwardError"
        }
        throw $forwardError
    }
}

if ($Json) { $result | ConvertTo-Json -Depth 8 -Compress }
else { Write-Output "$($result.verdict) | mode=$Mode | routing frozen | authority effect: none unless separately sealed Apply completed" }
