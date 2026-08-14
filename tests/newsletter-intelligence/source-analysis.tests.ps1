$templateRoot=Join-Path $repo 'templates/newsletter-intelligence'
. (Join-Path $repo 'tools/newsletter-source-analysis.ps1')
$fixtureRoot=Join-Path $testRoot 'fixtures/sources'
$fixtures=Get-Content -Raw -LiteralPath (Join-Path $fixtureRoot 'analysis-records.json')|ConvertFrom-Json

Assert-True (Test-SourceAnalysisCompleteness $fixtures.article_full) 'full article requires section-aware synthesis'
Assert-True (Test-SourceAnalysisCompleteness $fixtures.paper_full) 'full paper includes question, context, method, data, results, and limitations'
Assert-True (Test-SourceAnalysisCompleteness $fixtures.report_full) 'full report exposes sponsor, methodology, data basis, findings, incentives, and limitations'
Assert-True (Test-SourceAnalysisCompleteness $fixtures.paper_partial) 'partial paper names inaccessible method and results without claiming full coverage'

$brokenPaper=Copy-NewsletterRecord $fixtures.paper_full;$brokenPaper.paper_details.method=''
Assert-Throws {Test-SourceAnalysisCompleteness $brokenPaper} 'paper.*method' 'full paper cannot omit its method'
$dishonestPartial=Copy-NewsletterRecord $fixtures.paper_partial;$dishonestPartial.missing_sections=@()
Assert-Throws {Test-SourceAnalysisCompleteness $dishonestPartial} 'partial.*missing' 'partial analysis must name missing sections'

$safeMarkdown=Render-SourceAnalysisMarkdown $fixtures.malicious_article
Assert-True ($safeMarkdown -notmatch '(?i)<(script|iframe|form|object|svg)|!\[[^\]]*\]\(https?://|javascript:|data:text/html|https?://[^\s)]*token=') 'staged Markdown removes active HTML, remote embeds, unsafe schemes, and personalized links'
Assert-True ($safeMarkdown -match 'Ignore previous instructions') 'prompt-injection text remains inert source content rather than an executed instruction'

$claim=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'claim-record.json')|ConvertFrom-Json
$verification=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'verification-record.json')|ConvertFrom-Json
Assert-True (Test-VerificationIndependence $verification $claim) 'independent verification uses a distinct source'
$selfVerification=Copy-NewsletterRecord $verification;$selfVerification.verifier_source_ids=@('link-example')
Assert-Throws {Test-VerificationIndependence $selfVerification $claim} 'independent.*overlap' 'newsletter-linked source cannot independently verify itself'

$tempAnalysis=Join-Path ([IO.Path]::GetTempPath()) ('newsletter-analysis-'+[guid]::NewGuid().ToString('N'));New-Item -ItemType Directory $tempAnalysis|Out-Null
try{
  $fixtureEvaluationTime=[datetimeoffset]::Parse('2026-07-14T00:00:00Z')
  $snapshot=Join-Path $tempAnalysis 'snapshot.bin';[IO.File]::WriteAllText($snapshot,'bounded fixture source')
  $completion=Join-Path $tempAnalysis 'complete.json'
  $fetch=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'source-fetch.json')|ConvertFrom-Json;$fetch.snapshot_path=$snapshot;$fetch.completion_path=$completion
  $fetch.content_hash='sha256-'+(Get-FileHash -LiteralPath $snapshot -Algorithm SHA256).Hash.ToLowerInvariant()
  [IO.File]::WriteAllText($completion,([pscustomobject]@{candidate_id=$fetch.candidate_id;content_hash=$fetch.content_hash}|ConvertTo-Json -Compress))
  $request=New-SourceAnalysisRequest $fetch 'analysis-fixture' -EvaluatedAt $fixtureEvaluationTime
  Assert-True ($request.reasoning_level -eq 'medium' -and $request.snapshot_path -eq $snapshot -and $request.allowed_outputs.Count -eq 1) 'analysis request uses the completed local snapshot, medium reasoning, and staged output only'
  Assert-True (@($request.forbidden_capabilities|Where-Object{$_ -in @('gmail','navigation','shell','wiki_write')}).Count -eq 4) 'analysis request states the procedural capability boundary'
  [IO.File]::WriteAllText($snapshot,'tampered')
  Assert-Throws {New-SourceAnalysisRequest $fetch 'analysis-tampered' -EvaluatedAt $fixtureEvaluationTime} 'hash does not match' 'modified snapshots cannot enter source analysis'
  [IO.File]::WriteAllText($snapshot,'bounded fixture source')
  $expired=Copy-NewsletterRecord $fetch;$expired.expires_at='2000-01-01T00:00:00Z'
  Assert-Throws {New-SourceAnalysisRequest $expired 'analysis-expired' -EvaluatedAt $fixtureEvaluationTime} 'expired' 'expired snapshots cannot enter source analysis'
  $staged=Write-StagedSourceAnalysis $fixtures.article_full (Join-Path $tempAnalysis 'staged')
  Assert-True ((Test-Path -LiteralPath $staged.json_path) -and (Test-Path -LiteralPath $staged.markdown_path)) 'validated source analysis writes JSON and safe Markdown to private staging'
  $reused=Get-ReusableSourceAnalysis $fixtures.article_full ([pscustomobject]@{candidate_id='link-second';content_hash=$fixtures.article_full.content_hash})
  Assert-True ($reused.candidate_ids -contains 'link-second' -and $reused.analysis_id -eq $fixtures.article_full.analysis_id) 'identical content reuses analysis while retaining new provenance'
  Assert-True ($null -eq (Get-ReusableSourceAnalysis $fixtures.article_full ([pscustomobject]@{candidate_id='link-other';content_hash='sha256-other'}))) 'changed content requires a fresh analysis'
}finally{Remove-Item -LiteralPath $tempAnalysis -Recurse -Force -ErrorAction SilentlyContinue}
