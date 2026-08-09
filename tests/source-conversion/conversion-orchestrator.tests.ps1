$ErrorActionPreference="Stop"
$repo=Resolve-Path (Join-Path $PSScriptRoot "..\..")
$vault=Join-Path $repo ".tmp\orchestrator-vault"
if(Test-Path $vault){Remove-Item -Recurse -Force $vault}
New-Item -ItemType Directory -Force (Join-Path $vault "tools\config"),(Join-Path $vault "raw\assets"),(Join-Path $vault "research\assets")|Out-Null
foreach($name in @("run-vault-source-conversion.ps1","run-source-extraction.ps1","source-to-markdown.py","test-source-conversion-policy.ps1","resolve-python-runtime.ps1")){Copy-Item (Join-Path $repo "tools\$name") (Join-Path $vault "tools\$name")}
Copy-Item (Join-Path $repo "tools\config\source-conversion-policy.json") (Join-Path $vault "tools\config\source-conversion-policy.json")
Copy-Item (Join-Path $repo "tools\config\python-runtime-contract.json") (Join-Path $vault "tools\config\python-runtime-contract.json")
$runner=Join-Path $vault "tools\run-vault-source-conversion.ps1"
function Read-Summary { Get-Content -Raw (Join-Path $vault "wiki\_outputs\source-conversions\latest-run.json")|ConvertFrom-Json }
try{
 $one=Join-Path $vault "raw\assets\one.txt";Set-Content -Encoding UTF8 $one (("one source content. "*30).Trim());$hash=(Get-FileHash $one).Hash
 $archive=Join-Path $vault "raw\assets\repository.zip";Set-Content -Encoding Byte $archive ([byte[]](80,75,3,4))
 & $runner -Mode Incremental|Out-Null
 $summary=Read-Summary
 if($summary.selected -ne 1 -or $summary.green -ne 1 -or $summary.archive -ne 1){throw "Incremental run did not convert exactly one missing source while preserving one inventory-only archive."}
 if((Get-FileHash $one).Hash -ne $hash){throw "Incremental conversion modified its source."}
 $registryBeforeNoop=(Get-FileHash (Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv")).Hash
 & $runner -Mode Incremental|Out-Null
 if((Read-Summary).selected -ne 0){throw "Second incremental run must be an empty delta."}
 if((Get-FileHash (Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv")).Hash -ne $registryBeforeNoop){throw "No-op incremental run rewrote unchanged registry rows."}
 $python=& (Join-Path $repo "tools\resolve-python-runtime.ps1") -Purpose Agent -PathOnly
 $scanned=Join-Path $vault "raw\assets\scanned.pdf"
 & $python -c 'from pypdf import PdfWriter; import sys; w=PdfWriter(); w.add_blank_page(width=612,height=792); w.write(sys.argv[1])' $scanned
 if($LASTEXITCODE -ne 0){throw "Could not create scanned-PDF fixture."}
 $scanManifest=Join-Path $vault "scan-manifest.txt";"raw/assets/scanned.pdf"|Set-Content -Encoding UTF8 $scanManifest
 & $runner -Mode Manifest -Manifest $scanManifest|Out-Null
 $scanRow=Import-Csv (Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv")|Where-Object source -eq "raw/assets/scanned.pdf"
 if($scanRow.state -ne "amber" -or $scanRow.audit_status -ne "deferred-ocr" -or -not(Test-Path (Join-Path $vault $scanRow.target))){throw "OCR deferral was not persisted as a sidecar."}
 & $runner -Mode Rebuild|Out-Null
 $scanRow=Import-Csv (Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv")|Where-Object source -eq "raw/assets/scanned.pdf"
 if($scanRow.state -ne "amber" -or $scanRow.audit_status -ne "deferred-ocr"){throw "Rebuild lost the OCR deferral state."}
 $registry=Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv"
 Set-Content -Encoding UTF8 $registry "broken"
 $ErrorActionPreference="Continue";& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -Mode Incremental 2>&1|Out-Null;$code=$LASTEXITCODE;$ErrorActionPreference="Stop"
 if($code -eq 0){throw "Normal incremental run accepted a corrupt registry."}
 & $runner -Mode Rebuild|Out-Null
 if(-not(Import-Csv $registry|Where-Object source -eq "raw/assets/one.txt")){throw "Rebuild did not recover the corrupt registry."}
 $defaultPolicyPath=Join-Path $vault "tools\config\source-conversion-policy.json";$policy=Get-Content -Raw $defaultPolicyPath|ConvertFrom-Json
 $blockedPolicyPath=Join-Path $vault "blocked-policy.json";$policy.eligible_extensions=@($policy.eligible_extensions|Where-Object{$_ -ne ".txt"});$policy|ConvertTo-Json -Depth 8|Set-Content -Encoding UTF8 $blockedPolicyPath
 $blocked=Join-Path $vault "raw\assets\blocked.txt";Set-Content -Encoding UTF8 $blocked (("blocked policy content. "*30).Trim())
 & $runner -Mode Incremental -PolicyPath $blockedPolicyPath|Out-Null
 $blockedRow=Import-Csv $registry|Where-Object source -eq "raw/assets/blocked.txt"
 if($blockedRow.state -ne "policy-blocked" -or (Test-Path (Join-Path $vault $blockedRow.target))){throw "Narrowed policy still converted a blocked extension."}
 foreach($n in 2..4){Set-Content -Encoding UTF8 (Join-Path $vault "raw\assets\$n.txt") (("source $n content. "*30).Trim())}
 & $runner -Mode Backfill -Limit 2|Out-Null
 if((Read-Summary).selected -ne 2){throw "Backfill limit was not honored."}
 $lockPath=Join-Path $vault "wiki\_outputs\source-conversions\.conversion.lock"
 New-Item -ItemType Directory -Force (Split-Path $lockPath)|Out-Null
 $held=[IO.File]::Open($lockPath,[IO.FileMode]::Create,[IO.FileAccess]::ReadWrite,[IO.FileShare]::None)
 try{$ErrorActionPreference="Continue";& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -Mode Inventory 2>&1|Out-Null;$code=$LASTEXITCODE;$ErrorActionPreference="Stop";if($code -eq 0){throw "Overlapping run unexpectedly succeeded."};if(-not(Test-Path $lockPath)){throw "Rejected overlap removed the active lock."}}finally{$held.Dispose();if(Test-Path $lockPath){Remove-Item -Force $lockPath}}
 Set-Content $lockPath "stale";(Get-Item $lockPath).LastWriteTime=(Get-Date).AddHours(-12)
 & $runner -Mode Inventory|Out-Null
 if(Test-Path $lockPath){throw "Stale lock was not recovered."}
 $builtinPolicyPath=Join-Path $vault "builtin-policy.json";$policy=Get-Content -Raw $defaultPolicyPath|ConvertFrom-Json;$policy.backend="builtin";$policy|ConvertTo-Json -Depth 8|Set-Content -Encoding UTF8 $builtinPolicyPath
 $bad=Join-Path $vault "raw\assets\bad.docx";[IO.File]::WriteAllBytes($bad,[byte[]](1,2,3,4))
 $manifest=Join-Path $vault "bad-manifest.txt";"raw/assets/bad.docx"|Set-Content -Encoding UTF8 $manifest
 $ErrorActionPreference="Continue";& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -Mode Manifest -Manifest $manifest -PolicyPath $builtinPolicyPath 2>&1|Out-Null;$code=$LASTEXITCODE;$ErrorActionPreference="Stop"
 if($code -eq 0){throw "Conversion failure unexpectedly returned success."}
 $failed=Import-Csv (Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv")|Where-Object source -eq "raw/assets/bad.docx"
 if($failed.state -ne "red" -or $failed.audit_status -ne "failed"){throw "Conversion failure was not recorded durably."}
 $badBackfill=Join-Path $vault "raw\assets\bad-backfill.docx";[IO.File]::WriteAllBytes($badBackfill,[byte[]](1,2,3,4))
 foreach($n in 10..29){Set-Content -Encoding UTF8 (Join-Path $vault "raw\assets\good-$n.txt") (("good backfill content $n. "*30).Trim())}
 $backfillPolicyPath=Join-Path $vault "backfill-policy.json";$backfillPolicy=Get-Content -Raw $defaultPolicyPath|ConvertFrom-Json;$backfillPolicy.backend="builtin";$backfillPolicy.thresholds.maximum_failure_rate_percent=5;$backfillPolicy|ConvertTo-Json -Depth 8|Set-Content -Encoding UTF8 $backfillPolicyPath
 $ErrorActionPreference="Continue";$backfillOutput=@(& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -Mode Backfill -Limit 21 -PolicyPath $backfillPolicyPath 2>&1);$code=$LASTEXITCODE;$ErrorActionPreference="Stop"
 if($code -ne 0){throw ("Below-threshold backfill failure stopped the wave: " + ($backfillOutput -join "`n"))}
 $failed=Import-Csv (Join-Path $vault "wiki\_outputs\source-conversions\source-conversion-registry.csv")|Where-Object source -eq "raw/assets/bad-backfill.docx"
 if($failed.state -ne "red" -or $failed.audit_status -ne "failed"){throw "Below-threshold backfill failure was not quarantined."}
 $policy=Get-Content -Raw $defaultPolicyPath|ConvertFrom-Json
 $policy.thresholds.minimum_free_disk_gib=999999
 $diskPolicy=Join-Path $vault "disk-policy.json";$policy|ConvertTo-Json -Depth 8|Set-Content -Encoding UTF8 $diskPolicy
 $ErrorActionPreference="Continue";& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -Mode Inventory -PolicyPath $diskPolicy 2>&1|Out-Null;$code=$LASTEXITCODE;$ErrorActionPreference="Stop"
 if($code -eq 0){throw "Insufficient-disk preflight unexpectedly passed."}
}finally{if(Test-Path $vault){Remove-Item -Recurse -Force $vault}}
Write-Host "Conversion orchestrator tests passed."
