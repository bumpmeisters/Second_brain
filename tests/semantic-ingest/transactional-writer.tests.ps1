$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$fixture = Join-Path $repo '.tmp\transactional-writer-tests'
$writer = Join-Path $repo 'tools\set-file-transactional.ps1'

function Write-Utf8([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Force $parent | Out-Null }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

function Invoke-Writer([string]$ExpectedHash, [int]$ExpectedMatches = 1, [string]$TargetPath = $target) {
    $arguments = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $writer, '-Path', $TargetPath, '-ExpectedSha256', $ExpectedHash, '-FindTextFile', $find, '-ReplacementTextFile', $replacement, '-ExpectedMatchCount', $ExpectedMatches, '-Newline', 'Preserve', '-Json')
    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $output = & powershell.exe @arguments 2>$null
    $code = $LASTEXITCODE
    $ErrorActionPreference = $previousPreference
    return [pscustomobject]@{ code = $code; output = ($output | Out-String) }
}

try {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
    New-Item -ItemType Directory -Force $fixture | Out-Null
    $target = Join-Path $fixture 'target.txt'
    $find = Join-Path $fixture 'find.txt'
    $replacement = Join-Path $fixture 'replacement.txt'
    Write-Utf8 $target "alpha`nbeta`ngamma`n"
    Write-Utf8 $find 'beta'
    Write-Utf8 $replacement 'BETA'
    $hash = (Get-FileHash $target -Algorithm SHA256).Hash
    $run = Invoke-Writer $hash
    $result = $run.output | ConvertFrom-Json
    if ($run.code -ne 0 -or $result.matches -ne 1 -or [IO.File]::ReadAllText($target) -ne "alpha`nBETA`ngamma`n") { throw 'Transactional exact replacement failed.' }

    $before = [IO.File]::ReadAllText($target)
    $run = Invoke-Writer ('0' * 64)
    if ($run.code -eq 0 -or [IO.File]::ReadAllText($target) -ne $before) { throw 'Hash mismatch changed the target.' }

    $hash = (Get-FileHash $target -Algorithm SHA256).Hash
    $run = Invoke-Writer $hash 2
    if ($run.code -eq 0 -or [IO.File]::ReadAllText($target) -ne $before) { throw 'Match-count mismatch changed the target.' }

    $run = Invoke-Writer $hash 1 'raw/nonexistent-transaction-test.md'
    if ($run.code -eq 0 -or $run.output -match 'passed') { throw 'Protected source path was not rejected.' }

    $leftovers = @(Get-ChildItem $fixture -Force | Where-Object { $_.Name -like '*.codex-*' -or $_.Name -like '.*.tmp' })
    if ($leftovers.Count) { throw 'Transactional writer left temporary or backup files behind.' }
}
finally {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}
Write-Host 'Transactional writer tests passed (5 assertions).'