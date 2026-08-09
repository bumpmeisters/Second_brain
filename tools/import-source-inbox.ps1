param(
 [string]$VaultRoot="",
 [string]$PolicyPath="",
 [int]$StabilitySeconds=-1,
 [switch]$SkipConversion
)
$ErrorActionPreference="Stop"
if(-not $VaultRoot){$VaultRoot=Resolve-Path (Join-Path $PSScriptRoot "..")}
$VaultRoot=[IO.Path]::GetFullPath($VaultRoot)
if(-not $PolicyPath){$PolicyPath=Join-Path $VaultRoot "tools\config\source-inbox-policy.json"}
if(-not(Test-Path -LiteralPath $PolicyPath -PathType Leaf)){throw "Inbox policy not found: $PolicyPath"}
$policy=Get-Content -Raw $PolicyPath|ConvertFrom-Json
if($policy.schema_version -ne 1){throw "Unsupported inbox policy schema."}
$expectedLanes=[ordered]@{
 raw=[ordered]@{binary="raw/assets";native="raw/imports"}
 research=[ordered]@{binary="research/assets";native="research/imports"}
}
$laneNames=@($policy.lanes.PSObject.Properties.Name)
if($laneNames.Count -ne $expectedLanes.Count -or @($laneNames|Where-Object{$_ -notin $expectedLanes.Keys}).Count){throw "Inbox policy must define exactly the raw and research lanes."}
foreach($lane in $expectedLanes.Keys){
 $routeNames=@($policy.lanes.$lane.PSObject.Properties.Name)
 if($routeNames.Count -ne 2 -or @($routeNames|Where-Object{$_ -notin @('binary','native')}).Count){throw "Inbox lane must define exactly binary and native routes: $lane"}
 foreach($route in @('binary','native')){if(([string]$policy.lanes.$lane.$route).Replace('\','/') -ne $expectedLanes[$lane][$route]){throw "Unsafe inbox destination for lane and route: $lane/$route"}}
}
$expectedActions=[ordered]@{admit_new_sources=$true;preserve_relative_paths=$true;quarantine_duplicates=$true;quarantine_conflicts=$true;quarantine_unsupported=$true;run_incremental_conversion=$true;overwrite_existing_sources=$false;modify_admitted_sources=$false;run_ocr=$false;semantic_ingest=$false}
foreach($name in $expectedActions.Keys){$property=$policy.automatic_actions.PSObject.Properties[$name];if(-not $property -or [bool]$property.Value -ne $expectedActions[$name]){throw "Unsafe or incomplete inbox action policy: $name"}}
if([int]$policy.conversion_limit -lt 1 -or [int]$policy.conversion_limit -gt 250){throw "Inbox conversion limit must remain between 1 and 250."}
if($StabilitySeconds -lt 0){$StabilitySeconds=[int]$policy.stability_seconds}
if($StabilitySeconds -lt 0){throw "Inbox stability window cannot be negative."}
$binaryExtensions=@($policy.binary_extensions|ForEach-Object{$_.ToLowerInvariant()}|Sort-Object -Unique)
$nativeExtensions=@($policy.native_extensions|ForEach-Object{$_.ToLowerInvariant()}|Sort-Object -Unique)
if(@($binaryExtensions|Where-Object{$_ -in $nativeExtensions}).Count){throw "Inbox extension classes must not overlap."}
$repositoryArchiveByKey=@{}
foreach($archive in @($policy.repository_archives)){
 $archiveLane=([string]$archive.lane).ToLowerInvariant()
 $archiveRelative=([string]$archive.relative_path).Replace('\','/')
 $archiveSha=([string]$archive.sha256).ToLowerInvariant()
 if($archiveLane -ne 'raw'){throw "Repository archives are allowed only in the raw lane."}
 if(-not $archiveRelative -or [IO.Path]::IsPathRooted($archiveRelative) -or $archiveRelative -match '(^|/)\.\.(/|$)' -or [IO.Path]::GetExtension($archiveRelative).ToLowerInvariant() -ne '.zip'){throw "Unsafe repository archive path: $archiveRelative"}
 if($archiveSha -notmatch '^[0-9a-f]{64}$'){throw "Repository archive SHA-256 is invalid: $archiveRelative"}
 $archiveKey="$archiveLane|$($archiveRelative.ToLowerInvariant())"
 if($repositoryArchiveByKey.ContainsKey($archiveKey)){throw "Duplicate repository archive rule: $archiveRelative"}
 $repositoryArchiveByKey[$archiveKey]=$archiveSha
}
$inboxRoot=Join-Path $VaultRoot "inbox"
$quarantineRoot=Join-Path $inboxRoot "_quarantine"
$outputRoot=Join-Path $VaultRoot "wiki\_outputs\source-conversions"
$logRoot=Join-Path $outputRoot "logs"
$runId=(Get-Date -Format "yyyyMMdd-HHmmss-fff")+"-"+([guid]::NewGuid().ToString("N").Substring(0,8))
New-Item -ItemType Directory -Force $logRoot,$quarantineRoot|Out-Null
$lockPath=Join-Path $outputRoot ".inbox.lock"
$inboxLock=$null
try{$inboxLock=[IO.File]::Open($lockPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::None)}catch{throw "Another source inbox run is active: $lockPath"}
try{

function Get-RelativePath([string]$Base,[string]$Path){
 $baseUri=[Uri]::new(([IO.Path]::GetFullPath($Base).TrimEnd('\')+'\'))
 $pathUri=[Uri]::new([IO.Path]::GetFullPath($Path))
 return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($pathUri).ToString()).Replace('/','\')
}
function Test-FileReady([IO.FileInfo]$File){
 if(((Get-Date)-$File.LastWriteTime).TotalSeconds -lt $StabilitySeconds){return $false}
 try{$stream=[IO.File]::Open($File.FullName,[IO.FileMode]::Open,[IO.FileAccess]::Read,[IO.FileShare]::None);$stream.Dispose();return $true}catch{return $false}
}
function Move-ToQuarantine([IO.FileInfo]$File,[string]$Lane,[string]$Reason,[string]$Relative){
 $target=Join-Path $quarantineRoot (Join-Path $Reason (Join-Path $Lane $Relative))
 $parent=Split-Path -Parent $target;New-Item -ItemType Directory -Force $parent|Out-Null
 if(Test-Path -LiteralPath $target){$target=Join-Path $parent (([IO.Path]::GetFileNameWithoutExtension($target))+"-$runId-"+([guid]::NewGuid().ToString("N").Substring(0,8))+([IO.Path]::GetExtension($target)))}
 Move-Item -LiteralPath $File.FullName -Destination $target
 return Get-RelativePath $VaultRoot $target
}

[Collections.Generic.List[object]]$results=[Collections.Generic.List[object]]::new()
$counts=@{admitted=0;pending=0;quarantined=0}
function Add-InboxResult([string]$Lane,[string]$Input,[string]$Status,[string]$Destination="",[string]$Sha256="",[string]$Message=""){
 $results.Add([pscustomobject]@{run_id=$runId;lane=$Lane;input=$Input;status=$Status;destination=$Destination;sha256=$Sha256;message=$Message})
 if($Status -eq "admitted"){$counts.admitted++}elseif($Status -eq "pending"){$counts.pending++}elseif($Status -like "quarantined-*"){$counts.quarantined++}
}

foreach($lane in $expectedLanes.Keys){
 $laneRoot=Join-Path $inboxRoot $lane
 New-Item -ItemType Directory -Force $laneRoot|Out-Null
 Get-ChildItem -LiteralPath $laneRoot -File -Recurse|Where-Object{$_.Name -ne '.gitkeep'}|ForEach-Object{
  $file=$_
  $relative=Get-RelativePath $laneRoot $file.FullName
  $normalizedRelative=$relative.Replace('\','/')
  $archiveKey="$lane|$($normalizedRelative.ToLowerInvariant())"
  $approvedArchiveSha=if($repositoryArchiveByKey.ContainsKey($archiveKey)){$repositoryArchiveByKey[$archiveKey]}else{$null}
  if(-not(Test-FileReady $file)){
   Add-InboxResult $lane $relative "pending" -Message "File is new or still open; retry on the next run."
   return
  }
  $extension=$file.Extension.ToLowerInvariant()
  $route=if($extension -in $binaryExtensions){'binary'}elseif($extension -in $nativeExtensions){'native'}elseif($extension -eq '.zip' -and $approvedArchiveSha){'binary'}else{$null}
  if(-not $route){
   $quarantined=Move-ToQuarantine $file $lane "unsupported" $relative
   Add-InboxResult $lane $relative "quarantined-unsupported" $quarantined -Message "Extension is not approved by the inbox policy."
   return
  }
  $sizeBefore=$file.Length;$modifiedBefore=$file.LastWriteTimeUtc
  $sourceSha=(Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
  $file.Refresh()
  if($file.Length -ne $sizeBefore -or $file.LastWriteTimeUtc -ne $modifiedBefore){
   Add-InboxResult $lane $relative "pending" -Message "File changed while being checked; retry on the next run."
   return
  }
  if($approvedArchiveSha -and $sourceSha -ne $approvedArchiveSha){
   $quarantined=Move-ToQuarantine $file $lane "integrity" $relative
   Add-InboxResult $lane $relative "quarantined-integrity" $quarantined $sourceSha "Repository archive SHA-256 did not match its explicit admission rule."
   return
  }
  $destinationRoot=Join-Path $VaultRoot $expectedLanes[$lane][$route]
  $destination=Join-Path $destinationRoot $relative
  if(Test-Path -LiteralPath $destination){
   $classification=if((Test-Path -LiteralPath $destination -PathType Leaf) -and (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash.ToLowerInvariant() -eq $sourceSha){@{reason="duplicates";status="quarantined-duplicate"}}else{@{reason="conflicts";status="quarantined-conflict"}}
   $quarantined=Move-ToQuarantine $file $lane $classification.reason $relative
   Add-InboxResult $lane $relative $classification.status $quarantined $sourceSha "Existing source was not overwritten."
   return
  }
  $destinationParent=Split-Path -Parent $destination
  $ancestorConflict=$false;$cursor=$destinationParent
  while($cursor -and $cursor.StartsWith($destinationRoot,[StringComparison]::OrdinalIgnoreCase)){
   if(Test-Path -LiteralPath $cursor -PathType Leaf){$ancestorConflict=$true;break}
   if($cursor -eq $destinationRoot){break};$cursor=Split-Path -Parent $cursor
  }
  if($ancestorConflict){
   $quarantined=Move-ToQuarantine $file $lane "conflicts" $relative
   Add-InboxResult $lane $relative "quarantined-conflict" $quarantined $sourceSha "A parent path is already occupied by a source file."
   return
  }
  New-Item -ItemType Directory -Force $destinationParent|Out-Null
  Move-Item -LiteralPath $file.FullName -Destination $destination
  $canonical=(Get-RelativePath $VaultRoot $destination).Replace('\','/')
  Add-InboxResult $lane $relative "admitted" $canonical $sourceSha "Source admitted; immutable source contract now applies."
 }
}
$ledger=Join-Path $logRoot "source-inbox-$runId.csv"
$results|Export-Csv -NoTypeInformation -Encoding UTF8 $ledger
$conversionExit=$null
if(-not $SkipConversion){
 $runner=Join-Path $VaultRoot "tools\run-vault-source-conversion.ps1"
 if(-not(Test-Path -LiteralPath $runner -PathType Leaf)){throw "Conversion runner not found: $runner"}
 $previousErrorActionPreference=$ErrorActionPreference;$ErrorActionPreference="Continue"
 & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -Mode Incremental -Limit ([int]$policy.conversion_limit) 2>&1|Out-Null
 $conversionExit=$LASTEXITCODE;$ErrorActionPreference=$previousErrorActionPreference
 if($conversionExit -ne 0){throw "Inbox admission completed, but incremental conversion failed. See the conversion exception queue."}
}
$summary=[ordered]@{run_id=$runId;scanned=$results.Count;admitted=$counts.admitted;pending=$counts.pending;quarantined=$counts.quarantined;conversion_exit_code=$conversionExit;ledger=(Get-RelativePath $VaultRoot $ledger).Replace('\','/')}
$summary|ConvertTo-Json
}finally{if($inboxLock){$inboxLock.Dispose()};if(Test-Path -LiteralPath $lockPath){Remove-Item -LiteralPath $lockPath -Force}}
