param(
    [ValidateSet('none','init-run','validate','normalize','link-gate','render','import-decisions','prune','build-signals','build-brief','fixture-pipeline')]
    [string]$Command='none',
    [string]$InputPath,
    [string]$OutputPath,
    [string]$RegistryPath,
    [string]$ProfilesPath,
    [string]$IssuesPath,
    [string]$PriorityPath,
    [string]$RunId,
    [string]$StagingRoot,
    [ValidateSet('fixture','live')][string]$Mode='fixture',
    [ValidateSet('device_local','google_drive')][string]$StagingLocation='device_local',
    [switch]$AcceptStagingLocation,
    [switch]$Confirm,
    [datetime]$Now=(Get-Date),
    [int]$MaxSignals=7
)

$ErrorActionPreference='Stop'
$script:SchemaVersion='1.0'
$script:AllowedDecisions=@('selected','not_selected','undecided')
$script:AllowedEvidence=@('verified','partially_verified','unverified','contradicted','stale_risk')
$script:AllowedSourceTypes=@('research_paper','report','official_documentation','news_article','vendor_content','unknown')
$script:AllowedDiscoveryLenses=@('adjacent_enabler','convergence','strategic_surprise','emergent_topic','exploratory')
$script:ForbiddenFields=@('full_body','body','raw_body','raw_mime','mime','html_body','text_body','authorization','cookie','access_token','refresh_token','password','secret','api_key')

function Get-ObjectProperties([object]$Value,[string]$Path='$'){
    if($null -eq $Value){return}
    if($Value -is [string] -or $Value -is [ValueType]){return}
    if($Value -is [System.Collections.IEnumerable] -and $Value -isnot [System.Collections.IDictionary]){
        $i=0;foreach($item in $Value){Get-ObjectProperties $item "$Path[$i]";$i++};return
    }
    foreach($p in $Value.PSObject.Properties){
        [pscustomobject]@{Name=$p.Name;Value=$p.Value;Path="$Path.$($p.Name)"}
        Get-ObjectProperties $p.Value "$Path.$($p.Name)"
    }
}

function Require-Fields([object]$Record,[string[]]$Fields){
    foreach($field in $Fields){if($Record.PSObject.Properties.Name -notcontains $field -or $null -eq $Record.$field){throw "missing required field: $field"}}
}

function ConvertTo-CanonicalValue([object]$Value,[bool]$ExcludeIntegrity=$false){
    if($null -eq $Value -or $Value -is [string] -or $Value -is [ValueType]){return $Value}
    if($Value -is [System.Collections.IEnumerable] -and $Value -isnot [System.Collections.IDictionary]){
        return ,([object[]]@($Value|ForEach-Object{ConvertTo-CanonicalValue $_ $ExcludeIntegrity}))
    }
    $ordered=[ordered]@{}
    foreach($p in @($Value.PSObject.Properties|Sort-Object Name)){
        if($ExcludeIntegrity -and $p.Name -eq 'integrity'){continue}
        $ordered[$p.Name]=ConvertTo-CanonicalValue $p.Value $ExcludeIntegrity
    }
    return [pscustomobject]$ordered
}

function ConvertTo-CanonicalJson([object]$Value,[bool]$ExcludeIntegrity=$false){
    return (ConvertTo-CanonicalValue $Value $ExcludeIntegrity|ConvertTo-Json -Depth 50 -Compress)
}

function Get-CanonicalSha256([object]$Value,[bool]$ExcludeIntegrity=$false){
    $sha=[Security.Cryptography.SHA256]::Create()
    try{$bytes=[Text.Encoding]::UTF8.GetBytes((ConvertTo-CanonicalJson $Value $ExcludeIntegrity));return 'sha256-'+(([BitConverter]::ToString($sha.ComputeHash($bytes))).Replace('-','').ToLowerInvariant())}
    finally{$sha.Dispose()}
}

function Add-RecordIntegrity([object]$Record){
    if($Record.PSObject.Properties.Name -contains 'integrity'){$Record.PSObject.Properties.Remove('integrity')}
    $Record|Add-Member -NotePropertyName integrity -NotePropertyValue ([pscustomobject]@{algorithm='sha256';canonicalization='newsletter-intelligence-canonical-json/v1';hash=(Get-CanonicalSha256 $Record $true)})
    return $Record
}

function Test-RecordIntegrity([object]$Record,[bool]$Required=$false){
    $has=$Record.PSObject.Properties.Name -contains 'integrity'
    if(!$has){if($Required){throw 'integrity is required'};return $true}
    Require-Fields $Record.integrity @('algorithm','canonicalization','hash')
    if($Record.integrity.algorithm -ne 'sha256' -or $Record.integrity.canonicalization -ne 'newsletter-intelligence-canonical-json/v1'){throw 'unsupported integrity contract'}
    if($Record.integrity.hash -ne (Get-CanonicalSha256 $Record $true)){throw 'integrity hash mismatch'}
    return $true
}

