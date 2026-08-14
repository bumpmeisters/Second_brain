$ErrorActionPreference='Stop'
$toolRoot=Split-Path -Parent $MyInvocation.MyCommand.Path
if(!(Get-Command Test-NewsletterRecord -ErrorAction SilentlyContinue)){. (Join-Path $toolRoot 'newsletter-intelligence.ps1')}

function Test-SourceAnalysisCompleteness([object]$Analysis){
    Test-NewsletterRecord $Analysis|Out-Null
    if($Analysis.coverage -eq 'partial' -and @($Analysis.missing_sections).Count -eq 0){throw 'partial analysis must name missing sections'}
    if($Analysis.coverage -eq 'full' -and @($Analysis.missing_sections).Count -gt 0){throw 'full analysis cannot name missing sections'}
    if($Analysis.coverage -eq 'full'){
        if(@($Analysis.structure_covered).Count -lt 2){throw 'full analysis must be section-aware'}
        if($Analysis.source_type -notin @('research_paper','report') -and @($Analysis.section_synthesis).Count -lt 1){throw 'full analysis must be section-aware'}
        if($Analysis.source_type -eq 'research_paper'){
            if($null -eq $Analysis.paper_details){throw 'paper analysis missing: paper_details'}
            foreach($field in @('research_question','prior_context','method','data_sample','results','limitations')){if([string]::IsNullOrWhiteSpace([string]$Analysis.paper_details.$field)){throw "paper analysis missing: $field"}}
        }
        if($Analysis.source_type -eq 'report'){
            if($null -eq $Analysis.report_details){throw 'report analysis missing: report_details'}
            foreach($field in @('sponsor','methodology','data_basis','findings','limitations','commercial_incentives')){if([string]::IsNullOrWhiteSpace([string]$Analysis.report_details.$field)){throw "report analysis missing: $field"}}
        }
    }
    return $true
}

function ConvertTo-SafeMarkdownText([string]$Content){
    if([string]::IsNullOrWhiteSpace($Content)){return ''}
    $safe=ConvertTo-SafeText $Content
    $safe=[regex]::Replace($safe,'!\[([^\]]*)\]\([^)]*\)','$1')
    $safe=[regex]::Replace($safe,'\[([^\]]+)\]\([^)]*\)','$1')
    $safe=[regex]::Replace($safe,'(?i)\b(?:https?://|javascript:|data:)\S+','[removed external target]')
    return $safe.Trim()
}

function Render-SourceAnalysisMarkdown([object]$Analysis){
    Test-SourceAnalysisCompleteness $Analysis|Out-Null
    $lines=@("# $(ConvertTo-SafeMarkdownText $Analysis.title)",'',"- Source type: $(ConvertTo-SafeMarkdownText $Analysis.source_type)","- Coverage: $(ConvertTo-SafeMarkdownText $Analysis.coverage)",'- Status: staged','','## Summary','',(ConvertTo-SafeMarkdownText $Analysis.summary),'','## Section synthesis','')
    foreach($section in @($Analysis.section_synthesis)){$lines+="- **$(ConvertTo-SafeMarkdownText $section.section)**: $(ConvertTo-SafeMarkdownText $section.synthesis)"}
    foreach($detailsName in @('paper_details','report_details')){if($null -ne $Analysis.$detailsName){$lines+=@('',"## $($detailsName -replace '_',' ')",'');foreach($property in $Analysis.$detailsName.PSObject.Properties){$lines+="- **$(ConvertTo-SafeMarkdownText $property.Name)**: $(ConvertTo-SafeMarkdownText ([string]$property.Value))"}}}
    foreach($group in @(@('Caveats','caveats'),@('Contradictions','contradictions'),@('Second Brain relevance','downstream_relevance'),@('Missing sections','missing_sections'))){$lines+=@('',"## $($group[0])",'');foreach($item in @($Analysis.($group[1]))){$lines+="- $(ConvertTo-SafeMarkdownText ([string]$item))"};if(@($Analysis.($group[1])).Count -eq 0){$lines+='- None recorded.'}}
    $lines+=@('','## Bounded evidence excerpts','');foreach($excerpt in @($Analysis.bounded_excerpts)){$lines+="- $(ConvertTo-SafeMarkdownText $excerpt.text) - $(ConvertTo-SafeMarkdownText $excerpt.location)"}
    $lines+=@('','## Provenance','',"- Analysis ID: $(ConvertTo-SafeMarkdownText $Analysis.analysis_id)","- Content hash: $(ConvertTo-SafeMarkdownText $Analysis.content_hash)","- Fetch record: $(ConvertTo-SafeMarkdownText $Analysis.provenance.fetch_record_id)","- Reasoning level: $(ConvertTo-SafeMarkdownText $Analysis.provenance.reasoning_level)",'','> This is a staged analysis, not a promoted wiki claim.')
    return ($lines -join [Environment]::NewLine)
}

