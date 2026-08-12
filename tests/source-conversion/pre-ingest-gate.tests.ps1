$ErrorActionPreference="Stop"
$repo=Resolve-Path (Join-Path $PSScriptRoot "..\..")
$vault=Join-Path $repo ".tmp\pre-ingest-vault"
if(Test-Path $vault){Remove-Item -Recurse -Force $vault}
New-Item -ItemType Directory -Force (Join-Path $vault "tools\config"),(Join-Path $vault "raw\assets"),(Join-Path $vault "research\assets"),(Join-Path $vault "wiki\_extractions")|Out-Null
$toolFiles=@("assert-source-ingest-ready.ps1","run-vault-source-conversion.ps1","run-source-extraction.ps1","source-conversion-readiness.ps1","source-to-markdown.py","test-content-ingest-sidecars.ps1","test-source-conversion-policy.ps1","resolve-python-runtime.ps1")
foreach($name in $toolFiles){Copy-Item (Join-Path $repo "tools\$name") (Join-Path $vault "tools\$name")}
Copy-Item (Join-Path $repo "tools\config\source-conversion-policy.json") (Join-Path $vault "tools\config\source-conversion-policy.json")
Copy-Item (Join-Path $repo "tools\config\python-runtime-contract.json") (Join-Path $vault "tools\config\python-runtime-contract.json")
$gate=Join-Path $vault "tools\assert-source-ingest-ready.ps1"
$runner=Join-Path $vault "tools\run-vault-source-conversion.ps1"
$lint=Join-Path $vault "tools\test-content-ingest-sidecars.ps1"
$native=Join-Path $vault "raw\assets\native.md"
$fresh=Join-Path $vault "raw\assets\fresh.txt"
$manifest=Join-Path $vault "fixture-manifest.txt"
Set-Content -Encoding UTF8 $native "# native"
Set-Content -Encoding UTF8 $fresh (("fresh source with searchable content. "*20).Trim())
try{
 & $gate -SourcePath "raw/assets/native.md" -Intent ContentLevel -Json|Out-Null
 & $gate -SourcePath "raw/assets/native.md" -Intent InventoryOnly -Json|Out-Null
 $before=(Get-FileHash $fresh -Algorithm SHA256).Hash
 $ready=(& $gate -SourcePath "raw/assets/fresh.txt" -Intent ContentLevel -Json|Out-String)|ConvertFrom-Json
 if($ready.status -ne "ready" -or $ready.reason -ne "validated-sidecar"){throw "Fresh source did not pass through a validated sidecar."}
 if((Get-FileHash $fresh -Algorithm SHA256).Hash -ne $before){throw "Conversion modified the original source."}
 $sidecar=Join-Path $vault $ready.target
 $text=Get-Content -Raw $sidecar
 if($text -notmatch 'source:\s+.+raw/assets/fresh.txt' -or $text -notmatch 'source_sha256: [0-9a-f]{64}'){throw "Sidecar does not preserve original identity and fingerprint."}
 & $lint -SourcePath "raw/assets/fresh.txt"|Out-Null
 "raw/assets/fresh.txt"|Set-Content -Encoding UTF8 $manifest
 Set-Content -Encoding UTF8 $fresh (("changed source with searchable content. "*20).Trim())
 & $runner -Mode Manifest -Manifest $manifest|Out-Null
 $row=Import-Csv (Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv")|Where-Object source -eq "raw/assets/fresh.txt"
 if($row.state -ne "stale-blocked"){throw "Changed original must block the stale sidecar."}
 $blockedOutput=& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $gate -SourcePath "raw/assets/fresh.txt" -Intent ContentLevel -Json 2>$null
 $blockedExit=$LASTEXITCODE
 $blocked=($blockedOutput|Out-String)|ConvertFrom-Json
 if($blockedExit -ne 2 -or $blocked.status -ne "blocked" -or $blocked.reason -ne "stale-blocked"){throw "Authoritative gate did not block stale source."}
 try{& $lint -SourcePath "raw/assets/fresh.txt"|Out-Null;throw "Post-ingest lint unexpectedly passed stale source."}catch{if($_.Exception.Message -like "Post-ingest lint unexpectedly*"){throw}}
 $diskSource=Join-Path $vault "raw\assets\disk.txt";Set-Content -Encoding UTF8 $diskSource (("disk source content. "*20).Trim())
 $policyPath=Join-Path $vault "tools\config\source-conversion-policy.json"
 $policy=Get-Content -Raw $policyPath|ConvertFrom-Json
 $policy.thresholds.minimum_free_disk_gib=999999
 $policyJson=$policy|ConvertTo-Json -Depth 8
 $policyWritten=$false
 for($attempt=1;$attempt -le 20;$attempt++){
  try{
   Set-Content -Encoding UTF8 $policyPath $policyJson
   $policyWritten=$true
   break
  }catch [System.IO.IOException]{
   if($attempt -eq 20){throw}
   Start-Sleep -Milliseconds 100
  }
 }
 if(-not $policyWritten){throw "Temporary policy fixture could not be written."}
 $ErrorActionPreference="Continue";$errorOutput=& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $gate -SourcePath "raw/assets/disk.txt" -Intent ContentLevel -Json 2>$null;$errorCode=$LASTEXITCODE;$ErrorActionPreference="Stop"
 $errorResult=($errorOutput|Out-String)|ConvertFrom-Json
 if($errorCode -ne 2 -or $errorResult.status -ne "blocked" -or $errorResult.reason -notlike "reconciliation-error:*"){throw "Gate did not return a structured reconciliation error."}
 $outside=Join-Path $vault "outside.txt";Set-Content $outside "outside"
 try{& $gate -SourcePath $outside -Intent ContentLevel -Json|Out-Null;throw "Outside path unexpectedly passed."}catch{if($_.Exception.Message -like "Outside path unexpectedly*"){throw}}
}finally{if(Test-Path $vault){Remove-Item -Recurse -Force $vault}}
Write-Host "Pre-ingest gate tests passed."