function Test-NewsletterRecord([Parameter(Mandatory)][object]$Record){
    Require-Fields $Record @('schema_version','record_type')
    if($Record.schema_version -ne $script:SchemaVersion){throw "unsupported schema_version: $($Record.schema_version)"}
    foreach($p in @(Get-ObjectProperties $Record)){
        if($script:ForbiddenFields -contains $p.Name.ToLowerInvariant()){throw "forbidden field at $($p.Path): $($p.Name)"}
    }
    if($Record.record_type -eq 'source_analysis'){
        Require-Fields $Record @('analysis_id','candidate_ids','content_hash','source_type','coverage','title','summary','structure_covered','section_synthesis','claim_ids','caveats','contradictions','downstream_relevance','missing_sections','bounded_excerpts','status','provenance')
        if($Record.source_type -notin $script:AllowedSourceTypes){throw 'unsupported analysis source type'}
        if($Record.coverage -notin @('full','partial','paywalled','unavailable')){throw 'unsupported analysis coverage'}
        if($Record.status -ne 'staged'){throw 'source analysis must remain staged'}
        Require-Fields $Record.provenance @('fetch_record_id','snapshot_path','final_url','analyzed_at','reasoning_level')
        if($Record.provenance.reasoning_level -notin @('light','medium','high')){throw 'unsupported reasoning level'}
        if(@($Record.bounded_excerpts).Count -gt 3){throw 'source analysis exceeds three bounded excerpts'}
        foreach($excerpt in @($Record.bounded_excerpts)){Require-Fields $excerpt @('text','location');if(([string]$excerpt.text).Length -gt 600){throw 'source analysis excerpt exceeds 600 characters'}}
        return $true
    }
    if($Record.record_type -eq 'source_claim'){
        Require-Fields $Record @('claim_id','analysis_id','statement','claim_kind','origin_source_ids','evidence_locations','evidence_status','uncertainty','provenance')
        if($Record.claim_kind -notin @('source_claim','agent_inference','newsletter_interpretation')){throw 'unsupported claim kind'}
        if($Record.evidence_status -notin $script:AllowedEvidence){throw 'unsupported claim evidence status'}
        if($Record.uncertainty -notin @('low','medium','high')){throw 'unsupported claim uncertainty'}
        if(([string]$Record.statement).Length -gt 1200){throw 'claim statement exceeds 1200 characters'}
        return $true
    }
    if($Record.record_type -eq 'claim_verification'){
        Require-Fields $Record @('verification_id','claim_id','status','verifier_source_ids','independent','notes','provenance')
        if($Record.status -notin @('verified','partially_verified','contradicted','unverified')){throw 'unsupported verification status'}
        if($Record.independent -isnot [bool]){throw 'independent must be boolean'}
        return $true
    }
    switch($Record.record_type){
        'run_manifest'{
            Require-Fields $Record @('run_id','mode','status','staging_location','staging_location_accepted','checkpoints')
            if($Record.mode -notin @('fixture','live')){throw 'unknown run mode'}
            if($Record.mode -eq 'live' -and -not $Record.staging_location_accepted){throw 'staging location must be explicitly accepted before a live body read'}
            $mutating=@($Record.allowed_gmail_operations|Where-Object{$_ -notin @('profile','search','batch_read','thread_read')})
            if($mutating.Count){throw "Gmail mutation operation is forbidden: $($mutating -join ', ')"}
        }
        'issue'{
            Require-Fields $Record @('issue_id','message_id','newsletter_id','received_at','subject','content_hash','evidence_excerpts','provenance')
            foreach($e in @($Record.evidence_excerpts)){if(([string]$e.text).Length -gt 1200){throw 'evidence excerpt exceeds 1200 characters'}}
            foreach($c in @($Record.claims)){if($c.verification_status -notin $script:AllowedEvidence){throw "unknown verification status: $($c.verification_status)"}}
        }
        'newsletter_profile'{
            Require-Fields $Record @('newsletter_id','name','issue_ids','date_range','relevance_hypotheses','provenance')
            foreach($p in @(Get-ObjectProperties $Record)){if($p.Name -match '^(score|rank|recommendation)$'){throw "judgment field is forbidden in source profiles: $($p.Name)"}}
        }
        'source_decisions'{
            Require-Fields $Record @('exported_at','decisions')
            $ids=@();foreach($d in @($Record.decisions)){if($d.decision -notin $script:AllowedDecisions){throw "unsupported decision: $($d.decision)"};if($ids -contains $d.newsletter_id){throw "duplicate decision: $($d.newsletter_id)"};$ids+=$d.newsletter_id}
        }
        'source_registry'{
            Require-Fields $Record @('updated_at','sources')
            if($null -ne $Record.revision -and [int]$Record.revision -lt 0){throw 'registry revision cannot be negative'}
            $ids=@();foreach($s in @($Record.sources)){if($s.decision -notin $script:AllowedDecisions){throw "unsupported decision: $($s.decision)"};if($ids -contains $s.newsletter_id){throw "duplicate registry source: $($s.newsletter_id)"};$ids+=$s.newsletter_id}
        }
        'newsletter_identity_registry'{Require-Fields $Record @('updated_at','canonical_newsletters','unresolved_groups','provenance')}
        'newsletter_identity_decisions'{Require-Fields $Record @('exported_at','decisions','updated_at','confirmed_at')}
        'weekly_review_decisions'{
            Require-Fields $Record @('review_id','period','input_hash','bundle_hash','base_registry_revisions','reviewer_timestamp','actions')
            Require-Fields $Record.period @('from','to')
            $ids=@();foreach($action in @($Record.actions)){Require-Fields $action @('action_id','family','target_id','operation','payload');if($ids -contains $action.action_id){throw "duplicate review action: $($action.action_id)"};$ids+=$action.action_id}
            Test-RecordIntegrity $Record $true|Out-Null
        }
        'review_event'{
            Require-Fields $Record @('event_id','review_id','confirmed_at','review_hash','actions')
            Test-RecordIntegrity $Record $true|Out-Null
        }
        'priority_context'{
            Require-Fields $Record @('context_id','context_version','confirmation_status','confirmed_priorities','inferred_hypotheses','active_lenses','derived_from','created_at')
            if($Record.confirmation_status -notin @('provisional','confirmed')){throw "unsupported priority confirmation status: $($Record.confirmation_status)"}
            if([int]$Record.context_version -lt 1){throw 'priority context version must be positive'}
            if($Record.confirmation_status -eq 'provisional' -and @($Record.confirmed_priorities).Count -gt 0){throw 'provisional priority context cannot contain confirmed priorities'}
            $ids=@();foreach($priority in @($Record.confirmed_priorities)){Require-Fields $priority @('priority_id','label','description');if($ids -contains $priority.priority_id){throw "duplicate confirmed priority: $($priority.priority_id)"};$ids+=$priority.priority_id}
            foreach($lens in @($Record.active_lenses)){if($lens -notin @('active_priorities','wiki_gap','contradiction','durable_method','strategic_surprise','adjacent_enabler','convergence','emergent_topic','exploratory')){throw "unsupported relevance lens: $lens"}}
        }
        'topic_candidate'{
            Require-Fields $Record @('topic_id','title','summary','supporting_issue_ids','supporting_source_ids','wiki_overlap','uncertainty','rationale','source_eligibility','provenance')
            if($Record.source_eligibility -notin @('eligible','ineligible','needs_review')){throw "unsupported topic source eligibility: $($Record.source_eligibility)"}
        }
        'topic_registry'{
            Require-Fields $Record @('revision','updated_at','topics')
            if([int]$Record.revision -lt 0){throw 'topic registry revision cannot be negative'}
            $ids=@();foreach($topic in @($Record.topics)){Require-Fields $topic @('topic_id','title','watch_status','events','candidate_provenance');if($topic.watch_status -notin @('follow','ignore','snooze','merged')){throw "unsupported topic watch status: $($topic.watch_status)"};if($ids -contains $topic.topic_id){throw "duplicate topic registry entry: $($topic.topic_id)"};$ids+=$topic.topic_id;foreach($event in @($topic.events)){Require-Fields $event @('event_id','operation','created_at');if($event.operation -notin @('follow','ignore','snooze','merge','correct')){throw "unsupported topic event operation: $($event.operation)"}}}
        }
        'link_candidate'{Require-Fields $Record @('candidate_id','origin_issue_ids','origin_newsletter_ids','anchor_text','context_excerpt','related_claim_ids','related_topic_ids','canonical_url','source_type','commercial_markers','safety_status','provenance');if($Record.source_type -notin $script:AllowedSourceTypes){throw 'unsupported link source type'};if($Record.safety_status -notin @('safe','blocked_sensitive','blocked_private','blocked_unsafe','blocked_opaque_redirect')){throw 'unsupported link safety status'};if($Record.context_excerpt.Length -gt 600 -or $Record.anchor_text.Length -gt 240){throw 'link candidate text exceeds bounded context limit'};$candidateLenses=if($Record.PSObject.Properties.Name -contains 'discovery_lenses'){@($Record.discovery_lenses)}else{@()};$candidateTopics=if($Record.PSObject.Properties.Name -contains 'topic_hypotheses'){@($Record.topic_hypotheses)}else{@()};foreach($lens in $candidateLenses){if($lens -notin $script:AllowedDiscoveryLenses){throw "unsupported discovery lens: $lens"}};if($candidateTopics.Count -gt 10 -or @($candidateTopics|Where-Object{$_.ToString().Length -gt 120}).Count){throw 'topic hypotheses exceed bounded context limit'};if($Record.PSObject.Properties.Name -contains 'original_url'){throw 'link candidates must not retain original URLs'}}
        'link_gate_decision'{Require-Fields $Record @('gate_id','candidate_id','priority_fit','primary_source_value','novel_depth','contradiction_value','commercial_discount','expected_source_type','confidence','disposition','reason','budget_status','provenance');if($Record.disposition -notin @('follow','skip','defer','needs_review','blocked')){throw 'unsupported link gate disposition'};if($Record.budget_status -notin @('allocated','not_applicable','overflow')){throw 'unsupported link gate budget status'}}
        'source_fetch'{Require-Fields $Record @('candidate_id','final_url','redirect_chain','coverage','retrieved_at');if($Record.coverage -notin @('full','partial','paywalled','unavailable')){throw 'unsupported source coverage'};if($Record.coverage -in @('full','partial')){Require-Fields $Record @('mime_type','wire_size','decompressed_size','content_hash','snapshot_path','completion_path','expires_at');if([int64]$Record.wire_size -lt 0 -or [int64]$Record.decompressed_size -lt 0){throw 'source fetch sizes cannot be negative'}}}
        'identity_ambiguity'{Require-Fields $Record @('ambiguity_id','newsletter_id','status','reason','issue_ids','provenance')}
        'signal_feedback'{Require-Fields $Record @('feedback_id','signal_id','action','note','created_at')}
        'promotion_proposal'{Require-Fields $Record @('proposal_id','signal_id','status','conclusion','evidence_status','uncertainty','affected_pages','proposed_changes','provenance')}
        'signal'{
            Require-Fields $Record @('signal_id','title','source_claim','issue_ids','newsletter_ids','novelty','relevance','evidence_status','uncertainty','judge','provenance')
            if($Record.evidence_status -notin $script:AllowedEvidence){throw "unknown evidence status: $($Record.evidence_status)"}
        }
        default{throw "unknown record_type: $($Record.record_type)"}
    }
    return $true
}

function Write-JsonAtomic([object]$Value,[string]$Path){
    $parent=Split-Path -Parent $Path;if($parent){New-Item -ItemType Directory -Force -Path $parent|Out-Null}
    $json=$Value|ConvertTo-Json -Depth 20
    $temp="$Path.tmp-$([guid]::NewGuid().ToString('N'))"
    try{[IO.File]::WriteAllText($temp,$json,[Text.UTF8Encoding]::new($false));$check=Get-Content -Raw -LiteralPath $temp|ConvertFrom-Json;Test-NewsletterRecord $check|Out-Null;Move-Item -Force -LiteralPath $temp -Destination $Path}
    finally{if(Test-Path -LiteralPath $temp){Remove-Item -LiteralPath $temp -Force}}
}

function Test-NewsletterRecordArray([object[]]$Records){
    foreach($record in @($Records)){Test-NewsletterRecord $record|Out-Null}
    return $true
}

function Write-JsonArrayAtomic([object[]]$Records,[string]$Path){
    Test-NewsletterRecordArray $Records|Out-Null
    $parent=Split-Path -Parent $Path;if($parent){New-Item -ItemType Directory -Force -Path $parent|Out-Null}
    $json=@($Records)|ConvertTo-Json -Depth 50
    $temp="$Path.tmp-$([guid]::NewGuid().ToString('N'))"
    try{[IO.File]::WriteAllText($temp,$json,[Text.UTF8Encoding]::new($false));$check=Get-Content -Raw -LiteralPath $temp|ConvertFrom-Json;Test-NewsletterRecordArray @($check)|Out-Null;Move-Item -Force -LiteralPath $temp -Destination $Path}
    finally{if(Test-Path -LiteralPath $temp){Remove-Item -LiteralPath $temp -Force}}
}

function Apply-RegistryPatch([object]$Registry,[object[]]$Patches,[int]$ExpectedRevision){
    Test-NewsletterRecord $Registry|Out-Null
    $actual=if($null -eq $Registry.revision){0}else{[int]$Registry.revision}
    if($actual -ne $ExpectedRevision){throw "stale registry revision: expected $ExpectedRevision, found $actual"}
    $byId=@{};foreach($source in @($Registry.sources)){$byId[$source.newsletter_id]=$source}
    foreach($patch in @($Patches)){
        Require-Fields $patch @('newsletter_id','decision')
        if($patch.decision -notin $script:AllowedDecisions){throw "unsupported decision: $($patch.decision)"}
        if(!$byId.ContainsKey($patch.newsletter_id)){throw "unknown registry source: $($patch.newsletter_id)"}
        $entry=$byId[$patch.newsletter_id];$entry.decision=$patch.decision
        foreach($field in @('note','decided_at')){if($patch.PSObject.Properties.Name -contains $field){$entry.$field=$patch.$field}}
    }
    $Registry.revision=$actual+1;$Registry.updated_at=(Get-Date).ToUniversalTime().ToString('o')
    return $Registry
}

function Copy-NewsletterRecord([object]$Record){
    return (ConvertTo-CanonicalJson $Record|ConvertFrom-Json)
}

