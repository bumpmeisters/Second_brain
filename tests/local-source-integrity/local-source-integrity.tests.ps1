$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repo = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$tool = Join-Path $repo 'tools\test-local-source-integrity.ps1'
$tempRoot = Join-Path ([IO.Path]::GetTempPath()) ('local-source-integrity-' + [guid]::NewGuid().ToString('N'))

function Get-TextSha256([string]$Text) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($Text)))).Replace('-', '') }
    finally { $sha.Dispose() }
}

function Invoke-Tool([string]$Vault, [string]$Mode) {
    $previous = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $output = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $tool -VaultRoot $Vault -Mode $Mode -Json 2>&1 | Out-String
    $exitCode = $LASTEXITCODE
    $ErrorActionPreference = $previous
    return [pscustomobject]@{ exit_code = $exitCode; output = $output }
}

try {
    $fixture = Join-Path $tempRoot 'vault'
    New-Item -ItemType Directory -Force (Join-Path $fixture 'tools\config'), (Join-Path $fixture 'raw\assets'), (Join-Path $fixture 'research\assets'), (Join-Path $fixture 'wiki\_extractions\raw\assets'), (Join-Path $fixture 'wiki\_outputs\source-conversions') | Out-Null
    [IO.File]::WriteAllText((Join-Path $fixture 'raw\assets\README.md'), "raw`n", [Text.UTF8Encoding]::new($false))
    [IO.File]::WriteAllText((Join-Path $fixture 'research\assets\README.md'), "research`n", [Text.UTF8Encoding]::new($false))

    $sourceLocator = 'raw/assets/private.pdf'
    $sidecarLocator = 'wiki/_extractions/raw/assets/private.pdf.md'
    $sourcePath = Join-Path $fixture $sourceLocator
    $sidecarPath = Join-Path $fixture $sidecarLocator
    [IO.File]::WriteAllText($sourcePath, "source`n", [Text.UTF8Encoding]::new($false))
    [IO.File]::WriteAllText($sidecarPath, "sidecar`n", [Text.UTF8Encoding]::new($false))
    $contract = [ordered]@{
        contract = 'local-source-integrity/v1'
        locator_normalization = 'repository-relative forward-slash UTF-8, ordinal case-sensitive'
        coverage = [ordered]@{ tracked_source_count = 2; bound_local_source_count = 1; total_source_count = 3 }
        source_bindings = @([ordered]@{
            binding_id = 'LSI-001'
            source_locator_sha256 = Get-TextSha256 $sourceLocator
            source_sha256 = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash
            source_bytes = (Get-Item -LiteralPath $sourcePath).Length
            sidecar_locator_sha256 = Get-TextSha256 $sidecarLocator
            sidecar_sha256 = (Get-FileHash -LiteralPath $sidecarPath -Algorithm SHA256).Hash
            sidecar_bytes = (Get-Item -LiteralPath $sidecarPath).Length
        })
        local_link_targets = @([ordered]@{ binding_id = 'LLT-001'; target_locator_sha256 = Get-TextSha256 '_outputs/private/checkpoint'; availability = 'local-only'; kind = 'private-ledger' })
    }
    $contractPath = Join-Path $fixture 'tools\config\local-source-integrity-contract.json'
    [IO.File]::WriteAllText($contractPath, ($contract | ConvertTo-Json -Depth 8), [Text.UTF8Encoding]::new($false))
    '"source","target"', ('"' + $sourceLocator + '","' + $sidecarLocator + '"') | Set-Content -LiteralPath (Join-Path $fixture 'wiki\_outputs\source-conversions\source-conversion-registry.csv') -Encoding UTF8

    $hydrated = Invoke-Tool $fixture 'LocalHydrated'
    if ($hydrated.exit_code -ne 0 -or ($hydrated.output | ConvertFrom-Json).registry_joins -ne 1) { throw 'Complete hydrated fixture did not pass.' }

    Remove-Item -LiteralPath $sourcePath, $sidecarPath -Force
    $clean = Invoke-Tool $fixture 'CleanCheckout'
    if ($clean.exit_code -ne 0 -or ($clean.output | ConvertFrom-Json).visible_source_files -ne 2) { throw 'Clean-checkout fixture did not pass.' }

    [IO.File]::WriteAllText($sourcePath, "tampered`n", [Text.UTF8Encoding]::new($false))
    [IO.File]::WriteAllText($sidecarPath, "sidecar`n", [Text.UTF8Encoding]::new($false))
    if ((Invoke-Tool $fixture 'LocalHydrated').exit_code -eq 0) { throw 'Tampered source identity was accepted.' }

    Remove-Item -LiteralPath $sourcePath, $sidecarPath -Force
    $privateContract = $contract | ConvertTo-Json -Depth 8 | ConvertFrom-Json
    $privateContract | Add-Member -NotePropertyName source_path -NotePropertyValue 'raw/assets/private.pdf'
    [IO.File]::WriteAllText($contractPath, ($privateContract | ConvertTo-Json -Depth 8), [Text.UTF8Encoding]::new($false))
    if ((Invoke-Tool $fixture 'CleanCheckout').exit_code -eq 0) { throw 'Concrete private path was accepted in the public contract.' }

    $productionText = [IO.File]::ReadAllText((Join-Path $repo 'tools\config\local-source-integrity-contract.json'), [Text.Encoding]::UTF8)
    if ($productionText -match '(?i)"(?:source|sidecar|target|repository)_path"\s*:|[A-Z]:[\\/]|/Users/|raw/assets/|research/assets/|wiki/_extractions/') { throw 'Production contract exposes a concrete private path.' }
    $production = Invoke-Tool $repo 'CleanCheckout'
    if ($production.exit_code -ne 0) { throw 'Production clean-checkout contract failed.' }
    $productionResult = $production.output | ConvertFrom-Json
    if ($productionResult.source_bindings -ne 35 -or $productionResult.sidecar_bindings -ne 35 -or $productionResult.local_link_targets -ne 12) { throw 'Production contract counts changed.' }

    Write-Host 'Local-source integrity contract: PASS'
}
finally {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}
