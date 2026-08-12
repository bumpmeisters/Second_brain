[CmdletBinding()]
param(
    [string]$VaultRoot
)

$ErrorActionPreference = 'Stop'

if (-not $VaultRoot) {
    $VaultRoot = (& git rev-parse --show-toplevel 2>$null).Trim()
}
if (-not $VaultRoot -or -not (Test-Path -LiteralPath $VaultRoot -PathType Container)) {
    throw 'Vault root could not be resolved.'
}

$vaultPath = (Resolve-Path -LiteralPath $VaultRoot).Path
$fixtureRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("content-object-contract-tests-" + [guid]::NewGuid().ToString('N'))
$fixtureMarker = [System.IO.Path]::GetFullPath((Join-Path ([System.IO.Path]::GetTempPath()) 'content-object-contract-tests-'))
$testResults = [System.Collections.Generic.List[string]]::new()

function Copy-FixtureFile {
    param([string]$RelativePath)

    $source = Join-Path $vaultPath ($RelativePath -replace '/', '\')
    $target = Join-Path $fixtureRoot ($RelativePath -replace '/', '\')
    $targetDirectory = Split-Path -Parent $target
    New-Item -ItemType Directory -Force -Path $targetDirectory | Out-Null
    Copy-Item -LiteralPath $source -Destination $target
}

function Invoke-FixtureValidator {
    param(
        [string]$Name,
        [int]$ExpectedExitCode,
        [string]$ExpectedText
    )

    $validator = Join-Path $fixtureRoot 'projects\content-operating-system\tools\validate-content-objects.ps1'
    $previousErrorActionPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $output = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $validator -VaultRoot $fixtureRoot 2>&1 | Out-String
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }
    if ($exitCode -ne $ExpectedExitCode) {
        throw "$Name returned exit code $exitCode instead of $ExpectedExitCode.`n$output"
    }
    if ($ExpectedText -and $output -notmatch [regex]::Escape($ExpectedText)) {
        throw "$Name did not report expected text '$ExpectedText'.`n$output"
    }
    $testResults.Add("PASS $Name")
}

try {
    $fixtureFiles = @(
        'projects/content-operating-system/tools/validate-content-objects.ps1',
        'projects/content-operating-system/tools/config/content-object-contract.json',
        'projects/content-operating-system/publishing/publication-register.md',
        'projects/ai/authority/directions/llm-thinking-emergence-direction-v1.md',
        'projects/ai/authority/llm-thinking-emergence-direction-approval.md',
        'projects/ai/authority/directions/llm-thinking-emergence-direction-v6.md',
        'projects/ai/authority/llm-thinking-emergence-direction-v6-approval.md',
        'projects/ai/authority/briefs/llm-thinking-emergence-linkedin-article-brief-v5.md',
        'projects/ai/authority/briefs/llm-thinking-emergence-linkedin-post-brief-v1.md',
        'projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-6.md',
        'projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-post-v0-1.md',
        'projects/ai/authority/directions/j-space-thought-suppression-direction-v1.md',
        'projects/ai/authority/briefs/j-space-thought-suppression-linkedin-article-brief-v1.md',
        'projects/ai/authority/linkedin/j-space-thought-suppression-linkedin-article-v0.md',
        'projects/ai/authority/directions/j-space-silent-reasoning-direction-v1.md',
        'projects/ai/authority/briefs/j-space-silent-reasoning-linkedin-article-brief-v1.md',
        'projects/ai/authority/linkedin/j-space-silent-reasoning-linkedin-article-v0.md'
    )
    foreach ($fixtureFile in $fixtureFiles) {
        Copy-FixtureFile -RelativePath $fixtureFile
    }

    Invoke-FixtureValidator -Name 'baseline migration' -ExpectedExitCode 0 -ExpectedText 'PASS content-object-contract/v1'

    $registerPath = Join-Path $fixtureRoot 'projects\content-operating-system\publishing\publication-register.md'
    $registerBaseline = Get-Content -Raw -LiteralPath $registerPath
    $duplicateRow = ($registerBaseline -split "`r?`n" | Where-Object { $_ -match 'ai-j-space-silent-reasoning-03-linkedin-article-v0' } | Select-Object -First 1)
    $registerWithDuplicate = $registerBaseline.Replace("`n## Pending recovery: wave 07", "`n$duplicateRow`n`n## Pending recovery: wave 07")
    Set-Content -LiteralPath $registerPath -Value $registerWithDuplicate -NoNewline
    Invoke-FixtureValidator -Name 'duplicate variant rejection' -ExpectedExitCode 1 -ExpectedText "Duplicate variant_id"
    Set-Content -LiteralPath $registerPath -Value $registerBaseline -NoNewline

    $briefPath = Join-Path $fixtureRoot 'projects\ai\authority\briefs\llm-thinking-emergence-linkedin-article-brief-v5.md'
    $briefBaseline = Get-Content -Raw -LiteralPath $briefPath
    Set-Content -LiteralPath $briefPath -Value ($briefBaseline + "`n## Personal Take Checkpoint`n") -NoNewline
    Invoke-FixtureValidator -Name 'strategic brief redefinition rejection' -ExpectedExitCode 1 -ExpectedText 'redefines a Strategic'
    Set-Content -LiteralPath $briefPath -Value $briefBaseline -NoNewline

    $fingerprintPath = Join-Path $fixtureRoot 'projects\ai\authority\linkedin\fingerprint-test-artifact.md'
    [System.IO.File]::WriteAllText($fingerprintPath, "frozen test artifact`n")
    $fingerprintBaseline = [System.IO.File]::ReadAllBytes($fingerprintPath)
    $contractPath = Join-Path $fixtureRoot 'projects\content-operating-system\tools\config\content-object-contract.json'
    $contractObject = Get-Content -Raw -LiteralPath $contractPath | ConvertFrom-Json
    $contractObject.service_now_fingerprints | Add-Member -NotePropertyName 'projects/ai/authority/linkedin/fingerprint-test-artifact.md' -NotePropertyValue ((Get-FileHash -LiteralPath $fingerprintPath -Algorithm SHA256).Hash.ToLowerInvariant())
    $contractObject | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $contractPath
    Invoke-FixtureValidator -Name 'active fingerprint baseline' -ExpectedExitCode 0 -ExpectedText 'PASS content-object-contract/v1'
    [System.IO.File]::WriteAllBytes($fingerprintPath, $fingerprintBaseline + [byte[]](10))
    Invoke-FixtureValidator -Name 'fingerprint mutation rejection' -ExpectedExitCode 1 -ExpectedText 'Fingerprint changed'
    [System.IO.File]::WriteAllBytes($fingerprintPath, $fingerprintBaseline)

    $performanceDirectory = Join-Path $fixtureRoot 'projects\ai\authority\performance'
    New-Item -ItemType Directory -Force -Path $performanceDirectory | Out-Null
    $performancePath = Join-Path $performanceDirectory 'draft-variant-performance.md'
    @'
---
type: performance-record
status: recorded
performance_id: performance-ai-llm-thinking-emergence-01-test
content_id: ai-llm-thinking-emergence-01
direction_id: direction-ai-llm-thinking-emergence-01-v6
brief_id: brief-ai-llm-thinking-emergence-01-linkedin-article-v5
variant_id: ai-llm-thinking-emergence-01-linkedin-article-v5
source_project: projects/ai
observation_window: 2026-08-01/2026-08-12
created: 2026-08-12
updated: 2026-08-12
---
'@ | Set-Content -LiteralPath $performancePath
    Invoke-FixtureValidator -Name 'unpublished performance rejection' -ExpectedExitCode 1 -ExpectedText 'which is not published'

    foreach ($result in $testResults) {
        Write-Output $result
    }
    Write-Output "PASS content-object-contract tests: $($testResults.Count) scenarios."
} finally {
    $resolvedFixture = [System.IO.Path]::GetFullPath($fixtureRoot)
    if (
        (Test-Path -LiteralPath $resolvedFixture) -and
        $resolvedFixture.StartsWith($fixtureMarker, [System.StringComparison]::OrdinalIgnoreCase)
    ) {
        Remove-Item -LiteralPath $resolvedFixture -Recurse -Force
    }
}