function Get-MatchingPriorityIds([object]$PriorityContext,[string]$Text){
    $haystack=$Text.ToLowerInvariant()
    $matched=@()
    foreach($priority in @($PriorityContext.confirmed_priorities)){
        $terms=@([string]$priority.label)
        if($priority.PSObject.Properties.Name -contains 'match_terms'){$terms+=@($priority.match_terms)}
        if(@($terms|Where-Object{$_ -and $haystack.Contains($_.ToString().ToLowerInvariant())}).Count){$matched+=[string]$priority.priority_id}
    }
    return @($matched|Sort-Object -Unique)
}

function New-RelevanceAssessment([object]$PriorityContext,[string[]]$CandidateTerms,[string[]]$WikiOverlap,[string[]]$Contradictions,[bool]$HasDurableMethod,[bool]$HasStrategicSurprise,[string[]]$DiscoveryLenses=@()){
    Test-NewsletterRecord $PriorityContext|Out-Null
    foreach($lens in @($DiscoveryLenses)){if($lens -notin $script:AllowedDiscoveryLenses){throw "unsupported discovery lens: $lens"}}
    $matches=@(Get-MatchingPriorityIds $PriorityContext (($CandidateTerms|Where-Object{$_}) -join ' '))
    $priorityStatus=if($PriorityContext.confirmation_status -eq 'confirmed'){'confirmed'}else{'provisional'}
    return [pscustomobject]@{
        context_id=$PriorityContext.context_id
        context_version=[int]$PriorityContext.context_version
        priority_fit=[pscustomobject]@{status=$priorityStatus;matching_priority_ids=@($matches);reason=if($priorityStatus -eq 'provisional'){'No confirmed personal priorities are available; use wiki-derived hypotheses only as provisional context.'}else{'Compared against explicitly confirmed priorities.'}}
        active_lenses=@($PriorityContext.active_lenses)
        wiki_gap=(@($WikiOverlap).Count -eq 0)
        contradiction=(@($Contradictions).Count -gt 0)
        durable_method=$HasDurableMethod
        strategic_surprise=$HasStrategicSurprise
        discovery_lenses=@($DiscoveryLenses|Sort-Object -Unique)
    }
}

function Confirm-PriorityContext([object]$PriorityContext,[object[]]$ConfirmedPriorities,[string]$ConfirmedAt=((Get-Date).ToUniversalTime().ToString('o'))){
    Test-NewsletterRecord $PriorityContext|Out-Null
    $next=Copy-NewsletterRecord $PriorityContext
    $next.context_version=[int]$PriorityContext.context_version+1
    $next.confirmation_status='confirmed'
    $next.confirmed_priorities=@($ConfirmedPriorities)
    if($next.PSObject.Properties.Name -contains 'confirmed_at'){$next.confirmed_at=$ConfirmedAt}else{$next|Add-Member -NotePropertyName confirmed_at -NotePropertyValue $ConfirmedAt}
    $next.created_at=$ConfirmedAt
    Test-NewsletterRecord $next|Out-Null
    return $next
}

function Test-TopicSourceEligibility([object]$Candidate,[object]$SourceRegistry){
    Test-NewsletterRecord $Candidate|Out-Null;Test-NewsletterRecord $SourceRegistry|Out-Null
    foreach($newsletterId in @($Candidate.provenance.newsletter_ids)){
        $source=@($SourceRegistry.sources|Where-Object newsletter_id -eq $newsletterId|Select-Object -First 1)
        if(!$source -or $source.decision -ne 'selected'){throw "topic candidate requires a selected newsletter source: $newsletterId"}
    }
    return $true
}

function Apply-TopicWatchAction([object]$TopicRegistry,[object]$Candidate,[ValidateSet('follow','ignore','snooze','merge','correct')][string]$Operation,[int]$ExpectedRevision,[string]$CreatedAt=((Get-Date).ToUniversalTime().ToString('o')),[string]$Note=''){
    Test-NewsletterRecord $TopicRegistry|Out-Null;Test-NewsletterRecord $Candidate|Out-Null
    if([int]$TopicRegistry.revision -ne $ExpectedRevision){throw "stale topic registry revision: expected $ExpectedRevision, found $($TopicRegistry.revision)"}
    $next=Copy-NewsletterRecord $TopicRegistry
    $entry=$next.topics|Where-Object topic_id -eq $Candidate.topic_id|Select-Object -First 1
    $event=[pscustomobject]@{event_id=(Get-StableId 'topic-event' "$($Candidate.topic_id)|$Operation|$CreatedAt|$Note");operation=$Operation;created_at=$CreatedAt;note=$Note}
    if(!$entry){
        if($Operation -eq 'correct'){throw 'cannot correct a topic that is not being watched'}
        $status=if($Operation -eq 'merge'){'merged'}else{$Operation}
        $entry=[pscustomobject]@{topic_id=$Candidate.topic_id;title=$Candidate.title;watch_status=$status;events=@($event);candidate_provenance=[pscustomobject]@{supporting_issue_ids=@($Candidate.supporting_issue_ids);supporting_source_ids=@($Candidate.supporting_source_ids);wiki_overlap=@($Candidate.wiki_overlap);source_eligibility=$Candidate.source_eligibility};monitoring_note=$Candidate.rationale}
        $next.topics=@($next.topics)+@($entry)
    }else{
        if($Operation -ne 'correct'){$entry.watch_status=if($Operation -eq 'merge'){'merged'}else{$Operation}}
        $entry.events=@($entry.events)+@($event)
        if($Note){$entry.monitoring_note=$Note}
    }
    $next.revision=[int]$TopicRegistry.revision+1;$next.updated_at=$CreatedAt
    Test-NewsletterRecord $next|Out-Null
    return $next
}

function New-ConfirmedReviewEvent([object]$Review,[string]$ConfirmedAt=((Get-Date).ToUniversalTime().ToString('o'))){
    Test-NewsletterRecord $Review|Out-Null
    $event=[pscustomobject]@{schema_version='1.0';record_type='review_event';event_id=(Get-StableId 'review-event' "$($Review.review_id)|$($Review.integrity.hash)");review_id=$Review.review_id;confirmed_at=$ConfirmedAt;review_hash=$Review.integrity.hash;actions=@($Review.actions)}
    Add-RecordIntegrity $event|Out-Null;Test-NewsletterRecord $event|Out-Null;return $event
}

function Import-ConfirmedReviewEvent([object]$Event,[string]$Path){
    Test-NewsletterRecord $Event|Out-Null
    $existing=if(Test-Path -LiteralPath $Path){@(Get-Content -Raw -LiteralPath $Path|ConvertFrom-Json)}else{@()}
    Test-NewsletterRecordArray $existing|Out-Null
    if(@($existing|Where-Object event_id -eq $Event.event_id).Count -eq 0){$existing+=,$Event;Write-JsonArrayAtomic $existing $Path}
    return @($existing)
}

function New-NewsletterRun([string]$Id,[string]$Root,[string]$RunMode,[string]$Location,[bool]$Accepted){
    if(!$Id){$Id='run-'+(Get-Date -Format 'yyyyMMdd-HHmmss')}
    $path=Join-Path $Root $Id;New-Item -ItemType Directory -Force -Path $path|Out-Null
    $manifestPath=Join-Path $path 'run-manifest.json'
    if(Test-Path $manifestPath){return Get-Content -Raw $manifestPath|ConvertFrom-Json}
    $stamp=(Get-Date).ToUniversalTime().ToString('o')
    $m=[pscustomobject]@{schema_version='1.0';record_type='run_manifest';run_id=$Id;mode=$RunMode;status='initialized';mailbox_identity='';date_after='';date_before='';staging_root=$Root;staging_location=$Location;staging_location_accepted=$Accepted;allowed_gmail_operations=@('profile','search','batch_read','thread_read');checkpoints=[pscustomobject]@{};created_at=$stamp;updated_at=$stamp}
    Write-JsonAtomic $m $manifestPath;return $m
}

function Test-GmailCollectionPreflight([string]$ProfileEmail,[string]$ExpectedEmail,[object]$Manifest,[int]$RequestedBodyCount,[bool]$Smoke){
    Test-NewsletterRecord $Manifest|Out-Null
    if(-not [string]::Equals($ProfileEmail,$ExpectedEmail,[StringComparison]::OrdinalIgnoreCase)){throw "account mismatch: connected Gmail profile does not match the configured newsletter mailbox"}
    if($Smoke -and $RequestedBodyCount -gt 10){throw 'the initial live smoke is limited to ten messages'}
    if($RequestedBodyCount -lt 0){throw 'requested body count cannot be negative'}
    return $true
}

function Add-GmailInventoryPage([object]$Manifest,[object]$Page,[bool]$Succeeded){
    if($Manifest.checkpoints.PSObject.Properties.Name -notcontains 'collection'){
        $Manifest.checkpoints|Add-Member -NotePropertyName collection -NotePropertyValue ([pscustomobject]@{discovered_ids=@();next_page_token=$null;pages_completed=0;failure=$null})
    }
    $state=$Manifest.checkpoints.collection
    if(-not $Succeeded){$state.failure=if($Page.error){[string]$Page.error}else{'connector page failed'};return $Manifest}
    $state.discovered_ids=@($state.discovered_ids+@($Page.message_ids)|Where-Object{$_}|Sort-Object -Unique)
    $state.next_page_token=$Page.next_page_token
    $state.pages_completed=[int]$state.pages_completed+1
    $state.failure=$null
    return $Manifest
}

