$ErrorActionPreference = 'Stop'
$modulePath = Join-Path $PSScriptRoot 'VaultTransaction.psm1'
$outputEncoding = [Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = $outputEncoding

try {
    $schemaPath = Join-Path $PSScriptRoot 'config\vault-transaction-schema.json'
    $schema = Get-Content -Raw -LiteralPath $schemaPath | ConvertFrom-Json
    $retainedByteLimit = [long]$schema.limits.max_request_utf8_bytes + 1
    $inputStream = [Console]::OpenStandardInput()
    $memory = [IO.MemoryStream]::new()
    try {
        $buffer = [byte[]]::new(8192)
        while (($read = $inputStream.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $remaining = $retainedByteLimit - $memory.Length
            if ($remaining -gt 0) {
                $memory.Write($buffer, 0, [int][Math]::Min($read, $remaining))
            }
        }
        $requestBytes = $memory.ToArray()
    }
    finally {
        $memory.Dispose()
    }

    Import-Module -Force -Name $modulePath
    $receipt = Invoke-VaultTransaction -RequestBytes $requestBytes
    $receipt | ConvertTo-Json -Depth 5 -Compress
    if ($receipt.status -ne 'success') { exit 1 }
}
catch {
    $receipt = [pscustomobject][ordered]@{
        schema_version = 'vault-transaction/v2'
        status = 'failure'
        operation = $null
        path = $null
        error_code = 'transformation-failed'
        message = 'The transaction entry point failed.'
        old_sha256 = $null
        new_sha256 = $null
        target_state = 'unchanged'
    }
    $receipt | ConvertTo-Json -Depth 5 -Compress
    exit 1
}
