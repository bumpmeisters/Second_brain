$priorityTemplate=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'priority-context.json')|ConvertFrom-Json
$topicCandidateTemplate=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'topic-candidate.json')|ConvertFrom-Json
$topicRegistryTemplate=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'topic-registry.json')|ConvertFrom-Json

Assert-True (Test-NewsletterRecord $priorityTemplate) 'confirmed priority context validates'
Assert-True (Test-NewsletterRecord $topicCandidateTemplate) 'topic candidate validates'
Assert-True (Test-NewsletterRecord $topicRegistryTemplate) 'topic-watch registry validates'
Assert-True ($priorityTemplate.confirmation_status -eq 'confirmed' -and @($priorityTemplate.confirmed_priorities).Count -eq 6) 'ME-derived priorities are explicitly confirmed'

$assessment=New-RelevanceAssessment $priorityTemplate @('loop engineering') @('loop-engineering') @() $false $false
Assert-True ($assessment.context_version -eq $priorityTemplate.context_version -and $assessment.priority_fit.status -eq 'confirmed') 'confirmed personal context cites its version'
Assert-True (@($assessment.priority_fit.matching_priority_ids|Where-Object {$_ -eq 'priority-applied-ai-agentic'}).Count -eq 1) 'priority synonyms match the confirmed applied-AI priority'
Assert-True (@($assessment.active_lenses|Where-Object {$_ -eq 'wiki_gap'}).Count -eq 1) 'non-personal relevance lenses remain active'
$openAssessment=New-RelevanceAssessment $priorityTemplate @('vibe coding') @() @() $false $false @('adjacent_enabler','convergence','emergent_topic')
Assert-True ($openAssessment.priority_fit.matching_priority_ids.Count -eq 0 -and $openAssessment.discovery_lenses -contains 'convergence') 'emerging relationship remains visible without a fixed priority match'
Assert-True (@($priorityTemplate.active_lenses|Where-Object {$_ -in @('adjacent_enabler','convergence','emergent_topic','exploratory')}).Count -eq 4) 'priority context exposes open-discovery lenses'
Assert-Throws {New-RelevanceAssessment $priorityTemplate @('new topic') @() @() $false $false @('closed_taxonomy')} 'unsupported discovery lens' 'unknown discovery lenses fail closed'

$provisional=Copy-NewsletterRecord $priorityTemplate
$provisional.confirmation_status='provisional';$provisional.confirmed_priorities=@();$provisional.context_version=1
$confirmed=Confirm-PriorityContext $provisional @([pscustomobject]@{priority_id='priority-agent-evaluation';label='Agent evaluation';description='Improve reliable agent evaluation practice.'}) '2026-07-13T10:00:00Z'
Assert-True ($confirmed.confirmation_status -eq 'confirmed' -and $confirmed.context_version -eq 2 -and $confirmed.confirmed_priorities.Count -eq 1) 'explicit confirmation creates a new priority-context version'
Assert-True ($provisional.confirmation_status -eq 'provisional' -and @($provisional.confirmed_priorities).Count -eq 0) 'confirmation does not mutate the prior priority context'

$follow=Apply-TopicWatchAction $topicRegistryTemplate $topicCandidateTemplate 'follow' 0 '2026-07-13T10:00:00Z'
Assert-True ($follow.revision -eq 1 -and $follow.topics[0].watch_status -eq 'follow' -and $follow.topics[0].events.Count -eq 1) 'topic follow creates a versioned monitoring instruction with an event'
Assert-True ($follow.topics[0].PSObject.Properties.Name -notcontains 'wiki_claim') 'topic follow does not create canonical wiki truth'
Assert-Throws {Apply-TopicWatchAction $topicRegistryTemplate $topicCandidateTemplate 'follow' 1 '2026-07-13T10:00:00Z'} 'stale topic registry revision' 'stale topic patch causes no write'

$corrected=Apply-TopicWatchAction $follow $topicCandidateTemplate 'correct' 1 '2026-07-13T10:05:00Z' 'Narrow to evaluation methods, not all agent operations.'
Assert-True ($corrected.topics[0].events.Count -eq 2 -and $corrected.topics[0].events[0].operation -eq 'follow' -and $corrected.topics[0].events[1].operation -eq 'correct') 'topic correction preserves prior events'

$unselectedRegistry=[pscustomobject]@{schema_version='1.0';record_type='source_registry';revision=0;updated_at='2026-07-13T00:00:00Z';sources=@([pscustomobject]@{newsletter_id='newsletter-unselected';decision='not_selected';note='';decided_at='2026-07-13T00:00:00Z'})}
Assert-Throws {Test-TopicSourceEligibility $topicCandidateTemplate $unselectedRegistry} 'selected newsletter' 'topic following cannot bypass source eligibility'
