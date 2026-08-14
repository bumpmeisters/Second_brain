$fixtureRoot=Join-Path $testRoot 'fixtures/links'
$input=Get-Content -Raw -LiteralPath (Join-Path $fixtureRoot 'link-input.json')|ConvertFrom-Json
$priority=Get-Content -Raw -LiteralPath (Join-Path $templateRoot 'priority-context.json')|ConvertFrom-Json
$registry=[pscustomobject]@{schema_version='1.0';record_type='source_registry';revision=1;updated_at='2026-07-13T00:00:00Z';sources=@([pscustomobject]@{newsletter_id='selected-one';decision='selected'},[pscustomobject]@{newsletter_id='selected-two';decision='selected'},[pscustomobject]@{newsletter_id='not-selected';decision='not_selected'})}
$candidates=@(New-LinkCandidates @($input.issues) $registry)
$unselectedIssue=[pscustomobject]@{issue_id='issue-unselected';newsletter_id='not-selected';links=@([pscustomobject]@{url='https://research.example.test/unselected-paper';label='Research paper';context='Durable research method.'})}
Assert-True (@(New-LinkCandidates @($unselectedIssue) $registry).Count -eq 0) 'not-selected newsletters cannot create link candidates'

Assert-True ($candidates.Count -eq 6) 'duplicate canonical URLs consolidate while unsafe links remain auditable candidates'
$paper=$candidates|Where-Object canonical_url -eq 'https://research.example.test/paper.pdf?study=42'|Select-Object -First 1
Assert-True ($paper -and $paper.origin_issue_ids.Count -eq 2 -and $paper.anchor_text -eq 'Read the paper') 'canonical duplicate retains every issue provenance and bounded anchor context'
Assert-True ($paper.commercial_markers.Count -eq 0 -and $paper.source_type -eq 'research_paper') 'paper source type is inferred without navigation'
$affiliate=$candidates|Where-Object {$_.commercial_markers -contains 'affiliate'}|Select-Object -First 1
Assert-True ($affiliate -and $affiliate.canonical_url -notmatch 'aff|utm') 'affiliate markers survive while tracking parameters are removed from the canonical URL'
$sensitive=$candidates|Where-Object safety_status -eq 'blocked_sensitive'|Select-Object -First 1
Assert-True ($sensitive -and ($sensitive.PSObject.Properties.Name -notcontains 'original_url')) 'sensitive links are blocked without persisting their original target'
$credentialTarget=ConvertTo-LinkCandidateTarget 'https://user:pass@example.test/paper?access_token=secret' 'Private paper' 'Research method'
Assert-True ($credentialTarget.safety_status -eq 'blocked_sensitive' -and $credentialTarget.canonical_url -notmatch 'user|pass|secret|example.test') 'credential-bearing targets persist only an opaque sanitized identifier'
$privateV6=ConvertTo-LinkCandidateTarget 'https://[fc00::1]/paper' 'Private IPv6' 'Research method'
Assert-True ($privateV6.safety_status -eq 'blocked_private') 'private IPv6 literals fail before retrieval'
$reorderedA=ConvertTo-LinkCandidateTarget 'https://example.test/article?b=2&a=1#part' 'Article' 'Analysis'
$reorderedB=ConvertTo-LinkCandidateTarget 'https://example.test/article?a=1&b=2' 'Article' 'Analysis'
Assert-True ($reorderedA.canonical_url -eq $reorderedB.canonical_url) 'query order and fragments do not bypass canonical deduplication'
$credentialCandidate=[pscustomobject]@{schema_version='1.0';record_type='link_candidate';candidate_id='link-credential';origin_issue_ids=@('issue-credential');origin_newsletter_ids=@('selected-one');anchor_text='Private dashboard';context_excerpt='A durable research method is available behind authentication.';related_claim_ids=@();related_topic_ids=@();canonical_url=$credentialTarget.canonical_url;source_type='research_paper';commercial_markers=@();safety_status='blocked_sensitive';provenance=[pscustomobject]@{created_at='2026-07-13T00:00:00Z';navigation_performed=$false}}
$confirmedPriority=Confirm-PriorityContext $priority @([pscustomobject]@{priority_id='priority-research-method';label='research paper';description='Durable research methods.'})
$priorityGate=(New-LinkGateDecisions @($paper) $confirmedPriority 1)[0]
Assert-True ($priorityGate.priority_fit.status -eq 'confirmed' -and $priorityGate.priority_fit.matching_priority_ids -contains 'priority-research-method') 'confirmed priority matches are recorded with their context version'