function Test-VerificationIndependence([object]$Verification,[object]$Claim){
    Test-NewsletterRecord $Claim|Out-Null;Test-NewsletterRecord $Verification|Out-Null
    if($Claim.claim_id -ne $Verification.claim_id){throw 'verification claim id does not match'}
    if($Verification.independent){$overlap=@($Verification.verifier_source_ids|Where-Object{$Claim.origin_source_ids -contains $_});if($overlap.Count){throw "independent verification source overlap: $($overlap -join ', ')"}}
    return $true
}

function New-SourceAnalysisRequest(
    [object]$Fetch,
    [string]$AnalysisId,
    [string]$SourceType='unknown',
    [datetimeoffset]$EvaluatedAt=[datetimeoffset]::UtcNow
){
    Test-NewsletterRecord $Fetch|Out-Null
    if($Fetch.coverage -notin @('full','partial')){throw "source snapshot is not analyzable: $($Fetch.coverage)"}
    if($SourceType -notin $script:AllowedSourceTypes){throw 'unsupported analysis source type'}
    if([datetimeoffset]::Parse($Fetch.expires_at) -le $EvaluatedAt){throw 'source snapshot has expired'}
    try{$completion=Get-Content -Raw -LiteralPath $Fetch.completion_path|ConvertFrom-Json}catch{throw 'analysis requires a readable completion marker'}
    if($completion.candidate_id -ne $Fetch.candidate_id -or $completion.content_hash -ne $Fetch.content_hash){throw 'completion marker does not match the fetch record'}
    try{$snapshotHash='sha256-'+(Get-FileHash -LiteralPath $Fetch.snapshot_path -Algorithm SHA256).Hash.ToLowerInvariant()}catch{throw 'analysis requires a readable completed snapshot'}
    if($snapshotHash -ne $Fetch.content_hash){throw 'snapshot content hash does not match the fetch record'}
    return [pscustomobject]@{analysis_id=$AnalysisId;candidate_id=$Fetch.candidate_id;content_hash=$Fetch.content_hash;source_type=$SourceType;coverage=$Fetch.coverage;snapshot_path=$Fetch.snapshot_path;reasoning_level='medium';allowed_inputs=@('completed_snapshot');allowed_outputs=@('staged_source_analysis');forbidden_capabilities=@('gmail','navigation','forms','downloads','shell','wiki_write')}
}

function Write-StagedSourceAnalysis([object]$Analysis,[string]$Directory){
    $markdown=Render-SourceAnalysisMarkdown $Analysis
    New-Item -ItemType Directory -Force -Path $Directory|Out-Null
    $jsonPath=Join-Path $Directory 'source-analysis.json';Write-JsonAtomic $Analysis $jsonPath
    $markdownPath=Join-Path $Directory 'source-analysis.md';$temp="$markdownPath.tmp-$([guid]::NewGuid().ToString('N'))"
    try{[IO.File]::WriteAllText($temp,$markdown,[Text.UTF8Encoding]::new($false));Move-Item -Force -LiteralPath $temp -Destination $markdownPath}finally{if(Test-Path -LiteralPath $temp){Remove-Item -Force -LiteralPath $temp}}
    return [pscustomobject]@{json_path=$jsonPath;markdown_path=$markdownPath}
}

function Get-ReusableSourceAnalysis([object]$Analysis,[object]$Fetch){
    Test-SourceAnalysisCompleteness $Analysis|Out-Null
    if($Analysis.content_hash -ne $Fetch.content_hash){return $null}
    $copy=Copy-NewsletterRecord $Analysis
    if($copy.candidate_ids -notcontains $Fetch.candidate_id){$copy.candidate_ids=@($copy.candidate_ids)+@($Fetch.candidate_id)}
    return $copy
}
