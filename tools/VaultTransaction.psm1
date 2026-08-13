Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Throw-VaultTransactionError {
    param(
        [Parameter(Mandatory = $true)][string]$Code,
        [Parameter(Mandatory = $true)][string]$Message
    )
    $exception = [InvalidOperationException]::new($Message)
    $exception.Data['vault_transaction_error_code'] = $Code
    throw $exception
}

function Get-VaultTransactionFieldNames {
    param([Parameter(Mandatory = $true)][object]$Object)
    if ($Object -is [Collections.IDictionary]) {
        return @($Object.Keys | ForEach-Object { [string]$_ })
    }
    return @($Object.PSObject.Properties | Where-Object {
        $_.MemberType -in @('NoteProperty', 'Property')
    } | ForEach-Object { $_.Name })
}

function Get-VaultTransactionField {
    param(
        [Parameter(Mandatory = $true)][object]$Object,
        [Parameter(Mandatory = $true)][string]$Name
    )
    if ($Object -is [Collections.IDictionary]) {
        return $Object[$Name]
    }
    $property = @($Object.PSObject.Properties | Where-Object { $_.Name -ceq $Name })
    if ($property.Count -ne 1) { return $null }
    return $property[0].Value
}

function Assert-VaultTransactionFields {
    param(
        [Parameter(Mandatory = $true)][object]$Object,
        [Parameter(Mandatory = $true)][string[]]$Required,
        [string[]]$Optional = @()
    )
    $names = @(Get-VaultTransactionFieldNames $Object)
    $allowed = @($Required + $Optional)
    foreach ($name in $names) {
        if (@($allowed | Where-Object { $_ -ceq $name }).Count -ne 1) {
            Throw-VaultTransactionError 'invalid-request' 'The request contains an unknown field.'
        }
    }
    foreach ($name in $Required) {
        if (@($names | Where-Object { $_ -ceq $name }).Count -ne 1) {
            Throw-VaultTransactionError 'invalid-request' 'The request is missing a required field.'
        }
    }
}

function New-VaultTransactionFailureReceipt {
    param(
        [string]$Operation,
        [string]$Path,
        [Parameter(Mandatory = $true)][string]$ErrorCode,
        [Parameter(Mandatory = $true)][string]$Message,
        [string]$OldSha256,
        [string]$NewSha256,
        [Parameter(Mandatory = $true)][string]$TargetState
    )
    [pscustomobject][ordered]@{
        schema_version = 'vault-transaction/v2'
        status = 'failure'
        operation = $Operation
        path = $Path
        error_code = $ErrorCode
        message = $Message
        old_sha256 = $OldSha256
        new_sha256 = $NewSha256
        target_state = $TargetState
    }
}

