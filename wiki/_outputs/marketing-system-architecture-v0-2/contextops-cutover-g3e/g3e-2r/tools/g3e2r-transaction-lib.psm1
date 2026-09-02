Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-G3E2RSha256 {
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][string]$LiteralPath)

    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) {
        throw "Required file is missing: $LiteralPath"
    }
    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Get-G3E2RBytesSha256 {
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][byte[]]$Bytes)

    $algorithm = [Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($algorithm.ComputeHash($Bytes))).Replace('-', '')
    }
    finally {
        $algorithm.Dispose()
    }
}

function Resolve-G3E2RInRoot {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$RepositoryPath,
        [switch]$ForMutation
    )

    if ([string]::IsNullOrWhiteSpace($RepositoryPath) -or [IO.Path]::IsPathRooted($RepositoryPath)) {
        throw "Expected a non-empty repository-relative path: $RepositoryPath"
    }
    $normalized = $RepositoryPath.Replace('\', '/')
    if ($normalized -match '(^|/)\.\.(/|$)') {
        throw "Path traversal is forbidden: $RepositoryPath"
    }
    if ($ForMutation -and $normalized -match '^(raw|research|inbox)(/|$)') {
        throw "Protected source path is outside transaction authority: $RepositoryPath"
    }
    $resolvedRoot = [IO.Path]::GetFullPath($Root).TrimEnd('\')
    $candidate = [IO.Path]::GetFullPath((Join-Path $resolvedRoot $normalized.Replace('/', '\')))
    if (($candidate -ne $resolvedRoot) -and (-not $candidate.StartsWith($resolvedRoot + '\', [StringComparison]::OrdinalIgnoreCase))) {
        throw "Path escapes supplied root: $RepositoryPath"
    }
    return $candidate
}

function Assert-G3E2RColumns {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][object[]]$Rows,
        [Parameter(Mandatory = $true)][string[]]$Expected,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if ($Rows.Count -eq 0) { throw "$Label has no rows." }
    $actual = @($Rows[0].PSObject.Properties.Name)
    if ($actual.Count -ne $Expected.Count) { throw "$Label column count differs from contract." }
    for ($index = 0; $index -lt $Expected.Count; $index++) {
        if ($actual[$index] -cne $Expected[$index]) {
            throw "$Label column mismatch at index ${index}: expected $($Expected[$index]); actual $($actual[$index])"
        }
    }
}

function Import-G3E2RDependencyLock {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$VaultRoot,
        [Parameter(Mandatory = $true)][string]$LockPath
    )

    $rows = @(Import-Csv -LiteralPath $LockPath)
    Assert-G3E2RColumns -Rows $rows -Expected @(
        'dependency_id', 'role', 'repository_path', 'sha256', 'bytes', 'reuse_mode', 'required_by'
    ) -Label 'Dependency lock'
    if ($rows.Count -ne 14) { throw "Expected exactly 14 dependency rows; found $($rows.Count)." }
    if (@($rows.dependency_id | Sort-Object -Unique).Count -ne $rows.Count) { throw 'Dependency ids must be unique.' }
    if (@($rows.repository_path | ForEach-Object { $_.ToLowerInvariant() } | Sort-Object -Unique).Count -ne $rows.Count) {
        throw 'Dependency paths must be unique under case-insensitive comparison.'
    }

    $map = @{}
    foreach ($row in $rows) {
        if ($row.sha256 -notmatch '^[A-F0-9]{64}$') { throw "Malformed dependency hash: $($row.dependency_id)" }
        $path = Resolve-G3E2RInRoot -Root $VaultRoot -RepositoryPath ([string]$row.repository_path)
        $item = Get-Item -LiteralPath $path
        if ($item.Length -ne [int64]$row.bytes) { throw "Dependency byte-count mismatch: $($row.dependency_id)" }
        $actual = Get-G3E2RSha256 -LiteralPath $path
        if ($actual -ne $row.sha256) { throw "Dependency hash mismatch: $($row.dependency_id); actual $actual" }
        $map[[string]$row.dependency_id] = [pscustomobject]@{ Row = $row; Path = $path }
    }
    return $map
}

function Get-G3E2RDependency {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][hashtable]$Lock,
        [Parameter(Mandatory = $true)][string]$Id
    )

    if (-not $Lock.ContainsKey($Id)) { throw "Dependency id is not locked: $Id" }
    return $Lock[$Id]
}

function Import-G3E2RTransactionManifest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$LiteralPath,
        [Parameter(Mandatory = $true)][ValidateSet('FWD', 'REV')][string]$Prefix,
        [Parameter(Mandatory = $true)][int]$ExpectedCount
    )

    $rows = @(Import-Csv -LiteralPath $LiteralPath)
    if ($rows.Count -ne $ExpectedCount) { throw "$Prefix manifest row count is $($rows.Count); expected $ExpectedCount." }
    for ($index = 0; $index -lt $rows.Count; $index++) {
        $expectedSequence = $index + 1
        $expectedId = '{0}-{1:D3}' -f $Prefix, $expectedSequence
        if ([int]$rows[$index].sequence -ne $expectedSequence -or $rows[$index].step_id -cne $expectedId) {
            throw "$Prefix sequence mismatch at row $expectedSequence."
        }
    }
    if ($Prefix -eq 'FWD') {
        Assert-G3E2RColumns -Rows $rows -Expected @(
            'sequence', 'step_id', 'phase', 'mutation_state', 'executor', 'timeout_seconds',
            'precondition', 'success_evidence', 'on_failure'
        ) -Label 'Forward transaction'
        if (@($rows | Where-Object step_id -eq 'FWD-020').Count -gt 0) { throw 'FWD-020 is forbidden in G3E2R.' }
        if (@($rows | Where-Object { [int]$_.sequence -lt 10 -and $_.mutation_state -eq 'started' }).Count -gt 0) {
            throw 'Durable mutation cannot begin before FWD-010.'
        }
        if (@($rows | Where-Object { [int]$_.sequence -ge 10 -and $_.mutation_state -ne 'started' }).Count -gt 0) {
            throw 'Every FWD-010+ row must remain inside automatic-reverse scope.'
        }
    }
    else {
        Assert-G3E2RColumns -Rows $rows -Expected @(
            'sequence', 'step_id', 'phase', 'executor', 'timeout_seconds',
            'precondition', 'success_evidence', 'failure_rule'
        ) -Label 'Reverse transaction'
    }
    return @($rows)
}

