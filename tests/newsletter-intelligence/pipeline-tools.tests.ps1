$pythonResolver=Join-Path $repo 'tools/resolve-python-runtime.ps1'
$python=& $pythonResolver -Purpose Agent -PathOnly
Assert-True ($python -and (Test-Path -LiteralPath $python -PathType Leaf)) 'the repository runtime contract resolves Python for newsletter batch tooling'
if($python -and (Test-Path -LiteralPath $python -PathType Leaf)){
    $result=& $python (Join-Path $testRoot 'pipeline_tools_test.py') 2>&1
    Assert-True ($LASTEXITCODE -eq 0) "snapshot extraction and chat-review batch fixtures pass: $($result -join ' ')"
}

$installer = Join-Path $repo 'tools/install-newsletter-retrieval-profile.ps1'
$switcher = Join-Path $repo 'tools/switch-newsletter-retrieval-profile.ps1'
$installerScratch = Join-Path ([System.IO.Path]::GetTempPath()) ('newsletter-profile-test-' + [guid]::NewGuid().ToString('N'))
try {
    New-Item -ItemType Directory -Path $installerScratch -Force | Out-Null
    $testConfig = Join-Path $installerScratch 'config.toml'
    Set-Content -LiteralPath $testConfig -Value "[windows]`nsandbox = `"elevated`"`n" -Encoding utf8
    $first = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $installer -TargetPath $testConfig -NoBackup | ConvertFrom-Json
    Assert-True ($LASTEXITCODE -eq 0 -and $first.status -eq 'installed') 'retrieval profile installer succeeds on a compatible isolated config'
    $second = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $installer -TargetPath $testConfig -NoBackup | ConvertFrom-Json
    Assert-True ($LASTEXITCODE -eq 0 -and $second.status -eq 'already_installed') 'retrieval profile installer is idempotent'
    $installedText = Get-Content -Raw -LiteralPath $testConfig
    $profileCount = ([regex]::Matches($installedText, '(?m)^\[permissions\.newsletter-retrieval\]\r?$')).Count
    Assert-True ($profileCount -eq 1) 'retrieval profile is installed exactly once'
    $baseline = $installedText
    $statePath = Join-Path $installerScratch 'retrieval-state.json'
    $activated = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $switcher -Mode Activate -TargetPath $testConfig -StatePath $statePath | ConvertFrom-Json
    Assert-True ($LASTEXITCODE -eq 0 -and $activated.status -eq 'activated') 'retrieval profile switch activates a managed global default'
    $activeText = Get-Content -Raw -LiteralPath $testConfig
    Assert-True ($activeText -match '(?m)^default_permissions = "newsletter-retrieval"\r?$') 'retrieval profile activation selects only the reviewed profile'
    $again = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $switcher -Mode Activate -TargetPath $testConfig -StatePath $statePath | ConvertFrom-Json
    Assert-True ($LASTEXITCODE -eq 0 -and $again.status -eq 'already_active') 'retrieval profile activation is idempotent while config is unchanged'
    $restored = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $switcher -Mode Restore -TargetPath $testConfig -StatePath $statePath | ConvertFrom-Json
    Assert-True ($LASTEXITCODE -eq 0 -and $restored.status -eq 'restored') 'retrieval profile switch restores the exact prior config'
    Assert-True ((Get-Content -Raw -LiteralPath $testConfig) -ceq $baseline) 'retrieval profile restoration preserves the installed profile and prior config bytes'
    $restoredAgain = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $switcher -Mode Restore -TargetPath $testConfig -StatePath $statePath | ConvertFrom-Json
    Assert-True ($LASTEXITCODE -eq 0 -and $restoredAgain.status -eq 'already_restored') 'retrieval profile restoration is idempotent'
}
finally {
    if (Test-Path -LiteralPath $installerScratch) {
        Remove-Item -LiteralPath $installerScratch -Recurse -Force
    }
}