function Invoke-VaultTransaction {
    [CmdletBinding(DefaultParameterSetName = 'Object')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Object')][object]$RequestObject,
        [Parameter(Mandatory = $true, ParameterSetName = 'Bytes')][byte[]]$RequestBytes
    )

    $schemaPath = Join-Path $PSScriptRoot 'config\vault-transaction-schema.json'
    $vaultRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..')).TrimEnd([IO.Path]::DirectorySeparatorChar)
    $strictUtf8 = [Text.UTF8Encoding]::new($false, $true)
    $outputUtf8 = [Text.UTF8Encoding]::new($false, $true)
    $operation = $null
    $relative = $null
    $target = $null
    $oldHash = $null
    $targetState = 'unchanged'
    $tempPath = $null
    $backupPath = $null
    $rollbackDiscard = $null

    try {
        $schema = Get-Content -Raw -LiteralPath $schemaPath | ConvertFrom-Json
        if ($PSCmdlet.ParameterSetName -eq 'Bytes') {
            if ($RequestBytes.LongLength -gt [long]$schema.limits.max_request_utf8_bytes) {
                Throw-VaultTransactionError 'request-too-large' 'The transaction request exceeds the configured size limit.'
            }
            try {
                $RequestJson = $strictUtf8.GetString($RequestBytes)
            }
            catch [Text.DecoderFallbackException] {
                Throw-VaultTransactionError 'invalid-encoding' 'The transaction request is not valid UTF-8.'
            }
            try {
                $RequestObject = $RequestJson | ConvertFrom-Json
            }
            catch {
                Throw-VaultTransactionError 'invalid-request' 'The transaction request is not valid JSON.'
            }
        }

        if ($null -eq $RequestObject -or $RequestObject -is [Array] -or $RequestObject -is [string]) {
            Throw-VaultTransactionError 'invalid-request' 'The transaction request must be one object.'
        }
        Assert-VaultTransactionFields $RequestObject @(
            'schema_version',
            'operation',
            'path',
            'expected_sha256',
            'expected_match_count',
            'payload'
        ) @('newline')

        $schemaVersion = Get-VaultTransactionField $RequestObject 'schema_version'
        if ($schemaVersion -isnot [string] -or $schemaVersion -cne 'vault-transaction/v2') {
            Throw-VaultTransactionError 'unsupported-schema-version' 'The transaction schema version is not supported.'
        }

        $operation = Get-VaultTransactionField $RequestObject 'operation'
        if ($operation -isnot [string]) {
            Throw-VaultTransactionError 'invalid-request' 'The operation must be a string.'
        }
        if ($operation -cne 'exact-replace') {
            Throw-VaultTransactionError 'unsupported-operation' 'The transaction operation is not supported by this spike.'
        }

        $requestPath = Get-VaultTransactionField $RequestObject 'path'
        if ($requestPath -isnot [string] -or [string]::IsNullOrWhiteSpace($requestPath)) {
            Throw-VaultTransactionError 'invalid-path' 'The transaction path must be a non-empty string.'
        }
        if ([IO.Path]::IsPathRooted($requestPath)) {
            Throw-VaultTransactionError 'invalid-path' 'The transaction path must be vault-relative.'
        }
        try {
            $target = [IO.Path]::GetFullPath((Join-Path $vaultRoot $requestPath))
        }
        catch {
            Throw-VaultTransactionError 'invalid-path' 'The transaction path is invalid.'
        }
        if (-not $target.StartsWith($vaultRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
            Throw-VaultTransactionError 'outside-vault' 'The transaction target resolves outside the vault.'
        }
        $relative = $target.Substring($vaultRoot.Length + 1).Replace('\', '/')
        foreach ($protectedRoot in @('raw/', 'research/assets/')) {
            if ($relative.StartsWith($protectedRoot, [StringComparison]::OrdinalIgnoreCase)) {
                Throw-VaultTransactionError 'protected-path' 'The transaction target is inside a protected source root.'
            }
        }
        try {
            $targetItem = Get-Item -LiteralPath $target -Force -ErrorAction Stop
        }
        catch {
            Throw-VaultTransactionError 'target-not-found' 'The transaction target does not exist.'
        }
        if ($targetItem.PSIsContainer) {
            Throw-VaultTransactionError 'target-not-found' 'The transaction target does not exist.'
        }
        $componentPath = $target
        $component = $targetItem
        while (-not $componentPath.Equals($vaultRoot, [StringComparison]::OrdinalIgnoreCase)) {
            if (($component.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
                Throw-VaultTransactionError 'outside-vault' 'Reparse-point targets are not allowed.'
            }
            $parentPath = Split-Path -Parent $componentPath
            if ([string]::IsNullOrWhiteSpace($parentPath) -or $parentPath -eq $componentPath) {
                Throw-VaultTransactionError 'outside-vault' 'The target path could not be bounded to the vault.'
            }
            $componentPath = $parentPath
            if (-not $componentPath.Equals($vaultRoot, [StringComparison]::OrdinalIgnoreCase)) {
                $component = Get-Item -LiteralPath $componentPath -Force -ErrorAction Stop
            }
        }
        if ($targetItem.Length -gt [long]$schema.limits.max_target_utf8_bytes) {
            Throw-VaultTransactionError 'target-too-large' 'The transaction target exceeds the configured size limit.'
        }

        $expectedHash = Get-VaultTransactionField $RequestObject 'expected_sha256'
        if ($expectedHash -isnot [string] -or $expectedHash -notmatch '^[0-9A-Fa-f]{64}$') {
            Throw-VaultTransactionError 'invalid-precondition' 'The expected SHA-256 value is invalid.'
        }
        $expectedMatchesRaw = Get-VaultTransactionField $RequestObject 'expected_match_count'
        $expectedMatches = 0
        if (-not [int]::TryParse(
            [Convert]::ToString($expectedMatchesRaw, [Globalization.CultureInfo]::InvariantCulture),
            [Globalization.NumberStyles]::None,
            [Globalization.CultureInfo]::InvariantCulture,
            [ref]$expectedMatches
        ) -or $expectedMatches -lt 1 -or $expectedMatches -gt [int]$schema.limits.max_expected_match_count) {
            Throw-VaultTransactionError 'invalid-precondition' 'The expected match count is invalid.'
        }

        $newline = if (@(Get-VaultTransactionFieldNames $RequestObject) -ccontains 'newline') {
            Get-VaultTransactionField $RequestObject 'newline'
        } else {
            'Preserve'
        }
        if ($newline -isnot [string] -or @('Preserve', 'LF', 'CRLF') -cnotcontains $newline) {
            Throw-VaultTransactionError 'invalid-precondition' 'The newline policy is invalid.'
        }

        $payload = Get-VaultTransactionField $RequestObject 'payload'
        if ($null -eq $payload -or $payload -is [Array] -or $payload -is [string]) {
            Throw-VaultTransactionError 'invalid-request' 'The operation payload must be one object.'
        }
        Assert-VaultTransactionFields $payload @('find_text', 'replacement_text')
        $findText = Get-VaultTransactionField $payload 'find_text'
        $replacementText = Get-VaultTransactionField $payload 'replacement_text'
        if ($findText -isnot [string] -or $replacementText -isnot [string] -or $findText.Length -eq 0) {
            Throw-VaultTransactionError 'invalid-request' 'The exact-replace payload is invalid.'
        }
        try {
            $findTextBytes = $outputUtf8.GetByteCount($findText)
            $replacementTextBytes = $outputUtf8.GetByteCount($replacementText)
        }
        catch [Text.EncoderFallbackException] {
            Throw-VaultTransactionError 'invalid-encoding' 'The operation payload contains invalid Unicode.'
        }
        if ($findTextBytes -gt [long]$schema.limits.max_find_text_utf8_bytes -or
            $replacementTextBytes -gt [long]$schema.limits.max_replacement_text_utf8_bytes) {
            Throw-VaultTransactionError 'payload-too-large' 'The operation payload exceeds the configured size limit.'
        }

        try {
            $targetBytes = [IO.File]::ReadAllBytes($target)
            $sha256 = [Security.Cryptography.SHA256]::Create()
            try {
                $oldHash = ([BitConverter]::ToString($sha256.ComputeHash($targetBytes))).Replace('-', '')
            }
            finally {
                $sha256.Dispose()
            }
            $oldByteCount = $targetBytes.LongLength
        }
        catch {
            Throw-VaultTransactionError 'transformation-failed' 'The target hash could not be read.'
        }
        if (-not $oldHash.Equals($expectedHash, [StringComparison]::OrdinalIgnoreCase)) {
            Throw-VaultTransactionError 'target-hash-mismatch' 'The target hash does not match the transaction precondition.'
        }
        try {
            $textOffset = if ($targetBytes.Length -ge 3 -and
                $targetBytes[0] -eq 0xEF -and
                $targetBytes[1] -eq 0xBB -and
                $targetBytes[2] -eq 0xBF) { 3 } else { 0 }
            $oldText = $strictUtf8.GetString($targetBytes, $textOffset, $targetBytes.Length - $textOffset)
        }
        catch [Text.DecoderFallbackException] {
            Throw-VaultTransactionError 'invalid-encoding' 'The target is not valid UTF-8.'
        }
        catch {
            Throw-VaultTransactionError 'transformation-failed' 'The target could not be read.'
        }

        $matchCount = 0
        $offset = 0
        while (($index = $oldText.IndexOf($findText, $offset, [StringComparison]::Ordinal)) -ge 0) {
            $matchCount++
            $offset = $index + $findText.Length
        }
        if ($matchCount -ne $expectedMatches) {
            Throw-VaultTransactionError 'exact-match-count-mismatch' 'The exact match count does not match the transaction precondition.'
        }

        $newText = $oldText.Replace($findText, $replacementText)
        $lineBreak = if ($newline -eq 'LF') {
            "`n"
        } elseif ($newline -eq 'CRLF') {
            "`r`n"
        } elseif ($oldText.Contains("`r`n")) {
            "`r`n"
        } else {
            "`n"
        }
        if ($newline -ne 'Preserve') {
            $newText = $newText -replace "`r`n|`r|`n", $lineBreak
        }

        $oldLines = @($oldText -split '\r?\n')
        $newLines = @($newText -split '\r?\n')
        $changedLines = 0
        for ($i = 0; $i -lt [Math]::Max($oldLines.Count, $newLines.Count); $i++) {
            $oldLine = if ($i -lt $oldLines.Count) { $oldLines[$i] } else { $null }
            $candidateLine = if ($i -lt $newLines.Count) { $newLines[$i] } else { $null }
            if ($oldLine -cne $candidateLine) { $changedLines++ }
        }

        $targetDirectory = Split-Path -Parent $target
        $targetName = [IO.Path]::GetFileName($target)
        $tempPath = Join-Path $targetDirectory ('.' + $targetName + '.codex-v2-' + [Guid]::NewGuid().ToString('N') + '.tmp')
        $backupPath = Join-Path $targetDirectory ('.' + $targetName + '.codex-v2-backup-' + [Guid]::NewGuid().ToString('N'))
        try {
            [IO.File]::WriteAllText($tempPath, $newText, $outputUtf8)
            $candidateHash = (Get-FileHash -LiteralPath $tempPath -Algorithm SHA256).Hash
        }
        catch {
            Throw-VaultTransactionError 'write-failed' 'The candidate output could not be written.'
        }
        try {
            [IO.File]::Replace($tempPath, $target, $backupPath, $true)
            $targetState = 'replaced'
            $tempPath = $null
        }
        catch {
            if ($tempPath -and (Test-Path -LiteralPath $tempPath)) {
                try { Remove-Item -LiteralPath $tempPath -Force } catch { }
            }
            $tempPath = $null
            Throw-VaultTransactionError 'write-failed' 'Atomic replacement failed.'
        }

        try {
            $newHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
        }
        catch {
            $newHash = $null
        }
        if ($null -eq $newHash -or -not $newHash.Equals($candidateHash, [StringComparison]::OrdinalIgnoreCase)) {
            $rollbackDiscard = Join-Path $targetDirectory ('.' + $targetName + '.codex-v2-rollback-' + [Guid]::NewGuid().ToString('N'))
            try {
                [IO.File]::Replace($backupPath, $target, $rollbackDiscard, $true)
                $backupPath = $null
                $targetState = 'rolled-back'
                if (Test-Path -LiteralPath $rollbackDiscard) { Remove-Item -LiteralPath $rollbackDiscard -Force }
                $rollbackDiscard = $null
            }
            catch {
                $targetState = 'unknown'
            }
            Throw-VaultTransactionError 'post-write-hash-mismatch' 'Post-write hash confirmation failed.'
        }

        try {
            if (Test-Path -LiteralPath $backupPath) { Remove-Item -LiteralPath $backupPath -Force }
            $backupPath = $null
        }
        catch {
            Throw-VaultTransactionError 'cleanup-failed' 'The transaction backup could not be removed.'
        }

        return [pscustomobject][ordered]@{
            schema_version = 'vault-transaction/v2'
            status = 'success'
            operation = $operation
            path = $relative
            error_code = $null
            old_sha256 = $oldHash
            new_sha256 = $newHash
            matches = $matchCount
            old_bytes = $oldByteCount
            new_bytes = $outputUtf8.GetByteCount($newText)
            changed_lines = $changedLines
            newline = $newline
            payload_persisted = $false
            external_payload_files = 0
            atomic_temp_scope = 'target-directory'
        }
    }
    catch {
        $isVaultTransactionError = $_.Exception.Data.Contains('vault_transaction_error_code')
        $errorCode = if ($isVaultTransactionError) {
            [string]$_.Exception.Data['vault_transaction_error_code']
        } else {
            'transformation-failed'
        }
        $message = if ($isVaultTransactionError) {
            $_.Exception.Message
        } else {
            'The transaction failed.'
        }
        if ($tempPath -and (Test-Path -LiteralPath $tempPath)) {
            try {
                Remove-Item -LiteralPath $tempPath -Force
                $tempPath = $null
            }
            catch {
                $errorCode = 'cleanup-failed'
                $message = 'The internal sibling file could not be removed.'
            }
        }
        if ($rollbackDiscard -and (Test-Path -LiteralPath $rollbackDiscard)) {
            try {
                Remove-Item -LiteralPath $rollbackDiscard -Force
                $rollbackDiscard = $null
            }
            catch {
                $errorCode = 'cleanup-failed'
                $message = 'The rollback-discard file could not be removed.'
            }
        }
        if ($target -and (Test-Path -LiteralPath $target -PathType Leaf)) {
            try { $observedHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash } catch { $observedHash = $null }
        } else {
            $observedHash = $null
        }
        return New-VaultTransactionFailureReceipt -Operation $operation -Path $relative -ErrorCode $errorCode -Message $message -OldSha256 $oldHash -NewSha256 $observedHash -TargetState $targetState
    }
}

Export-ModuleMember -Function Invoke-VaultTransaction