function Get-G3E2RFingerprintV2 {
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][object[]]$Rows)

    $lines = [object[]]@($Rows | ForEach-Object {
        $path = ([string]$_.repository_path).Replace('\', '/')
        $hash = ([string]$_.sha256).ToUpperInvariant()
        $bytes = [int64]$_.bytes
        if ([string]::IsNullOrWhiteSpace($path) -or $path -match '(^|/)\.\.(/|$)' -or $hash -notmatch '^[A-F0-9]{64}$') {
            throw 'Fingerprint input is malformed.'
        }
        [pscustomobject]@{ Path = $path; Line = "$path`t$hash`t$bytes" }
    })
    [Array]::Sort($lines, [Collections.Generic.Comparer[object]]::Create({
        param($left, $right)
        return [StringComparer]::Ordinal.Compare([string]$left.Path, [string]$right.Path)
    }))
    for ($index = 1; $index -lt $lines.Count; $index++) {
        if ([StringComparer]::Ordinal.Compare($lines[$index - 1].Path, $lines[$index].Path) -ge 0) {
            throw 'Fingerprint paths must be unique under ordinal comparison.'
        }
    }
    $text = (@($lines | ForEach-Object { $_.Line }) -join "`n")
    return Get-G3E2RBytesSha256 -Bytes ([Text.UTF8Encoding]::new($false).GetBytes($text))
}

