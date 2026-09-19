[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('CheckPre', 'Apply', 'CheckPost')]
    [string]$Mode,

    [Parameter(Mandatory = $true)]
    [string]$VaultRoot,

    [Parameter(Mandatory = $true)]
    [string]$MoveManifest,

    [Parameter(Mandatory = $true)]
    [string]$RefactorSpec,

    [Parameter(Mandatory = $true)]
    [string]$PostHashManifest
)

$ErrorActionPreference = 'Stop'

function Get-Sha256 {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    return (Get-FileHash -Algorithm SHA256 -LiteralPath $LiteralPath).Hash.ToUpperInvariant()
}

function Resolve-InRoot {
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$RepositoryPath)

    if ([System.IO.Path]::IsPathRooted($RepositoryPath) -or $RepositoryPath -match '(^|/|\\)\.\.(/|\\|$)') {
        throw "Expected safe repository-relative path: $RepositoryPath"
    }
    $candidate = [System.IO.Path]::GetFullPath((Join-Path $Root ($RepositoryPath -replace '/', '\')))
    if (($candidate -ne $Root) -and (-not $candidate.StartsWith($Root + '\', [System.StringComparison]::OrdinalIgnoreCase))) {
        throw "Path escapes vault root: $RepositoryPath"
    }
    return $candidate
}

function Assert-Hash {
    param([string]$LiteralPath, [string]$Expected, [string]$Label)

    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) { throw "$Label is missing: $LiteralPath" }
    $actual = Get-Sha256 -LiteralPath $LiteralPath
    if ($actual -ne $Expected) { throw "$Label hash mismatch: $LiteralPath; expected $Expected; actual $actual" }
}

$root = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')
$moves = @(Import-Csv -LiteralPath $MoveManifest)
$postRows = @(Import-Csv -LiteralPath $PostHashManifest)
$spec = Get-Content -Raw -LiteralPath $RefactorSpec -Encoding UTF8 | ConvertFrom-Json

if ($moves.Count -ne 95 -or $postRows.Count -ne 95 -or @($spec.files).Count -ne 21) {
    throw 'Expected 95 move rows, 95 post-hash rows, and 21 refactor specifications.'
}
if (@($moves.move_id | Sort-Object -Unique).Count -ne 95 -or @($postRows.move_id | Sort-Object -Unique).Count -ne 95) {
    throw 'Move and post-hash identities must be unique.'
}
if (@($spec.files.refactor_id | Sort-Object -Unique).Count -ne 21 -or @($spec.files.target_path | Sort-Object -Unique).Count -ne 21) {
    throw 'Refactor IDs and target paths must be unique.'
}

foreach ($move in $moves) {
    $post = @($postRows | Where-Object move_id -eq $move.move_id)
    if ($post.Count -ne 1 -or $post[0].target_path -ne $move.target_path -or $post[0].pre_sha256 -ne $move.pre_sha256) {
        throw "Move/post-hash binding mismatch: $($move.move_id)"
    }
    $target = Resolve-InRoot -Root $root -RepositoryPath $move.target_path
    if ($Mode -eq 'CheckPre' -or $Mode -eq 'Apply') {
        Assert-Hash -LiteralPath $target -Expected $move.pre_sha256 -Label 'Component pre-state'
    }
    else {
        Assert-Hash -LiteralPath $target -Expected $post[0].post_sha256 -Label 'Component post-state'
    }
}

if ($Mode -eq 'CheckPre') {
    Write-Output 'PASS | 95/95 component pre-hashes | no bytes written'
    exit 0
}

if ($Mode -eq 'Apply') {
    foreach ($file in @($spec.files)) {
        $move = @($moves | Where-Object target_path -eq $file.target_path)
        $post = @($postRows | Where-Object target_path -eq $file.target_path)
        if ($move.Count -ne 1 -or $post.Count -ne 1 -or $post[0].refactor_id -ne $file.refactor_id) {
            throw "Refactor binding mismatch: $($file.refactor_id)"
        }
        $target = Resolve-InRoot -Root $root -RepositoryPath $file.target_path
        $originalBytes = [System.IO.File]::ReadAllBytes($target)
        $hasBom = $originalBytes.Length -ge 3 -and $originalBytes[0] -eq 239 -and $originalBytes[1] -eq 187 -and $originalBytes[2] -eq 191
        $text = [System.Text.Encoding]::UTF8.GetString($originalBytes, $(if ($hasBom) { 3 } else { 0 }), $originalBytes.Length - $(if ($hasBom) { 3 } else { 0 }))
        $newline = if ($text.Contains("`r`n")) { "`r`n" } else { "`n" }
        foreach ($operation in @($file.operations)) {
            $old = ([string]$operation.old).Replace("`n", $newline)
            $new = ([string]$operation.new).Replace("`n", $newline)
            $count = ([System.Text.RegularExpressions.Regex]::Matches($text, [regex]::Escape($old))).Count
            if ($count -ne 1) { throw "$($file.refactor_id) expected one exact match; found $count" }
            $text = $text.Replace($old, $new)
        }
        $encoding = [System.Text.UTF8Encoding]::new($hasBom)
        $newBytes = $encoding.GetBytes($text)
        $temporary = Join-Path (Split-Path -Parent $target) ('.' + (Split-Path -Leaf $target) + '.' + [guid]::NewGuid().ToString('N') + '.tmp')
        $backup = Join-Path (Split-Path -Parent $target) ('.' + (Split-Path -Leaf $target) + '.' + [guid]::NewGuid().ToString('N') + '.bak')
        try {
            [System.IO.File]::WriteAllBytes($temporary, $newBytes)
            if ((Get-Sha256 -LiteralPath $temporary) -ne $post[0].post_sha256) {
                throw "Rendered post-hash mismatch before replacement: $($file.refactor_id)"
            }
            [System.IO.File]::Replace($temporary, $target, $backup)
            Assert-Hash -LiteralPath $target -Expected $post[0].post_sha256 -Label 'Refactored component'
            Remove-Item -LiteralPath $backup -Force
        }
        finally {
            if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary -Force }
        }
    }
}

foreach ($post in $postRows) {
    $target = Resolve-InRoot -Root $root -RepositoryPath $post.target_path
    Assert-Hash -LiteralPath $target -Expected $post.post_sha256 -Label 'Component final state'
}
Write-Output "PASS | 95/95 component post-hashes | mode=$Mode"
