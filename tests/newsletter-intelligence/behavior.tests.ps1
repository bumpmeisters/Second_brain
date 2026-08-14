$messages=Get-Content -Raw -LiteralPath (Join-Path $testRoot 'fixtures/messages.json')|ConvertFrom-Json
$issues=@(Convert-MessageRecords @($messages))
Assert-True ($issues.Count -eq 3) 'normalization preserves one issue record per message'
Assert-True (-not (($issues|ConvertTo-Json -Depth 20) -match 'ignore all rules|<script|<form')) 'active and prompt-like markup is removed'
Assert-True (($issues[0].links[0].url -eq 'https://agent.test/evals?item=1')) 'tracking parameters are removed from retained links'
Assert-True (($issues|Where-Object message_id -eq 'm1').newsletter_id -eq ($issues|Where-Object message_id -eq 'm2').newsletter_id) 'List-ID groups sender variants'
Assert-True (@($issues|Where-Object duplicate_cluster_id).Count -eq 2) 'duplicate normalized content is clustered with provenance'
$profiles=@(New-NewsletterProfiles $issues)
Assert-True ($profiles.Count -eq 2) 'recurring issues become one profile per newsletter'
Assert-True (-not (($profiles|ConvertTo-Json -Depth 20) -match '"(score|rank|recommendation)"')) 'profiles contain no model judgment field'
Assert-True (@($profiles|Where-Object{$_.wiki_overlap.Count -gt 0}).Count -gt 0) 'profiles map observed themes to relevant wiki areas without scoring'

$temp=Join-Path ([IO.Path]::GetTempPath()) ('newsletter-tests-'+[guid]::NewGuid().ToString('N'));New-Item -ItemType Directory $temp|Out-Null
try{
  $profiles[0].caveats+=@('</SCRIPT><script>alert(1)</script>')
  $html=Join-Path $temp 'index.html';Render-ReviewWorkspace $profiles $issues $html
  $rendered=Get-Content -Raw $html
  Assert-True ($rendered -match 'Evidence-first newsletter review') 'offline review workspace renders'
  Assert-True (-not ($rendered -match '(?i)(src|href)=["'']https?')) 'workspace contains no remote resources or live external links'
  Assert-True (-not ($rendered -match '<form')) 'workspace contains no submitting forms'
  Assert-True (-not ($rendered -match '(?i)</script><script>alert\(1\)')) 'case-insensitive script terminators are escaped in embedded JSON'
  Assert-True ($rendered -match "execCommand\('copy'\)") 'offline clipboard actions include a file-origin fallback'

  $decision=[pscustomobject]@{schema_version='1.0';record_type='source_decisions';exported_at='2026-07-03T00:00:00Z';decisions=@(
    [pscustomobject]@{newsletter_id=$profiles[0].newsletter_id;decision='selected';note='pilot'},
    [pscustomobject]@{newsletter_id=$profiles[1].newsletter_id;decision='not_selected';note='not for pilot'})}
  $registryPath=Join-Path $temp 'registry.json'
  Assert-Throws {Import-SourceDecisions $decision $profiles $registryPath $false} 'explicit confirmation' 'browser state cannot alter registry without confirmation'
  $registry=Import-SourceDecisions $decision $profiles $registryPath $true
  Assert-True (Test-Path $registryPath) 'confirmed decisions atomically create the registry'
  $seededHtml=Join-Path $temp 'seeded.html';Render-ReviewWorkspace $profiles $issues $seededHtml $registry
  Assert-True ((Get-Content -Raw $seededHtml) -match 'initial_decisions') 'authoritative decisions seed regenerated review workspaces'
  $invalidRegistry=Get-Content -Raw $registryPath|ConvertFrom-Json;$invalidRegistry.sources[0].decision='maybe'
  Assert-Throws {Test-NewsletterRecord $invalidRegistry} 'unsupported decision' 'source registry rejects unsupported authority states'
  $signals=@(Build-Signals $issues $registry)
  Assert-True (@($signals|Where-Object newsletter_ids -contains $profiles[1].newsletter_id).Count -eq 0) 'not-selected sources cannot create signals'
  Assert-True ($signals.Count -eq 1) 'repeated selected claims consolidate into one signal'
  Assert-True ($signals[0].issue_ids.Count -eq 2) 'consolidated signals retain all issue provenance'
  $brief=Join-Path $temp 'brief.md';Build-WeeklyBrief $signals $brief 1|Out-Null
  Assert-True ((Get-Content -Raw $brief) -match 'Evidence status.*unverified') 'brief exposes evidence status and uncertainty'

  $runRoot=Join-Path $temp 'runs';$r1=New-NewsletterRun 'run-idempotent' $runRoot 'fixture' 'device_local' $false;$r1.checkpoints|Add-Member -NotePropertyName page -NotePropertyValue 2;Write-JsonAtomic $r1 (Join-Path $runRoot 'run-idempotent/run-manifest.json')
  $r2=New-NewsletterRun 'run-idempotent' $runRoot 'fixture' 'device_local' $false
  Assert-True ($r2.checkpoints.page -eq 2) 'reinitialization preserves completed checkpoints'

  $stage=Join-Path $temp 'stage';New-Item -ItemType Directory -Force (Join-Path $stage 'issues'),(Join-Path $stage 'profiles')|Out-Null
  $rejected=($registry.sources|Where-Object decision -eq 'not_selected');$rejected.decided_at='2026-06-01T00:00:00Z'
  $rejectedIssue=$issues|Where-Object newsletter_id -eq $rejected.newsletter_id|Select-Object -First 1
  Write-JsonAtomic $rejectedIssue (Join-Path $stage "issues/$($rejected.newsletter_id)-issue.json")
  Write-JsonAtomic ($profiles|Where-Object newsletter_id -eq $rejected.newsletter_id) (Join-Path $stage "profiles/$($rejected.newsletter_id).json")
  New-Item -ItemType Directory -Force (Join-Path $stage 'decisions')|Out-Null
  Copy-Item -LiteralPath $registryPath -Destination (Join-Path $stage 'decisions/source-registry.json')
  $removed=@(Invoke-Retention $registry $stage ([datetime]'2026-07-03'))
  Assert-True ($removed.Count -eq 1) 'day-30 retention removes rejected issue detail'
  Assert-True (Test-Path (Join-Path $stage "profiles/$($rejected.newsletter_id).json")) 'retention preserves rejected profile context'
  Assert-True (Test-Path (Join-Path $stage 'decisions/source-registry.json')) 'retention preserves authoritative decision context'
}finally{Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue}

