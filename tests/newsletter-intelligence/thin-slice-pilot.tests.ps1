$pilot=Get-Content -Raw -LiteralPath (Join-Path $testRoot 'fixtures/thin-slice/pilot.json')|ConvertFrom-Json
Assert-True (Test-ThinSlicePilot $pilot) 'pre-registered thin slice validates before scoring'
$score=Measure-ThinSlicePilot $pilot
Assert-True ($score.candidate_count -eq 20 -and $score.issue_count -eq 4) 'retrospective set contains twenty candidates across four issues'
Assert-True ($score.precision -ge 0.60 -and $score.recall -ge 0.70) 'offline precision and recall meet pre-registered thresholds'
Assert-True ($score.retrieval_count -le 10 -and $score.analysis_count -le 3) 'thin slice respects retrieval and deep-analysis caps'
Assert-True ($score.non_obvious_useful_count -ge 2) 'evaluation set includes deliberately non-obvious valuable links'
Assert-True ($score.status -eq 'awaiting_live_validation') 'offline success cannot waive the explicitly approved live validation'

$tempPilot=Join-Path ([IO.Path]::GetTempPath()) ('newsletter-thin-slice-'+[guid]::NewGuid().ToString('N'));New-Item -ItemType Directory $tempPilot|Out-Null
try{
  $html=Join-Path $tempPilot 'review.html';Render-ThinSliceReviewWorkspace $pilot $html
  $rendered=Get-Content -Raw -LiteralPath $html
  Assert-True ($rendered -match 'Thin-slice knowledge review' -and $rendered -match 'Retain' -and $rendered -match 'Correct') 'thin-slice workspace exposes gate audit, analyses, and feedback actions'
  Assert-True ($rendered -notmatch '(?i)(src|href)=["'']https?://|<form') 'thin-slice workspace remains offline and contains no submitting form'
  Assert-True ($rendered -match 'link-11' -and $rendered -match 'link-20') 'skipped and overflow candidates remain visible for audit'
  Assert-True ($rendered -match 'Retrieval outcomes' -and $rendered -match 'Coverage:') 'bounded retrieval outcomes are visibly audited'
  Assert-True ($rendered -match 'maxFeedback=30' -and $rendered -match 'Identical consecutive feedback') 'thin-slice feedback is bounded and consecutive duplicates are ignored'
  Assert-True ($rendered -match 'data-feedback-action' -and $rendered -match "setAttribute\('aria-pressed'" -and $rendered -match 'latestFeedback') 'thin-slice actions expose and restore a visible mutually exclusive selection'
  Assert-True ($rendered -match "if\(thin\).*?\.toolbar.*?\.remove\(\).*?\.shell.*?\.remove\(\).*?return" -and $rendered -match "downloadJson\('newsletter-review.json'" -and $rendered -match "'Export review'") 'thin-slice mode shows one review flow and one relevant download'
  $scorecard=Join-Path $tempPilot 'scorecard.md';Write-ThinSlicePilotScorecard $pilot $scorecard|Out-Null
  Assert-True ((Get-Content -Raw $scorecard) -match 'Awaiting explicitly approved live validation') 'scorecard cannot claim pilot approval before the live week'
}finally{Remove-Item -LiteralPath $tempPilot -Recurse -Force -ErrorAction SilentlyContinue}

$tooMany=Copy-NewsletterRecord $pilot;$tooMany.retrieval_outcomes=@($tooMany.retrieval_outcomes)+@([pscustomobject]@{candidate_id='link-11';coverage='full'})
Assert-Throws {Test-ThinSlicePilot $tooMany} 'retrieval cap' 'retrieval cap fails closed'
$mutating=Copy-NewsletterRecord $pilot;$mutating.boundary_checks.wiki_promoted=$true
Assert-Throws {Test-ThinSlicePilot $mutating} 'boundary' 'wiki promotion or authority mutation fails the pilot'
$duplicateGate=Copy-NewsletterRecord $pilot;$duplicateGate.gate_results[19].candidate_id='link-19'
Assert-Throws {Test-ThinSlicePilot $duplicateGate} 'gate identifiers.*unique' 'duplicate gate cannot conceal a missing candidate result'
$missingBoundary=Copy-NewsletterRecord $pilot;$missingBoundary.boundary_checks=[pscustomobject]@{}
Assert-Throws {Test-ThinSlicePilot $missingBoundary} 'missing required field' 'missing boundary evidence fails closed'
$wrongBoundary=Copy-NewsletterRecord $pilot;$wrongBoundary.boundary_checks.authority_mutated='false'
Assert-Throws {Test-ThinSlicePilot $wrongBoundary} 'boundary violation' 'boundary evidence must use strict booleans'
$unsafeId=Copy-NewsletterRecord $pilot;$unsafeId.pilot_id="bad`n---`n![remote](https://tracker.test/pixel)"
Assert-Throws {Test-ThinSlicePilot $unsafeId} 'pilot_id is invalid' 'pilot identifier cannot inject YAML or Markdown'
$unknownRetrieval=Copy-NewsletterRecord $pilot;$unknownRetrieval.retrieval_outcomes[0].candidate_id='link-11'
Assert-Throws {Test-ThinSlicePilot $unknownRetrieval} 'requires a followed candidate' 'retrieval outcomes require a followed candidate'
$shallow=Copy-NewsletterRecord $pilot;$shallow.source_analyses[0]=[pscustomobject]@{analysis_id='placeholder';candidate_ids=@('link-01')}
Assert-Throws {Test-ThinSlicePilot $shallow} 'missing required field' 'placeholder analysis cannot satisfy the depth gate'