function ConvertTo-G3E2RNativeArgument {
    param([AllowEmptyString()][string]$Value)

    if ($Value.Length -eq 0) { return '""' }
    if ($Value -notmatch '[\s"]') { return $Value }
    $builder = [Text.StringBuilder]::new()
    $null = $builder.Append('"')
    $slashes = 0
    foreach ($character in $Value.ToCharArray()) {
        if ($character -eq '\') {
            $slashes++
            continue
        }
        if ($character -eq '"') {
            $null = $builder.Append(('\' * (($slashes * 2) + 1)))
            $null = $builder.Append('"')
            $slashes = 0
            continue
        }
        if ($slashes -gt 0) { $null = $builder.Append(('\' * $slashes)); $slashes = 0 }
        $null = $builder.Append($character)
    }
    if ($slashes -gt 0) { $null = $builder.Append(('\' * ($slashes * 2))) }
    $null = $builder.Append('"')
    return $builder.ToString()
}

function Invoke-G3E2RBoundProcess {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$FilePath,
        [Parameter(Mandatory = $true)][string[]]$ArgumentList,
        [Parameter(Mandatory = $true)][ValidateRange(1, 1800)][int]$TimeoutSeconds,
        [string]$WorkingDirectory
    )

    if (-not (Test-Path -LiteralPath $FilePath -PathType Leaf)) { throw "Executable is missing: $FilePath" }
    $info = [Diagnostics.ProcessStartInfo]::new()
    $info.FileName = $FilePath
    $info.Arguments = (@($ArgumentList | ForEach-Object { ConvertTo-G3E2RNativeArgument -Value ([string]$_) }) -join ' ')
    $info.UseShellExecute = $false
    $info.CreateNoWindow = $true
    $info.RedirectStandardOutput = $true
    $info.RedirectStandardError = $true
    if (-not [string]::IsNullOrWhiteSpace($WorkingDirectory)) { $info.WorkingDirectory = $WorkingDirectory }

    $process = [Diagnostics.Process]::new()
    $process.StartInfo = $info
    try {
        if (-not $process.Start()) { throw "Failed to start process: $FilePath" }
        $stdoutTask = $process.StandardOutput.ReadToEndAsync()
        $stderrTask = $process.StandardError.ReadToEndAsync()
        if (-not $process.WaitForExit($TimeoutSeconds * 1000)) {
            try { $process.Kill() } catch { }
            throw "Process watchdog timeout after $TimeoutSeconds seconds: $FilePath"
        }
        $stdout = $stdoutTask.Result
        $stderr = $stderrTask.Result
        if ($process.ExitCode -ne 0) {
            throw "Process failed with exit code $($process.ExitCode): $FilePath`n$stdout`n$stderr"
        }
        return [pscustomobject]@{ ExitCode = $process.ExitCode; StdOut = $stdout; StdErr = $stderr }
    }
    finally {
        $process.Dispose()
    }
}

function Test-G3E2RAdministrator {
    [CmdletBinding()]
    param()

    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]::new($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Read-G3E2RSeal {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$LiteralPath,
        [Parameter(Mandatory = $true)][hashtable]$ExpectedBindings
    )

    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) { throw "Live seal is missing: $LiteralPath" }
    $seal = Get-Content -Raw -LiteralPath $LiteralPath -Encoding UTF8 | ConvertFrom-Json
    if ($seal.seal_contract -cne 'g3e2r-live-seal/v1' -or $seal.state -cne 'sealed') {
        throw 'Live seal contract or state is invalid.'
    }
    foreach ($field in @('transaction_id', 'approval_id', 'snapshot_selection_path', 'snapshot_directory',
        'exact_poststate_manifest_path', 'exact_poststate_archive_path', 'hard_reference_manifest_path',
        'restore_current_manifest_path', 'rollback_witness_manifest_path', 'legacy_token')) {
        if ([string]::IsNullOrWhiteSpace([string]$seal.$field)) { throw "Live seal field is missing: $field" }
    }
    if ($seal.routing_state -cne 'frozen' -or -not [bool]$seal.automatic_reverse_approved -or -not [bool]$seal.live_capability_probe_approved) {
        throw 'Live seal lacks frozen routing, automatic reverse, or capability-probe authority.'
    }
    foreach ($key in $ExpectedBindings.Keys) {
        if ([string]$seal.$key -cne [string]$ExpectedBindings[$key]) { throw "Live seal binding mismatch: $key" }
    }
    return $seal
}

Export-ModuleMember -Function @(
    'Get-G3E2RSha256', 'Get-G3E2RBytesSha256', 'Resolve-G3E2RInRoot', 'Assert-G3E2RColumns',
    'Import-G3E2RDependencyLock', 'Get-G3E2RDependency', 'Import-G3E2RTransactionManifest',
    'Get-G3E2RFingerprintV2', 'Invoke-G3E2RBoundProcess', 'Test-G3E2RAdministrator', 'Read-G3E2RSeal'
)