function Get-StableId([string]$Prefix,[string]$Text){
    $sha=[Security.Cryptography.SHA256]::Create();try{$bytes=[Text.Encoding]::UTF8.GetBytes($Text);$hash=$sha.ComputeHash($bytes);return "$Prefix-$(([BitConverter]::ToString($hash)).Replace('-','').Substring(0,16).ToLowerInvariant())"}finally{$sha.Dispose()}
}

function ConvertTo-SafeText([string]$Content){
    if(!$Content){return ''}
    $x=[regex]::Replace($Content,'(?is)<(script|style|form|iframe|object|svg)[^>]*>.*?</\1>',' ')
    $x=[regex]::Replace($x,'(?is)<(img|input|link|meta)[^>]*>',' ')
    $x=[regex]::Replace($x,'(?is)<[^>]+>',' ')
    $x=[Net.WebUtility]::HtmlDecode($x)
    $x=[regex]::Replace($x,'(?i)(unsubscribe|manage preferences|view in browser|sponsored by).{0,240}',' ')
    return ([regex]::Replace($x,'\s+',' ')).Trim()
}

function Remove-TrackingParameters([string]$Url){
    $uri=[uri]$Url
    if($uri.Scheme -notin @('http','https')){throw 'only HTTP(S) newsletter links are retained'}
    $builder=[UriBuilder]$uri
    $kept=@()
    foreach($pair in $builder.Query.TrimStart('?').Split('&',[StringSplitOptions]::RemoveEmptyEntries)){
        $name=[uri]::UnescapeDataString(($pair -split '=',2)[0])
        if($name -notmatch '^(?i:utm_.+|gclid|dclid|fbclid|msclkid|mc_cid|mc_eid)$'){$kept+=$pair}
    }
    $builder.Query=$kept -join '&'
    return $builder.Uri.AbsoluteUri
}

function Get-LinkSourceType([uri]$Uri,[string]$Label,[string]$Context){
    $text=(($Uri.AbsolutePath+' '+$Label+' '+$Context).ToLowerInvariant())
    if($text -match '(paper|research|arxiv|doi)' -or $Uri.AbsolutePath -match '(?i)\.pdf$'){return 'research_paper'}
    if($text -match '(report|study)'){return 'report'}
    if($text -match '(documentation|docs|official|method)'){return 'official_documentation'}
    if($text -match '(buy|pricing|platform|product|vendor)'){return 'vendor_content'}
    if($text -match '(article|news|analysis)'){return 'news_article'}
    return 'unknown'
}

function Test-PrivateLinkHost([string]$HostName){
    $normalized=$HostName.Trim('[',']').TrimEnd('.').ToLowerInvariant()
    if($normalized -eq 'localhost' -or $normalized.EndsWith('.localhost')){return $true}
    $address=$null
    if(![System.Net.IPAddress]::TryParse($normalized,[ref]$address)){return $false}
    if([System.Net.IPAddress]::IsLoopback($address)){return $true}
    if($address.IsIPv4MappedToIPv6){$address=$address.MapToIPv4()}
    $bytes=$address.GetAddressBytes()
    if($address.AddressFamily -eq [System.Net.Sockets.AddressFamily]::InterNetwork){
        return ($bytes[0] -in @(0,10,127)) -or ($bytes[0] -eq 100 -and $bytes[1] -ge 64 -and $bytes[1] -le 127) -or ($bytes[0] -eq 169 -and $bytes[1] -eq 254) -or ($bytes[0] -eq 172 -and $bytes[1] -ge 16 -and $bytes[1] -le 31) -or ($bytes[0] -eq 192 -and $bytes[1] -eq 168) -or ($bytes[0] -ge 224)
    }
    $allZero=(@($bytes|Where-Object{$_ -ne 0}).Count -eq 0)
    return $allZero -or $address.IsIPv6LinkLocal -or $address.IsIPv6SiteLocal -or $address.IsIPv6Multicast -or (($bytes[0] -band 0xFE) -eq 0xFC)
}

function ConvertTo-LinkCandidateTarget([string]$Url,[string]$Label,[string]$Context){
    $markers=@()
    if("$Url $Label $Context" -match '(?i)(affiliate|\baff=|sponsored|paid platform|buy now)'){$markers+='affiliate'}
    if("$Url $Label $Context" -match '(?i)(unsubscribe|manage preferences)'){$markers+='unsubscribe'}
    try{$uri=[uri]$Url}catch{return [pscustomobject]@{canonical_url=(Get-StableId 'blocked-unsafe' $Url);safety_status='blocked_unsafe';source_type='unknown';commercial_markers=$markers}}
    if($uri.Scheme -notin @('http','https')){return [pscustomobject]@{canonical_url=(Get-StableId 'blocked-unsafe' $Url);safety_status='blocked_unsafe';source_type='unknown';commercial_markers=$markers}}
    $sensitiveNames='^(?i:token|access_token|refresh_token|id_token|auth|authorization|key|api_key|email|user|password|credential|code|session|sid|signature|sig|jwt)$'
    $queryNames=@($uri.Query.TrimStart('?').Split('&',[StringSplitOptions]::RemoveEmptyEntries)|ForEach-Object{[uri]::UnescapeDataString(($_ -split '=',2)[0])})
    if($uri.UserInfo -or @($queryNames|Where-Object{$_ -match $sensitiveNames}).Count -gt 0){
        $safe=[UriBuilder]$uri;$safe.UserName='';$safe.Password='';$safe.Query='';$safe.Fragment=''
        $opaque='urn:blocked-sensitive:'+(Get-StableId 'target' $safe.Uri.AbsoluteUri)
        return [pscustomobject]@{canonical_url=$opaque;safety_status='blocked_sensitive';source_type=(Get-LinkSourceType $uri $Label $Context);commercial_markers=$markers}
    }
    if(Test-PrivateLinkHost $uri.Host){
        return [pscustomobject]@{canonical_url=(Get-StableId 'blocked-private' $Url);safety_status='blocked_private';source_type=(Get-LinkSourceType $uri $Label $Context);commercial_markers=$markers}
    }
    $builder=[UriBuilder]$uri;$kept=@()
    foreach($pair in $builder.Query.TrimStart('?').Split('&',[StringSplitOptions]::RemoveEmptyEntries)){
        $name=[uri]::UnescapeDataString(($pair -split '=',2)[0])
        if($name -notmatch '^(?i:utm_.+|gclid|dclid|fbclid|msclkid|mc_cid|mc_eid|aff|affiliate|ref|token|auth|key|email|user|password)$'){$kept+=$pair}
    }
    $builder.Query=@($kept|Sort-Object) -join '&';$builder.Fragment=''
    return [pscustomobject]@{canonical_url=$builder.Uri.AbsoluteUri;safety_status='safe';source_type=(Get-LinkSourceType $uri $Label $Context);commercial_markers=$markers}
}

function New-LinkCandidates([object[]]$Issues,[object]$Registry){
    Test-NewsletterRecord $Registry|Out-Null
    $selected=@($Registry.sources|Where-Object decision -eq 'selected'|ForEach-Object newsletter_id)
    $byTarget=[ordered]@{}
    foreach($issue in @($Issues|Where-Object newsletter_id -in $selected)){
        foreach($link in @($issue.links)){
            $label=([string]$link.label).Substring(0,[Math]::Min(240,([string]$link.label).Length))
            $context=([string]$link.context).Substring(0,[Math]::Min(600,([string]$link.context).Length))
            $linkLenses=if($link.PSObject.Properties.Name -contains 'discovery_lenses'){@($link.discovery_lenses|Where-Object{$_}|Sort-Object -Unique)}else{@()}
            $linkTopics=if($link.PSObject.Properties.Name -contains 'topic_hypotheses'){@($link.topic_hypotheses|Where-Object{$_}|Sort-Object -Unique)}else{@()}
            $target=ConvertTo-LinkCandidateTarget ([string]$link.url) $label $context
            $key=$target.canonical_url
            if(!$byTarget.Contains($key)){
                $candidate=[pscustomobject]@{schema_version='1.0';record_type='link_candidate';candidate_id=(Get-StableId 'link' $key);origin_issue_ids=@([string]$issue.issue_id);origin_newsletter_ids=@([string]$issue.newsletter_id);anchor_text=$label;context_excerpt=$context;related_claim_ids=@($link.claim_ids);related_topic_ids=@($link.topic_ids);discovery_lenses=@($linkLenses);topic_hypotheses=@($linkTopics);canonical_url=$key;source_type=$target.source_type;commercial_markers=@($target.commercial_markers);safety_status=$target.safety_status;provenance=[pscustomobject]@{created_at=(Get-Date).ToUniversalTime().ToString('o');navigation_performed=$false}}
                Test-NewsletterRecord $candidate|Out-Null;$byTarget[$key]=$candidate
            }else{
                $existing=$byTarget[$key]
                $existing.origin_issue_ids=@($existing.origin_issue_ids+$issue.issue_id|Sort-Object -Unique)
                $existing.origin_newsletter_ids=@($existing.origin_newsletter_ids+$issue.newsletter_id|Sort-Object -Unique)
                $existing.related_claim_ids=@($existing.related_claim_ids+@($link.claim_ids)|Where-Object{$_}|Sort-Object -Unique)
                $existing.related_topic_ids=@($existing.related_topic_ids+@($link.topic_ids)|Where-Object{$_}|Sort-Object -Unique)
                $existing.discovery_lenses=@($existing.discovery_lenses+$linkLenses|Where-Object{$_}|Sort-Object -Unique)
                $existing.topic_hypotheses=@($existing.topic_hypotheses+$linkTopics|Where-Object{$_}|Sort-Object -Unique)
            }
        }
    }
    return @($byTarget.Values)
}