Assert-Throws {New-ConfirmedThinSliceLiveReview $pilot $true 'analysis-01' '2026-07-15T08:00:00Z' '2026-07-15T08:00:00Z' '2026-07-15T08:04:00Z' $false} 'explicit confirmation' 'live review cannot self-authorize inside pilot data'
$confirmedReview=New-ConfirmedThinSliceLiveReview $pilot $true 'analysis-01' '2026-07-15T08:00:00Z' '2026-07-15T08:00:00Z' '2026-07-15T08:04:00Z' $true
Assert-Throws {Measure-ThinSlicePilot $pilot $confirmedReview} 'requires explicit confirmation' 'a serialized review cannot authorize its own scoring'
Assert-True ((Measure-ThinSlicePilot $pilot $confirmedReview $true).status -eq 'passed') 'confirmed live review passes only with time and a retained complete analysis'
$slowReview=New-ConfirmedThinSliceLiveReview $pilot $true 'analysis-01' '2026-07-15T08:00:00Z' '2026-07-15T08:00:00Z' '2026-07-15T08:06:00Z' $true
Assert-True ((Measure-ThinSlicePilot $pilot $slowReview $true).status -eq 'live_failed') 'review over five minutes fails the live gate'
$noRetentionReview=New-ConfirmedThinSliceLiveReview $pilot $false '' '2026-07-15T08:00:00Z' '2026-07-15T08:00:00Z' '2026-07-15T08:04:00Z' $true
Assert-True ((Measure-ThinSlicePilot $pilot $noRetentionReview $true).status -eq 'live_failed') 'a completed review with no retained deep analysis fails the live gate'
Assert-Throws {New-ConfirmedThinSliceLiveReview $pilot $true 'analysis-missing' '2026-07-15T08:00:00Z' '2026-07-15T08:00:00Z' '2026-07-15T08:04:00Z' $true} 'retained analysis is unknown' 'live review must retain a complete pilot analysis'
Assert-Throws {New-ConfirmedThinSliceLiveReview $pilot $true 'analysis-01' 'not-a-date' '2026-07-15T08:00:00Z' '2026-07-15T08:04:00Z' $true} 'timestamps are invalid' 'live review timestamps must be valid and ordered'
$tamperedReview=Copy-NewsletterRecord $confirmedReview;$tamperedReview.review_minutes=1
Assert-Throws {Measure-ThinSlicePilot $pilot $tamperedReview $true} 'integrity hash mismatch' 'tampered live review cannot unlock the pilot'
$inconsistentReview=Copy-NewsletterRecord $confirmedReview;$inconsistentReview.review_minutes=1;Add-RecordIntegrity $inconsistentReview|Out-Null
Assert-Throws {Measure-ThinSlicePilot $pilot $inconsistentReview $true} 'minutes do not match elapsed time' 'review duration is derived from timestamps, not caller input'
$wrongConfirmed=Copy-NewsletterRecord $confirmedReview;$wrongConfirmed.confirmed='true';Add-RecordIntegrity $wrongConfirmed|Out-Null
Assert-Throws {Measure-ThinSlicePilot $pilot $wrongConfirmed $true} 'unsupported or unconfirmed' 'confirmation requires a strict boolean'
$unsafeReviewId=Copy-NewsletterRecord $confirmedReview;$unsafeReviewId.review_id="bad`n---`n![remote](https://tracker.test/pixel)<img src=x>![[embed]]";Add-RecordIntegrity $unsafeReviewId|Out-Null
Assert-Throws {Measure-ThinSlicePilot $pilot $unsafeReviewId $true} 'review_id is invalid' 'review identifier cannot inject active Markdown into the scorecard'
$passedScorecard=Join-Path ([IO.Path]::GetTempPath()) ('newsletter-passed-'+[guid]::NewGuid().ToString('N')+'.md')
try{Write-ThinSlicePilotScorecard $pilot $passedScorecard $confirmedReview $true|Out-Null;$passedText=Get-Content -Raw $passedScorecard;Assert-True ($passedText -match 'U5 may proceed' -and $passedText -notmatch 'U5 remains blocked') 'passed scorecard no longer reports U5 as blocked'}finally{Remove-Item -LiteralPath $passedScorecard -Force -ErrorAction SilentlyContinue}

$relaxed=Copy-NewsletterRecord $pilot;$relaxed.thresholds.max_review_minutes=500
Assert-Throws {Test-ThinSlicePilot $relaxed} 'agreed pilot bounds' 'pilot cannot relax the five-minute review contract'
$wrongLabel=Copy-NewsletterRecord $pilot;$wrongLabel.evaluation_set[0].useful='false'
Assert-Throws {Test-ThinSlicePilot $wrongLabel} 'labels must be boolean' 'usefulness labels require strict booleans'
$coverageMismatch=Copy-NewsletterRecord $pilot;$coverageMismatch.retrieval_outcomes[0].coverage='partial'
Assert-Throws {Test-ThinSlicePilot $coverageMismatch} 'analysis coverage exceeds retrieval coverage' 'full analysis cannot be backed by partial retrieval'
$offlineFail=Copy-NewsletterRecord $pilot;$offlineFail.evaluation_set[0].useful=$false;$offlineFail.evaluation_set[1].useful=$false;$offlineFail.evaluation_set[2].useful=$false;$offlineFail.evaluation_set[12].useful=$true;$offlineFail.evaluation_set[13].useful=$true;$offlineFail.evaluation_set[14].useful=$true
Assert-True ((Measure-ThinSlicePilot $offlineFail).status -eq 'offline_failed') 'offline quality failure cannot proceed to live validation'
$noUseful=Copy-NewsletterRecord $pilot;foreach($item in $noUseful.evaluation_set){$item.useful=$false}
Assert-True ((Measure-ThinSlicePilot $noUseful).status -eq 'offline_failed') 'zero useful labels fail without dividing by zero'
