$ErrorActionPreference = "Stop"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Set-Location $root

function Write-Check($Name, $Status, $Detail = "") {
    $label = if ($Status) { "OK" } else { "WARN" }
    if ($Detail) {
        "{0}: {1} - {2}" -f $label, $Name, $Detail
    } else {
        "{0}: {1}" -f $label, $Name
    }
}

$gitDir = Join-Path $root ".git"
$indexLock = Join-Path $gitDir "codex-write-test.tmp"
$gitWritable = $false
try {
    Set-Content -LiteralPath $indexLock -Value "test" -NoNewline
    Remove-Item -LiteralPath $indexLock -Force
    $gitWritable = $true
} catch {
    $gitWritable = $false
}
Write-Check ".git writable" $gitWritable "normal staging needs this"

$longPaths = git config --get core.longpaths
Write-Check "Git long paths" ($longPaths -eq "true") "set with: git config core.longpaths true"

if (Get-Command git-lfs -ErrorAction SilentlyContinue) {
    $lfsVersion = git lfs version 2>$null
    Write-Check "Git LFS installed" ($LASTEXITCODE -eq 0) $lfsVersion
} else {
    Write-Check "Git LFS installed" $false "git-lfs command was not found"
}

if (Get-Command gh -ErrorAction SilentlyContinue) {
    $ghVersion = gh --version 2>$null
    Write-Check "GitHub CLI installed" ($LASTEXITCODE -eq 0) (($ghVersion | Select-Object -First 1) -as [string])
} else {
    Write-Check "GitHub CLI installed" $false "gh command was not found"
}

$helperDirs = @(Get-ChildItem -Force -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like ".git-publish-temp*" })
Write-Check "Temporary publish helpers" ($helperDirs.Count -eq 0) ("found: " + (($helperDirs | Select-Object -ExpandProperty Name) -join ", "))

$files = @(Get-ChildItem -Recurse -File -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch "\\.git(\\|$)" -and $_.FullName -notmatch "\\.git-publish-temp" })

$largeFiles = @($files | Where-Object { $_.Length -gt 90MB } | Sort-Object Length -Descending)
Write-Check "Files over 90 MB" ($largeFiles.Count -eq 0) ("count: " + $largeFiles.Count)
$largeFiles | Select-Object -First 20 @{Name="SizeMB";Expression={[math]::Round($_.Length / 1MB, 1)}}, FullName | Format-Table -AutoSize

$longestPaths = @($files | Sort-Object { $_.FullName.Length } -Descending | Select-Object -First 20 @{Name="Length";Expression={$_.FullName.Length}}, FullName)
Write-Check "Paths over 240 chars" (($longestPaths | Where-Object { $_.Length -gt 240 }).Count -eq 0) "Windows and Git may need long-path support"
$longestPaths | Where-Object { $_.Length -gt 240 } | Format-Table -AutoSize