function New-LinkGateDecisions([object[]]$Candidates,[object]$PriorityContext,[int]$Budget=10){
    Test-NewsletterRecord $PriorityContext|Out-Null
    $allocated=0;$records=@()
    $ordered=@($Candidates|Sort-Object @{Expression={
        $t=("$($_.anchor_text) $($_.context_excerpt)".ToLowerInvariant())
        $score=@(Get-MatchingPriorityIds $PriorityContext $t).Count*3
        $candidateLenses=if($_.PSObject.Properties.Name -contains 'discovery_lenses'){@($_.discovery_lenses)}else{@()}
        $candidateTopics=if($_.PSObject.Properties.Name -contains 'topic_hypotheses'){@($_.topic_hypotheses)}else{@()}
        if($candidateLenses.Count -gt 0 -or $candidateTopics.Count -gt 0){$score+=3}
        if($_.source_type -in @('research_paper','report','official_documentation')){$score+=4}
        if($t -match '(challenge|contradiction|contradict|against|disagree)'){$score+=2}
        if($t -match '(method|framework|practice|research|study)'){$score+=1}
        $score
    };Descending=$true},@{Expression='candidate_id';Ascending=$true})
    foreach($candidate in $ordered){
        Test-NewsletterRecord $candidate|Out-Null
        $text=("$($candidate.anchor_text) $($candidate.context_excerpt)".ToLowerInvariant())
        $primary=$candidate.source_type -in @('research_paper','report','official_documentation')
        $contradiction=$text -match '(challenge|contradiction|contradict|against|disagree)'
        $durable=$text -match '(method|framework|practice|research|study)'
        $commercial=@($candidate.commercial_markers).Count -gt 0 -or $candidate.source_type -eq 'vendor_content'
        $matched=@(Get-MatchingPriorityIds $PriorityContext $text)
        $priorityMatched=$matched.Count -gt 0
        $discoveryLenses=if($candidate.PSObject.Properties.Name -contains 'discovery_lenses'){@($candidate.discovery_lenses|Sort-Object -Unique)}else{@()}
        $topicHypotheses=if($candidate.PSObject.Properties.Name -contains 'topic_hypotheses'){@($candidate.topic_hypotheses|Sort-Object -Unique)}else{@()}
        $openDiscovery=$discoveryLenses.Count -gt 0 -or $topicHypotheses.Count -gt 0
        $disposition='needs_review';$reason='Context requires human review before retrieval.';$budgetStatus='not_applicable'
        if($candidate.safety_status -in @('blocked_private','blocked_unsafe','blocked_opaque_redirect')){$disposition='blocked';$reason='Unsafe or private target is blocked before retrieval.'}
        elseif($candidate.safety_status -eq 'blocked_sensitive'){
            if(@($candidate.commercial_markers) -contains 'unsubscribe'){$disposition='skip';$reason='Unsubscribe target is excluded before retrieval.'}
            else{$disposition='blocked';$reason='Credential-bearing or sensitive target is blocked before retrieval.'}
        }
        elseif($commercial){$disposition='skip';$reason='Affiliate or commercial link is discounted and skipped.'}
        elseif($primary -or $contradiction -or $durable -or $priorityMatched -or $openDiscovery){
            if($allocated -lt $Budget){$disposition='follow';$reason=if($openDiscovery){'A provisional open-discovery relationship merits bounded retrieval.'}elseif($priorityMatched){'Confirmed priority fit or durable source value merits bounded retrieval.'}else{'Primary, durable, or contradiction-rich source merits bounded retrieval.'};$budgetStatus='allocated';$allocated++}
            else{$disposition='defer';$reason='Relevant candidate retained in adaptive-budget overflow.';$budgetStatus='overflow'}
        }else{$disposition='skip';$reason='Expected knowledge depth is too low for this run.'}
        $priorityFit=[pscustomobject]@{status=if($PriorityContext.confirmation_status -eq 'confirmed'){'confirmed'}else{'provisional'};context_version=$PriorityContext.context_version;matching_priority_ids=$matched;reason=if($PriorityContext.confirmation_status -eq 'confirmed'){'Compared newsletter context against explicitly confirmed priorities.'}else{'No confirmed personal priorities are available; fit remains provisional.'}}
        $gate=[pscustomobject]@{schema_version='1.0';record_type='link_gate_decision';gate_id=(Get-StableId 'gate' "$($candidate.candidate_id)|$($PriorityContext.context_version)");candidate_id=$candidate.candidate_id;priority_fit=$priorityFit;discovery_lenses=@($discoveryLenses);topic_hypotheses=@($topicHypotheses);primary_source_value=if($primary){'high'}else{'low'};novel_depth=if($durable){'high'}else{'unknown'};contradiction_value=if($contradiction){'high'}else{'none'};commercial_discount=if($commercial){'high'}else{'none'};expected_source_type=$candidate.source_type;confidence=if($disposition -in @('blocked','skip')){'high'}else{'medium'};disposition=$disposition;reason=$reason;budget_status=$budgetStatus;provenance=[pscustomobject]@{candidate_id=$candidate.candidate_id;context_version=$PriorityContext.context_version;navigation_performed=$false;created_at=(Get-Date).ToUniversalTime().ToString('o')}}
        Test-NewsletterRecord $gate|Out-Null;$records+=$gate
    }
    return $records
}

function Convert-MessageRecords([object[]]$Messages){
    $issues=@();foreach($m in $Messages){
        Require-Fields $m @('message_id','received_at','sender_address','subject','content')
        $safe=ConvertTo-SafeText ([string]$m.content)
        $listId=if($m.list_id){[string]$m.list_id}else{''}
        $identitySeed=if($listId){$listId}else{(([string]$m.sender_address -split '@')[-1])+'|'+([string]$m.sender_name)}
        $newsletterId=Get-StableId 'newsletter' $identitySeed.ToLowerInvariant()
        $excerpt=$safe.Substring(0,[Math]::Min(600,$safe.Length))
        $claims=@();if($m.claims){foreach($claim in @($m.claims)){$claims += [pscustomobject]@{text=[string]$claim;attribution='newsletter';verification_status='unverified'}}}
        $links=@();foreach($u in @($m.links)){if(([uri]$u).Scheme -in @('http','https')){$links += [pscustomobject]@{url=(Remove-TrackingParameters ([string]$u));label='Newsletter link'}}}
        $issue=[pscustomobject]@{schema_version='1.0';record_type='issue';issue_id=(Get-StableId 'issue' ([string]$m.message_id));message_id=[string]$m.message_id;newsletter_id=$newsletterId;received_at=[string]$m.received_at;sender_name=[string]$m.sender_name;sender_address=[string]$m.sender_address;subject=[string]$m.subject;list_id=$listId;content_hash=(Get-StableId 'sha256' $safe);topics=@($m.topics);claims=$claims;links=$links;evidence_excerpts=@([pscustomobject]@{text=$excerpt;purpose='representative'});relevance_hypotheses=@($m.relevance_hypotheses);promotional_markers=@($m.promotional_markers);duplicate_cluster_id=$null;provenance=[pscustomobject]@{provider='gmail';message_id=[string]$m.message_id;collected_at=(Get-Date).ToUniversalTime().ToString('o')}}
        Test-NewsletterRecord $issue|Out-Null;$issues+=$issue
    }
    $hashGroups=$issues|Group-Object {if($_.claims.Count){([regex]::Replace(([string]$_.claims[0].text).ToLowerInvariant(),'\W+',' ')).Trim()}else{$_.content_hash}}|Where-Object Count -gt 1
    foreach($g in $hashGroups){$cluster=Get-StableId 'duplicate' $g.Name;foreach($i in $g.Group){$i.duplicate_cluster_id=$cluster}}
    return $issues
}

function New-NewsletterProfiles([object[]]$Issues){
    $wikiMap=@{
        'AI models and tools'='[[ai-research-library]]'
        'agent evaluation'='[[agent-evaluation]]'
        'agentic workflows'='[[agentic-systems]]'
        'prompting'='[[agentic-prompting]]'
        'AI in marketing and sales'='[[ai-marketing-research-library]]'
        'strategy'='[[personal-ai-cowork-system]]'
        'AI-enabled productivity'='[[ai-operating-system]]'
        'AI market and products'='[[applied-ai-use-cases]]'
    }
    $profiles=@();foreach($g in ($Issues|Group-Object newsletter_id)){
        $dates=@($g.Group|ForEach-Object{[datetime]$_.received_at}|Sort-Object)
        $themes=@($g.Group.topics|Where-Object{$_}|Group-Object|Sort-Object Count -Descending|Select-Object -First 8 -ExpandProperty Name)
        $subjects=(@($g.Group.subject)-join ' ').ToLowerInvariant();$formats=@()
        if($subjects -match 'weekly|daily|digest|roundup|recap'){$formats+='digest or roundup'}
        if($subjects -match 'how to|guide|build|tutorial|playbook'){$formats+='practical guide or tutorial'}
        if($subjects -match 'news|launch|release|new |tools|update'){$formats+='news or product update'}
        if(-not $formats.Count){$formats+='analysis or commentary'}
        $promoIssues=@($g.Group|Where-Object{$_.promotional_markers.Count -gt 0}).Count
        $promoPercent=[Math]::Round(($promoIssues/[Math]::Max(1,$g.Count))*100)
        $wiki=@($themes|ForEach-Object{if($wikiMap.ContainsKey($_)){$wikiMap[$_]}}|Sort-Object -Unique)
        $identityHasList=@($g.Group.list_id|Where-Object{$_}|Sort-Object -Unique).Count -eq 1
        $caveats=@('Profile describes the analyzed sample and does not recommend a selection.')
        if(-not $identityHasList){$caveats+='List-ID was unavailable; sender-based identity requires human review.'}
        if($g.Count -lt 3){$caveats+='Fewer than three issues were available, so recurring-pattern conclusions are tentative.'}
        $themeText=if($themes.Count){($themes|Select-Object -First 3)-join ', '}else{'topics not yet classified'}
        $p=[pscustomobject]@{schema_version='1.0';record_type='newsletter_profile';newsletter_id=$g.Name;name=([string]($g.Group|Select-Object -First 1).sender_name);description="Recurring source covering $themeText, inferred from $($g.Count) bounded issue records.";issue_ids=@($g.Group.issue_id);sender_addresses=@($g.Group.sender_address|Sort-Object -Unique);date_range=[pscustomobject]@{from=$dates[0].ToString('yyyy-MM-dd');to=$dates[-1].ToString('yyyy-MM-dd')};recurring_themes=$themes;delivery_formats=@($formats|Sort-Object -Unique);promotion_characteristics=@("Commercial or subscription language appeared in $promoIssues of $($g.Count) issues ($promoPercent%).");evidence_characteristics=@("$($g.Count) bounded issue excerpts analyzed; newsletter claims remain unverified.",'Gmail message provenance is retained for every issue.');repetition_notes=@("$(@($g.Group.duplicate_cluster_id|Where-Object{$_}|Sort-Object -Unique).Count) duplicate clusters observed.");wiki_overlap=$wiki;relevance_hypotheses=@($g.Group.relevance_hypotheses|Where-Object{$_}|Sort-Object -Unique|ForEach-Object{[pscustomobject]@{text=$_;uncertainty='medium'}});caveats=$caveats;identity_confidence=if($identityHasList){'high'}else{'medium'};provenance=[pscustomobject]@{issue_ids=@($g.Group.issue_id);generated_at=(Get-Date).ToUniversalTime().ToString('o')}}
        Test-NewsletterRecord $p|Out-Null;$profiles+=$p
    };return $profiles
}

