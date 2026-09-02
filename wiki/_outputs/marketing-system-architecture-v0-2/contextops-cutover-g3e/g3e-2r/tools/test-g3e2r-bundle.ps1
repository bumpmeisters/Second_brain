[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$VaultRoot,
    [string]$RepairRoot,
    [Parameter(Mandatory = $true)][string]$PythonExecutable,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($RepairRoot)) { $RepairRoot = Join-Path $PSScriptRoot '..' }
$root = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
$repair = (Resolve-Path -LiteralPath $RepairRoot).Path.TrimEnd('\')
Import-Module (Join-Path $repair 'tools/g3e2r-transaction-lib.psm1') -Force

$runner = Join-Path $repair 'tools/invoke-g3e2-transaction.ps1'
$reverse = Join-Path $repair 'tools/invoke-g3e2-reverse.ps1'
$snapshotTool = Join-Path $repair 'tools/manage-scoped-cutover-snapshot.ps1'
$wrapperTool = Join-Path $repair 'tools/sync_agents_skills.py'
$candidateTest = Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/tools/test-candidate-bundle.ps1'
$candidateRoot = Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate'
$powerShellExecutable = (Get-Process -Id $PID).Path
$checks = [Collections.Generic.List[string]]::new()

function Get-TreeFingerprint {
    param([string]$LiteralPath)
    $base = (Resolve-Path -LiteralPath $LiteralPath).Path.TrimEnd('\')
    $rows = @(Get-ChildItem -LiteralPath $base -Recurse -File | ForEach-Object {
        [pscustomobject]@{
            repository_path = $_.FullName.Substring($base.Length + 1).Replace('\', '/')
            sha256 = Get-G3E2RSha256 -LiteralPath $_.FullName
            bytes = $_.Length
        }
    })
    return Get-G3E2RFingerprintV2 -Rows $rows
}

function Get-LiveFingerprint {
    $components = @(Import-Csv -LiteralPath (Join-Path $repair 'manifests/component-transition-manifest.csv'))
    $wrapperManifest = @(Import-Csv -LiteralPath (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/manifests/wrapper-transition-manifest.csv'))
    $referencePaths = @((Import-Csv -LiteralPath (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/reference-transition.csv')).referencing_path)
    $protectedPaths = @((Import-Csv -LiteralPath (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/component-register.csv') | Where-Object protection_class -eq 'protected-raw').current_path)
    $mosRoot = Join-Path $root 'projects/marketing-operating-system'
    $mosPaths = @(Get-ChildItem -LiteralPath $mosRoot -Recurse -File | ForEach-Object { $_.FullName.Substring($root.Length + 1).Replace('\', '/') })
    $paths = @($components.source_path) + @($wrapperManifest.wrapper_path) + $referencePaths + $protectedPaths + $mosPaths + @(
        'projects/marketing-contextops/AGENTS.md',
        'projects/marketing-contextops/README.md',
        'projects/marketing-contextops/decisions/log.md',
        'projects/marketing-operating-system/AGENTS.md',
        'projects/abm-operating-system/AGENTS.md',
        'projects/content-operating-system/AGENTS.md',
        'projects/company-workspaces/AGENTS.md'
    )
    $rows = @(foreach ($path in @($paths | Sort-Object -Unique)) {
        $full = Resolve-G3E2RInRoot -Root $root -RepositoryPath $path
        if (-not (Test-Path -LiteralPath $full -PathType Leaf)) { throw "Live baseline path is missing: $path" }
        [pscustomobject]@{ repository_path = $path; sha256 = Get-G3E2RSha256 -LiteralPath $full; bytes = (Get-Item -LiteralPath $full).Length }
    })
    return Get-G3E2RFingerprintV2 -Rows $rows
}

function Invoke-CheckedProcess {
    param([string]$FilePath, [string[]]$Arguments, [int]$Timeout = 300)
    return Invoke-G3E2RBoundProcess -FilePath $FilePath -ArgumentList $Arguments -TimeoutSeconds $Timeout -WorkingDirectory $root
}

function Invoke-CheckedPowerShell {
    param([string]$Script, [string[]]$Arguments, [int]$Timeout = 300)
    return Invoke-CheckedProcess -FilePath $powerShellExecutable -Arguments (@('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $Script) + $Arguments) -Timeout $Timeout
}

function Write-Utf8NoBom {
    param([string]$LiteralPath, [string]$Text)
    $parent = Split-Path -Parent $LiteralPath
    if (-not (Test-Path -LiteralPath $parent -PathType Container)) { $null = New-Item -ItemType Directory -Path $parent -Force }
    [IO.File]::WriteAllText($LiteralPath, $Text, [Text.UTF8Encoding]::new($false))
}

$g3e1Before = Get-TreeFingerprint -LiteralPath (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1')
$liveBefore = Get-LiveFingerprint
$workspaceAdvisory = Join-Path $root '.obsidian/workspace.json'
$workspaceAdvisoryBefore = if (Test-Path -LiteralPath $workspaceAdvisory -PathType Leaf) { Get-G3E2RSha256 -LiteralPath $workspaceAdvisory } else { 'ABSENT' }
$stagingBefore = @(git -C $root diff --cached --name-only)
$temporaryRoot = [IO.Path]::GetFullPath((Join-Path ([IO.Path]::GetTempPath()) ('g3e2r-a-' + [guid]::NewGuid().ToString('N'))))
$systemTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\')
if (-not $temporaryRoot.StartsWith($systemTemp + '\', [StringComparison]::OrdinalIgnoreCase)) { throw 'Temporary fixture escaped the system temp root.' }

try {
    $null = New-Item -ItemType Directory -Path $temporaryRoot

    $null = Invoke-CheckedPowerShell -Script $candidateTest -Arguments @('-CandidateRoot', $candidateRoot)
    $checks.Add('g3e1-candidate-pre-30-of-30')

    foreach ($file in Get-ChildItem -LiteralPath (Join-Path $repair 'tools') -File | Where-Object Extension -in @('.ps1', '.psm1')) {
        $tokens = $null
        $errors = $null
        [Management.Automation.Language.Parser]::ParseFile($file.FullName, [ref]$tokens, [ref]$errors) | Out-Null
        if ($errors.Count -gt 0) { throw "PowerShell syntax failure: $($file.Name): $($errors[0].Message)" }
    }
    $null = Invoke-CheckedProcess -FilePath $PythonExecutable -Arguments @(
        '-c', 'import ast,pathlib,sys; ast.parse(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))', $wrapperTool
    ) -Timeout 45
    $checks.Add('tool-syntax')

    $validate = & $runner -Mode Validate -VaultRoot $root -RepairRoot $repair -Json | ConvertFrom-Json
    if ($validate.verdict -cne 'PASS') { throw 'Forward validator did not pass.' }
    $reverseValidate = & $reverse -Mode Validate -VaultRoot $root -RepairRoot $repair -Json | ConvertFrom-Json
    if ($reverseValidate.verdict -cne 'PASS') { throw 'Reverse validator did not pass.' }
    $checks.Add('static-contracts')

    $success = & $runner -Mode Simulate -VaultRoot $root -RepairRoot $repair -Json | ConvertFrom-Json
    $preFailure = & $runner -Mode Simulate -VaultRoot $root -RepairRoot $repair -FailAtStep FWD-006 -Json | ConvertFrom-Json
    $postFailure = & $runner -Mode Simulate -VaultRoot $root -RepairRoot $repair -FailAtStep FWD-011 -Json | ConvertFrom-Json
    if ($success.verdict -cne 'PASS_ROUTING_FROZEN' -or $preFailure.verdict -cne 'HOLD_NO_MUTATION' -or
        $postFailure.verdict -cne 'REVERSED_ROUTING_FROZEN' -or -not [bool]$postFailure.reverse_invoked) {
        throw 'Transaction state-machine simulation failed.'
    }
    $checks.Add('state-machine-success-hold-reverse')

    $applyBlocked = $false
    try { $null = & $runner -Mode Apply -VaultRoot $root -RepairRoot $repair } catch { $applyBlocked = $true }
    if (-not $applyBlocked) { throw 'Unsealed Apply did not fail closed.' }
    $checks.Add('unsealed-apply-blocked')

    $componentRows = @(Import-Csv -LiteralPath (Join-Path $repair 'manifests/component-transition-manifest.csv'))
    foreach ($row in $componentRows) {
        $source = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.source_path)
        $target = Resolve-G3E2RInRoot -Root $temporaryRoot -RepositoryPath ([string]$row.target_path)
        $parent = Split-Path -Parent $target
        if (-not (Test-Path -LiteralPath $parent)) { $null = New-Item -ItemType Directory -Path $parent -Force }
        Copy-Item -LiteralPath $source -Destination $target
    }
    $wrapperRows = @(Import-Csv -LiteralPath (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/manifests/wrapper-transition-manifest.csv'))
    foreach ($row in $wrapperRows) {
        $source = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$row.wrapper_path)
        $target = Resolve-G3E2RInRoot -Root $temporaryRoot -RepositoryPath ([string]$row.wrapper_path)
        $parent = Split-Path -Parent $target
        if (-not (Test-Path -LiteralPath $parent)) { $null = New-Item -ItemType Directory -Path $parent -Force }
        Copy-Item -LiteralPath $source -Destination $target
    }
    $frameworkBuilder = @($wrapperRows | Where-Object action -eq 'verify-only')[0]
    $frameworkSource = Resolve-G3E2RInRoot -Root $root -RepositoryPath ([string]$frameworkBuilder.canonical_pre_path)
    $frameworkTarget = Resolve-G3E2RInRoot -Root $temporaryRoot -RepositoryPath ([string]$frameworkBuilder.canonical_pre_path)
    $frameworkParent = Split-Path -Parent $frameworkTarget
    if (-not (Test-Path -LiteralPath $frameworkParent)) { $null = New-Item -ItemType Directory -Path $frameworkParent -Force }
    Copy-Item -LiteralPath $frameworkSource -Destination $frameworkTarget

    $componentTool = Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/tools/apply-component-refactors.ps1'
    $null = Invoke-CheckedPowerShell -Script $componentTool -Arguments @(
        '-Mode', 'Apply', '-VaultRoot', $temporaryRoot,
        '-MoveManifest', (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/move-manifest.csv'),
        '-RefactorSpec', (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/specs/component-refactor-operations.json'),
        '-PostHashManifest', (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/manifests/component-posthashes.csv')
    ) -Timeout 180
    $wrapperManifest = Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/manifests/wrapper-transition-manifest.csv'
    $null = Invoke-CheckedProcess -FilePath $PythonExecutable -Arguments @(
        $wrapperTool, '--vault-root', $temporaryRoot, '--manifest', $wrapperManifest, '--mode', 'capability-probe', '--state', 'pre'
    ) -Timeout 90
    $null = Invoke-CheckedProcess -FilePath $PythonExecutable -Arguments @(
        $wrapperTool, '--vault-root', $temporaryRoot, '--manifest', $wrapperManifest, '--mode', 'apply', '--state', 'post'
    ) -Timeout 90
    $null = Invoke-CheckedProcess -FilePath $PythonExecutable -Arguments @(
        $wrapperTool, '--vault-root', $temporaryRoot, '--manifest', $wrapperManifest, '--mode', 'check', '--state', 'post'
    ) -Timeout 90
    $wrapperResidue = @(Get-ChildItem -LiteralPath $temporaryRoot -Recurse -Force -File | Where-Object Name -match '^\.g3e2r-(probe|wrapper)-')
    if ($wrapperResidue.Count -ne 0) { throw 'Wrapper fixture left residue.' }
    $checks.Add('isolated-wrapper-probe-and-apply')

    $snapshotRoot = Join-Path $temporaryRoot 'snapshot-fixture'
    $null = New-Item -ItemType Directory -Path (Join-Path $snapshotRoot 'data') -Force
    Write-Utf8NoBom -LiteralPath (Join-Path $snapshotRoot 'data/append.log') -Text "base`n"
    Write-Utf8NoBom -LiteralPath (Join-Path $snapshotRoot 'data/exact.md') -Text "exact-pre`n"
    Write-Utf8NoBom -LiteralPath (Join-Path $snapshotRoot 'data/verify.md') -Text "verify`n"
    $selectionDraft = @(
        [pscustomobject]@{ repository_path = 'data/append.log'; sha256 = Get-G3E2RSha256 -LiteralPath (Join-Path $snapshotRoot 'data/append.log'); bytes = (Get-Item -LiteralPath (Join-Path $snapshotRoot 'data/append.log')).Length },
        [pscustomobject]@{ repository_path = 'data/exact.md'; sha256 = Get-G3E2RSha256 -LiteralPath (Join-Path $snapshotRoot 'data/exact.md'); bytes = (Get-Item -LiteralPath (Join-Path $snapshotRoot 'data/exact.md')).Length },
        [pscustomobject]@{ repository_path = 'data/verify.md'; sha256 = Get-G3E2RSha256 -LiteralPath (Join-Path $snapshotRoot 'data/verify.md'); bytes = (Get-Item -LiteralPath (Join-Path $snapshotRoot 'data/verify.md')).Length }
    )
    $snapshotId = 'g3e2r-' + (Get-G3E2RFingerprintV2 -Rows $selectionDraft).Substring(0, 16).ToLowerInvariant()
    $selectionRows = @(
        [pscustomobject][ordered]@{ snapshot_id = $snapshotId; repository_path = 'data/append.log'; pre_sha256 = $selectionDraft[0].sha256; bytes = $selectionDraft[0].bytes; restore_policy = 'append-only-prefix'; basis = 'isolated-test' },
        [pscustomobject][ordered]@{ snapshot_id = $snapshotId; repository_path = 'data/exact.md'; pre_sha256 = $selectionDraft[1].sha256; bytes = $selectionDraft[1].bytes; restore_policy = 'restore-exact'; basis = 'isolated-test' },
        [pscustomobject][ordered]@{ snapshot_id = $snapshotId; repository_path = 'data/verify.md'; pre_sha256 = $selectionDraft[2].sha256; bytes = $selectionDraft[2].bytes; restore_policy = 'verify-only'; basis = 'isolated-test' }
    )
    $selectionPath = Join-Path $snapshotRoot 'selection.csv'
    Write-Utf8NoBom -LiteralPath $selectionPath -Text ((@($selectionRows | ConvertTo-Csv -NoTypeInformation) -join "`n") + "`n")
    $snapshotDirectory = Join-Path $snapshotRoot 'control/snapshot'
    $null = Invoke-CheckedPowerShell -Script $snapshotTool -Arguments @('-Command', 'Capture', '-VaultRoot', $snapshotRoot, '-SelectionManifest', $selectionPath, '-SnapshotDirectory', $snapshotDirectory, '-AllowCapture')
    $null = Invoke-CheckedPowerShell -Script $snapshotTool -Arguments @('-Command', 'VerifyBundle', '-VaultRoot', $snapshotRoot, '-SelectionManifest', $selectionPath, '-SnapshotDirectory', $snapshotDirectory)
    $null = Invoke-CheckedPowerShell -Script $snapshotTool -Arguments @('-Command', 'CheckLivePreState', '-VaultRoot', $snapshotRoot, '-SelectionManifest', $selectionPath, '-SnapshotDirectory', $snapshotDirectory)
    Write-Utf8NoBom -LiteralPath (Join-Path $snapshotRoot 'data/exact.md') -Text "exact-mutated`n"
    [IO.File]::AppendAllText((Join-Path $snapshotRoot 'data/append.log'), "later`n", [Text.UTF8Encoding]::new($false))
    $mutatedExact = Join-Path $snapshotRoot 'data/exact.md'
    $allowedRows = @([pscustomobject][ordered]@{ repository_path = 'data/exact.md'; allowed_sha256 = Get-G3E2RSha256 -LiteralPath $mutatedExact })
    $allowedPath = Join-Path $snapshotRoot 'allowed-current.csv'
    Write-Utf8NoBom -LiteralPath $allowedPath -Text ((@($allowedRows | ConvertTo-Csv -NoTypeInformation) -join "`n") + "`n")
    $liveCheckBlocked = $false
    try { $null = Invoke-CheckedPowerShell -Script $snapshotTool -Arguments @('-Command', 'CheckLivePreState', '-VaultRoot', $snapshotRoot, '-SelectionManifest', $selectionPath, '-SnapshotDirectory', $snapshotDirectory) } catch { $liveCheckBlocked = $true }
    if (-not $liveCheckBlocked) { throw 'Changed fixture incorrectly passed CheckLivePreState.' }
    $null = Invoke-CheckedPowerShell -Script $snapshotTool -Arguments @('-Command', 'RestorePlan', '-VaultRoot', $snapshotRoot, '-SelectionManifest', $selectionPath, '-SnapshotDirectory', $snapshotDirectory)
    $null = Invoke-CheckedPowerShell -Script $snapshotTool -Arguments @('-Command', 'Restore', '-VaultRoot', $snapshotRoot, '-SelectionManifest', $selectionPath, '-SnapshotDirectory', $snapshotDirectory, '-AllowedCurrentManifest', $allowedPath, '-AllowRestore')
    $null = Invoke-CheckedPowerShell -Script $snapshotTool -Arguments @('-Command', 'CheckFunctionalPrestate', '-VaultRoot', $snapshotRoot, '-SelectionManifest', $selectionPath, '-SnapshotDirectory', $snapshotDirectory)
    if ((Get-Content -Raw -LiteralPath (Join-Path $snapshotRoot 'data/append.log')) -cne "base`nlater`n") { throw 'Append-only fixture did not preserve later bytes.' }
    $checks.Add('isolated-snapshot-split-and-restore')

    $null = Invoke-CheckedPowerShell -Script $candidateTest -Arguments @('-CandidateRoot', $candidateRoot)
    $checks.Add('g3e1-candidate-post-30-of-30')
}
finally {
    if (Test-Path -LiteralPath $temporaryRoot) {
        $resolvedDelete = [IO.Path]::GetFullPath($temporaryRoot)
        if (($resolvedDelete -eq $systemTemp) -or (-not $resolvedDelete.StartsWith($systemTemp + '\', [StringComparison]::OrdinalIgnoreCase))) {
            throw "Refusing unsafe temporary cleanup target: $resolvedDelete"
        }
        Remove-Item -LiteralPath $resolvedDelete -Recurse -Force
    }
}

$g3e1After = Get-TreeFingerprint -LiteralPath (Join-Path $root 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1')
$liveAfter = Get-LiveFingerprint
$workspaceAdvisoryAfter = if (Test-Path -LiteralPath $workspaceAdvisory -PathType Leaf) { Get-G3E2RSha256 -LiteralPath $workspaceAdvisory } else { 'ABSENT' }
$stagingAfter = @(git -C $root diff --cached --name-only)
if ($g3e1After -cne $g3e1Before) { throw 'G3E-1 tree changed during G3E2R-A tests.' }
if ($liveAfter -cne $liveBefore) { throw 'Live scoped state changed during isolated tests.' }
if (@(Compare-Object $stagingBefore $stagingAfter).Count -ne 0) { throw 'Git staging changed during tests.' }
$checks.Add('g3e1-live-staging-invariance')

$rootFast = Invoke-CheckedPowerShell -Script (Join-Path $root 'tools/test-wiki-integrity.ps1') -Arguments @('-Profile', 'Fast') -Timeout 300
if ($rootFast.StdOut -notmatch '(?im)0\s+errors?' -or $rootFast.StdOut -notmatch '(?im)0\s+warnings?') {
    throw "Root Fast does not prove 0/0.`n$($rootFast.StdOut)"
}
$checks.Add('root-fast-0-0')

$result = [ordered]@{
    contract = 'g3e2r-a-static-isolated-test/v1'
    verdict = 'PASS'
    checks = @($checks)
    check_count = $checks.Count
    g3e1_tree_fingerprint_before = $g3e1Before
    g3e1_tree_fingerprint_after = $g3e1After
    live_scope_fingerprint_before = $liveBefore
    live_scope_fingerprint_after = $liveAfter
    workspace_advisory_before = $workspaceAdvisoryBefore
    workspace_advisory_after = $workspaceAdvisoryAfter
    workspace_advisory_is_hard_gate = $false
    temporary_fixture_removed = -not (Test-Path -LiteralPath $temporaryRoot)
    git_staging_unchanged = $true
    authority_effect = 'none'
}
if ($Json) { $result | ConvertTo-Json -Depth 7 -Compress }
else { Write-Output "PASS | $($checks.Count) G3E2R-A gates | temporary fixture removed | G3E-1 and live scope unchanged" }
