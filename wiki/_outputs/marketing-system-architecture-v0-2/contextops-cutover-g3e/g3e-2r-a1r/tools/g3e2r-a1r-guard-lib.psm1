Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Import-G3E2RA1RPlatformModules {
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
Import-G3E2RA1RPlatformModules

function Get-G3E2RA1RSha256 {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) { throw "File is missing: $LiteralPath" }
    return (Microsoft.PowerShell.Utility\Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Get-G3E2RA1RBytes {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    return (Get-Item -LiteralPath $LiteralPath -Force).Length
}

function Resolve-G3E2RA1RInRoot {
    param([Parameter(Mandatory = $true)][string]$Root,[Parameter(Mandatory = $true)][string]$RepositoryPath,[switch]$ForMutation)
    $base = [IO.Path]::GetFullPath($Root).TrimEnd('\')
    if ([IO.Path]::IsPathRooted($RepositoryPath)) { throw "Repository path must be relative: $RepositoryPath" }
    $full = [IO.Path]::GetFullPath((Join-Path $base $RepositoryPath.Replace('/','\')))
    if (-not $full.StartsWith($base + '\',[StringComparison]::OrdinalIgnoreCase)) { throw "Repository path escapes the Vault: $RepositoryPath" }
    if ($ForMutation -and $RepositoryPath -match '^(raw|research/assets)(/|$)') { throw "Protected source mutation is forbidden: $RepositoryPath" }
    return $full
}

function Get-G3E2RA1RRepositoryPath {
    param([string]$Root,[string]$LiteralPath)
    $base = [IO.Path]::GetFullPath($Root).TrimEnd('\')
    $full = [IO.Path]::GetFullPath($LiteralPath)
    if (-not $full.StartsWith($base + '\',[StringComparison]::OrdinalIgnoreCase)) { throw "Path is outside the Vault: $LiteralPath" }
    return $full.Substring($base.Length + 1).Replace('\','/')
}

function Assert-G3E2RA1RExactProperties {
    param([Parameter(Mandatory = $true)][object]$Value,[Parameter(Mandatory = $true)][string[]]$Expected,[Parameter(Mandatory = $true)][string]$Label)
    $actual = @($Value.PSObject.Properties.Name)
    if (@(Compare-Object ($Expected | Sort-Object) ($actual | Sort-Object)).Count -ne 0) { throw "$Label properties differ from contract." }
}

function Import-G3E2RA1RExactCsv {
    param([string]$LiteralPath,[string[]]$Columns,[int]$Count,[string]$Label)
    $rows = @(Import-Csv -LiteralPath $LiteralPath)
    if ($rows.Count -ne $Count) { throw "$Label must contain $Count rows; found $($rows.Count)." }
    foreach ($row in $rows) { Assert-G3E2RA1RExactProperties -Value $row -Expected $Columns -Label $Label }
    return $rows
}

function Test-G3E2RA1RBoundManifest {
    param([string]$ManifestPath,[string]$BaseDirectory,[string]$PathColumn,[string[]]$Columns,[int]$Count,[string]$Label)
    $rows = Import-G3E2RA1RExactCsv -LiteralPath $ManifestPath -Columns $Columns -Count $Count -Label $Label
    $base = [IO.Path]::GetFullPath($BaseDirectory).TrimEnd('\')
    foreach ($row in $rows) {
        $relative = [string]$row.$PathColumn
        if ([IO.Path]::IsPathRooted($relative)) { throw "$Label path must be relative: $relative" }
        $full = [IO.Path]::GetFullPath((Join-Path $base $relative.Replace('/','\')))
        if (-not $full.StartsWith($base + '\',[StringComparison]::OrdinalIgnoreCase)) { throw "$Label path escapes its root: $relative" }
        if ((Get-G3E2RA1RSha256 $full) -cne ([string]$row.sha256).ToUpperInvariant() -or (Get-G3E2RA1RBytes $full) -ne [int64]$row.bytes) { throw "$Label identity mismatch: $relative" }
    }
    return $rows
}

function Get-G3E2RA1RContext {
    param([Parameter(Mandatory = $true)][string]$VaultRoot,[Parameter(Mandatory = $true)][string]$OverlayRoot,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash)
    $root = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
    $overlay = (Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
    $canonical = Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r'
    if ($overlay -cne $canonical) { throw 'A1R overlay is not at its canonical repository path.' }

    $lockPath = Join-Path $overlay 'dependency-lock.csv'
    $lock = Import-G3E2RA1RExactCsv -LiteralPath $lockPath -Columns @('dependency_id','role','repository_path','sha256','bytes','reuse_mode','required_by') -Count 1 -Label 'A1R dependency lock'
    if ($lock[0].dependency_id -cne 'G3E2R-A1-BUNDLE' -or $lock[0].reuse_mode -cne 'verify-transitively-never-modify') { throw 'A1R dependency lock must bind only the immutable A1 root.' }
    $a1Manifest = Resolve-G3E2RA1RInRoot -Root $root -RepositoryPath ([string]$lock[0].repository_path)
    if ((Get-G3E2RA1RSha256 $a1Manifest) -cne [string]$lock[0].sha256 -or (Get-G3E2RA1RBytes $a1Manifest) -ne [int64]$lock[0].bytes) { throw 'A1 dependency root mismatch.' }
    if (-not [string]::IsNullOrWhiteSpace($ExpectedA1Hash) -and (Get-G3E2RA1RSha256 $a1Manifest) -cne $ExpectedA1Hash.ToUpperInvariant()) { throw 'Expected-A1-Hash mismatch.' }

    $a1Root = Split-Path -Parent $a1Manifest
    Import-Module (Join-Path $a1Root 'tools/g3e2r-a1-guard-lib.psm1') -Force
    $a1Context = Get-G3E2RA1Context -VaultRoot $root -OverlayRoot $a1Root -ExpectedA1Hash ([string]$lock[0].sha256)
    Import-Module (Join-Path $a1Context.ARoot 'tools/g3e2r-transaction-lib.psm1') -Force
    $aDependencies = Import-G3E2RDependencyLock -VaultRoot $root -LockPath $a1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK']

    $manifest = Join-Path $overlay 'a1r-bundle-manifest.csv'
    if (Test-Path -LiteralPath $manifest -PathType Leaf) {
        if (-not [string]::IsNullOrWhiteSpace($ExpectedA1RHash) -and (Get-G3E2RA1RSha256 $manifest) -cne $ExpectedA1RHash.ToUpperInvariant()) { throw 'Expected-A1R-Hash mismatch.' }
        $rows = Test-G3E2RA1RBoundManifest -ManifestPath $manifest -BaseDirectory $overlay -PathColumn overlay_path -Columns @('role','overlay_path','sha256','bytes') -Count 14 -Label 'A1R bundle'
        $actual = @(Get-ChildItem -LiteralPath $overlay -Recurse -File | ForEach-Object { $_.FullName.Substring($overlay.Length + 1).Replace('\','/') })
        $expected = @($rows.overlay_path) + 'a1r-bundle-manifest.csv'
        if ($actual.Count -ne 15 -or @(Compare-Object ($actual | Sort-Object) ($expected | Sort-Object)).Count -ne 0) { throw 'A1R overlay differs from its exact fifteen-file inventory.' }
    }

    $sealContract = Get-Content -LiteralPath (Join-Path $overlay 'contracts/live-seal-v2-a1r-contract.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $bContract = Get-Content -LiteralPath (Join-Path $overlay 'contracts/b-candidate-v1-contract.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $hardContract = Get-Content -LiteralPath (Join-Path $overlay 'contracts/hard-reference-v1-contract.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $gates = Import-G3E2RA1RExactCsv -LiteralPath (Join-Path $overlay 'manifests/gate-map-v2.csv') -Columns @('direction','sequence','step_id','mutation_state','gate_function','success_contract','failure_action') -Count 40 -Label 'A1R gate map'
    if (@($gates | Where-Object direction -CEQ 'SEAL').Count -ne 9 -or @($gates | Where-Object direction -CEQ 'FWD').Count -ne 19 -or @($gates | Where-Object direction -CEQ 'REV').Count -ne 12 -or @($gates.step_id | Sort-Object -Unique).Count -ne 40 -or @($gates | Where-Object step_id -CEQ 'FWD-020').Count -ne 0) { throw 'A1R gate map does not have the exact 9/19/12 shape.' }
    if ($sealContract.ttl_seconds -ne 900 -or $sealContract.bundle_binding_count -ne 6 -or $sealContract.execution_binding_count -ne 28 -or $sealContract.artifact_binding_count -ne 15 -or $sealContract.runtime_binding_count -ne 4) { throw 'A1R seal contract cardinality differs from approval.' }
    if ($bContract.bound_member_count -ne 18 -or @($bContract.members).Count -ne 18 -or $hardContract.row_count -ne 130) { throw 'A1R B or hard-reference contract cardinality differs from approval.' }
    return [pscustomobject]@{ Root=$root; Overlay=$overlay; Manifest=$manifest; A1Manifest=$a1Manifest; A1Root=$a1Root; A1Context=$a1Context; ADependencies=$aDependencies; SealContract=$sealContract; BContract=$bContract; HardReferenceContract=$hardContract; Gates=$gates }
}

function Get-G3E2RA1RExecutionPaths {
    return [ordered]@{
        'A1-SEAL-CONTRACT'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/contracts/live-seal-v2-contract.json'
        'A1-INVARIANT-CONTRACT'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/contracts/live-invariant-v1-contract.json'
        'A1-RUNTIME-ROLES'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/manifests/runtime-roles.csv'
        'A1-GATE-MAP'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/manifests/gate-map.csv'
        'A1-GUARD-LIB'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/g3e2r-a1-guard-lib.psm1'
        'A1-FINALIZER'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/finalize-g3e2r-live-seal-v2.ps1'
        'A1-FORWARD-V2'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/invoke-g3e2-transaction-v2.ps1'
        'A1-REVERSE-V2'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/invoke-g3e2-reverse-v2.ps1'
        'A-COMPONENT-MANIFEST'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/manifests/component-transition-manifest.csv'
        'A-FORWARD-MANIFEST'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/manifests/forward-transaction.csv'
        'A-REVERSE-MANIFEST'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/manifests/reverse-transaction.csv'
        'A-SNAPSHOT-TOOL'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/tools/manage-scoped-cutover-snapshot.ps1'
        'A-WRAPPER-TOOL'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/tools/sync_agents_skills.py'
        'G3E1-COMPONENT-TOOL'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/tools/apply-component-refactors.ps1'
        'G3E1-POSTSTATE-TOOL'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/tools/apply-exact-poststate.ps1'
        'ROOT-FAST-TOOL'='tools/test-wiki-integrity.ps1'
        'COMPONENT-REGISTER'='wiki/_outputs/marketing-system-architecture-v0-2/component-register.csv'
        'REFERENCE-TRANSITION'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/reference-transition.csv'
        'MOS-PRE-TOOL'='projects/marketing-operating-system/tools/test-federation-contracts.ps1'
        'MOS-POST-TOOL'='projects/marketing-operating-system/tools/test-federation-contracts.ps1'
        'A1R-SEAL-CONTRACT'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/contracts/live-seal-v2-a1r-contract.json'
        'A1R-B-CONTRACT'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/contracts/b-candidate-v1-contract.json'
        'A1R-HARD-REFERENCE-CONTRACT'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/contracts/hard-reference-v1-contract.json'
        'A1R-GATE-MAP'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/manifests/gate-map-v2.csv'
        'A1R-GUARD-LIB'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/tools/g3e2r-a1r-guard-lib.psm1'
        'A1R-FINALIZER'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/tools/finalize-g3e2r-live-seal-v2r.ps1'
        'A1R-FORWARD-V2R'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/tools/invoke-g3e2-transaction-v2r.ps1'
        'A1R-REVERSE-V2R'='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1r/tools/invoke-g3e2-reverse-v2r.ps1'
    }
}

function Get-G3E2RA1RArtifactPaths {
    param([object]$Context)
    $paths=[ordered]@{}
    foreach($member in @($Context.BContract.members|Where-Object{-not[string]::IsNullOrWhiteSpace([string]$_.artifact_id)})){$paths[[string]$member.artifact_id]=([string]$Context.BContract.canonical_root).TrimEnd('/')+'/'+[string]$member.bundle_path}
    $paths['G3E1-EXACT-POSTSTATE-ARCHIVE']=Get-G3E2RA1RRepositoryPath $Context.Root (Get-G3E2RDependency -Lock $Context.ADependencies -Id 'G3E1-POSTSTATE-ARCHIVE').Path
    return $paths
}

function New-G3E2RA1RFileBinding {
    param([string]$IdName,[string]$Id,[string]$Root,[string]$RepositoryPath)
    $path = Resolve-G3E2RA1RInRoot -Root $Root -RepositoryPath $RepositoryPath
    $value = [ordered]@{ repository_path=$RepositoryPath; sha256=Get-G3E2RA1RSha256 $path; bytes=Get-G3E2RA1RBytes $path }
    $ordered = [ordered]@{}
    $ordered[$IdName] = $Id
    foreach ($name in $value.Keys) { $ordered[$name] = $value[$name] }
    return [pscustomobject]$ordered
}

function Test-G3E2RA1RBManifest {
    param([Parameter(Mandatory = $true)][object]$Context,[string]$ExpectedBHash,[switch]$AllowSealed)
    $bRoot = Resolve-G3E2RA1RInRoot -Root $Context.Root -RepositoryPath ([string]$Context.BContract.canonical_root)
    if (-not (Test-Path -LiteralPath $bRoot -PathType Container)) { throw 'Canonical G3E2R-B root is missing.' }
    if ((Get-Item -LiteralPath $bRoot -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw 'Canonical G3E2R-B root must not be a reparse point.' }
    $manifest = Join-Path $bRoot ([string]$Context.BContract.bundle_manifest_filename)
    if (-not [string]::IsNullOrWhiteSpace($ExpectedBHash) -and (Get-G3E2RA1RSha256 $manifest) -cne $ExpectedBHash.ToUpperInvariant()) { throw 'Expected-B-Hash mismatch.' }
    $rows = Test-G3E2RA1RBoundManifest -ManifestPath $manifest -BaseDirectory $bRoot -PathColumn bundle_path -Columns @($Context.BContract.manifest_columns) -Count 18 -Label 'G3E2R-B bundle'
    if (@($rows.role | Sort-Object -Unique).Count -ne 18 -or @($rows.bundle_path | Sort-Object -Unique).Count -ne 18) { throw 'G3E2R-B roles and paths must be unique.' }
    foreach ($member in @($Context.BContract.members)) {
        $row = @($rows | Where-Object { $_.role -ceq $member.role -and $_.bundle_path -ceq $member.bundle_path })
        if ($row.Count -ne 1) { throw "G3E2R-B role/path mismatch: $($member.role)" }
    }
    $allItems = @(Get-ChildItem -LiteralPath $bRoot -Recurse -Force)
    if (@($allItems | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }).Count -ne 0) { throw 'G3E2R-B reparse points are forbidden.' }
    $actual = @($allItems | Where-Object { -not $_.PSIsContainer } | ForEach-Object { $_.FullName.Substring($bRoot.Length + 1).Replace('\','/') })
    $expected = @($rows.bundle_path) + [string]$Context.BContract.bundle_manifest_filename
    if ($AllowSealed) { $expected += [string]$Context.BContract.live_seal_filename }
    $requiredCount = if ($AllowSealed) { [int]$Context.BContract.sealed_file_count } else { [int]$Context.BContract.prepared_file_count }
    if ($actual.Count -ne $requiredCount -or @(Compare-Object ($actual | Sort-Object) ($expected | Sort-Object)).Count -ne 0) { throw "G3E2R-B inventory must contain exactly $requiredCount reviewed files." }
    return [pscustomobject]@{ Root=$bRoot; Manifest=$manifest; Rows=@($rows) }
}

function Assert-G3E2RA1RApproval {
    param([object]$Context,[object]$Approval,[string]$Label)
    Assert-G3E2RA1RExactProperties -Value $Approval -Expected @($Context.SealContract.required_approval_fields) -Label $Label
    if([string]::IsNullOrWhiteSpace([string]$Approval.approval_id)-or[string]::IsNullOrWhiteSpace([string]$Approval.approved_by)){throw "$Label provenance is incomplete."}
    if([DateTimeOffset]::Parse([string]$Approval.approved_at_utc)-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)){throw "$Label time is in the future."}
    foreach($field in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if($Approval.$field -isnot [bool]){throw "$Label boolean type is invalid: $field"}}
}

function Assert-G3E2RA1RBaseline {
    param([object]$Context,[object]$Baseline,[string]$Label)
    Assert-G3E2RA1RExactProperties -Value $Baseline -Expected @($Context.SealContract.required_baseline_fields) -Label $Label
    if($Baseline.mos_cleanup -isnot [bool]){throw "$Label mos_cleanup must be Boolean."}
    if ([int]$Baseline.git_staged_count -ne 0 -or [int]$Baseline.root_fast_errors -ne 0 -or [int]$Baseline.root_fast_warnings -ne 0 -or [int]$Baseline.mos_passed -ne 16 -or [int]$Baseline.mos_total -ne 16 -or -not [bool]$Baseline.mos_cleanup -or [string]$Baseline.mos_vault_mutation -cne 'none' -or [int]$Baseline.hard_reference_pre_paths -ne 41 -or [int]$Baseline.hard_reference_pre_positive -ne 41 -or [int]$Baseline.live_invariant_pre -ne 28 -or [int]$Baseline.residue_count -ne 0 -or [string]$Baseline.authority_pre -cne 'frozen') { throw "$Label differs from the required green prestate." }
}

function Assert-G3E2RA1RSealInput {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][object]$SealInput)
    Assert-G3E2RA1RExactProperties -Value $SealInput -Expected @($Context.SealContract.required_seal_input_top_level) -Label 'A1R seal input'
    if ($SealInput.seal_inputs_contract -cne $Context.SealContract.seal_inputs_contract -or $SealInput.state -cne 'prepared' -or $SealInput.routing_state -cne 'frozen' -or $SealInput.legacy_token -cne $Context.SealContract.legacy_token) { throw 'A1R seal input identity or routing state is invalid.' }
    if ([string]::IsNullOrWhiteSpace([string]$SealInput.transaction_id) -or [IO.Path]::GetFullPath([string]$SealInput.vault_root).TrimEnd('\') -cne $Context.Root) { throw 'A1R seal input transaction or Vault root is invalid.' }
    $prepared = [DateTimeOffset]::Parse([string]$SealInput.prepared_at_utc)
    if ($prepared -gt [DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)) { throw 'A1R seal input prepared time is in the future.' }
    Assert-G3E2RA1RApproval -Context $Context -Approval $SealInput.approval -Label 'A1R seal approval'
    Assert-G3E2RA1RBaseline -Context $Context -Baseline $SealInput.baseline -Label 'A1R seal baseline'
}

function Get-G3E2RA1RRuntimeBindings {
    param([object]$Context,[string]$PythonExecutable)
    return @(Get-G3E2RA1RuntimeBindings -Context $Context.A1Context -PythonExecutable $PythonExecutable)
}

function Assert-G3E2RA1RRuntimeBindings {
    param([object[]]$Expected,[object[]]$Actual)
    Assert-G3E2RA1RuntimeBindings -Expected $Expected -Actual $Actual
}

function New-G3E2RA1RSeal {
    param([object]$Context,[object]$SealInput,[object[]]$RuntimeBindings,[object]$BState)
    $bundlePaths = [ordered]@{
        'G3E1-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Context.Dependencies['G3E1-BUNDLE']
        'G3E2R-A-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Context.Dependencies['G3E2R-A-BUNDLE']
        'G3E2R-A-DEPENDENCY-LOCK'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK']
        'G3E2R-A1-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Manifest
        'G3E2R-A1R-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.Manifest
        'G3E2R-B-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $BState.Manifest
    }
    $bundles = foreach ($id in @($Context.SealContract.required_bundle_binding_ids)) { New-G3E2RA1RFileBinding -IdName bundle_id -Id $id -Root $Context.Root -RepositoryPath $bundlePaths[$id] }
    $executionPaths = Get-G3E2RA1RExecutionPaths
    $executions = foreach ($id in @($Context.SealContract.required_execution_binding_ids)) { New-G3E2RA1RFileBinding -IdName execution_id -Id $id -Root $Context.Root -RepositoryPath $executionPaths[$id] }
    $artifactPaths = Get-G3E2RA1RArtifactPaths -Context $Context
    $artifacts = foreach ($id in @($Context.SealContract.required_artifact_binding_ids)) { New-G3E2RA1RFileBinding -IdName artifact_id -Id $id -Root $Context.Root -RepositoryPath $artifactPaths[$id] }
    return [pscustomobject][ordered]@{
        seal_contract='g3e2r-live-seal/v2'; state='sealed'; transaction_id=[string]$SealInput.transaction_id; vault_root=$Context.Root; routing_state='frozen'; legacy_token=[string]$SealInput.legacy_token
        approval=$SealInput.approval
        time=[pscustomobject][ordered]@{ prepared_at_utc=[string]$SealInput.prepared_at_utc; sealed_at_utc=''; not_after_utc=''; ttl_seconds=900 }
        bundle_bindings=@($bundles); execution_bindings=@($executions); artifact_bindings=@($artifacts); runtime_bindings=@($RuntimeBindings); baseline=$SealInput.baseline
    }
}

function Get-G3E2RA1RArtifact {
    param([object]$Seal,[string]$Id)
    $row = @($Seal.artifact_bindings | Where-Object artifact_id -CEQ $Id)
    if ($row.Count -ne 1) { throw "A1R artifact binding must be unique: $Id" }
    return $row[0]
}

function Test-G3E2RA1RBoundArtifact {
    param([object]$Context,[object]$Artifact)
    $path = Resolve-G3E2RA1RInRoot -Root $Context.Root -RepositoryPath ([string]$Artifact.repository_path)
    if ((Get-G3E2RA1RSha256 $path) -cne [string]$Artifact.sha256 -or (Get-G3E2RA1RBytes $path) -ne [int64]$Artifact.bytes) { throw "A1R artifact binding mismatch: $($Artifact.artifact_id)" }
    return $path
}

function Assert-G3E2RA1RSealClosure {
    param([object]$Context,[object]$Seal,[switch]$AllowPreparedB)
    foreach ($row in @($Seal.bundle_bindings)) { Assert-G3E2RA1RExactProperties $row @('bundle_id','repository_path','sha256','bytes') 'Seal bundle binding' }
    foreach ($row in @($Seal.execution_bindings)) { Assert-G3E2RA1RExactProperties $row @('execution_id','repository_path','sha256','bytes') 'Seal execution binding' }
    foreach ($row in @($Seal.artifact_bindings)) { Assert-G3E2RA1RExactProperties $row @('artifact_id','repository_path','sha256','bytes') 'Seal artifact binding' }
    foreach ($row in @($Seal.runtime_bindings)) { Assert-G3E2RA1RExactProperties $row @('runtime_id','executable_path','executable_sha256','version','version_probe_id') 'Seal runtime binding' }
    $sets = @(
        @(@($Context.SealContract.required_bundle_binding_ids),@($Seal.bundle_bindings.bundle_id),6,'bundle'),
        @(@($Context.SealContract.required_execution_binding_ids),@($Seal.execution_bindings.execution_id),28,'execution'),
        @(@($Context.SealContract.required_artifact_binding_ids),@($Seal.artifact_bindings.artifact_id),15,'artifact'),
        @(@($Context.SealContract.required_runtime_ids),@($Seal.runtime_bindings.runtime_id),4,'runtime')
    )
    foreach ($set in $sets) { if ($set[1].Count -ne $set[2] -or @($set[1] | Sort-Object -Unique).Count -ne $set[2] -or @(Compare-Object ($set[0] | Sort-Object) ($set[1] | Sort-Object)).Count -ne 0) { throw "Seal $($set[3]) ids differ from contract." } }
    foreach ($row in @($Seal.bundle_bindings + $Seal.execution_bindings + $Seal.artifact_bindings)) {
        $path = Resolve-G3E2RA1RInRoot -Root $Context.Root -RepositoryPath ([string]$row.repository_path)
        if ((Get-G3E2RA1RSha256 $path) -cne [string]$row.sha256 -or (Get-G3E2RA1RBytes $path) -ne [int64]$row.bytes) { throw "Seal file binding mismatch: $($row.repository_path)" }
    }
    $bManifest=Join-Path (Resolve-G3E2RA1RInRoot $Context.Root ([string]$Context.BContract.canonical_root)) ([string]$Context.BContract.bundle_manifest_filename)
    $expectedBundles=[ordered]@{
        'G3E1-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Context.Dependencies['G3E1-BUNDLE']
        'G3E2R-A-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Context.Dependencies['G3E2R-A-BUNDLE']
        'G3E2R-A-DEPENDENCY-LOCK'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK']
        'G3E2R-A1-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.A1Manifest
        'G3E2R-A1R-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $Context.Manifest
        'G3E2R-B-BUNDLE'=Get-G3E2RA1RRepositoryPath $Context.Root $bManifest
    }
    foreach($id in $expectedBundles.Keys){$row=@($Seal.bundle_bindings|Where-Object bundle_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$expectedBundles[$id]){throw "Seal bundle path mismatch: $id"}}
    $expectedExecutions = Get-G3E2RA1RExecutionPaths
    foreach ($id in $expectedExecutions.Keys) { $row=@($Seal.execution_bindings|Where-Object execution_id -CEQ $id);if($row.Count-ne 1-or [string]$row[0].repository_path-cne[string]$expectedExecutions[$id]){throw "Seal execution path mismatch: $id"} }
    $expectedArtifacts=Get-G3E2RA1RArtifactPaths -Context $Context
    foreach($id in $expectedArtifacts.Keys){$row=@($Seal.artifact_bindings|Where-Object artifact_id -CEQ $id);if($row.Count-ne 1-or[string]$row[0].repository_path-cne[string]$expectedArtifacts[$id]){throw "Seal artifact path mismatch: $id"}}
    $b = @($Seal.bundle_bindings | Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')[0]
    $null = Test-G3E2RA1RBManifest -Context $Context -ExpectedBHash ([string]$b.sha256) -AllowSealed:(-not $AllowPreparedB)
}

function Read-G3E2RA1RSealV2 {
    param([object]$Context,[string]$LiteralPath,[string]$ExpectedA1Hash,[string]$ExpectedA1RHash,[string]$ExpectedSealHash,[object[]]$ActualRuntimeBindings,[ValidateSet('Forward','Reverse')][string]$Use='Forward')
    if ((Get-G3E2RA1RSha256 $Context.A1Manifest) -cne $ExpectedA1Hash.ToUpperInvariant()) { throw 'Expected-A1-Hash mismatch at seal consumption.' }
    if ((Get-G3E2RA1RSha256 $Context.Manifest) -cne $ExpectedA1RHash.ToUpperInvariant()) { throw 'Expected-A1R-Hash mismatch at seal consumption.' }
    if ((Get-G3E2RA1RSha256 $LiteralPath) -cne $ExpectedSealHash.ToUpperInvariant()) { throw 'Expected-Seal-Hash mismatch.' }
    $seal = Get-Content -LiteralPath $LiteralPath -Raw -Encoding UTF8 | ConvertFrom-Json
    Assert-G3E2RA1RExactProperties $seal @($Context.SealContract.required_top_level) 'A1R live seal'
    if ($seal.seal_contract -cne 'g3e2r-live-seal/v2' -or $seal.state -cne 'sealed' -or $seal.routing_state -cne 'frozen' -or $seal.legacy_token -cne $Context.SealContract.legacy_token -or [IO.Path]::GetFullPath([string]$seal.vault_root).TrimEnd('\') -cne $Context.Root) { throw 'A1R live seal identity is invalid.' }
    Assert-G3E2RA1RApproval -Context $Context -Approval $seal.approval -Label 'A1R live seal approval'
    Assert-G3E2RA1RExactProperties $seal.time @($Context.SealContract.required_time_fields) 'A1R live seal time'
    Assert-G3E2RA1RBaseline -Context $Context -Baseline $seal.baseline -Label 'A1R live seal baseline'
    $preparedAt=[DateTimeOffset]::Parse([string]$seal.time.prepared_at_utc);$sealedAt=[DateTimeOffset]::Parse([string]$seal.time.sealed_at_utc);$notAfter=[DateTimeOffset]::Parse([string]$seal.time.not_after_utc)
    if ([int]$seal.time.ttl_seconds -ne 900 -or ($notAfter-$sealedAt).TotalSeconds -ne 900 -or $preparedAt-gt$sealedAt -or $sealedAt-gt[DateTimeOffset]::UtcNow.AddSeconds([int]$Context.SealContract.maximum_future_clock_skew_seconds)) { throw 'A1R live seal time boundary is invalid.' }
    if ($Use -eq 'Forward' -and [DateTimeOffset]::UtcNow -gt $notAfter) { throw 'A1R live seal has expired for forward.' }
    foreach($field in @('live_capability_probe_approved','live_mutation_approved','automatic_reverse_approved','independent_reverse_approved')){if(-not[bool]$seal.approval.$field){throw "A1R live seal approval missing: $field"}}
    Assert-G3E2RA1RSealClosure -Context $Context -Seal $seal
    Assert-G3E2RA1RRuntimeBindings -Expected @($seal.runtime_bindings) -Actual $ActualRuntimeBindings
    return $seal
}

function Test-G3E2RA1RHardReferenceManifestSchema {
    param([object]$Context,[string]$LiteralPath)
    $contract=$Context.HardReferenceContract
    $rows=Import-G3E2RA1RExactCsv -LiteralPath $LiteralPath -Columns @($contract.columns) -Count ([int]$contract.row_count) -Label 'A1R hard-reference manifest'
    $keys=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach($row in $rows){
        if($row.state -notin @($contract.allowed_states)-or $row.policy -notin @($contract.allowed_policies)){throw 'Hard-reference state or policy is invalid.'}
        if($row.repository_path -ceq [string]$contract.workspace_path){throw 'workspace.json is forbidden in the hard-reference manifest.'}
        $null=Resolve-G3E2RA1RInRoot -Root $Context.Root -RepositoryPath ([string]$row.repository_path)
        if (-not $keys.Add(([string]$row.repository_path + [char]0 + [string]$row.state))) { throw 'Hard-reference composite key is duplicated.' }
        if($row.expected_sha256 -notmatch '^[A-F0-9]{64}$'-or [int64]$row.expected_bytes-lt 0-or [int]$row.expected_legacy_tokens-lt 0){throw 'Hard-reference identity field is invalid.'}
    }
    foreach($state in @('pre','post','reverse')){
        $projection=@($rows|Where-Object state -CEQ $state);$expected=$contract.state_projections.$state
        if($projection.Count-ne[int]$expected.paths-or @($projection|Where-Object{[int]$_.expected_legacy_tokens-gt 0}).Count-ne[int]$expected.positive){throw "Hard-reference $state projection differs from contract."}
    }
    return $rows
}

function Test-G3E2RA1RHardReferences {
    param([object]$Context,[object]$Seal,[ValidateSet('pre','post','reverse')][string]$State,[string]$RipgrepExecutable)
    $artifact=Get-G3E2RA1RArtifact -Seal $Seal -Id 'B-HARD-REFERENCE-MANIFEST';$path=Test-G3E2RA1RBoundArtifact $Context $artifact
    $rows=@(Test-G3E2RA1RHardReferenceManifestSchema -Context $Context -LiteralPath $path|Where-Object state -CEQ $State)
    $positive=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach($row in $rows){$full=Resolve-G3E2RA1RInRoot $Context.Root $row.repository_path;$text=Get-Content -LiteralPath $full -Raw -Encoding UTF8;$count=([regex]::Matches($text,[regex]::Escape([string]$Seal.legacy_token))).Count;if((Get-G3E2RA1RSha256 $full)-cne$row.expected_sha256-or(Get-G3E2RA1RBytes $full)-ne[int64]$row.expected_bytes-or$count-ne[int]$row.expected_legacy_tokens){throw "Hard-reference live mismatch: $($row.repository_path)"};if($count-gt 0){$null=$positive.Add(([string]$row.repository_path).Replace('\','/'))}}
    $args=@('--files-with-matches','--fixed-strings','--hidden','--no-ignore','--glob','!.git/**','--glob','!wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/**','--glob','!.obsidian/workspace.json',[string]$Seal.legacy_token,$Context.Root)
    $scan=&$RipgrepExecutable @args 2>&1;if($LASTEXITCODE-notin@(0,1)){throw 'Literal reference scan failed.'}
    $controlPrefix='wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/'
    $actual=@($scan|Where-Object{-not[string]::IsNullOrWhiteSpace([string]$_)}|ForEach-Object{$observed=[string]$_;$full=if([IO.Path]::IsPathRooted($observed)){[IO.Path]::GetFullPath($observed)}else{[IO.Path]::GetFullPath((Join-Path $Context.Root $observed))};if(-not$full.StartsWith($Context.Root+'\',[StringComparison]::OrdinalIgnoreCase)){throw "Literal scan returned a path outside the Vault: $observed"};$relative=$full.Substring($Context.Root.Length+1).Replace('\','/');if(-not$relative.StartsWith($controlPrefix,[StringComparison]::OrdinalIgnoreCase)-and$relative-cne'.obsidian/workspace.json'){$relative}}|Sort-Object -Unique)
    $difference=@(Compare-Object (@($positive)|Sort-Object) ($actual|Sort-Object))
    if($difference.Count-ne 0){throw "Global Legacy literal set differs from $State manifest: $($difference|ConvertTo-Json -Compress)"}
}

function Test-G3E2RA1RWorkspaceAdvisory {
    param([object]$Context,[object]$Seal)
    $artifact=Get-G3E2RA1RArtifact $Seal 'B-ADVISORY-REFERENCE-REPORT';$path=Test-G3E2RA1RBoundArtifact $Context $artifact
    $rows=Import-G3E2RA1RExactCsv -LiteralPath $path -Columns @($Context.HardReferenceContract.advisory_columns) -Count 1 -Label 'Workspace Advisory report'
    if($rows[0].repository_path-cne'.obsidian/workspace.json'-or$rows[0].policy-cne'advisory'){throw 'Workspace Advisory row is invalid.'}
    if($rows[0].observed_sha256-notmatch'^[A-F0-9]{64}$'-or[int64]$rows[0].observed_bytes-lt 0-or[int]$rows[0].observed_legacy_tokens-lt 0){throw 'Workspace Advisory observation shape is invalid.'}
    $null=[DateTimeOffset]::Parse([string]$rows[0].observed_at_utc)
}

function Add-G3E2RA1RCompatibilityProperties { param([object]$Seal) return Add-G3E2RA1CompatibilityProperties -Seal $Seal }
function Test-G3E2RA1RLiveInvariants { param([object]$Context,[object]$Seal,[string]$State,[switch]$AdvisoryExternalDrift) return @(Test-G3E2RA1LiveInvariants -Context $Context.A1Context -Seal $Seal -State $State -AdvisoryExternalDrift:$AdvisoryExternalDrift) }
function Assert-G3E2RA1RGitStagingEmpty { param([string]$VaultRoot,[string]$GitExecutable) Assert-G3E2RA1GitStagingEmpty $VaultRoot $GitExecutable }
function Assert-G3E2RA1RNoResidue { param([string]$VaultRoot) Assert-G3E2RA1NoResidue $VaultRoot }
function Enter-G3E2RA1RMutex { param([string]$VaultRoot) return Enter-G3E2RA1Mutex -VaultRoot $VaultRoot }
function Exit-G3E2RA1RMutex { param([object]$Mutex) Exit-G3E2RA1Mutex -Mutex $Mutex }
function Test-G3E2RA1RAdministrator { return Test-G3E2RA1Administrator }
function Get-G3E2RA1RFingerprintV2 { param([string]$LiteralPath) return Get-G3E2RA1FingerprintV2 $LiteralPath }

function Add-G3E2RA1RExpectedFile {
    param([hashtable]$Map,[string]$LiteralPath,[string]$Sha256,[Nullable[long]]$Bytes)
    $full=[IO.Path]::GetFullPath($LiteralPath)
    if($Map.ContainsKey($full)){if($Map[$full].sha256-cne$Sha256-or($null-ne$Bytes-and$null-ne$Map[$full].bytes-and[int64]$Map[$full].bytes-ne[int64]$Bytes)){throw "Conflicting closure identity: $full"};return}
    $Map[$full]=[pscustomobject]@{sha256=$Sha256.ToUpperInvariant();bytes=$Bytes}
}

function Enter-G3E2RA1RClosureLock {
    param([object]$Context,[object]$Seal,[string]$SealPath,[string]$ExpectedSealHash)
    Assert-G3E2RA1RSealClosure -Context $Context -Seal $Seal -AllowPreparedB:([string]::IsNullOrWhiteSpace($SealPath))
    $map=@{}
    foreach($row in @($Seal.bundle_bindings+$Seal.execution_bindings+$Seal.artifact_bindings)){Add-G3E2RA1RExpectedFile $map (Resolve-G3E2RA1RInRoot $Context.Root $row.repository_path) ([string]$row.sha256) ([int64]$row.bytes)}
    foreach($runtime in @($Seal.runtime_bindings)){Add-G3E2RA1RExpectedFile $map ([string]$runtime.executable_path) ([string]$runtime.executable_sha256) $null}
    if(-not[string]::IsNullOrWhiteSpace($SealPath)){Add-G3E2RA1RExpectedFile $map $SealPath $ExpectedSealHash $null}
    $manifestSpecs=@(
        @($Context.A1Context.Dependencies['G3E1-BUNDLE'],'candidate_path'),@($Context.A1Context.Dependencies['G3E2R-A-BUNDLE'],'overlay_path'),@($Context.A1Manifest,'overlay_path'),@($Context.Manifest,'overlay_path'),@((Resolve-G3E2RA1RInRoot $Context.Root (($Seal.bundle_bindings|Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')[0].repository_path)),'bundle_path')
    )
    foreach($spec in $manifestSpecs){$manifest=[string]$spec[0];$base=Split-Path -Parent $manifest;foreach($row in @(Import-Csv -LiteralPath $manifest)){Add-G3E2RA1RExpectedFile $map ([IO.Path]::GetFullPath((Join-Path $base ([string]$row.($spec[1])).Replace('/','\')))) ([string]$row.sha256) ([int64]$row.bytes)}}
    foreach($row in @(Import-Csv -LiteralPath $Context.A1Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK'])){Add-G3E2RA1RExpectedFile $map (Resolve-G3E2RA1RInRoot $Context.Root $row.repository_path) ([string]$row.sha256) ([int64]$row.bytes)}
    $handles=[Collections.Generic.List[object]]::new()
    try{
        foreach($path in @($map.Keys|Sort-Object)){
            $stream=[IO.File]::Open($path,[IO.FileMode]::Open,[IO.FileAccess]::Read,[IO.FileShare]::Read)
            $sha=[Security.Cryptography.SHA256]::Create();try{$hash=([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','')}finally{$sha.Dispose()}
            if($hash-cne$map[$path].sha256-or($null-ne$map[$path].bytes-and$stream.Length-ne[int64]$map[$path].bytes)){throw "Locked closure identity mismatch: $path"}
            $handles.Add([pscustomobject]@{Path=$path;Stream=$stream;Sha256=$hash;Bytes=$map[$path].bytes})
        }
        return [pscustomobject]@{Handles=$handles;Count=$handles.Count}
    }catch{foreach($item in $handles){$item.Stream.Dispose()};throw}
}

function Test-G3E2RA1RClosureLock {
    param([object]$Lock)
    foreach($item in @($Lock.Handles)){$item.Stream.Position=0;$sha=[Security.Cryptography.SHA256]::Create();try{$hash=([BitConverter]::ToString($sha.ComputeHash($item.Stream))).Replace('-','')}finally{$sha.Dispose()};if($hash-cne$item.Sha256-or($null-ne$item.Bytes-and$item.Stream.Length-ne[int64]$item.Bytes)){throw "Held closure changed: $($item.Path)"}}
}

function Exit-G3E2RA1RClosureLock { param([object]$Lock) if($null-ne$Lock){foreach($item in @($Lock.Handles|Sort-Object Path -Descending)){$item.Stream.Dispose()}} }

function Enter-G3E2RA1RSingleFileReadLock {
    param([string]$LiteralPath)
    $stream=[IO.File]::Open($LiteralPath,[IO.FileMode]::Open,[IO.FileAccess]::Read,[IO.FileShare]::Read)
    return [pscustomobject]@{Handles=@([pscustomobject]@{Path=$LiteralPath;Stream=$stream;Sha256=Get-G3E2RA1RSha256 $LiteralPath;Bytes=Get-G3E2RA1RBytes $LiteralPath});Count=1}
}

Export-ModuleMember -Function @(
    'Get-G3E2RA1RSha256','Get-G3E2RA1RBytes','Resolve-G3E2RA1RInRoot','Get-G3E2RA1RRepositoryPath','Assert-G3E2RA1RExactProperties','Import-G3E2RA1RExactCsv','Test-G3E2RA1RBoundManifest','Get-G3E2RA1RContext','Get-G3E2RA1RExecutionPaths','Get-G3E2RA1RArtifactPaths','Test-G3E2RA1RBManifest','Assert-G3E2RA1RSealInput','Get-G3E2RA1RRuntimeBindings','Assert-G3E2RA1RRuntimeBindings','New-G3E2RA1RSeal','Get-G3E2RA1RArtifact','Test-G3E2RA1RBoundArtifact','Assert-G3E2RA1RSealClosure','Read-G3E2RA1RSealV2','Test-G3E2RA1RHardReferenceManifestSchema','Test-G3E2RA1RHardReferences','Test-G3E2RA1RWorkspaceAdvisory','Add-G3E2RA1RCompatibilityProperties','Test-G3E2RA1RLiveInvariants','Assert-G3E2RA1RGitStagingEmpty','Assert-G3E2RA1RNoResidue','Enter-G3E2RA1RMutex','Exit-G3E2RA1RMutex','Test-G3E2RA1RAdministrator','Get-G3E2RA1RFingerprintV2','Enter-G3E2RA1RClosureLock','Test-G3E2RA1RClosureLock','Exit-G3E2RA1RClosureLock','Enter-G3E2RA1RSingleFileReadLock'
)
