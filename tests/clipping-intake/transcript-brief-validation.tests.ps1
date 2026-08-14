$ErrorActionPreference = 'Stop'

$vault = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$validator = Join-Path $vault 'tools\test-transcript-briefs.ps1'
$fixtureRoot = Join-Path ([IO.Path]::GetTempPath()) ('transcript-brief-' + [guid]::NewGuid().ToString('N'))
$sourcePath = Join-Path $fixtureRoot 'raw\Clippings\Example.md'
$briefRoot = Join-Path $fixtureRoot 'wiki\_outputs\transcript-briefs\2026-07-23'
$briefPath = Join-Path $briefRoot 'example.md'
$ledgerPath = Join-Path $fixtureRoot 'wiki\_outputs\intake.csv'

function Write-Utf8NoBom([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

try {
    Write-Utf8NoBom $sourcePath "**0:10** · Evidence`n"
    $hash = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash
    New-Item -ItemType Directory -Path (Split-Path -Parent $ledgerPath) -Force | Out-Null
    @([pscustomobject]@{
        canonical_source = 'raw/Clippings/Example.md'
        sha256 = $hash
        shortlisted = 'true'
    }) | Export-Csv -LiteralPath $ledgerPath -NoTypeInformation -Encoding UTF8

    $brief = @'
---
type: transcript-brief
status: draft
source_path: raw/Clippings/Example.md
source_identity: youtube:example
source_sha256: HASH_PLACEHOLDER
trust_class: practitioner
created: 2026-07-23
updated: 2026-07-23
---

# Example

## Core thesis

The source proposes a bounded operating workflow.

## Structured outline

- Define the decision and owner.
- Run a small pilot before scaling.
- Review evidence and exceptions.

## Reusable mechanisms

- Keep the workflow explicit.
- Treat exceptions as learning signals.

## Lean analysis

This is useful as an operating mechanism rather than as proof of performance.

## Caveats

The transcript offers practitioner experience, not independent causal evidence.

## Transcript anchors

- **0:10** — The speaker introduces the operating workflow.

## Proposed routing

- Target: `wiki/agentic-systems.md`
- Semantic disposition: `extended-claim`
'@
    $brief = $brief.Replace('HASH_PLACEHOLDER', $hash)
    Write-Utf8NoBom $briefPath $brief

    & $validator `
        -VaultRoot $fixtureRoot `
        -BriefRoot 'wiki/_outputs/transcript-briefs/2026-07-23' `
        -IntakeLedger 'wiki/_outputs/intake.csv' `
        -MinimumWords 20 `
        -MaximumWords 200

    $invalid = $brief.Replace('## Transcript anchors', '## Missing anchors').Replace('**0:10**', 'No timestamp')
    Write-Utf8NoBom $briefPath $invalid
    $failedAsExpected = $false
    try {
        & $validator `
            -VaultRoot $fixtureRoot `
            -BriefRoot 'wiki/_outputs/transcript-briefs/2026-07-23' `
            -IntakeLedger 'wiki/_outputs/intake.csv' `
            -MinimumWords 20 `
            -MaximumWords 200
    } catch {
        $failedAsExpected = $_.Exception.Message -match 'Transcript anchors|timestamp'
    }
    if (-not $failedAsExpected) { throw 'Validator accepted a brief without transcript anchors.' }

    Write-Host 'Transcript brief validation tests passed.'
}
finally {
    if (Test-Path -LiteralPath $fixtureRoot) {
        $resolvedFixture = [IO.Path]::GetFullPath($fixtureRoot)
        $resolvedTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
        if (-not $resolvedFixture.StartsWith($resolvedTemp, [StringComparison]::OrdinalIgnoreCase)) {
            throw "Refusing to remove test fixture outside the temp directory: $resolvedFixture"
        }
        Remove-Item -LiteralPath $fixtureRoot -Recurse -Force
    }
}
