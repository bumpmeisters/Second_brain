$tempRoot = Join-Path ([IO.Path]::GetTempPath()) ('newsletter-index-' + [guid]::NewGuid().ToString('N'))
try {
    New-Item -ItemType Directory -Force (Join-Path $tempRoot 'wiki/_outputs/newsletter-intelligence'), (Join-Path $tempRoot 'wiki/newsletters/alpha') | Out-Null
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
'@ | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/_outputs/newsletter-intelligence/identity-registry.json') -Encoding UTF8
    @'
---
type: newsletter-dossier
status: active
sources: []
canonical_id: publication-alpha
---
# Alpha
**Summary**: Fixture.
'@ | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/newsletters/alpha/alpha.md') -Encoding UTF8
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
'@ | Set-Content -LiteralPath (Join-Path $tempRoot 'wiki/newsletters/index.md') -Encoding UTF8

    $indexTool = Join-Path $repo 'tools/update-newsletter-index.ps1'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $indexTool -VaultRoot $tempRoot 2>&1 | Out-Null
    Assert-True ($LASTEXITCODE -eq 0) 'newsletter index generator succeeds'
    $index = Get-Content -LiteralPath (Join-Path $tempRoot 'wiki/newsletters/index.md') -Encoding UTF8 -Raw
    Assert-True ($index -match '\[\[newsletters/alpha/alpha\|Alpha\]\] \| 2 \| 5 \| 2026-04-01 to 2026-06-01') 'selected streams aggregate earliest start, latest end, and issue total'
    Assert-True ($index -notmatch '2030-01-01|99') 'not-selected streams are excluded'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $indexTool -VaultRoot $tempRoot -Check 2>&1 | Out-Null
    Assert-True ($LASTEXITCODE -eq 0) 'newsletter index check mode accepts current output'
} finally {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}
