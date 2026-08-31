$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repo = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$indexTool = Join-Path $repo 'tools\update-newsletter-index.ps1'
$tempRoot = Join-Path ([IO.Path]::GetTempPath()) ('newsletter-index-' + [guid]::NewGuid().ToString('N'))

function Assert-True([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw "Assertion failed: $Message" }
}

function Get-TextSha256([string]$Text) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($Text)))).Replace('-', '') }
    finally { $sha.Dispose() }
}

function Invoke-IndexTool([string]$VaultRoot, [switch]$Check) {
    $arguments = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $indexTool, '-VaultRoot', $VaultRoot)
    if ($Check) { $arguments += '-Check' }
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & powershell.exe @arguments 2>&1 | Out-Null
    $exitCode = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorActionPreference
    return $exitCode
}

try {
    New-Item -ItemType Directory -Force (Join-Path $tempRoot 'empty') | Out-Null
    Assert-True ((Invoke-IndexTool -VaultRoot (Join-Path $tempRoot 'empty') -Check) -eq 0) 'check mode accepts an intentionally unconfigured vault'
    Assert-True (-not (Test-Path -LiteralPath (Join-Path $tempRoot 'empty\wiki'))) 'unconfigured check creates no newsletter files'

    $fixture = Join-Path $tempRoot 'configured'
    New-Item -ItemType Directory -Force (Join-Path $fixture 'wiki\_outputs\newsletter-intelligence'), (Join-Path $fixture 'wiki\newsletters\alpha'), (Join-Path $fixture 'tools\config') | Out-Null
    @'
{
  "record_type": "newsletter_identity_registry",
  "canonical_newsletters": [
    {
      "canonical_id": "publication-alpha",
      "canonical_name": "Alpha",
      "overall_decision": "selected",
      "identity_status": "confirmed_merge",
      "streams": [
        {"decision":"selected","issue_count":2,"date_range":{"from":"2026-05-01","to":"2026-05-10"}},
        {"decision":"selected","issue_count":3,"date_range":{"from":"2026-04-01","to":"2026-06-01"}},
        {"decision":"not_selected","issue_count":99,"date_range":{"from":"2020-01-01","to":"2030-01-01"}}
      ]
    }
  ]
}
'@ | Set-Content -LiteralPath (Join-Path $fixture 'wiki\_outputs\newsletter-intelligence\identity-registry.json') -Encoding UTF8
    @'
---
type: newsletter-dossier
status: active
sources: []
canonical_id: publication-alpha
---
# Alpha
**Summary**: Fixture.
'@ | Set-Content -LiteralPath (Join-Path $fixture 'wiki\newsletters\alpha\alpha.md') -Encoding UTF8
    @'
---
type: index
status: active
sources: []
updated: 2026-01-01
---
# Newsletter Dossiers
**Summary**: Fixture.
- **Selected canonical newsletters**: 0
- **Qualified streams represented**: 0
| Newsletter | Streams | Issues analyzed | Coverage | Identity |
|---|---:|---:|---|---|
| old | 0 | 0 | old | old |
'@ | Set-Content -LiteralPath (Join-Path $fixture 'wiki\newsletters\index.md') -Encoding UTF8

    $publicBlock = @(
        '<!-- BEGIN GENERATED SELECTED DOSSIERS -->',
        '| Newsletter | Streams | Issues analyzed | Coverage | Identity |',
        '|---|---:|---:|---|---|',
        '| [[newsletters/alpha/alpha|Alpha]] | 2 | 5 | 2026-04-01 to 2026-06-01 | confirmed merge |',
        '<!-- END GENERATED SELECTED DOSSIERS -->'
    ) -join "`n"
    [ordered]@{
        contract = 'newsletter-index-public-projection/v1'
        projection = 'generated selected-dossiers block only'
        selected_canonical_newsletters = 1
        selected_streams = 2
        generated_block_sha256 = Get-TextSha256 $publicBlock
        generated_block_bytes = [Text.Encoding]::UTF8.GetByteCount($publicBlock)
    } | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $fixture 'tools\config\newsletter-index-contract.json') -Encoding UTF8

    Assert-True ((Invoke-IndexTool -VaultRoot $fixture) -eq 0) 'generator succeeds for a complete local configuration'
    $indexPath = Join-Path $fixture 'wiki\newsletters\index.md'
    $index = Get-Content -LiteralPath $indexPath -Encoding UTF8 -Raw
    Assert-True ($index -match '\[\[newsletters/alpha/alpha\|Alpha\]\] \| 2 \| 5 \| 2026-04-01 to 2026-06-01') 'selected streams aggregate issue counts and date bounds'
    Assert-True ($index -notmatch '2030-01-01|99') 'not-selected streams are excluded'
    Assert-True ($index -match '(?m)^updated: 2026-01-01\r?$') 'generator does not invent or rewrite the editorial update date'
    Assert-True ((Invoke-IndexTool -VaultRoot $fixture -Check) -eq 0) 'check mode accepts current output'

    $stale = $index -replace 'Selected canonical newsletters\*\*: 1', 'Selected canonical newsletters**: 9'
    Assert-True ($stale -ne $index) 'stale fixture mutation changes the generated count'
    [IO.File]::WriteAllText($indexPath, $stale, [Text.UTF8Encoding]::new($false))
    Assert-True ((Invoke-IndexTool -VaultRoot $fixture -Check) -eq 2) 'check mode fails closed on a stale generated table'

    [IO.File]::WriteAllText($indexPath, $index, [Text.UTF8Encoding]::new($false))
    Assert-True ((Invoke-IndexTool -VaultRoot $fixture -Check) -eq 0) 'restored generated table is current before clean-checkout validation'

    Remove-Item -LiteralPath (Join-Path $fixture 'wiki\_outputs\newsletter-intelligence\identity-registry.json') -Force
    Assert-True ((Invoke-IndexTool -VaultRoot $fixture -Check) -eq 0) 'clean checkout validates against the public projection without the private registry'

    $contractPath = Join-Path $fixture 'tools\config\newsletter-index-contract.json'
    $contract = Get-Content -LiteralPath $contractPath -Raw | ConvertFrom-Json
    $contract.generated_block_sha256 = ('0' * 64)
    $contract | ConvertTo-Json | Set-Content -LiteralPath $contractPath -Encoding UTF8
    Assert-True ((Invoke-IndexTool -VaultRoot $fixture -Check) -eq 2) 'clean checkout fails closed on a stale public projection'

    Write-Host 'Newsletter index generator contract: PASS'
}
finally {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}
