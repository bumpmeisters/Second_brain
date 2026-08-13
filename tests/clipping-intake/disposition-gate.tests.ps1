$ErrorActionPreference = 'Stop'
$vault = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$tool = Join-Path $vault 'tools\manage-clipping-dispositions.ps1'
$fixture = Join-Path ([IO.Path]::GetTempPath()) ('clipping-dispositions-' + [guid]::NewGuid().ToString('N'))

function Write-Utf8([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

try {
    New-Item -ItemType Directory -Path (Join-Path $fixture 'tools\config') -Force | Out-Null
    Copy-Item (Join-Path $vault 'tools\config\source-selection-policy.json') (Join-Path $fixture 'tools\config\source-selection-policy.json')
    $source = Join-Path $fixture 'raw\Clippings\Example.md'
    Write-Utf8 $source "---`ntitle: Example`nsource: https://www.youtube.com/watch?v=abcDEF12345`n---`n`n## Transcript`n`nUnreviewed body."
    $historicalSource = Join-Path $fixture 'raw\Clippings\Historical.md'
    Write-Utf8 $historicalSource "---`ntitle: Historical`nsource: https://example.com/historical`n---`nReviewed body."

    & $tool -Command Sync -VaultRoot $fixture | Out-Null
    $register = Join-Path $fixture 'wiki\_outputs\source-intake\clipping-dispositions.csv'
    $row = Import-Csv -LiteralPath $register | Where-Object canonical_source -eq 'raw/Clippings/Example.md'
    if ($row.selection_status -ne 'pending' -or $row.processing_status -ne 'unread') { throw 'New clipping did not default to pending and unread.' }
    if ($row.source_identity -ne 'youtube:abcDEF12345') { throw 'YouTube source identity was not normalized.' }

    $historicalHash = (Get-FileHash -LiteralPath $historicalSource -Algorithm SHA256).Hash
    $decisionPath = Join-Path $fixture 'wiki\_outputs\semantic-ingest\p31\decisions.csv'
    New-Item -ItemType Directory -Path (Split-Path -Parent $decisionPath) -Force | Out-Null
    @([pscustomobject]@{ canonical_source = 'raw/Clippings/Historical.md'; sha256 = $historicalHash; semantic_decision = 'registered-only'; routing = 'stay-P31'; review_status = 'approved' }) |
        Export-Csv -LiteralPath $decisionPath -NoTypeInformation -Encoding UTF8
    & $tool -Command Backfill -VaultRoot $fixture | Out-Null
    $historical = Import-Csv -LiteralPath $register | Where-Object canonical_source -eq 'raw/Clippings/Historical.md'
    if ($historical.processing_status -ne 'reviewed' -or $historical.semantic_disposition -ne 'registered-only' -or $historical.package -ne 'P31') { throw 'Historical approved decision was not backfilled.' }

    $failedWithoutConfirmation = $false
    try {
        & $tool -Command Set -VaultRoot $fixture -CanonicalSource $row.canonical_source -ExpectedSha256 $row.sha256 -Availability available -SelectionStatus approved-for-semantic-review -Package P32 -DecisionContext fixture -DecidedBy tester 2>$null | Out-Null
    } catch { $failedWithoutConfirmation = $_.Exception.Message -match 'Confirm' }
    if (-not $failedWithoutConfirmation) { throw 'Disposition update succeeded without confirmation.' }

    & $tool -Command Set -VaultRoot $fixture -CanonicalSource $row.canonical_source -ExpectedSha256 $row.sha256 -Availability available -SelectionStatus approved-for-semantic-review -Package P32 -DecisionContext fixture -DecidedBy tester -Confirm | Out-Null
    & $tool -Command Check -VaultRoot $fixture | Out-Null
    $approved = Import-Csv -LiteralPath $register | Where-Object canonical_source -eq 'raw/Clippings/Example.md'
    if ($approved.selection_status -ne 'approved-for-semantic-review' -or $approved.package -ne 'P32') { throw 'Confirmed disposition was not persisted.' }

    Write-Utf8 $source "changed"
    $driftBlocked = $false
    try { & $tool -Command Check -VaultRoot $fixture 2>$null | Out-Null } catch { $driftBlocked = $true }
    if (-not $driftBlocked) { throw 'Hash drift was not blocked.' }
}
finally {
    if (Test-Path -LiteralPath $fixture) {
        $resolvedFixture = [IO.Path]::GetFullPath($fixture)
        $resolvedTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
        if (-not $resolvedFixture.StartsWith($resolvedTemp, [StringComparison]::OrdinalIgnoreCase)) { throw 'Refusing to remove fixture outside temp.' }
        Remove-Item -LiteralPath $fixture -Recurse -Force
    }
}

Write-Host 'Clipping disposition gate tests passed (7 assertions).'