function Get-IdentityAmbiguities([object[]]$Issues){
    $records=@()
    foreach($g in ($Issues|Where-Object{-not $_.list_id}|Group-Object newsletter_id)){
        $record=[pscustomobject]@{schema_version='1.0';record_type='identity_ambiguity';ambiguity_id=(Get-StableId 'ambiguity' $g.Name);newsletter_id=$g.Name;status='needs_review';reason='No stable list identity was present; sender-based grouping requires human review.';issue_ids=@($g.Group.issue_id);candidate_senders=@($g.Group.sender_address|Sort-Object -Unique);provenance=[pscustomobject]@{generated_at=(Get-Date).ToUniversalTime().ToString('o')}}
        Test-NewsletterRecord $record|Out-Null;$records+=$record
    }
    return $records
}

function ConvertTo-HtmlSafe([string]$Text){return [Net.WebUtility]::HtmlEncode($Text)}

function Test-ThinSlicePilot([object]$Pilot){
    Require-Fields $Pilot @('schema_version','record_type','pilot_id','preregistered_at','thresholds','evaluation_set','gate_results','retrieval_outcomes','source_analyses','boundary_checks','live_validation')
    if($Pilot.schema_version -ne $script:SchemaVersion -or $Pilot.record_type -ne 'thin_slice_pilot'){throw 'unsupported thin-slice pilot contract'}
    if(([string]$Pilot.pilot_id) -notmatch '^[a-z0-9][a-z0-9._-]{0,63}$'){throw 'thin-slice pilot_id is invalid'}
    $preregistered=[datetimeoffset]::MinValue;if(![datetimeoffset]::TryParse([string]$Pilot.preregistered_at,[ref]$preregistered)){throw 'thin-slice preregistration timestamp is invalid'}
    Require-Fields $Pilot.thresholds @('precision_min','recall_min','max_candidates','max_retrievals','max_analyses','max_review_minutes')
    if([double]$Pilot.thresholds.precision_min -lt 0.60 -or [double]$Pilot.thresholds.precision_min -gt 1 -or [double]$Pilot.thresholds.recall_min -lt 0.70 -or [double]$Pilot.thresholds.recall_min -gt 1){throw 'thin-slice quality thresholds cannot be relaxed'}
    if([int]$Pilot.thresholds.max_candidates -lt 20 -or [int]$Pilot.thresholds.max_candidates -gt 30 -or [int]$Pilot.thresholds.max_retrievals -lt 1 -or [int]$Pilot.thresholds.max_retrievals -gt 10 -or [int]$Pilot.thresholds.max_analyses -lt 1 -or [int]$Pilot.thresholds.max_analyses -gt 3 -or [double]$Pilot.thresholds.max_review_minutes -le 0 -or [double]$Pilot.thresholds.max_review_minutes -gt 5){throw 'thin-slice caps exceed the agreed pilot bounds'}
    if(@($Pilot.evaluation_set).Count -lt 20 -or @($Pilot.evaluation_set.issue_id|Sort-Object -Unique).Count -lt 4){throw 'thin-slice evaluation requires at least 20 candidates across four issues'}
    if(@($Pilot.evaluation_set).Count -gt [int]$Pilot.thresholds.max_candidates){throw 'thin-slice candidate cap exceeded'}
    foreach($item in @($Pilot.evaluation_set)){Require-Fields $item @('candidate_id','issue_id','useful','non_obvious');if($item.useful -isnot [bool] -or $item.non_obvious -isnot [bool]){throw 'thin-slice usefulness labels must be boolean'};if([string]::IsNullOrWhiteSpace([string]$item.candidate_id) -or [string]::IsNullOrWhiteSpace([string]$item.issue_id)){throw 'thin-slice candidate and issue identifiers are required'}}
    $candidateIds=@($Pilot.evaluation_set.candidate_id);if(@($candidateIds|Sort-Object -Unique).Count -ne $candidateIds.Count){throw 'thin-slice candidate identifiers must be unique'}
    $gateIds=@($Pilot.gate_results.candidate_id);if(@($gateIds|Sort-Object -Unique).Count -ne $gateIds.Count){throw 'thin-slice gate identifiers must be unique'}
    if((Compare-Object ($candidateIds|Sort-Object) ($gateIds|Sort-Object))){throw 'thin-slice gate results must cover the evaluation set exactly'}
    if(@($Pilot.gate_results|Where-Object{$_.disposition -notin @('follow','skip','defer','needs_review','blocked')}).Count){throw 'unsupported thin-slice gate disposition'}
    if(@($Pilot.retrieval_outcomes).Count -gt [int]$Pilot.thresholds.max_retrievals){throw 'thin-slice retrieval cap exceeded'}
    if(@($Pilot.source_analyses).Count -lt 1 -or @($Pilot.source_analyses).Count -gt [int]$Pilot.thresholds.max_analyses){throw 'thin-slice analysis count is outside the pilot bounds'}
    Require-Fields $Pilot.boundary_checks @('safety_boundary_crossed','authority_mutated','wiki_promoted')
    foreach($field in @('safety_boundary_crossed','authority_mutated','wiki_promoted')){if($Pilot.boundary_checks.$field -isnot [bool] -or $Pilot.boundary_checks.$field){throw 'thin-slice boundary violation'}}
    $followIds=@($Pilot.gate_results|Where-Object disposition -eq 'follow'|ForEach-Object candidate_id)
    $retrievalIds=@($Pilot.retrieval_outcomes.candidate_id);if(@($retrievalIds|Sort-Object -Unique).Count -ne $retrievalIds.Count){throw 'thin-slice retrieval candidate identifiers must be unique'}
    $retrievalCoverage=@{};foreach($retrieval in @($Pilot.retrieval_outcomes)){Require-Fields $retrieval @('candidate_id','coverage');if($retrieval.candidate_id -notin $followIds){throw 'thin-slice retrieval requires a followed candidate'};if($retrieval.coverage -notin @('full','partial','paywalled','unavailable')){throw 'unsupported thin-slice retrieval coverage'};$retrievalCoverage[$retrieval.candidate_id]=$retrieval.coverage}
    if(!(Get-Command Test-SourceAnalysisCompleteness -ErrorAction SilentlyContinue)){. (Join-Path $PSScriptRoot 'newsletter-source-analysis.ps1')}
    $analysisIds=@();foreach($analysis in @($Pilot.source_analyses)){Test-SourceAnalysisCompleteness $analysis|Out-Null;if($analysisIds -contains $analysis.analysis_id){throw 'thin-slice analysis identifiers must be unique'};$analysisIds+=$analysis.analysis_id;if(@($analysis.candidate_ids).Count -ne 1 -or $analysis.candidate_ids[0] -notin $retrievalIds){throw 'thin-slice analysis requires one retrieved candidate'};$retrievalCoverageValue=$retrievalCoverage[$analysis.candidate_ids[0]];if($retrievalCoverageValue -in @('paywalled','unavailable') -or ($analysis.coverage -eq 'full' -and $retrievalCoverageValue -ne 'full')){throw 'thin-slice analysis coverage exceeds retrieval coverage'}}
    if($Pilot.live_validation.status -ne 'pending_explicit_approval'){throw 'live results require a separate confirmed review record'}
    foreach($field in @('review_minutes','retained_deep_analysis','retained_analysis_id')){if($Pilot.live_validation.PSObject.Properties.Name -notcontains $field){throw "missing live validation field: $field"}}
    if($null -ne $Pilot.live_validation.review_minutes -or $null -ne $Pilot.live_validation.retained_deep_analysis -or $null -ne $Pilot.live_validation.retained_analysis_id){throw 'pending live validation cannot contain results'}
    return $true
}

