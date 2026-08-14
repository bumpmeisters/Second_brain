$repo=Split-Path -Parent (Split-Path -Parent $testRoot)
$tool=Join-Path $repo 'tools/newsletter-intelligence.ps1'
. $tool
$templateRoot=Join-Path $repo 'templates/newsletter-intelligence'
Get-ChildItem -LiteralPath $templateRoot -Filter '*.json'|ForEach-Object{$record=Get-Content -Raw -LiteralPath $_.FullName|ConvertFrom-Json;Assert-True (Test-NewsletterRecord -Record $record) "$($_.Name) validates"}
$badIssue=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'issue-record.json')|ConvertFrom-Json;$badIssue|Add-Member -NotePropertyName full_body -NotePropertyValue 'private body'
Assert-Throws {Test-NewsletterRecord -Record $badIssue} 'forbidden field.*full_body' 'full body fields fail closed'
$badExcerpt=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'issue-record.json')|ConvertFrom-Json;$badExcerpt.evidence_excerpts[0].text='x'*1201
Assert-Throws {Test-NewsletterRecord -Record $badExcerpt} 'excerpt.*1200' 'over-limit excerpts are rejected'
$live=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'run-manifest.json')|ConvertFrom-Json;$live.mode='live'
Assert-Throws {Test-NewsletterRecord -Record $live} 'staging location.*accepted' 'live reads require accepted staging location'

$baselineSourceRegistry=[pscustomobject]@{
  schema_version='1.0';record_type='source_registry';updated_at='2026-07-06T00:00:00Z'
  sources=@([pscustomobject]@{newsletter_id='newsletter-fixture';decision='selected';note='synthetic migration fixture';decided_at='2026-07-06T00:00:00Z'})
}
Assert-True (Test-NewsletterRecord -Record $baselineSourceRegistry) 'V1 source registry remains a valid migration baseline'
$baselineIdentityRegistry=[pscustomobject]@{
  schema_version='1.0';record_type='newsletter_identity_registry';updated_at='2026-07-06T00:00:00Z'
  canonical_newsletters=@();unresolved_groups=@();provenance=[pscustomobject]@{source='synthetic migration fixture'}
}
Assert-True (Test-NewsletterRecord -Record $baselineIdentityRegistry) 'V1 identity registry remains a valid migration baseline'
$nestedSecret=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'issue-record.json')|ConvertFrom-Json
$nestedSecret.provenance | Add-Member -NotePropertyName authorization -NotePropertyValue 'Bearer private'
Assert-Throws {Test-NewsletterRecord -Record $nestedSecret} 'forbidden field.*authorization' 'nested secret fields fail closed'

$review=[pscustomobject]@{
  schema_version='1.0';record_type='weekly_review_decisions';review_id='review-example';period=[pscustomobject]@{from='2026-07-06';to='2026-07-12'}
  input_hash='sha256-input';bundle_hash='sha256-bundle';base_registry_revisions=[pscustomobject]@{source_registry=0}
  reviewer_timestamp='2026-07-13T10:00:00Z';actions=@([pscustomobject]@{action_id='action-1';family='source_selection';target_id='newsletter-example';operation='selected';payload=[pscustomobject]@{note='keep'}})
}
Add-RecordIntegrity $review
Assert-True (Test-NewsletterRecord -Record $review) 'hashed weekly review decisions validate'
$review.integrity.hash='00'
Assert-Throws {Test-NewsletterRecord -Record $review} 'integrity hash mismatch' 'invalid review hash fails closed'
Add-RecordIntegrity $review|Out-Null

$registry=[pscustomobject]@{schema_version='1.0';record_type='source_registry';revision=2;updated_at='2026-07-13T00:00:00Z';sources=@([pscustomobject]@{newsletter_id='newsletter-a';decision='selected';note='keep';decided_at='2026-07-01T00:00:00Z'},[pscustomobject]@{newsletter_id='newsletter-b';decision='undecided';note='wait';decided_at='2026-07-01T00:00:00Z'})}
$patched=Apply-RegistryPatch $registry @([pscustomobject]@{newsletter_id='newsletter-a';decision='not_selected';note='changed'}) 2
Assert-True ($patched.revision -eq 3 -and $patched.sources.Count -eq 2 -and ($patched.sources|Where-Object newsletter_id -eq 'newsletter-b').decision -eq 'undecided') 'partial registry patch preserves untouched entries and increments revision'
Assert-Throws {Apply-RegistryPatch $registry @([pscustomobject]@{newsletter_id='newsletter-a';decision='selected'}) 1} 'stale registry revision' 'stale registry revision causes no patch'

$event=New-ConfirmedReviewEvent $review '2026-07-13T10:05:00Z'
Assert-True (Test-NewsletterRecord -Record $event) 'immutable confirmed review event validates'
$tempContracts=Join-Path ([IO.Path]::GetTempPath()) ('newsletter-contracts-'+[guid]::NewGuid().ToString('N'));New-Item -ItemType Directory $tempContracts|Out-Null
try{
  $eventPath=Join-Path $tempContracts 'review-events.json';$first=Import-ConfirmedReviewEvent $event $eventPath;$second=Import-ConfirmedReviewEvent $event $eventPath
  Assert-True (@($first).Count -eq 1 -and @($second).Count -eq 1) 'duplicate confirmed-review import is idempotent'
  $signalTemplate=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'signal-record.json')|ConvertFrom-Json
  $arrayPath=Join-Path $tempContracts 'signals.json';Write-JsonArrayAtomic @($signalTemplate) $arrayPath
  Assert-True (@(Get-Content -Raw $arrayPath|ConvertFrom-Json).Count -eq 1) 'signal-array output is validated and atomically written'
}finally{Remove-Item -LiteralPath $tempContracts -Recurse -Force -ErrorAction SilentlyContinue}
