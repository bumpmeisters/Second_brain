param(
    [Parameter(Mandatory = $true)][string]$Path,
    [Parameter(Mandatory = $true)][ValidatePattern('^[0-9A-Fa-f]{64}$')][string]$ExpectedSha256,
    [Parameter(Mandatory = $true)][string]$FindTextFile,
    [Parameter(Mandatory = $true)][string]$ReplacementTextFile,
    [ValidateRange(1, 100000)][int]$ExpectedMatchCount = 1,
    [ValidateSet('Preserve', 'LF', 'CRLF')][string]$Newline = 'Preserve',
    [switch]$KeepBackup,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$target = [IO.Path]::GetFullPath($(if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $vaultRoot $Path }))
if (-not $target.StartsWith($vaultRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) { throw "Target is outside the vault: $Path" }
$relative = $target.Substring($vaultRoot.Length + 1).Replace('\', '/')
foreach ($root in @('raw/', 'research/assets/')) {
    if ($relative.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) { throw "Protected source path cannot be edited: $relative" }
}
if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { throw "Target file does not exist: $relative" }
foreach ($inputPath in @($FindTextFile, $ReplacementTextFile)) { if (-not (Test-Path -LiteralPath $inputPath -PathType Leaf)) { throw "Text input file does not exist: $inputPath" } }

$oldHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
if ($oldHash -ne $ExpectedSha256) { throw "Target hash mismatch for $relative. Expected $ExpectedSha256, found $oldHash." }
$encoding = [Text.UTF8Encoding]::new($false)
$oldText = [IO.File]::ReadAllText($target, [Text.Encoding]::UTF8)
$findText = [IO.File]::ReadAllText((Resolve-Path -LiteralPath $FindTextFile), [Text.Encoding]::UTF8)
$replacementText = [IO.File]::ReadAllText((Resolve-Path -LiteralPath $ReplacementTextFile), [Text.Encoding]::UTF8)
if (-not $findText.Length) { throw 'Find text must not be empty.' }

$matchCount = 0
$offset = 0
while (($index = $oldText.IndexOf($findText, $offset, [StringComparison]::Ordinal)) -ge 0) {
    $matchCount++
    $offset = $index + $findText.Length
}
if ($matchCount -ne $ExpectedMatchCount) { throw "Expected $ExpectedMatchCount exact match(es), found $matchCount. No file was changed." }
$newText = $oldText.Replace($findText, $replacementText)
$lineBreak = if ($Newline -eq 'LF') { "`n" } elseif ($Newline -eq 'CRLF') { "`r`n" } elseif ($oldText.Contains("`r`n")) { "`r`n" } else { "`n" }
if ($Newline -ne 'Preserve') { $newText = (($newText -replace "`r`n", "`n") -replace "`r", "`n") -replace "`n", $lineBreak }

$oldLines = @($oldText -split '\r?\n')
$newLines = @($newText -split '\r?\n')
$changedLines = 0
for ($i = 0; $i -lt [Math]::Max($oldLines.Count, $newLines.Count); $i++) {
    $oldLine = if ($i -lt $oldLines.Count) { $oldLines[$i] } else { $null }
    $candidateLine = if ($i -lt $newLines.Count) { $newLines[$i] } else { $null }
    if ($oldLine -cne $candidateLine) { $changedLines++ }
}

$temp = Join-Path (Split-Path -Parent $target) ('.' + [IO.Path]::GetFileName($target) + '.codex-' + [Guid]::NewGuid().ToString('N') + '.tmp')
$backupPath = $target + '.codex-backup-' + [Guid]::NewGuid().ToString('N')
$reportedBackup = if ($KeepBackup) { $backupPath } else { $null }
try {
    [IO.File]::WriteAllText($temp, $newText, $encoding)
    [IO.File]::Replace($temp, $target, $backupPath, $true)
    if (-not $KeepBackup -and (Test-Path -LiteralPath $backupPath)) { Remove-Item -LiteralPath $backupPath -Force }
} finally {
    if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Force }
}
$newHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
$result = [pscustomobject][ordered]@{
    path = $relative
    matches = $matchCount
    old_sha256 = $oldHash
    new_sha256 = $newHash
    old_bytes = $encoding.GetByteCount($oldText)
    new_bytes = $encoding.GetByteCount($newText)
    changed_lines = $changedLines
    newline = $Newline
    backup = $reportedBackup
}
if ($Json) { $result | ConvertTo-Json -Depth 4 } else { $result | Format-List }