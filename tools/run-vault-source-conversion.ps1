param(
 [ValidateSet("Inventory","Incremental","Backfill","Manifest","Rebuild")][string]$Mode="Inventory",
 [string]$Manifest="",
 [int]$Limit=0,
 [switch]$AnalyzeBundles,
 [string]$PolicyPath=""
)
$ErrorActionPreference="Stop"
$vaultRoot=Resolve-Path (Join-Path $PSScriptRoot "..")
if(-not $PolicyPath){$PolicyPath=Join-Path $vaultRoot "tools\config\source-conversion-policy.json"}
& (Join-Path $vaultRoot "tools\test-source-conversion-policy.ps1") -PolicyPath $PolicyPath|Out-Null
$policy=Get-Content -Raw $PolicyPath|ConvertFrom-Json
if($Mode -eq "Manifest" -and (-not $Manifest -or -not(Test-Path -LiteralPath $Manifest -PathType Leaf))){throw "Manifest mode requires an existing manifest."}
$outputRoot=Join-Path $vaultRoot "wiki\_outputs\source-conversions"
$registryPath=Join-Path $outputRoot "source-conversion-registry.csv"
$exceptionPath=Join-Path $outputRoot "source-conversion-exceptions.csv"
$summaryPath=Join-Path $outputRoot "latest-run.json"
$lockPath=Join-Path $outputRoot ".conversion.lock"
$runId=(Get-Date -Format "yyyyMMdd-HHmmss-fff")+"-"+([guid]::NewGuid().ToString("N").Substring(0,8))
$runRelative="wiki/_outputs/source-conversions/runs/$runId"
$runRoot=Join-Path $vaultRoot $runRelative
$logDir=Join-Path $outputRoot "logs"
$logFile=Join-Path $logDir "source-conversion-$runId.log"
New-Item -ItemType Directory -Force $runRoot,$logDir|Out-Null

