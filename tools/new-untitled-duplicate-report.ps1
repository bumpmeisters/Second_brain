param(
    [string]$VaultRoot = "",
    [string]$OutputPath = ""
)

$ErrorActionPreference = 'Stop'
if (-not $VaultRoot) { $VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
$VaultRoot = [IO.Path]::GetFullPath($VaultRoot)
if (-not $OutputPath) { $OutputPath = Join-Path $VaultRoot 'wiki\_outputs\wiki-lint\untitled-duplicate-candidates-2026-08-08.csv' }

$rawByHash = @{}
foreach ($file in Get-ChildItem -LiteralPath (Join-Path $VaultRoot 'raw') -Recurse -File -Filter '*.md') {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
    if (-not $rawByHash.ContainsKey($hash)) { $rawByHash[$hash] = [Collections.Generic.List[string]]::new() }
    $rawByHash[$hash].Add($file.FullName.Substring($VaultRoot.Length + 1).Replace('\', '/'))
}

$rows = foreach ($file in Get-ChildItem -LiteralPath $VaultRoot -File -Filter 'Untitled*.md' | Sort-Object Name) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
    $matches = @($rawByHash[$hash] | Sort-Object)
    [pscustomobject][ordered]@{
        root_file = $file.Name
        size_bytes = $file.Length
        sha256 = $hash
        disposition = if ($matches.Count) { 'exact-duplicate-retain-pending-deletion-approval' } else { 'review-required' }
        matching_raw_files = $matches -join '; '
    }
}

$parent = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Force -Path $parent | Out-Null
$csv = (($rows | ConvertTo-Csv -NoTypeInformation) -join "`n") + "`n"
[IO.File]::WriteAllText($OutputPath, $csv, [Text.UTF8Encoding]::new($false))
Write-Output "Wrote Untitled duplicate report: $OutputPath ($(@($rows).Count) files)."
