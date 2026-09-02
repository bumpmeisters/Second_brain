Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-G3E2RA1Sha256 {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) { throw "File is missing: $LiteralPath" }
    return (Get-FileHash -Algorithm SHA256 -LiteralPath $LiteralPath).Hash.ToUpperInvariant()
}

function Get-G3E2RA1Bytes {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    return (Get-Item -LiteralPath $LiteralPath -Force).Length
}

function Resolve-G3E2RA1InRoot {
    param([Parameter(Mandatory = $true)][string]$Root,[Parameter(Mandatory = $true)][string]$RepositoryPath,[switch]$ForMutation)
    $rootPath = [IO.Path]::GetFullPath($Root).TrimEnd('\')
    if ([IO.Path]::IsPathRooted($RepositoryPath)) { throw "Repository path must be relative: $RepositoryPath" }
    $full = [IO.Path]::GetFullPath((Join-Path $rootPath $RepositoryPath.Replace('/', '\')))
    if (-not $full.StartsWith($rootPath + '\', [StringComparison]::OrdinalIgnoreCase)) { throw "Repository path escapes the Vault: $RepositoryPath" }
    if ($ForMutation -and ($RepositoryPath -match '^(raw|research/assets)(/|$)')) { throw "Protected source mutation is forbidden: $RepositoryPath" }
    return $full
}

function Assert-G3E2RA1ExactProperties {
    param([Parameter(Mandatory = $true)][object]$Value,[Parameter(Mandatory = $true)][string[]]$Expected,[Parameter(Mandatory = $true)][string]$Label)
    $actual = @($Value.PSObject.Properties.Name)
    if (@(Compare-Object ($Expected | Sort-Object) ($actual | Sort-Object)).Count -ne 0) { throw "$Label properties differ from contract." }
}

function Import-G3E2RA1Csv {
    param([Parameter(Mandatory = $true)][string]$LiteralPath,[Parameter(Mandatory = $true)][string[]]$Columns,[Parameter(Mandatory = $true)][int]$Count,[Parameter(Mandatory = $true)][string]$Label)
    $rows = @(Import-Csv -LiteralPath $LiteralPath)
    if ($rows.Count -ne $Count) { throw "$Label must contain $Count rows; found $($rows.Count)." }
    foreach ($row in $rows) { Assert-G3E2RA1ExactProperties -Value $row -Expected $Columns -Label $Label }
    return $rows
}

function Test-G3E2RA1BoundManifest {
    param([Parameter(Mandatory = $true)][string]$ManifestPath,[Parameter(Mandatory = $true)][string]$BaseDirectory,[Parameter(Mandatory = $true)][string]$PathColumn,[Parameter(Mandatory = $true)][string[]]$Columns,[Parameter(Mandatory = $true)][int]$Count,[Parameter(Mandatory = $true)][string]$Label)
    $rows = Import-G3E2RA1Csv -LiteralPath $ManifestPath -Columns $Columns -Count $Count -Label $Label
    $base = [IO.Path]::GetFullPath($BaseDirectory).TrimEnd('\')
    foreach ($row in $rows) {
        $relative = [string]$row.$PathColumn
        if ([IO.Path]::IsPathRooted($relative)) { throw "$Label path must be relative: $relative" }
        $full = [IO.Path]::GetFullPath((Join-Path $base $relative.Replace('/', '\')))
        if (-not $full.StartsWith($base + '\', [StringComparison]::OrdinalIgnoreCase)) { throw "$Label path escapes its root: $relative" }
        if ((Get-G3E2RA1Sha256 -LiteralPath $full) -cne ([string]$row.sha256).ToUpperInvariant() -or (Get-G3E2RA1Bytes -LiteralPath $full) -ne [int64]$row.bytes) { throw "$Label identity mismatch: $relative" }
    }
    return $rows
}

function Get-G3E2RA1Context {
    param([Parameter(Mandatory = $true)][string]$VaultRoot,[Parameter(Mandatory = $true)][string]$OverlayRoot,[string]$ExpectedA1Hash)
    $root = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
    $overlay = (Resolve-Path -LiteralPath $OverlayRoot).Path.TrimEnd('\')
    $expectedOverlay = Resolve-G3E2RA1InRoot -Root $root -RepositoryPath 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1'
    if ($overlay -cne $expectedOverlay) { throw 'A1 overlay is not at its canonical repository path.' }
    $lockPath = Join-Path $overlay 'dependency-lock.csv'
    $lock = Import-G3E2RA1Csv -LiteralPath $lockPath -Columns @('dependency_id','role','repository_path','sha256','bytes','reuse_mode','required_by') -Count 3 -Label 'A1 dependency lock'
    $expectedIds = @('G3E1-BUNDLE','G3E2R-A-BUNDLE','G3E2R-A-DEPENDENCY-LOCK')
    if (@(Compare-Object $expectedIds (@($lock.dependency_id) | Sort-Object)).Count -ne 0) { throw 'A1 dependency lock must contain exactly the three approved roots.' }
    $dependencies = @{}
    foreach ($row in $lock) {
        $path = Resolve-G3E2RA1InRoot -Root $root -RepositoryPath ([string]$row.repository_path)
        if ((Get-G3E2RA1Sha256 -LiteralPath $path) -cne $row.sha256 -or (Get-G3E2RA1Bytes -LiteralPath $path) -ne [int64]$row.bytes) { throw "A1 dependency root mismatch: $($row.dependency_id)" }
        $dependencies[$row.dependency_id] = $path
    }
    $aRoot = Split-Path -Parent $dependencies['G3E2R-A-BUNDLE']
    $aArgs = @{ ManifestPath=$dependencies['G3E2R-A-BUNDLE']; BaseDirectory=$aRoot; PathColumn='overlay_path'; Columns=@('role','overlay_path','sha256','bytes'); Count=14; Label='G3E2R-A bundle' }
    $null = Test-G3E2RA1BoundManifest @aArgs
    $g3e1Root = Split-Path -Parent $dependencies['G3E1-BUNDLE']
    $gArgs = @{ ManifestPath=$dependencies['G3E1-BUNDLE']; BaseDirectory=$g3e1Root; PathColumn='candidate_path'; Columns=@('role','candidate_path','sha256','bytes'); Count=30; Label='G3E-1 bundle' }
    $null = Test-G3E2RA1BoundManifest @gArgs
    $a1Manifest = Join-Path $overlay 'a1-bundle-manifest.csv'
    if (Test-Path -LiteralPath $a1Manifest -PathType Leaf) {
        if (-not [string]::IsNullOrWhiteSpace($ExpectedA1Hash) -and (Get-G3E2RA1Sha256 -LiteralPath $a1Manifest) -cne $ExpectedA1Hash.ToUpperInvariant()) { throw 'Expected-A1-Hash mismatch.' }
        $a1Args = @{ ManifestPath=$a1Manifest; BaseDirectory=$overlay; PathColumn='overlay_path'; Columns=@('role','overlay_path','sha256','bytes'); Count=14; Label='A1 bundle' }
        $a1Rows = Test-G3E2RA1BoundManifest @a1Args
        $actual = @(Get-ChildItem -LiteralPath $overlay -Recurse -File | ForEach-Object { $_.FullName.Substring($overlay.Length + 1).Replace('\','/') })
        $expected = @($a1Rows.overlay_path) + 'a1-bundle-manifest.csv'
        if ($actual.Count -ne 15 -or @(Compare-Object ($actual | Sort-Object) ($expected | Sort-Object)).Count -ne 0) { throw 'A1 overlay differs from its exact fifteen-file inventory.' }
    }
    $gates = Import-G3E2RA1Csv -LiteralPath (Join-Path $overlay 'manifests/gate-map.csv') -Columns @('direction','sequence','step_id','mutation_state','gate_function','success_contract','failure_action') -Count 40 -Label 'A1 gate map'
    if (@($gates | Where-Object direction -CEQ 'SEAL').Count -ne 9 -or @($gates | Where-Object direction -CEQ 'FWD').Count -ne 19 -or @($gates | Where-Object direction -CEQ 'REV').Count -ne 12 -or @($gates.step_id | Sort-Object -Unique).Count -ne 40 -or @($gates | Where-Object step_id -match 'FWD-020').Count -ne 0) { throw 'A1 gate map does not have the approved 9/19/12 shape.' }
    $runtimes = Import-G3E2RA1Csv -LiteralPath (Join-Path $overlay 'manifests/runtime-roles.csv') -Columns @('runtime_id','lookup_policy','version_probe_id','required_use') -Count 4 -Label 'A1 runtime roles'
    $invariantContract = Get-Content -Raw -LiteralPath (Join-Path $overlay 'contracts/live-invariant-v1-contract.json') -Encoding UTF8 | ConvertFrom-Json
    $sealContract = Get-Content -Raw -LiteralPath (Join-Path $overlay 'contracts/live-seal-v2-contract.json') -Encoding UTF8 | ConvertFrom-Json
    if ($invariantContract.row_count -ne 28 -or $sealContract.ttl_seconds -ne 900) { throw 'A1 contract cardinality or TTL differs from the approved plan.' }
    return [pscustomobject]@{ Root=$root; Overlay=$overlay; ARoot=$aRoot; G3E1Root=$g3e1Root; Dependencies=$dependencies; Gates=$gates; RuntimeRoles=$runtimes; InvariantContract=$invariantContract; SealContract=$sealContract; A1Manifest=$a1Manifest }
}

function Get-G3E2RA1RuntimeBindings {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][string]$PythonExecutable)
    $candidates = @{ POWERSHELL_HOST=(Get-Process -Id $PID).Path; PYTHON_AGENT=(Resolve-Path -LiteralPath $PythonExecutable).Path; RIPGREP=[string]((Get-Command rg -CommandType Application -ErrorAction Stop | Select-Object -First 1).Source); GIT=[string]((Get-Command git -CommandType Application -ErrorAction Stop | Select-Object -First 1).Source) }
    $bindings = [Collections.Generic.List[object]]::new()
    foreach ($role in $Context.RuntimeRoles) {
        $path = [IO.Path]::GetFullPath($candidates[[string]$role.runtime_id])
        switch ([string]$role.runtime_id) {
            'POWERSHELL_HOST' { $versionOutput = & $path -NoProfile -Command '$PSVersionTable.PSVersion.ToString()' 2>&1; $versionPattern = '^\d+\.' }
            'PYTHON_AGENT' { $versionOutput = & $path --version 2>&1; $versionPattern = '^Python \d+\.' }
            'RIPGREP' { $versionOutput = & $path --version 2>&1; $versionPattern = '^ripgrep \d+\.' }
            'GIT' { $versionOutput = & $path --version 2>&1; $versionPattern = '^git version \d+\.' }
            default { throw "Unknown runtime role: $($role.runtime_id)" }
        }
        $version = @($versionOutput) | Select-Object -First 1
        if ([string]::IsNullOrWhiteSpace([string]$version) -or ([string]$version).Trim() -notmatch $versionPattern) { throw "Runtime version probe failed: $($role.runtime_id); observed=$([string]$version)" }
        $bindings.Add([pscustomobject]@{ runtime_id=[string]$role.runtime_id; executable_path=$path; executable_sha256=Get-G3E2RA1Sha256 -LiteralPath $path; version=([string]$version).Trim(); version_probe_id=[string]$role.version_probe_id })
    }
    return @($bindings)
}

function Assert-G3E2RA1RuntimeBindings {
    param([Parameter(Mandatory = $true)][object[]]$Expected,[Parameter(Mandatory = $true)][object[]]$Actual)
    if ($Expected.Count -ne 4 -or $Actual.Count -ne 4) { throw 'Exactly four runtime bindings are required.' }
    foreach ($wanted in $Expected) {
        $found = @($Actual | Where-Object runtime_id -CEQ $wanted.runtime_id)
        if ($found.Count -ne 1 -or [IO.Path]::GetFullPath([string]$found[0].executable_path) -cne [IO.Path]::GetFullPath([string]$wanted.executable_path) -or [string]$found[0].executable_sha256 -cne [string]$wanted.executable_sha256 -or [string]$found[0].version -cne [string]$wanted.version -or [string]$found[0].version_probe_id -cne [string]$wanted.version_probe_id) { throw "Runtime binding mismatch: $($wanted.runtime_id)" }
    }
}

function Get-G3E2RA1Artifact {
    param([object]$Seal,[string]$Id)
    $row = @($Seal.artifact_bindings | Where-Object artifact_id -CEQ $Id)
    if ($row.Count -ne 1) { throw "Live seal artifact binding must be unique: $Id" }
    return $row[0]
}

function Test-G3E2RA1BoundArtifact {
    param([object]$Context,[object]$Artifact)
    $path = Resolve-G3E2RA1InRoot -Root $Context.Root -RepositoryPath ([string]$Artifact.repository_path)
    if ((Get-G3E2RA1Sha256 -LiteralPath $path) -cne [string]$Artifact.sha256 -or (Get-G3E2RA1Bytes -LiteralPath $path) -ne [int64]$Artifact.bytes) { throw "Artifact binding mismatch: $($Artifact.artifact_id)" }
    return $path
}

function Assert-G3E2RA1SealClosure {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][object]$Seal)
    $bundleColumns = @('bundle_id','repository_path','sha256','bytes')
    $executionColumns = @('execution_id','repository_path','sha256','bytes')
    $artifactColumns = @('artifact_id','repository_path','sha256','bytes')
    $runtimeColumns = @('runtime_id','executable_path','executable_sha256','version','version_probe_id')
    foreach ($row in @($Seal.bundle_bindings)) { Assert-G3E2RA1ExactProperties -Value $row -Expected $bundleColumns -Label 'Seal bundle binding' }
    foreach ($row in @($Seal.execution_bindings)) { Assert-G3E2RA1ExactProperties -Value $row -Expected $executionColumns -Label 'Seal execution binding' }
    foreach ($row in @($Seal.artifact_bindings)) { Assert-G3E2RA1ExactProperties -Value $row -Expected $artifactColumns -Label 'Seal artifact binding' }
    foreach ($row in @($Seal.runtime_bindings)) { Assert-G3E2RA1ExactProperties -Value $row -Expected $runtimeColumns -Label 'Seal runtime binding' }
    if (@(Compare-Object (@($Context.SealContract.required_bundle_binding_ids) | Sort-Object) (@($Seal.bundle_bindings.bundle_id) | Sort-Object)).Count -ne 0 -or @($Seal.bundle_bindings.bundle_id | Sort-Object -Unique).Count -ne 5) { throw 'Seal bundle ids differ from contract.' }
    if (@(Compare-Object (@($Context.SealContract.required_execution_binding_ids) | Sort-Object) (@($Seal.execution_bindings.execution_id) | Sort-Object)).Count -ne 0 -or @($Seal.execution_bindings.execution_id | Sort-Object -Unique).Count -ne 20) { throw 'Seal execution ids differ from contract.' }
    if (@(Compare-Object (@($Context.SealContract.required_artifact_binding_ids) | Sort-Object) (@($Seal.artifact_bindings.artifact_id) | Sort-Object)).Count -ne 0 -or @($Seal.artifact_bindings.artifact_id | Sort-Object -Unique).Count -ne 15) { throw 'Seal artifact ids differ from contract.' }
    if (@(Compare-Object (@($Context.SealContract.required_runtime_ids) | Sort-Object) (@($Seal.runtime_bindings.runtime_id) | Sort-Object)).Count -ne 0 -or @($Seal.runtime_bindings.runtime_id | Sort-Object -Unique).Count -ne 4) { throw 'Seal runtime ids differ from contract.' }

    $expectedBundles = @{
        'G3E1-BUNDLE' = $Context.Dependencies['G3E1-BUNDLE']
        'G3E2R-A-BUNDLE' = $Context.Dependencies['G3E2R-A-BUNDLE']
        'G3E2R-A-DEPENDENCY-LOCK' = $Context.Dependencies['G3E2R-A-DEPENDENCY-LOCK']
        'G3E2R-A1-BUNDLE' = $Context.A1Manifest
    }
    foreach ($id in $expectedBundles.Keys) {
        $row = @($Seal.bundle_bindings | Where-Object bundle_id -CEQ $id)
        $actualPath = Resolve-G3E2RA1InRoot -Root $Context.Root -RepositoryPath ([string]$row[0].repository_path)
        if ($actualPath -cne [IO.Path]::GetFullPath($expectedBundles[$id]) -or (Get-G3E2RA1Sha256 -LiteralPath $actualPath) -cne [string]$row[0].sha256 -or (Get-G3E2RA1Bytes -LiteralPath $actualPath) -ne [int64]$row[0].bytes) { throw "Seal bundle root mismatch: $id" }
    }

    $expectedExecution = @{
        'A1-SEAL-CONTRACT' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/contracts/live-seal-v2-contract.json'
        'A1-INVARIANT-CONTRACT' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/contracts/live-invariant-v1-contract.json'
        'A1-RUNTIME-ROLES' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/manifests/runtime-roles.csv'
        'A1-GATE-MAP' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/manifests/gate-map.csv'
        'A1-GUARD-LIB' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/g3e2r-a1-guard-lib.psm1'
        'A1-FINALIZER' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/finalize-g3e2r-live-seal-v2.ps1'
        'A1-FORWARD-V2' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/invoke-g3e2-transaction-v2.ps1'
        'A1-REVERSE-V2' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r-a1/tools/invoke-g3e2-reverse-v2.ps1'
        'A-COMPONENT-MANIFEST' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/manifests/component-transition-manifest.csv'
        'A-FORWARD-MANIFEST' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/manifests/forward-transaction.csv'
        'A-REVERSE-MANIFEST' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/manifests/reverse-transaction.csv'
        'A-SNAPSHOT-TOOL' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/tools/manage-scoped-cutover-snapshot.ps1'
        'A-WRAPPER-TOOL' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-2r/tools/sync_agents_skills.py'
        'G3E1-COMPONENT-TOOL' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/tools/apply-component-refactors.ps1'
        'G3E1-POSTSTATE-TOOL' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/candidate/tools/apply-exact-poststate.ps1'
        'ROOT-FAST-TOOL' = 'tools/test-wiki-integrity.ps1'
        'COMPONENT-REGISTER' = 'wiki/_outputs/marketing-system-architecture-v0-2/component-register.csv'
        'REFERENCE-TRANSITION' = 'wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/reference-transition.csv'
        'MOS-PRE-TOOL' = 'projects/marketing-operating-system/tools/test-federation-contracts.ps1'
        'MOS-POST-TOOL' = 'projects/marketing-operating-system/tools/test-federation-contracts.ps1'
    }
    foreach ($id in $expectedExecution.Keys) {
        $row = @($Seal.execution_bindings | Where-Object execution_id -CEQ $id)
        if ([string]$row[0].repository_path -cne $expectedExecution[$id]) { throw "Seal execution path mismatch: $id" }
        $path = Resolve-G3E2RA1InRoot -Root $Context.Root -RepositoryPath ([string]$row[0].repository_path)
        if ((Get-G3E2RA1Sha256 -LiteralPath $path) -cne [string]$row[0].sha256 -or (Get-G3E2RA1Bytes -LiteralPath $path) -ne [int64]$row[0].bytes) { throw "Seal execution identity mismatch: $id" }
    }
    foreach ($artifact in @($Seal.artifact_bindings)) { $null = Test-G3E2RA1BoundArtifact -Context $Context -Artifact $artifact }
}

function Read-G3E2RA1SealV2 {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][string]$LiteralPath,[Parameter(Mandatory = $true)][string]$ExpectedA1Hash,[Parameter(Mandatory = $true)][string]$ExpectedSealHash,[Parameter(Mandatory = $true)][object[]]$ActualRuntimeBindings,[ValidateSet('Forward','Reverse')][string]$Use='Forward')
    if ((Get-G3E2RA1Sha256 -LiteralPath $Context.A1Manifest) -cne $ExpectedA1Hash.ToUpperInvariant()) { throw 'Expected-A1-Hash mismatch at seal consumption.' }
    if ((Get-G3E2RA1Sha256 -LiteralPath $LiteralPath) -cne $ExpectedSealHash.ToUpperInvariant()) { throw 'Expected-Seal-Hash mismatch.' }
    $seal = Get-Content -Raw -LiteralPath $LiteralPath -Encoding UTF8 | ConvertFrom-Json
    Assert-G3E2RA1ExactProperties -Value $seal -Expected @($Context.SealContract.required_top_level) -Label 'Live seal'
    if ($seal.seal_contract -cne 'g3e2r-live-seal/v2' -or $seal.state -cne 'sealed' -or $seal.routing_state -cne 'frozen' -or $seal.legacy_token -cne 'projects/No and low code_1st Marketing Agent') { throw 'Live seal identity or frozen-routing contract is invalid.' }
    if ([string]::IsNullOrWhiteSpace([string]$seal.transaction_id) -or [IO.Path]::GetFullPath([string]$seal.vault_root).TrimEnd('\') -cne $Context.Root) { throw 'Live seal transaction id or Vault root is invalid.' }
    if ([int]$seal.time.ttl_seconds -ne 900) { throw 'Live seal TTL must equal 900 seconds.' }
    $sealedAt = [DateTimeOffset]::Parse([string]$seal.time.sealed_at_utc)
    $notAfter = [DateTimeOffset]::Parse([string]$seal.time.not_after_utc)
    if (($notAfter - $sealedAt).TotalSeconds -ne 900) { throw 'Live seal time window is not exactly 900 seconds.' }
    if ($Use -eq 'Forward' -and [DateTimeOffset]::UtcNow -gt $notAfter) { throw 'Live seal has expired for forward start.' }
    Assert-G3E2RA1ExactProperties -Value $seal.approval -Expected @($Context.SealContract.required_approval_fields) -Label 'Live seal approval'
    Assert-G3E2RA1ExactProperties -Value $seal.time -Expected @($Context.SealContract.required_time_fields) -Label 'Live seal time'
    Assert-G3E2RA1ExactProperties -Value $seal.baseline -Expected @($Context.SealContract.required_baseline_fields) -Label 'Live seal baseline'
    foreach ($field in @('live_mutation_approved','automatic_reverse_approved','live_capability_probe_approved','independent_reverse_approved')) { if (-not [bool]$seal.approval.$field) { throw "Live seal approval mismatch: $field" } }
    if ([string]::IsNullOrWhiteSpace([string]$seal.approval.approval_id) -or [string]::IsNullOrWhiteSpace([string]$seal.approval.approved_by) -or [DateTimeOffset]::Parse([string]$seal.approval.approved_at_utc) -gt [DateTimeOffset]::UtcNow.AddSeconds(60)) { throw 'Live seal approval provenance is invalid.' }
    if ([int]$seal.baseline.git_staged_count -ne 0 -or [int]$seal.baseline.root_fast_errors -ne 0 -or [int]$seal.baseline.root_fast_warnings -ne 0 -or [int]$seal.baseline.mos_passed -ne 16 -or [int]$seal.baseline.mos_total -ne 16 -or -not [bool]$seal.baseline.mos_cleanup -or [string]$seal.baseline.mos_vault_mutation -cne 'none' -or [int]$seal.baseline.residue_count -ne 0 -or [string]$seal.baseline.authority_pre -cne 'frozen') { throw 'Live seal baseline does not prove the required green prestate.' }
    if (@($seal.bundle_bindings).Count -ne 5 -or @($seal.execution_bindings).Count -ne 20 -or @($seal.artifact_bindings).Count -ne 15 -or @($seal.runtime_bindings).Count -ne 4) { throw 'Live seal binding cardinality is invalid.' }
    Assert-G3E2RA1SealClosure -Context $Context -Seal $seal
    Assert-G3E2RA1RuntimeBindings -Expected @($seal.runtime_bindings) -Actual $ActualRuntimeBindings
    return $seal
}

function Add-G3E2RA1CompatibilityProperties {
    param([Parameter(Mandatory = $true)][object]$Seal)
    $map = @{ snapshot_selection_path='B-SNAPSHOT-SELECTION'; snapshot_manifest_path='B-SNAPSHOT-MANIFEST'; snapshot_archive_path='B-SNAPSHOT-ARCHIVE'; snapshot_envelope_path='B-SNAPSHOT-ENVELOPE'; exact_poststate_manifest_path='B-EXACT-POSTSTATE-MANIFEST'; exact_poststate_archive_path='G3E1-EXACT-POSTSTATE-ARCHIVE'; hard_reference_manifest_path='B-HARD-REFERENCE-MANIFEST'; restore_current_manifest_path='B-RESTORE-CURRENT-MANIFEST'; rollback_witness_manifest_path='B-ROLLBACK-WITNESS-MANIFEST'; live_invariant_manifest_path='B-LIVE-INVARIANT-MANIFEST' }
    foreach ($name in $map.Keys) { $artifact = Get-G3E2RA1Artifact -Seal $Seal -Id $map[$name]; $Seal | Add-Member -NotePropertyName $name -NotePropertyValue ([string]$artifact.repository_path) -Force; $Seal | Add-Member -NotePropertyName ($name -replace '_path$','_sha256') -NotePropertyValue ([string]$artifact.sha256) -Force }
    $snapshotDir = Split-Path -Parent ([string]$Seal.snapshot_envelope_path)
    $Seal | Add-Member -NotePropertyName snapshot_directory -NotePropertyValue $snapshotDir.Replace('\','/') -Force
    $Seal | Add-Member -NotePropertyName snapshot_envelope_sha256 -NotePropertyValue ([string](Get-G3E2RA1Artifact -Seal $Seal -Id 'B-SNAPSHOT-ENVELOPE').sha256) -Force
    return $Seal
}

function Assert-G3E2RA1GitStagingEmpty {
    param([Parameter(Mandatory = $true)][string]$VaultRoot,[Parameter(Mandatory = $true)][string]$GitExecutable)
    $output = & $GitExecutable -C $VaultRoot diff --cached --name-only 2>&1
    if ($LASTEXITCODE -ne 0) { throw 'Git staging inspection failed.' }
    if (-not [string]::IsNullOrWhiteSpace(($output -join [Environment]::NewLine))) { throw 'Git staging is not empty.' }
}

function Test-G3E2RA1WorkspaceAdvisory {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][object]$Seal)
    $artifact = Get-G3E2RA1Artifact -Seal $Seal -Id 'B-ADVISORY-REFERENCE-REPORT'
    $path = Test-G3E2RA1BoundArtifact -Context $Context -Artifact $artifact
    $rows = @(Import-Csv -LiteralPath $path)
    if (@($rows | Where-Object { $_.repository_path -ceq '.obsidian/workspace.json' -and $_.policy -ceq 'advisory' }).Count -ne 1) { throw 'workspace.json must occur exactly once as Advisory reference.' }
}

function Test-G3E2RA1HardReferences {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][object]$Seal,[Parameter(Mandatory = $true)][ValidateSet('pre','post','reverse')][string]$State,[Parameter(Mandatory = $true)][string]$RipgrepExecutable)
    $artifact = Get-G3E2RA1Artifact -Seal $Seal -Id 'B-HARD-REFERENCE-MANIFEST'
    $path = Test-G3E2RA1BoundArtifact -Context $Context -Artifact $artifact
    $rows = @(Import-Csv -LiteralPath $path | Where-Object { $_.state -in @($State,'both') })
    if (@($rows | Where-Object repository_path -CEQ '.obsidian/workspace.json').Count -ne 0) { throw 'workspace.json must be absent from the hard-reference manifest.' }
    $allowed = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($row in $rows) {
        $full = Resolve-G3E2RA1InRoot -Root $Context.Root -RepositoryPath ([string]$row.repository_path)
        if ((Get-G3E2RA1Sha256 -LiteralPath $full) -cne [string]$row.expected_sha256) { throw "Hard reference hash mismatch: $($row.repository_path)" }
        $text = Get-Content -Raw -LiteralPath $full -Encoding UTF8
        if (([regex]::Matches($text,[regex]::Escape([string]$Seal.legacy_token))).Count -ne [int]$row.expected_legacy_tokens) { throw "Hard reference token mismatch: $($row.repository_path)" }
        $null = $allowed.Add(([string]$row.repository_path).Replace('\','/'))
    }
    $arguments = @('--files-with-matches','--fixed-strings','--hidden','--no-ignore','--glob','!.git/**','--glob','!wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/**','--glob','!.obsidian/workspace.json',[string]$Seal.legacy_token,$Context.Root)
    $scan = & $RipgrepExecutable @arguments 2>&1
    if ($LASTEXITCODE -notin @(0,1)) { throw 'Literal reference scan failed.' }
    foreach ($item in @($scan | Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) })) {
        $full = [IO.Path]::GetFullPath([string]$item)
        $relative = $full.Substring($Context.Root.Length + 1).Replace('\','/')
        if (-not $allowed.Contains($relative)) { throw "Unmanifested hard Legacy reference: $relative" }
    }
}

function Get-G3E2RA1FingerprintV2 {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Container)) { return 'ABSENT' }
    $lines = @(Get-ChildItem -LiteralPath $LiteralPath -Recurse -File -Force | Sort-Object FullName | ForEach-Object { $_.FullName.Substring($LiteralPath.TrimEnd('\').Length + 1).Replace('\','/') + [char]9 + $_.Length + [char]9 + (Get-G3E2RA1Sha256 -LiteralPath $_.FullName) })
    $payload = [Text.Encoding]::UTF8.GetBytes(($lines -join [char]10))
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return ([BitConverter]::ToString($sha.ComputeHash($payload))).Replace('-','') } finally { $sha.Dispose() }
}

function Test-G3E2RA1LiveInvariants {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][object]$Seal,[Parameter(Mandatory = $true)][ValidateSet('pre','post','reverse','pre-reverse')][string]$State,[switch]$AdvisoryExternalDrift)
    $artifact = Get-G3E2RA1Artifact -Seal $Seal -Id 'B-LIVE-INVARIANT-MANIFEST'
    $path = Test-G3E2RA1BoundArtifact -Context $Context -Artifact $artifact
    $rows = Import-G3E2RA1Csv -LiteralPath $path -Columns @($Context.InvariantContract.columns) -Count 28 -Label 'Live invariant manifest'
    if (@($rows.invariant_id | Sort-Object -Unique).Count -ne 28 -or @($rows | Where-Object { $_.state_scope -notin @($Context.InvariantContract.allowed_state_scopes) -or $_.subject_type -notin @($Context.InvariantContract.allowed_subject_types) -or $_.mutation_policy -notin @($Context.InvariantContract.allowed_mutation_policies) }).Count -ne 0) { throw 'Live invariant ids or enumerations differ from contract.' }
    if (@($rows | Where-Object { $_.subject_type -ceq 'file-exact' -and $_.mutation_policy -ceq 'must-not-change' -and $_.basis -ceq $Context.InvariantContract.protected_basis }).Count -ne 14 -or @($rows | Where-Object { $_.subject_type -ceq 'file-exact' -and $_.mutation_policy -ceq 'must-not-change' -and $_.basis -ceq $Context.InvariantContract.sibling_basis }).Count -ne 3) { throw 'Live invariant protected/sibling split differs from 14/3.' }
    if (@(Compare-Object (@($Context.InvariantContract.required_tree_ids) | Sort-Object) (@($rows | Where-Object subject_type -CEQ 'tree-fingerprint').invariant_id | Sort-Object)).Count -ne 0 -or @(Compare-Object (@($Context.InvariantContract.required_wrapper_ids) | Sort-Object) (@($rows | Where-Object subject_type -CEQ 'wrapper-set').invariant_id | Sort-Object)).Count -ne 0) { throw 'Live invariant tree or wrapper ids differ from contract.' }
    foreach ($row in @($rows | Where-Object subject_type -in @('tree-fingerprint','wrapper-set'))) { $contractCount = $Context.InvariantContract.expected_file_counts.PSObject.Properties[[string]$row.invariant_id].Value; if ([int]$row.expected_file_count -ne [int]$contractCount) { throw "Live invariant file count differs from contract: $($row.invariant_id)" } }
    $externalDrift = [Collections.Generic.List[object]]::new()
    foreach ($row in @($rows | Where-Object { $_.state_scope -in @('all',$State) })) {
        $full = Resolve-G3E2RA1InRoot -Root $Context.Root -RepositoryPath ([string]$row.repository_path)
        try {
            switch ([string]$row.subject_type) {
                'file-exact' {
                    if (-not (Test-Path -LiteralPath $full -PathType Leaf) -or (Get-G3E2RA1Sha256 -LiteralPath $full) -cne [string]$row.expected_sha256 -or (Get-G3E2RA1Bytes -LiteralPath $full) -ne [int64]$row.expected_bytes) { throw "Live file invariant mismatch: $($row.invariant_id)" }
                }
                'tree-fingerprint' {
                    if ((Get-G3E2RA1FingerprintV2 -LiteralPath $full) -cne [string]$row.expected_fingerprint_v2 -or @(Get-ChildItem -LiteralPath $full -Recurse -File -Force).Count -ne [int]$row.expected_file_count) { throw "Live tree invariant mismatch: $($row.invariant_id)" }
                }
                'wrapper-set' {
                    if (@(Get-ChildItem -LiteralPath $full -Recurse -File -Force).Count -ne [int]$row.expected_file_count -or (Get-G3E2RA1FingerprintV2 -LiteralPath $full) -cne [string]$row.expected_fingerprint_v2) { throw "Live wrapper invariant mismatch: $($row.invariant_id)" }
                }
                default { throw "Unknown live invariant subject type: $($row.subject_type)" }
            }
        }
        catch {
            if ($AdvisoryExternalDrift -and $row.mutation_policy -ceq 'must-not-change') { $externalDrift.Add([pscustomobject]@{ invariant_id=[string]$row.invariant_id; repository_path=[string]$row.repository_path; finding='external-drift' }) } else { throw }
        }
    }
    return @($externalDrift)
}

function Assert-G3E2RA1NoResidue {
    param([Parameter(Mandatory = $true)][string]$VaultRoot)
    foreach ($pattern in @('*.g3e2r.tmp','*.g3e2r.partial','*.g3e2r.lock','*.g3e2r.compat.json')) {
        if (@(Get-ChildItem -LiteralPath $VaultRoot -Recurse -Force -File -Filter $pattern).Count -ne 0) { throw "G3E2R transaction residue found: $pattern" }
    }
}

function Test-G3E2RA1BManifest {
    param([Parameter(Mandatory = $true)][object]$Context,[Parameter(Mandatory = $true)][object]$Seal)
    $bundle = @($Seal.bundle_bindings | Where-Object bundle_id -CEQ 'G3E2R-B-BUNDLE')
    if ($bundle.Count -ne 1) { throw 'G3E2R-B bundle binding must occur exactly once.' }
    $manifest = Resolve-G3E2RA1InRoot -Root $Context.Root -RepositoryPath ([string]$bundle[0].repository_path)
    if ((Get-G3E2RA1Sha256 -LiteralPath $manifest) -cne [string]$bundle[0].sha256 -or (Get-G3E2RA1Bytes -LiteralPath $manifest) -ne [int64]$bundle[0].bytes) { throw 'G3E2R-B bundle root mismatch.' }
    $base = Split-Path -Parent $manifest
    $bArgs = @{ ManifestPath=$manifest; BaseDirectory=$base; PathColumn='bundle_path'; Columns=@('role','bundle_path','sha256','bytes'); Count=18; Label='G3E2R-B bundle' }
    $rows = Test-G3E2RA1BoundManifest @bArgs
    $actual = @(Get-ChildItem -LiteralPath $base -Recurse -File | ForEach-Object { $_.FullName.Substring($base.Length + 1).Replace('\','/') })
    $expected = @($rows.bundle_path) + (Split-Path -Leaf $manifest)
    if ($actual.Count -ne 19 -or @(Compare-Object ($actual | Sort-Object) ($expected | Sort-Object)).Count -ne 0) { throw 'Prepared B inventory must contain exactly nineteen files.' }
}

function Enter-G3E2RA1Mutex {
    param([Parameter(Mandatory = $true)][string]$VaultRoot,[int]$TimeoutSeconds=0)
    $bytes = [Text.Encoding]::UTF8.GetBytes(([IO.Path]::GetFullPath($VaultRoot)).ToUpperInvariant())
    $sha = [Security.Cryptography.SHA256]::Create()
    try { $token = ([BitConverter]::ToString($sha.ComputeHash($bytes))).Replace('-','').Substring(0,16) } finally { $sha.Dispose() }
    $mutex = [Threading.Mutex]::new($false,'Local\G3E2R-A1-' + $token)
    if (-not $mutex.WaitOne([TimeSpan]::FromSeconds($TimeoutSeconds))) { $mutex.Dispose(); throw 'Another G3E2R-A1 transaction owns the Vault mutex.' }
    return $mutex
}

function Exit-G3E2RA1Mutex {
    param([Parameter(Mandatory = $true)][Threading.Mutex]$Mutex)
    try { $Mutex.ReleaseMutex() } finally { $Mutex.Dispose() }
}

function Test-G3E2RA1Administrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]::new($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

Export-ModuleMember -Function @(
    'Get-G3E2RA1Sha256','Get-G3E2RA1Bytes','Resolve-G3E2RA1InRoot','Assert-G3E2RA1ExactProperties',
    'Import-G3E2RA1Csv','Test-G3E2RA1BoundManifest','Get-G3E2RA1Context',
    'Get-G3E2RA1RuntimeBindings','Assert-G3E2RA1RuntimeBindings','Get-G3E2RA1Artifact',
    'Test-G3E2RA1BoundArtifact','Assert-G3E2RA1SealClosure','Read-G3E2RA1SealV2','Add-G3E2RA1CompatibilityProperties',
    'Assert-G3E2RA1GitStagingEmpty','Test-G3E2RA1WorkspaceAdvisory','Test-G3E2RA1HardReferences',
    'Get-G3E2RA1FingerprintV2','Test-G3E2RA1LiveInvariants','Assert-G3E2RA1NoResidue',
    'Test-G3E2RA1BManifest','Enter-G3E2RA1Mutex','Exit-G3E2RA1Mutex','Test-G3E2RA1Administrator'
)