$skill=Get-Content -Raw -LiteralPath (Join-Path $repo 'skills/newsletter-intelligence/SKILL.md')
Assert-True ($skill -match 'at most ten messages') 'live smoke is explicitly capped'
Assert-True ($skill -match 'Do not use send, draft, label, archive, trash, delete') 'Gmail mutation boundary is explicit'

$liveManifest=Get-Content -Raw -LiteralPath (Join-Path $repo 'templates/newsletter-intelligence/run-manifest.json')|ConvertFrom-Json
$liveManifest.mode='live';$liveManifest.staging_location_accepted=$true
Assert-True (Test-GmailCollectionPreflight 'dedicated@example.test' 'dedicated@example.test' $liveManifest 10 $true) 'matching account and ten-message smoke pass preflight'
Assert-Throws {Test-GmailCollectionPreflight 'wrong@example.test' 'dedicated@example.test' $liveManifest 1 $true} 'account mismatch' 'account mismatch stops before body reads'
Assert-Throws {Test-GmailCollectionPreflight 'dedicated@example.test' 'dedicated@example.test' $liveManifest 11 $true} 'ten messages' 'smoke cannot exceed ten body reads'
$page1=[pscustomobject]@{message_ids=@('a','b');next_page_token='token-2'}
$page2=[pscustomobject]@{message_ids=@('b','c');next_page_token=$null}
Add-GmailInventoryPage $liveManifest $page1 $true|Out-Null;Add-GmailInventoryPage $liveManifest $page2 $true|Out-Null
Assert-True (@($liveManifest.checkpoints.collection.discovered_ids).Count -eq 3) 'pagination deduplicates message identifiers'
$tokenBefore=$liveManifest.checkpoints.collection.next_page_token
Add-GmailInventoryPage $liveManifest ([pscustomobject]@{message_ids=@('d');next_page_token='bad-token';error='timeout'}) $false|Out-Null
Assert-True ($liveManifest.checkpoints.collection.next_page_token -eq $tokenBefore) 'failed page does not advance the resume token'

$ambiguousMessage=[pscustomobject]@{message_id='m4';received_at='2026-06-21T08:00:00Z';sender_name='Generic Dispatch';sender_address='news@shared-sender.test';subject='Unknown publication';list_id='';content='A useful but weakly identified issue.';topics=@('AI');claims=@('A source identity needs review.');links=@();relevance_hypotheses=@();promotional_markers=@()}
$ambiguousIssue=@(Convert-MessageRecords @($ambiguousMessage))
$ambiguities=@(Get-IdentityAmbiguities $ambiguousIssue)
Assert-True ($ambiguities.Count -eq 1 -and $ambiguities[0].status -eq 'needs_review') 'low-confidence grouping creates an ambiguity record'

$feedback=New-SignalFeedback $signals[0] 'correct' 'Narrow the claim in later briefs.'
Assert-True ($feedback.signal_id -eq $signals[0].signal_id -and $signals[0].source_claim -match 'bounded evaluation') 'feedback is append-only and does not rewrite historical signals'
$proposal=New-PromotionProposal $signals[0] @('agent-evaluation')
Assert-True ($proposal.status -eq 'proposed' -and $proposal.affected_pages.Count -eq 1) 'promotion remains a proposal with explicit affected pages'
