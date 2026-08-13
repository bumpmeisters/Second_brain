$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$fixture = Join-Path $repo '.tmp\vault-transaction-v2-tests'
$entryPoint = Join-Path $repo 'tools\invoke-vault-transaction.ps1'
$modulePath = Join-Path $repo 'tools\VaultTransaction.psm1'
$schema = Get-Content -Raw -LiteralPath (Join-Path $repo 'tools\config\vault-transaction-schema.json') | ConvertFrom-Json
$assertions = 0

function Assert-V2([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:assertions++
}

function Write-Utf8([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Force -Path $parent | Out-Null
    }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

function New-Request([string]$Path, [string]$ExpectedSha256, [string]$FindText, [string]$ReplacementText, [int]$ExpectedMatchCount = 1, [string]$Newline = 'Preserve') {
    [ordered]@{
        schema_version = 'vault-transaction/v2'
        operation = 'exact-replace'
        path = $Path
        expected_sha256 = $ExpectedSha256
        expected_match_count = $ExpectedMatchCount
        newline = $Newline
        payload = [ordered]@{
            find_text = $FindText
            replacement_text = $ReplacementText
        }
    }
}

function Invoke-V2Json([string]$RequestJson) {
    Invoke-V2Bytes ([Text.UTF8Encoding]::new($false, $true).GetBytes($RequestJson))
}

function Invoke-V2Bytes([byte[]]$Bytes) {
    $start = [Diagnostics.ProcessStartInfo]::new()
    $start.FileName = 'powershell.exe'
    $start.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$entryPoint`""
    $start.UseShellExecute = $false
    $start.RedirectStandardInput = $true
    $start.RedirectStandardOutput = $true
    $start.RedirectStandardError = $true
    $start.CreateNoWindow = $true
    $process = [Diagnostics.Process]::new()
    $process.StartInfo = $start
    try {
        if (-not $process.Start()) { throw 'Could not start v2 transaction process.' }
        $process.StandardInput.BaseStream.Write($Bytes, 0, $Bytes.Length)
        $process.StandardInput.BaseStream.Flush()
        $process.StandardInput.Close()
        $raw = $process.StandardOutput.ReadToEnd().Trim()
        $null = $process.StandardError.ReadToEnd()
        $process.WaitForExit()
        $receipt = if ($raw) { $raw | ConvertFrom-Json } else { $null }
        [pscustomobject]@{ code = $process.ExitCode; raw = $raw; receipt = $receipt }
    }
    finally {
        $process.Dispose()
    }
}

function Request-Json($Request) {
    $Request | ConvertTo-Json -Depth 8 -Compress
}

function Assert-NoV2Leftovers([string]$Directory) {
    $leftovers = @(Get-ChildItem -LiteralPath $Directory -Force -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -like '*.codex-v2-*'
    })
    Assert-V2 ($leftovers.Count -eq 0) "V2 left temporary or backup files: $($leftovers.Name -join ', ')"
}

try {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
    New-Item -ItemType Directory -Force -Path $fixture | Out-Null
    $target = Join-Path $fixture 'target.txt'
    $relativeTarget = '.tmp/vault-transaction-v2-tests/target.txt'
    $executionMarker = Join-Path $repo 'v2-payload-executed.txt'

    Write-Utf8 $target "alpha`nTOKEN`nomega`n"
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $sentinel = 'SENTINEL-DO-NOT-EXECUTE'
    $unicodeText = -join [char[]]@(0x47, 0x72, 0xFC, 0xDF, 0x65, 0x20, 0x4E16, 0x754C)
    $special = "BETA`n$unicodeText`n`$([IO.File]::WriteAllText('v2-payload-executed.txt','bad')); & whoami | Out-File bad # $sentinel"
    $request = New-Request $relativeTarget $hash 'TOKEN' $special
    $run = Invoke-V2Json (Request-Json $request)
    Assert-V2 ($run.code -eq 0 -and $run.receipt.status -eq 'success') "Unicode and shell-character replacement did not succeed (exit=$($run.code), status=$($run.receipt.status), error_code=$($run.receipt.error_code), message=$($run.receipt.message))."
    Assert-V2 ([IO.File]::ReadAllText($target) -eq "alpha`n$special`nomega`n") 'Replacement payload did not round-trip exactly.'
    Assert-V2 (-not (Test-Path -LiteralPath $executionMarker)) 'Replacement payload was executed as a command.'
    Assert-V2 ($run.receipt.operation -eq 'exact-replace' -and $run.receipt.matches -eq 1) 'Success receipt is incomplete.'
    Assert-V2 ($run.receipt.payload_persisted -eq $false -and $run.receipt.external_payload_files -eq 0 -and $run.receipt.atomic_temp_scope -eq 'target-directory') 'Receipt does not prove the payload-file boundary.'
    Assert-V2 ($run.raw -notmatch [regex]::Escape($sentinel)) 'Receipt leaked replacement payload content.'
    Assert-V2 (@($run.receipt.PSObject.Properties.Name) -notcontains 'payload') 'Receipt contains a payload field.'
    Assert-NoV2Leftovers $fixture

    Write-Utf8 $target 'before DELETE after'
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget $hash 'DELETE' ''))
    Assert-V2 ($run.code -eq 0 -and [IO.File]::ReadAllText($target) -eq 'before  after') 'Empty replacement failed.'

    Write-Utf8 $target 'start TOKEN end'
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $large = 'x' * 1048576
    $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget $hash 'TOKEN' $large))
    Assert-V2 ($run.code -eq 0 -and [IO.File]::ReadAllText($target).Length -eq (10 + $large.Length)) 'Large replacement did not round-trip.'
    Assert-V2 ($run.receipt.new_bytes -gt 1048576) 'Large replacement receipt has an incorrect byte count.'
    Assert-NoV2Leftovers $fixture

    Write-Utf8 $target 'stable target'
    $before = [IO.File]::ReadAllText($target)
    $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget ('0' * 64) 'target' 'changed'))
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'target-hash-mismatch') 'Hash mismatch did not fail with the stable code.'
    Assert-V2 ([IO.File]::ReadAllText($target) -eq $before) 'Hash mismatch changed the target.'

    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget $hash 'target' 'changed' 2))
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'exact-match-count-mismatch') 'Match-count mismatch did not fail with the stable code.'
    Assert-V2 ([IO.File]::ReadAllText($target) -eq $before) 'Match-count mismatch changed the target.'

    $run = Invoke-V2Json (Request-Json (New-Request 'raw/nonexistent-v2-test.md' ('0' * 64) 'x' 'y'))
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'protected-path') 'Protected source path was not rejected.'
    $run = Invoke-V2Json (Request-Json (New-Request '../outside-vault-v2-test.md' ('0' * 64) 'x' 'y'))
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'outside-vault') 'Outside-vault path was not rejected.'

    $junctionTarget = Join-Path $fixture 'junction-target'
    $junctionPath = Join-Path $fixture 'junction'
    New-Item -ItemType Directory -Force -Path $junctionTarget | Out-Null
    $linkedTarget = Join-Path $junctionTarget 'linked.txt'
    Write-Utf8 $linkedTarget 'linked target'
    $junctionCreated = $false
    try {
        New-Item -ItemType Junction -Path $junctionPath -Target $junctionTarget -ErrorAction Stop | Out-Null
        $junctionCreated = $true
    }
    catch {
        Write-Host 'Reparse-point test skipped because junction creation is unavailable.'
    }
    if ($junctionCreated) {
        $junctionHash = (Get-FileHash -LiteralPath (Join-Path $junctionPath 'linked.txt') -Algorithm SHA256).Hash
        $run = Invoke-V2Json (Request-Json (New-Request '.tmp/vault-transaction-v2-tests/junction/linked.txt' $junctionHash 'target' 'changed'))
        Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'outside-vault') 'Reparse-point path was not rejected.'
        Assert-V2 ([IO.File]::ReadAllText($linkedTarget) -eq 'linked target') 'Reparse-point rejection changed the linked target.'
    }
    if (Test-Path -LiteralPath $junctionPath) { [IO.Directory]::Delete($junctionPath, $false) }

    $unknown = New-Request $relativeTarget $hash 'target' 'changed'
    $unknown['unexpected'] = 'reject-me'
    $run = Invoke-V2Json (Request-Json $unknown)
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'invalid-request') 'Unknown request field was not rejected.'

    $unsupported = New-Request $relativeTarget $hash 'target' 'changed'
    $unsupported.operation = 'json-set-path'
    $run = Invoke-V2Json (Request-Json $unsupported)
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'unsupported-operation') 'Reserved operation was not rejected.'

    $run = Invoke-V2Bytes ([byte[]](0xFF, 0xFE, 0xFD))
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'invalid-encoding') 'Invalid UTF-8 request was not rejected.'

    $oversizedRequest = [Text.Encoding]::ASCII.GetBytes('x' * ([int]$schema.limits.max_request_utf8_bytes + 1))
    $run = Invoke-V2Bytes $oversizedRequest
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'request-too-large') 'Oversized stdin request was not rejected before parsing.'

    [IO.File]::WriteAllBytes($target, [byte[]](0xFF, 0xFE, 0xFD))
    $invalidTargetBefore = [IO.File]::ReadAllBytes($target)
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget $hash 'x' 'y'))
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'invalid-encoding') 'Invalid UTF-8 target was not rejected.'
    Assert-V2 ([Convert]::ToBase64String([IO.File]::ReadAllBytes($target)) -eq [Convert]::ToBase64String($invalidTargetBefore)) 'Invalid UTF-8 target changed on failure.'

    Write-Utf8 $target "alpha`r`nTOKEN`r`n"
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget $hash 'TOKEN' 'beta' 1 'LF'))
    Assert-V2 ($run.code -eq 0 -and [IO.File]::ReadAllText($target) -eq "alpha`nbeta`n") 'Explicit LF normalization failed.'
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget $hash 'beta' 'BETA' 1 'CRLF'))
    Assert-V2 ($run.code -eq 0 -and [IO.File]::ReadAllText($target) -eq "alpha`r`nBETA`r`n") 'Explicit CRLF normalization failed.'
    Assert-NoV2Leftovers $fixture

    Write-Utf8 $target 'locked target'
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $lock = [IO.File]::Open($target, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::Read)
    try {
        $run = Invoke-V2Json (Request-Json (New-Request $relativeTarget $hash 'target' 'changed'))
    }
    finally {
        $lock.Dispose()
    }
    Assert-V2 ($run.code -ne 0 -and $run.receipt.error_code -eq 'write-failed') 'Forced replacement failure did not return write-failed.'
    Assert-V2 ([IO.File]::ReadAllText($target) -eq 'locked target') 'Forced replacement failure changed the target.'
    Assert-NoV2Leftovers $fixture

    Import-Module -Force $modulePath
    Write-Utf8 $target 'object route'
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $objectReceipt = Invoke-VaultTransaction -RequestObject ([pscustomobject](New-Request $relativeTarget $hash 'object' 'in-process'))
    Assert-V2 ($objectReceipt.status -eq 'success' -and [IO.File]::ReadAllText($target) -eq 'in-process route') 'In-process PowerShell object route failed.'
    Assert-NoV2Leftovers $fixture

    Write-Utf8 $target 'invalid unicode target'
    $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    $invalidUnicode = [string][char]0xD800
    $objectReceipt = Invoke-VaultTransaction -RequestObject ([pscustomobject](New-Request $relativeTarget $hash 'target' $invalidUnicode))
    Assert-V2 ($objectReceipt.status -eq 'failure' -and $objectReceipt.error_code -eq 'invalid-encoding') 'Invalid in-memory Unicode was not rejected.'
    Assert-V2 ([IO.File]::ReadAllText($target) -eq 'invalid unicode target') 'Invalid in-memory Unicode changed the target.'

    $representativeReplacements = @(
        'plain-ascii',
        'Grüße',
        '世界',
        'accented-éèê',
        "line-one`nline-two",
        "line-one`r`nline-two",
        '"double quotes"',
        "'single quotes'",
        'backtick-`-literal',
        '$dollar and $(subexpression)',
        '; semicolon',
        '& ampersand',
        '| pipeline',
        '<tag>',
        '[brackets] {braces}',
        "`ttab",
        'equals=value',
        'slash/and\backslash',
        'colon:comma,period.',
        'final-case-20'
    )
    for ($case = 0; $case -lt $representativeReplacements.Count; $case++) {
        $replacement = $representativeReplacements[$case]
        Write-Utf8 $target "prefix TOKEN suffix"
        $hash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
        $receipt = Invoke-VaultTransaction -RequestObject ([pscustomobject](New-Request $relativeTarget $hash 'TOKEN' $replacement))
        Assert-V2 ($receipt.status -eq 'success') "Representative edit $($case + 1) failed."
        Assert-V2 ([IO.File]::ReadAllText($target) -eq "prefix $replacement suffix") "Representative edit $($case + 1) did not round-trip."
    }
    Assert-NoV2Leftovers $fixture
}
finally {
    if (Get-Module VaultTransaction) { Remove-Module VaultTransaction -Force }
    if (Test-Path -LiteralPath $executionMarker) { Remove-Item -LiteralPath $executionMarker -Force }
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}

Write-Host "Vault transaction v2 tests passed ($assertions assertions)."