function New-ConfirmedThinSliceLiveReview([object]$Pilot,[bool]$RetainedDeepAnalysis,[string]$RetainedAnalysisId,[string]$ApprovedAt,[string]$ReviewStartedAt,[string]$ReviewedAt,[bool]$Confirmed){
    Test-ThinSlicePilot $Pilot|Out-Null;if(!$Confirmed){throw 'live review requires explicit confirmation'}
    $started=[datetimeoffset]::MinValue;$reviewed=[datetimeoffset]::MinValue;if(![datetimeoffset]::TryParse($ReviewStartedAt,[ref]$started) -or ![datetimeoffset]::TryParse($ReviewedAt,[ref]$reviewed) -or $reviewed -le $started){throw 'thin-slice live review timestamps are invalid or out of order'}
    $record=[pscustomobject]@{schema_version='1.0';record_type='thin_slice_live_review';review_id=(Get-StableId 'thin-slice-review' "$($Pilot.pilot_id)|$ReviewedAt");pilot_id=$Pilot.pilot_id;pilot_hash=(Get-CanonicalSha256 $Pilot);approved_at=$ApprovedAt;review_started_at=$ReviewStartedAt;reviewed_at=$ReviewedAt;review_minutes=[Math]::Round(($reviewed-$started).TotalMinutes,2);retained_deep_analysis=$RetainedDeepAnalysis;retained_analysis_id=if($RetainedDeepAnalysis){$RetainedAnalysisId}else{$null};confirmed=$true}
    Add-RecordIntegrity $record|Out-Null;Test-ThinSliceLiveReview $record $Pilot|Out-Null;return $record
}

function Test-ThinSliceLiveReview([object]$Review,[object]$Pilot){
    Test-ThinSlicePilot $Pilot|Out-Null;Require-Fields $Review @('schema_version','record_type','review_id','pilot_id','pilot_hash','approved_at','review_started_at','reviewed_at','review_minutes','retained_deep_analysis','confirmed','integrity')
    if($Review.schema_version -ne $script:SchemaVersion -or $Review.record_type -ne 'thin_slice_live_review' -or $Review.confirmed -isnot [bool] -or $Review.confirmed -ne $true){throw 'unsupported or unconfirmed thin-slice live review'}
    if(([string]$Review.review_id) -notmatch '^[a-z0-9][a-z0-9._-]{0,95}$'){throw 'thin-slice live review_id is invalid'}
    Test-RecordIntegrity $Review $true|Out-Null;if($Review.pilot_id -ne $Pilot.pilot_id -or $Review.pilot_hash -ne (Get-CanonicalSha256 $Pilot)){throw 'thin-slice live review does not match the pilot'}
    $approved=[datetimeoffset]::MinValue;$started=[datetimeoffset]::MinValue;$reviewed=[datetimeoffset]::MinValue;$preregistered=[datetimeoffset]::Parse($Pilot.preregistered_at)
    if(![datetimeoffset]::TryParse([string]$Review.approved_at,[ref]$approved) -or ![datetimeoffset]::TryParse([string]$Review.review_started_at,[ref]$started) -or ![datetimeoffset]::TryParse([string]$Review.reviewed_at,[ref]$reviewed) -or $preregistered -gt $approved -or $approved -gt $started -or $started -gt $reviewed){throw 'thin-slice live review timestamps are invalid or out of order'}
    $minutes=[double]$Review.review_minutes;$elapsed=[Math]::Round(($reviewed-$started).TotalMinutes,2);if([double]::IsNaN($minutes) -or [double]::IsInfinity($minutes) -or $minutes -le 0 -or [Math]::Abs($minutes-$elapsed) -gt 0.01){throw 'thin-slice live review minutes do not match elapsed time'}
    if($Review.retained_deep_analysis -isnot [bool]){throw 'thin-slice live review retention must be boolean'}
    if($Review.retained_deep_analysis -and $Review.retained_analysis_id -notin $Pilot.source_analyses.analysis_id){throw 'thin-slice live review retained analysis is unknown'}
    if(!$Review.retained_deep_analysis -and $null -ne $Review.retained_analysis_id){throw 'thin-slice live review cannot retain an analysis when retention is false'}
    return $true
}

function Measure-ThinSlicePilot([object]$Pilot,[object]$LiveReview=$null,[bool]$ConfirmLiveReview=$false){
    Test-ThinSlicePilot $Pilot|Out-Null
    $labels=@{};foreach($item in @($Pilot.evaluation_set)){$labels[$item.candidate_id]=[bool]$item.useful}
    $followed=@($Pilot.gate_results|Where-Object disposition -eq 'follow')
    $truePositive=@($followed|Where-Object{$labels[$_.candidate_id]}).Count
    $useful=@($Pilot.evaluation_set|Where-Object useful).Count
    $precision=if($followed.Count){$truePositive/$followed.Count}else{0}
    $recall=if($useful){$truePositive/$useful}else{0}
    $offlinePass=$precision -ge [double]$Pilot.thresholds.precision_min -and $recall -ge [double]$Pilot.thresholds.recall_min
    if($null -ne $LiveReview){if(!$ConfirmLiveReview){throw 'scoring a live review requires explicit confirmation'};Test-ThinSliceLiveReview $LiveReview $Pilot|Out-Null}
    $status=if(!$offlinePass){'offline_failed'}elseif($null -eq $LiveReview){'awaiting_live_validation'}elseif([double]$LiveReview.review_minutes -le [double]$Pilot.thresholds.max_review_minutes -and $LiveReview.retained_deep_analysis){'passed'}else{'live_failed'}
    return [pscustomobject]@{pilot_id=$Pilot.pilot_id;candidate_count=@($Pilot.evaluation_set).Count;issue_count=@($Pilot.evaluation_set.issue_id|Sort-Object -Unique).Count;follow_count=$followed.Count;useful_count=$useful;true_positive_count=$truePositive;precision=[Math]::Round($precision,3);recall=[Math]::Round($recall,3);retrieval_count=@($Pilot.retrieval_outcomes).Count;analysis_count=@($Pilot.source_analyses).Count;non_obvious_useful_count=@($Pilot.evaluation_set|Where-Object{$_.useful -and $_.non_obvious}).Count;status=$status}
}

function Render-ThinSliceReviewWorkspace([object]$Pilot,[string]$Destination){
    Test-ThinSlicePilot $Pilot|Out-Null
    Render-ReviewWorkspace -Profiles @() -Issues @() -Destination $Destination -ThinSlice $Pilot
}

function Write-ThinSlicePilotScorecard([object]$Pilot,[string]$Destination,[object]$LiveReview=$null,[bool]$ConfirmLiveReview=$false){
    $score=Measure-ThinSlicePilot $Pilot $LiveReview $ConfirmLiveReview
    $status=if($score.status -eq 'awaiting_live_validation'){'Awaiting explicitly approved live validation'}elseif($score.status -eq 'passed'){'Pilot passed'}else{$score.status -replace '_',' '}
    $lines=@(
        '---','type: newsletter-thin-slice-scorecard','status: review',"pilot_id: $($Pilot.pilot_id)",'---','',
        '# Newsletter Knowledge-Discovery Thin Slice','',"**Decision status**: $status",'',
        "- Candidates: $($score.candidate_count) across $($score.issue_count) issues",
        "- Useful-follow precision: $([Math]::Round($score.precision*100))% (minimum $([Math]::Round([double]$Pilot.thresholds.precision_min*100))%)",
        "- Missed-value recall: $([Math]::Round($score.recall*100))% (minimum $([Math]::Round([double]$Pilot.thresholds.recall_min*100))%)",
        "- Retrieval outcomes: $($score.retrieval_count) / $($Pilot.thresholds.max_retrievals)",
        "- Deep analyses: $($score.analysis_count) / $($Pilot.thresholds.max_analyses)",
        "- Non-obvious useful links in labelled set: $($score.non_obvious_useful_count)",'',
        '## Boundaries','','- No authority mutation.','- No wiki promotion.','- No live validation without explicit approval.','',
        $(if($score.status -eq 'passed'){"> Live gate satisfied by confirmed review $($LiveReview.review_id). U5 may proceed."}elseif($score.status -eq 'awaiting_live_validation'){'> Offline threshold success is necessary but not sufficient. U5 remains blocked until the live review is explicitly approved, completed within five minutes, and retains at least one materially deeper analysis.'}else{'> Pilot gate failed. Recalibrate, narrow scope, or stop before U5.'})
    )
    $parent=Split-Path -Parent $Destination;if($parent){New-Item -ItemType Directory -Force $parent|Out-Null};[IO.File]::WriteAllLines($Destination,$lines,[Text.UTF8Encoding]::new($false));return $Destination
}

function Render-ReviewWorkspace([object[]]$Profiles,[object[]]$Issues,[string]$Destination,[object]$Registry=$null,[object]$ThinSlice=$null){
    $initial=@{}
    if($Registry){foreach($source in @($Registry.sources)){if($source.newsletter_id -in $Profiles.newsletter_id){$initial[$source.newsletter_id]=$source.decision}}}
    $payload=[pscustomobject]@{schema_version='1.0';profiles=$Profiles;issues=$Issues;initial_decisions=$initial;thin_slice=$ThinSlice}
    $json=[regex]::Replace(($payload|ConvertTo-Json -Depth 20 -Compress),'(?i)</script','<\/script')
    $template=Get-Content -Raw -LiteralPath (Join-Path (Split-Path -Parent $PSScriptRoot) 'skills/newsletter-intelligence/assets/review-workspace.html')
    $html=$template.Replace('__NEWSLETTER_DATA__',$json)
    if($html -match '(?i)<(script|link|img)[^>]+(src|href)\s*=\s*["'']https?'){throw 'remote resources are forbidden in review workspace'}
    $parent=Split-Path -Parent $Destination;if($parent){New-Item -ItemType Directory -Force $parent|Out-Null};[IO.File]::WriteAllText($Destination,$html,[Text.UTF8Encoding]::new($false))
}