$openCandidate=[pscustomobject]@{schema_version='1.0';record_type='link_candidate';candidate_id='link-open-discovery';origin_issue_ids=@('issue-open');origin_newsletter_ids=@('selected-one');anchor_text='A unified work surface';context_excerpt='Vibe coding, Codex, and Claude Code may converge into a possible OpenAI SuperApp.';related_claim_ids=@();related_topic_ids=@();discovery_lenses=@('adjacent_enabler','convergence','emergent_topic');topic_hypotheses=@('vibe coding','coding agents','OpenAI SuperApp convergence');canonical_url='https://example.test/unified-work-surface';source_type='news_article';commercial_markers=@();safety_status='safe';provenance=[pscustomobject]@{created_at='2026-08-08T00:00:00Z';navigation_performed=$false}}
$openGate=(New-LinkGateDecisions @($openCandidate) $priority 1)[0]
Assert-True ($openGate.priority_fit.matching_priority_ids.Count -eq 0 -and $openGate.disposition -eq 'follow') 'a convergence hypothesis remains eligible without a priority keyword match'
Assert-True ($openGate.discovery_lenses -contains 'convergence' -and $openGate.topic_hypotheses -contains 'vibe coding') 'open-discovery rationale remains auditable in the gate record'

$unrelatedCandidate=[pscustomobject]@{schema_version='1.0';record_type='link_candidate';candidate_id='link-unrelated';origin_issue_ids=@('issue-unrelated');origin_newsletter_ids=@('selected-one');anchor_text='Weekend recipe';context_excerpt='Cooking a poached egg for breakfast.';related_claim_ids=@();related_topic_ids=@();canonical_url='https://example.test/weekend-recipe';source_type='news_article';commercial_markers=@();safety_status='safe';provenance=[pscustomobject]@{created_at='2026-08-08T00:00:00Z';navigation_performed=$false}}
$unrelatedGate=(New-LinkGateDecisions @($unrelatedCandidate) $priority 1)[0]
Assert-True ($unrelatedGate.disposition -eq 'skip') 'a truly unrelated control does not consume the bounded retrieval budget'
Assert-Throws {Test-NewsletterRecord ([pscustomobject]@{schema_version='1.0';record_type='link_candidate';candidate_id='link-bad-lens';origin_issue_ids=@('issue-open');origin_newsletter_ids=@('selected-one');anchor_text='New';context_excerpt='New';related_claim_ids=@();related_topic_ids=@();discovery_lenses=@('closed_taxonomy');topic_hypotheses=@();canonical_url='https://example.test/new';source_type='news_article';commercial_markers=@();safety_status='safe';provenance=[pscustomobject]@{created_at='2026-08-08T00:00:00Z';navigation_performed=$false}})} 'unsupported discovery lens' 'unsupported open-discovery labels fail closed'

$gates=@(New-LinkGateDecisions $candidates $priority 1)
$follow=@($gates|Where-Object disposition -eq 'follow')
$overflow=@($gates|Where-Object budget_status -eq 'overflow')
Assert-True ($follow.Count -eq 1 -and $follow[0].candidate_id -eq $paper.candidate_id) 'relevant primary paper receives the finite follow allocation'
Assert-True (@($gates|Where-Object { $_.disposition -eq 'skip' -and $_.reason -match 'affiliate|unsubscribe|commercial' }).Count -ge 2) 'affiliate, unsubscribe, and generic commercial links fail before retrieval'
Assert-True (@($gates|Where-Object { $_.disposition -eq 'blocked' -and $_.reason -match 'private|sensitive|unsafe' }).Count -ge 2) 'private and credential-bearing targets are blocked before retrieval'
Assert-True ((New-LinkGateDecisions @($credentialCandidate) $priority 1)[0].disposition -eq 'blocked') 'credential-bearing primary sources cannot enter review or retrieval'
Assert-True ($overflow.Count -eq 1 -and $overflow[0].disposition -eq 'defer') 'budget exhaustion retains an ordered overflow candidate without opening it'
Assert-True (($gates|ConvertTo-Json -Depth 20) -notmatch 'token=|user:pass|utm_') 'candidate and gate records contain no sensitive or tracking URL values'
Assert-True (@($gates|ForEach-Object {Test-NewsletterRecord $_}).Count -eq $gates.Count) 'every deterministic gate decision validates'
