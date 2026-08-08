function Get-SourceConversionAction([string]$Reason){
 switch($Reason){
  "native-markdown" { "read original Markdown"; break }
  "validated-sidecar" { "read sidecar and cite original"; break }
  "missing-target" { "retry policy-bound conversion"; break }
  "stale-blocked" { "request approved regeneration"; break }
  "amber" { "review extraction quality before ingest"; break }
  "red" { "repair converter/backend and retry"; break }
  "unregistered" { "run policy-bound reconciliation"; break }
  default { "review source-conversion exception"; break }
 }
}
function Get-SourceConversionReadiness {
 param([string[]]$Source,[string]$RegistryPath,[string[]]$NativeMarkdownExtensions,[string]$VaultRoot)
 $registry=@{}
 if(Test-Path $RegistryPath){foreach($row in Import-Csv $RegistryPath){$registry[$row.source]=$row}}
 foreach($item in $Source){
  if([IO.Path]::GetExtension($item).ToLowerInvariant() -in $NativeMarkdownExtensions){$reason="native-markdown";[pscustomobject]@{source=$item;status="ready";reason=$reason;target=$null;recommended_action=(Get-SourceConversionAction $reason)};continue}
  $row=$registry[$item]
  if(-not $row){$reason="unregistered";[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$null;recommended_action=(Get-SourceConversionAction $reason)};continue}
  if($row.state -ne "green"){$reason=$row.state;[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$row.target;recommended_action=(Get-SourceConversionAction $reason)};continue}
  $sourcePath=Join-Path $VaultRoot $item;$targetPath=Join-Path $VaultRoot $row.target
  if(-not(Test-Path -LiteralPath $targetPath -PathType Leaf)){$reason="missing-target";[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$row.target;recommended_action=(Get-SourceConversionAction $reason)};continue}
  $currentSha=(Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash.ToLowerInvariant()
  $match=Select-String -LiteralPath $targetPath -Pattern '^source_sha256:\s*([0-9a-fA-F]{64})'|Select-Object -First 1
  $targetSha=if($match){$match.Matches[0].Groups[1].Value.ToLowerInvariant()}else{""}
  if($currentSha -ne $row.sha256 -or $targetSha -ne $row.sha256){$reason="stale-blocked";[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$row.target;recommended_action=(Get-SourceConversionAction $reason)}}
  else{$reason="validated-sidecar";[pscustomobject]@{source=$item;status="ready";reason=$reason;target=$row.target;recommended_action=(Get-SourceConversionAction $reason)}}
 }
}
