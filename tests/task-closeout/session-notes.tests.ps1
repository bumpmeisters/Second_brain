$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$tool = Join-Path $repo 'tools/test-session-notes.ps1'
$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$fixture = Join-Path $tempBase ('session-notes-' + [guid]::NewGuid().ToString('N'))
$utf8 = [Text.UTF8Encoding]::new($false)
$id = '00000000-0000-0000-0000-000000000001'
$name = '2026-09-21-example.md'
$passed = 0
function Write-Fixture([string]$Relative, [string]$Text) {
    [IO.File]::WriteAllText((Join-Path $fixture $Relative), $Text, $utf8)
}
function Assert-Check([bool]$Expected, [string]$Task = $id, [string]$Path = '', [string]$ExpectedError = '') {
    $arguments = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $tool, '-VaultRoot', $fixture, '-Json')
    if ($Task) { $arguments += @('-TaskId', $Task) }
    if ($Path) { $arguments += @('-SessionPath', $Path) }
    $output = & powershell.exe @arguments | Out-String
    $code = $LASTEXITCODE
    $result = $output | ConvertFrom-Json
    if ($result.passed -ne $Expected -or ($Expected -and $code -ne 0) -or (-not $Expected -and $code -ne 2)) { throw "Unexpected validation result: $output" }
    if ($ExpectedError -and ($result.errors -join ' ') -notmatch $ExpectedError) { throw "Expected $ExpectedError in: $output" }
    $script:passed++
}
try {
    New-Item -ItemType Directory -Path (Join-Path $fixture 'sessions') -Force | Out-Null
    $note = [IO.File]::ReadAllText((Join-Path $repo 'templates/session-note.md'), [Text.Encoding]::UTF8).Replace('YYYY-MM-DD', '2026-09-21').Replace('task_id: unknown', "task_id: $id")
    $row = '| 2026-09-21 | [Example](' + $name + ') | `' + $id + '` | active |'
    Write-Fixture "sessions/$name" $note
    Write-Fixture 'sessions/index.md' $row
    Assert-Check $true
    Assert-Check $false '00000000-0000-0000-0000-000000000002' '' 'No session note'
    Write-Fixture 'sessions/index.md' ''
    Assert-Check $false $id '' 'exactly one index row'
    Write-Fixture 'sessions/index.md' ($row.Replace('| active |', '| complete |'))
    Assert-Check $false $id '' 'disagrees'
    Write-Fixture 'sessions/index.md' $row
    Write-Fixture "sessions/$name" ($note + "`n[Missing](missing.md)`n")
    Assert-Check $false $id '' 'broken file link'
    Write-Fixture "sessions/$name" ($note.Replace('capture: reconstructed', 'capture: guessed'))
    Assert-Check $false $id '' 'invalid capture'
    Write-Fixture "sessions/$name" ($note.Replace('created: 2026-09-21', 'created: 2026-02-30'))
    Assert-Check $false $id '' 'invalid created date'
    Write-Fixture "sessions/$name" $note
    Write-Fixture 'sessions/2026-09-21-duplicate.md' $note
    Assert-Check $false $id '' 'Duplicate task_id'
    Remove-Item -LiteralPath (Join-Path $fixture 'sessions/2026-09-21-duplicate.md')
    Write-Fixture "sessions/$name" ($note.Replace($id, 'unknown'))
    Write-Fixture 'sessions/index.md' ($row.Replace($id, 'unknown'))
    Assert-Check $true '' "sessions/$name"
    Assert-Check $false '' 'sessions/absent.md' 'Requested session note'
    Write-Fixture "sessions/$name" ($note -replace '(?s)## Anlass und Herkunft.*?## Verlauf', "## Anlass und Herkunft`n`n## Verlauf")
    Write-Fixture 'sessions/index.md' $row
    Assert-Check $false $id '' 'empty section'
    Write-Output "Session note tests: $passed passed."
} finally {
    # Delete only the exact test-owned directory, after verifying its resolved boundary.
    if (Test-Path -LiteralPath $fixture) {
        $resolved = (Resolve-Path -LiteralPath $fixture).Path
        if ($resolved -ne [IO.Path]::GetFullPath($fixture) -or -not $resolved.StartsWith($tempBase + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) -or (Split-Path $resolved -Leaf) -notmatch '^session-notes-[a-f0-9]{32}$') { throw 'Unsafe fixture cleanup path.' }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
