param([ValidateSet('Contract', 'Integration', 'All')][string]$Profile = 'All')
$ErrorActionPreference = 'Stop'
$contractTests = @(
    'skill-contract.tests.ps1',
    'local-skill-validator.tests.ps1',
    'vault-transaction-contract.tests.ps1',
    'transactional-writer.tests.ps1'
)
$integrationTests = @(
    'vault-transaction-v2.tests.ps1',
    'package-generator.tests.ps1',
    'package-validator.tests.ps1'
)
$selected = if ($Profile -eq 'Contract') { $contractTests } elseif ($Profile -eq 'Integration') { $integrationTests } else { @($contractTests + $integrationTests) }
foreach ($test in $selected) {
    Write-Host "Running $test"
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot $test)
    if ($LASTEXITCODE -ne 0) { throw "Semantic-ingest test failed: $test" }
}
Write-Host "Semantic-ingest $Profile test profile passed ($($selected.Count) suites)."