function Import-SourceDecisions([object]$Decisions,[object[]]$Profiles,[string]$Destination,[bool]$Confirmed){
    Test-NewsletterRecord $Decisions|Out-Null;if(!$Confirmed){throw 'decision import requires explicit confirmation'}
    $known=@($Profiles.newsletter_id);foreach($d in $Decisions.decisions){if($d.newsletter_id -notin $known){throw "unknown newsletter_id: $($d.newsletter_id)"}}
    $registry=[pscustomobject]@{schema_version='1.0';record_type='source_registry';updated_at=(Get-Date).ToUniversalTime().ToString('o');sources=@($Decisions.decisions|ForEach-Object{[pscustomobject]@{newsletter_id=$_.newsletter_id;decision=$_.decision;note=[string]$_.note;decided_at=(Get-Date).ToUniversalTime().ToString('o')}})}
    Write-JsonAtomic $registry $Destination;return $registry
}

function Invoke-Retention([object]$Registry,[string]$Staging,[datetime]$At){
    $removed=@();foreach($s in $Registry.sources|Where-Object decision -eq 'not_selected'){
        if(([datetime]$s.decided_at).AddDays(30) -le $At){
            Get-ChildItem -LiteralPath $Staging -Recurse -File -ErrorAction SilentlyContinue|Where-Object{$_.FullName -match '[\\/](issues|issue-html|cache|caches)([\\/]|$)' -and ($_.Name -match [regex]::Escape($s.newsletter_id) -or (($_.Extension -eq '.json') -and ((Get-Content -Raw $_.FullName) -match [regex]::Escape($s.newsletter_id))))}|ForEach-Object{Remove-Item -LiteralPath $_.FullName -Force;$removed+=$_.FullName}
        }
    };return $removed
}

function Build-Signals([object[]]$Issues,[object]$Registry){
    $selected=@($Registry.sources|Where-Object decision -eq 'selected'|ForEach-Object newsletter_id)
    $candidates=@();foreach($i in $Issues|Where-Object newsletter_id -in $selected){foreach($c in @($i.claims)){
        $key=([regex]::Replace(([string]$c.text).ToLowerInvariant(),'\W+',' ')).Trim();if(!$key){continue}
        $existing=$candidates|Where-Object key -eq $key|Select-Object -First 1
        if($existing){$existing.issue_ids=@($existing.issue_ids+$i.issue_id|Sort-Object -Unique);$existing.newsletter_ids=@($existing.newsletter_ids+$i.newsletter_id|Sort-Object -Unique);continue}
        $signal=[pscustomobject]@{schema_version='1.0';record_type='signal';signal_id=(Get-StableId 'signal' $key);title=if($i.subject){$i.subject}else{'Newsletter signal'};source_claim=[string]$c.text;issue_ids=@($i.issue_id);newsletter_ids=@($i.newsletter_id);novelty='Needs comparison with relevant wiki pages.';relevance=if($i.relevance_hypotheses.Count){$i.relevance_hypotheses[0]}else{'Downstream relevance has not yet been established.'};wiki_connections=@();downstream_action='Decide whether to verify, test, or dismiss this claim.';evidence_status='unverified';uncertainty='high';contradictions=@();verification_evidence=@();judge=[pscustomobject]@{disposition='hold_for_verification';reason='Newsletter claim requires independent evidence and a fresh judgment pass.'};provenance=[pscustomobject]@{created_at=(Get-Date).ToUniversalTime().ToString('o');pipeline_version='1.0'}}
        $signal|Add-Member -NotePropertyName key -NotePropertyValue $key;$candidates+=$signal
    }}
    foreach($s in $candidates){$s.PSObject.Properties.Remove('key');Test-NewsletterRecord $s|Out-Null};return $candidates
}

function Build-WeeklyBrief([object[]]$Signals,[string]$Destination,[int]$Limit){
    $eligible=@($Signals|Where-Object{$_.judge.disposition -in @('include','hold_for_verification')}|Select-Object -First $Limit)
    $lines=@('---','type: newsletter-strategic-intelligence-brief',"created: $((Get-Date).ToString('yyyy-MM-dd'))",'status: review','---','','# Weekly Strategic Intelligence Brief','',"**Signal count**: $($eligible.Count) (bounded at $Limit)",'')
    foreach($s in $eligible){$lines+=@("## $($s.title)",'',"**Source claim**: $($s.source_claim)","**Evidence status**: $($s.evidence_status)","**Novelty**: $($s.novelty)","**Relevance**: $($s.relevance)","**Uncertainty**: $($s.uncertainty)","**Possible next step**: $($s.downstream_action)","**Provenance**: $($s.issue_ids -join ', ')",'')}
    $lines+=@('## Review actions','','For each signal: accept, reject, correct, verify, or request a promotion proposal. Promotion never edits durable wiki pages automatically.')
    $parent=Split-Path -Parent $Destination;if($parent){New-Item -ItemType Directory -Force $parent|Out-Null};[IO.File]::WriteAllLines($Destination,$lines,[Text.UTF8Encoding]::new($false));return $Destination
}

function New-SignalFeedback([object]$Signal,[ValidateSet('accept','reject','correct','verify','promote')][string]$Action,[string]$Note){
    Test-NewsletterRecord $Signal|Out-Null
    $stamp=(Get-Date).ToUniversalTime().ToString('o')
    $record=[pscustomobject]@{schema_version='1.0';record_type='signal_feedback';feedback_id=(Get-StableId 'feedback' "$($Signal.signal_id)|$Action|$stamp");signal_id=$Signal.signal_id;action=$Action;note=$Note;created_at=$stamp}
    Test-NewsletterRecord $record|Out-Null;return $record
}

function New-PromotionProposal([object]$Signal,[string[]]$AffectedPages){
    Test-NewsletterRecord $Signal|Out-Null
    $record=[pscustomobject]@{schema_version='1.0';record_type='promotion_proposal';proposal_id=(Get-StableId 'proposal' $Signal.signal_id);signal_id=$Signal.signal_id;status='proposed';conclusion=$Signal.source_claim;evidence_status=$Signal.evidence_status;uncertainty=$Signal.uncertainty;affected_pages=@($AffectedPages);proposed_changes=@('Review and draft a source-cited wiki update; do not apply automatically.');provenance=[pscustomobject]@{issue_ids=@($Signal.issue_ids);created_at=(Get-Date).ToUniversalTime().ToString('o')}}
    Test-NewsletterRecord $record|Out-Null;return $record
}

if($MyInvocation.InvocationName -ne '.'){
    switch($Command){
        'init-run'{New-NewsletterRun $RunId $StagingRoot $Mode $StagingLocation $AcceptStagingLocation.IsPresent|ConvertTo-Json -Depth 10}
        'validate'{$r=Get-Content -Raw $InputPath|ConvertFrom-Json;Test-NewsletterRecord $r}
        'normalize'{$m=Get-Content -Raw $InputPath|ConvertFrom-Json;$issues=Convert-MessageRecords @($m);$profiles=New-NewsletterProfiles $issues;$ambiguities=Get-IdentityAmbiguities $issues;New-Item -ItemType Directory -Force $OutputPath|Out-Null;$issues|ForEach-Object{Write-JsonAtomic $_ (Join-Path $OutputPath "$($_.issue_id).json")};$profiles|ForEach-Object{Write-JsonAtomic $_ (Join-Path $OutputPath "$($_.newsletter_id).profile.json")};$ambiguities|ForEach-Object{Write-JsonAtomic $_ (Join-Path $OutputPath "$($_.ambiguity_id).json")}}
        'link-gate'{$i=Get-Content -Raw $InputPath|ConvertFrom-Json;$p=Get-Content -Raw $PriorityPath|ConvertFrom-Json;$r=Get-Content -Raw $RegistryPath|ConvertFrom-Json;$issues=if($i.PSObject.Properties.Name -contains 'issues'){@($i.issues)}else{@($i)};$c=@(New-LinkCandidates $issues $r);$g=@(New-LinkGateDecisions $c $p 10);New-Item -ItemType Directory -Force $OutputPath|Out-Null;Write-JsonArrayAtomic $c (Join-Path $OutputPath 'link-candidates.json');Write-JsonArrayAtomic $g (Join-Path $OutputPath 'link-gates.json')}
        'render'{$p=Get-Content -Raw $ProfilesPath|ConvertFrom-Json;$i=Get-Content -Raw $IssuesPath|ConvertFrom-Json;$r=if($RegistryPath -and (Test-Path $RegistryPath)){Get-Content -Raw $RegistryPath|ConvertFrom-Json}else{$null};Render-ReviewWorkspace @($p) @($i) $OutputPath $r}
        'import-decisions'{$d=Get-Content -Raw $InputPath|ConvertFrom-Json;$p=Get-Content -Raw $ProfilesPath|ConvertFrom-Json;Import-SourceDecisions $d @($p) $RegistryPath $Confirm.IsPresent|ConvertTo-Json -Depth 10}
        'prune'{$r=Get-Content -Raw $RegistryPath|ConvertFrom-Json;Invoke-Retention $r $StagingRoot $Now}
        'build-signals'{$i=Get-Content -Raw $IssuesPath|ConvertFrom-Json;$r=Get-Content -Raw $RegistryPath|ConvertFrom-Json;$s=Build-Signals @($i) $r;$s|ConvertTo-Json -Depth 20|Set-Content -Encoding utf8 $OutputPath}
        'build-brief'{$s=Get-Content -Raw $InputPath|ConvertFrom-Json;Build-WeeklyBrief @($s) $OutputPath $MaxSignals}
        default{if($Command -ne 'none'){throw "unsupported command: $Command"}}
    }
}