function Import-Rows([string]$Path){if(Test-Path $Path){return @(Import-Csv $Path)};return @()}
function Publish-Csv($Data,[string]$Path){
 $temp="$Path.tmp-$runId";@($Data)|Export-Csv -NoTypeInformation -Encoding UTF8 $temp;Move-Item -Force $temp $Path
}
function Publish-Json($Data,[string]$Path){
 $temp="$Path.tmp-$runId";$Data|ConvertTo-Json|Set-Content -Encoding UTF8 $temp;Move-Item -Force $temp $Path
}
function Read-SidecarFingerprint([string]$Path){
 if(-not(Test-Path -LiteralPath $Path -PathType Leaf)){return ""}
 $match=Select-String -LiteralPath $Path -Pattern '^source_sha256:\s*([0-9a-fA-F]{64})'|Select-Object -First 1
 if($match){return $match.Matches[0].Groups[1].Value.ToLowerInvariant()}
 return ""
}
function Read-SidecarStatus([string]$Path){
 if(-not(Test-Path -LiteralPath $Path -PathType Leaf)){return ""}
 $match=Select-String -LiteralPath $Path -Pattern '^status:\s*["'']?([a-zA-Z0-9-]+)'|Select-Object -First 1
 if($match){return $match.Matches[0].Groups[1].Value.ToLowerInvariant()}
 return ""
}
function Get-StateRows($Inventory,$Audits,$OldBySource){
 $auditByTarget=@{}
 foreach($audit in @($Audits)){if($audit.file){$auditByTarget[$audit.file.Replace("\","/")]=$audit}}
 foreach($item in @($Inventory)){
  $source=$item.source.Replace("\","/")
  $sourcePath=Join-Path $vaultRoot $source
  $target=if($item.target){$item.target.Replace("\","/")}else{""}
  $old=$OldBySource[$source]
  if($old -and $old.size_bytes -eq $item.size_bytes -and $old.modified -eq $item.modified){$sha=$old.sha256}
  else{$sha=(Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash.ToLowerInvariant()}
  $state="unsupported";$auditStatus=""
  if($item.extension -in @($policy.native_markdown_extensions)){$state="native"}
  elseif($item.category -eq "archive"){$state="archive"}
  elseif($item.action -eq "convert" -and $item.extension -notin @($policy.eligible_extensions)){$state="policy-blocked"}
  elseif($item.action -eq "convert"){
   $targetPath=Join-Path $vaultRoot $target
   $targetExists=Test-Path -LiteralPath $targetPath -PathType Leaf
   $recordedSha=if($targetExists){Read-SidecarFingerprint $targetPath}else{""}
   $sidecarStatus=if($targetExists){Read-SidecarStatus $targetPath}else{""}
   $expectedSha=if($recordedSha){$recordedSha}elseif($old){$old.sha256}else{""}
   if($targetExists -and $expectedSha -and $expectedSha -ne $sha){$state="stale-blocked"}
   elseif($targetExists -and $sidecarStatus -eq "deferred-ocr" -and $expectedSha -eq $sha){$state="amber";$auditStatus="deferred-ocr"}
   elseif(-not $targetExists -and $old -and $old.sha256 -eq $sha -and $old.audit_status -eq "deferred-ocr"){$state="amber";$auditStatus="deferred-ocr"}
   elseif(-not $targetExists -and $old -and $old.sha256 -eq $sha -and $old.audit_status -eq "failed"){$state="red";$auditStatus="failed"}
   elseif(-not $targetExists){$state="missing"}
   else{
    $audit=$auditByTarget[$target]
    if($audit){$auditStatus=$audit.status}
    elseif($old -and $old.sha256 -eq $sha){$auditStatus=$old.audit_status;$state=$old.state}
    else{$auditStatus="unknown"}
    if(-not $state -or $state -eq "unsupported"){
     if($auditStatus -in @("good","ok")){$state="green"}
     elseif($auditStatus -eq "review"){$state="amber"}
     else{$state="red"}
    }
   }
  }
  $rowRunId=$runId
  if($old -and $old.sha256 -eq $sha -and $old.profile -eq $policy.converter_profile_version -and $old.target -eq $target -and $old.audit_status -eq $auditStatus -and $old.state -eq $state){$rowRunId=$old.run_id}
  [pscustomobject]@{source=$source;size_bytes=$item.size_bytes;modified=$item.modified;sha256=$sha;profile=$policy.converter_profile_version;target=$target;audit_status=$auditStatus;state=$state;run_id=$rowRunId}
 }
}

$lock=$null
$conversionFailureCount=0
try{
 if(Test-Path $lockPath){
  $age=(Get-Date)-(Get-Item $lockPath).LastWriteTime
  if($age.TotalMinutes -gt [int]$policy.thresholds.lock_timeout_minutes){Remove-Item -Force $lockPath}
 }
 try{$lock=[IO.File]::Open($lockPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::None)}
 catch{throw "Another source conversion run is active: $lockPath"}
 $bytes=[Text.Encoding]::UTF8.GetBytes("$PID $runId");$lock.Write($bytes,0,$bytes.Length);$lock.Flush()
 $drive=[IO.DriveInfo]::new([IO.Path]::GetPathRoot($vaultRoot.Path))
 if($drive.AvailableFreeSpace -lt ([int64]$policy.thresholds.minimum_free_disk_gib*1GB)){throw "Insufficient disk headroom for source conversion."}

 $extract=Join-Path $vaultRoot "tools\run-source-extraction.ps1"
 $oldBySource=@{}
 if($Mode -ne "Rebuild" -and (Test-Path $registryPath)){
  $registryRows=@(Import-Rows $registryPath)
  $required=@("source","size_bytes","modified","sha256","profile","target","audit_status","state","run_id")
  if(-not $registryRows.Count -or @($required|Where-Object{$_ -notin $registryRows[0].PSObject.Properties.Name}).Count){throw "Source conversion registry is corrupt; run Rebuild."}
  foreach($row in $registryRows){if($oldBySource.ContainsKey($row.source)){throw "Source conversion registry contains duplicate rows; run Rebuild."};$oldBySource[$row.source]=$row}
 }
 $inventoryReport="$runRelative/inventory"
 $inventoryParams=@{ReportDir=$inventoryReport}
 if($Mode -eq "Manifest"){$inventoryParams.Manifest=$Manifest}
 if($AnalyzeBundles){$inventoryParams.AnalyzeBundles=$true}
 if($Mode -in @("Inventory","Rebuild") -or -not(Test-Path $registryPath)){$inventoryParams.Validate=$true}
 & $extract @inventoryParams 2>&1|Tee-Object -FilePath $logFile
 $inventory=Import-Rows (Join-Path $vaultRoot "$inventoryReport/source-inventory.csv")
 $audits=Import-Rows (Join-Path $vaultRoot "$inventoryReport/conversion-audit.csv")
 $rows=@(Get-StateRows $inventory $audits $oldBySource)

 $selection=@($rows|Where-Object{
 $_.state -eq "missing" -or
 ($_.state -eq "amber" -and $_.audit_status -eq "deferred-ocr" -and -not(Test-Path -LiteralPath (Join-Path $vaultRoot $_.target) -PathType Leaf))
})
 if($Mode -eq "Inventory" -or $Mode -eq "Rebuild"){$selection=@()}
 elseif($Mode -eq "Backfill"){
  $waveLimit=if($Limit -gt 0){$Limit}else{[int]$policy.backfill_wave_sizes[0]}
  $selection=@($selection|Select-Object -First $waveLimit)
 }elseif($Limit -gt 0){$selection=@($selection|Select-Object -First $Limit)}

 if($selection.Count){
  $selectionManifest=Join-Path $runRoot "selected-sources.txt"
  $selection.source|Set-Content -Encoding UTF8 $selectionManifest
  $conversionReport="$runRelative/conversion"
  & $extract -Convert -Manifest $selectionManifest -ReportDir $conversionReport -Backend $policy.backend 2>&1|Tee-Object -FilePath $logFile -Append
  $convertedInventory=Import-Rows (Join-Path $vaultRoot "$conversionReport/source-inventory.csv")
  $convertedAudits=Import-Rows (Join-Path $vaultRoot "$conversionReport/conversion-audit.csv")
  $convertedRows=@(Get-StateRows $convertedInventory $convertedAudits $oldBySource)
  $conversionFailures=@(Import-Rows (Join-Path $vaultRoot "$conversionReport/conversion-failures.csv"))
  $deferredRows=@(Import-Rows (Join-Path $vaultRoot "$conversionReport/deferred-ocr.csv"))
  $failedBySource=@{};foreach($failure in $conversionFailures){$failedBySource[$failure.source]=$failure.error}
  foreach($row in $convertedRows){if($failedBySource.ContainsKey($row.source)){$row.state="red";$row.audit_status="failed"}}
  $deferredBySource=@{};foreach($deferred in $deferredRows){$deferredBySource[$deferred.source]=$deferred.reason}
  foreach($row in $convertedRows){if($deferredBySource.ContainsKey($row.source)){$row.state="amber";$row.audit_status="deferred-ocr"}}
  $conversionFailureCount=@($conversionFailures).Count
  $bySource=@{};foreach($row in $rows){$bySource[$row.source]=$row};foreach($row in $convertedRows){$bySource[$row.source]=$row}
  $rows=@($bySource.Values|Sort-Object source)
 }

 if($Mode -eq "Manifest"){
  $merged=@{};foreach($row in $oldBySource.Values){$merged[$row.source]=$row};foreach($row in $rows){$merged[$row.source]=$row}
  $rows=@($merged.Values|Sort-Object source)
 }
 Publish-Csv $rows $registryPath
 $exceptions=@($rows|Where-Object{$_.state -in @("missing","stale-blocked","amber","red")}|Select-Object *,@{Name="recommended_action";Expression={
  if($_.audit_status -eq "deferred-ocr"){"request OCR approval"}
  elseif($_.audit_status -eq "failed"){"repair converter/backend and retry"}
  elseif($_.state -eq "stale-blocked"){"request approved regeneration"}
  elseif($_.state -eq "missing"){"retry policy-bound conversion"}
  else{"review extraction quality before content ingest"}
 }})
 Publish-Csv $exceptions $exceptionPath
 $counts=@{};foreach($group in $rows|Group-Object state){$counts[$group.Name]=$group.Count}
 $summary=[ordered]@{run_id=$runId;mode=$Mode;scanned=$rows.Count;selected=$selection.Count;green=[int]$counts.green;native=[int]$counts.native;archive=[int]$counts.archive;amber=[int]$counts.amber;red=[int]$counts.red;missing=[int]$counts.missing;stale_blocked=[int]$counts["stale-blocked"];exceptions=$exceptions.Count;failure_count=$conversionFailureCount;run_directory=$runRelative}
 Publish-Json $summary $summaryPath
 $summary|ConvertTo-Json
 if($conversionFailureCount -and $Mode -ne "Backfill"){throw "One or more source conversions failed; see the exception queue and run report."}
 if($Mode -eq "Backfill" -and $selection.Count){
  $selectedStates=@($rows|Where-Object{$_.source -in $selection.source})
  $failureCount=@($selectedStates|Where-Object{$_.state -eq "red"}).Count
  $failureRate=100*$failureCount/[math]::Max(1,$selectedStates.Count)
  if($failureRate -gt [double]$policy.thresholds.maximum_failure_rate_percent){throw "Backfill failure threshold exceeded; automatic continuation stopped."}
 }
}catch{$_|Out-String|Tee-Object -FilePath $logFile -Append|Write-Error;throw}
finally{if($lock){$lock.Dispose();if(Test-Path $lockPath){Remove-Item -Force $lockPath}}}
