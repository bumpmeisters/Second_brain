$ErrorActionPreference="Stop"
$repo=Resolve-Path (Join-Path $PSScriptRoot "..\..")
$vault=Join-Path $repo ".tmp\source-inbox-vault"
if(Test-Path $vault){Remove-Item -Recurse -Force $vault}
New-Item -ItemType Directory -Force (Join-Path $vault "tools\config"),(Join-Path $vault "inbox\raw\nested"),(Join-Path $vault "inbox\research"),(Join-Path $vault "raw\assets"),(Join-Path $vault "research\assets")|Out-Null
Copy-Item (Join-Path $repo "tools\import-source-inbox.ps1") (Join-Path $vault "tools\import-source-inbox.ps1")
Copy-Item (Join-Path $repo "tools\config\source-inbox-policy.json") (Join-Path $vault "tools\config\source-inbox-policy.json")
$archiveFixture=Join-Path $vault "archive-fixture.txt";Set-Content -Encoding UTF8 $archiveFixture "immutable repository snapshot"
$approvedZip=Join-Path $vault "inbox\raw\nested\approved-repository.zip";Compress-Archive -LiteralPath $archiveFixture -DestinationPath $approvedZip
$badZip=Join-Path $vault "inbox\raw\nested\bad-repository.zip";Compress-Archive -LiteralPath $archiveFixture -DestinationPath $badZip
$testPolicyPath=Join-Path $vault "tools\config\source-inbox-policy.json";$testPolicy=Get-Content -Raw $testPolicyPath|ConvertFrom-Json
$testPolicy.repository_archives=@($testPolicy.repository_archives)+@(
 [pscustomobject]@{lane="raw";relative_path="nested/approved-repository.zip";sha256=(Get-FileHash $approvedZip -Algorithm SHA256).Hash.ToLowerInvariant()},
 [pscustomobject]@{lane="raw";relative_path="nested/bad-repository.zip";sha256=("0"*64)}
)
$testPolicy|ConvertTo-Json -Depth 8|Set-Content -Encoding UTF8 $testPolicyPath
$runner=Join-Path $vault "tools\import-source-inbox.ps1"
try{
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\raw\nested\one.docx") (("one content "*30).Trim())
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\research\report.md") "# AI research"
 $result=& $runner -VaultRoot $vault -StabilitySeconds 0 -SkipConversion|ConvertFrom-Json
 if($result.admitted -ne 3 -or $result.quarantined -ne 1){throw "Valid inbox files or repository archive integrity checks were not handled correctly."}
 if(-not(Test-Path (Join-Path $vault "raw\assets\nested\one.docx")) -or -not(Test-Path (Join-Path $vault "raw\assets\nested\approved-repository.zip")) -or -not(Test-Path (Join-Path $vault "research\imports\report.md"))){throw "Inbox paths were not preserved."}
 if(-not(Test-Path (Join-Path $vault "inbox\_quarantine\integrity\raw\nested\bad-repository.zip"))){throw "Repository archive with mismatched SHA-256 was not quarantined."}
 $originalHash=(Get-FileHash (Join-Path $vault "raw\assets\nested\one.docx")).Hash
 Copy-Item (Join-Path $vault "raw\assets\nested\one.docx") (Join-Path $vault "inbox\raw\nested\one.docx")
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\raw\nested\conflict.docx") "new"
 Set-Content -Encoding UTF8 (Join-Path $vault "raw\assets\nested\conflict.docx") "existing"
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\raw\bad.exe") "unsupported"
 Copy-Item (Join-Path $vault "raw\assets\nested\approved-repository.zip") (Join-Path $vault "inbox\raw\nested\unapproved-repository.zip")
 New-Item -ItemType Directory -Force (Join-Path $vault "raw\assets\nested\directory-collision.docx")|Out-Null
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\raw\nested\directory-collision.docx") "cannot replace directory"
 Set-Content -Encoding UTF8 (Join-Path $vault "raw\assets\nested\blocked") "parent is a file"
 New-Item -ItemType Directory -Force (Join-Path $vault "inbox\raw\nested\blocked")|Out-Null
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\raw\nested\blocked\child.pdf") "cannot create parent"
 $result=& $runner -VaultRoot $vault -StabilitySeconds 0 -SkipConversion|ConvertFrom-Json
 if($result.quarantined -ne 6){throw "Duplicate, path conflict, unsupported file, and unapproved repository archive were not quarantined."}
 if((Get-FileHash (Join-Path $vault "raw\assets\nested\one.docx")).Hash -ne $originalHash){throw "Duplicate handling modified an admitted source."}
 if((Get-Content -Raw (Join-Path $vault "raw\assets\nested\conflict.docx")).Trim() -ne "existing"){throw "Conflict handling overwrote an admitted source."}
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\raw\fresh.txt") "fresh"
 Set-Content -Encoding UTF8 (Join-Path $vault "inbox\raw\fresh.exe") "fresh unsupported"
 $result=& $runner -VaultRoot $vault -StabilitySeconds 60 -SkipConversion|ConvertFrom-Json
 if($result.pending -ne 2 -or -not(Test-Path (Join-Path $vault "inbox\raw\fresh.txt")) -or -not(Test-Path (Join-Path $vault "inbox\raw\fresh.exe"))){throw "Unstable file was moved too early."}
 $unsafePolicy=Get-Content -Raw (Join-Path $vault "tools\config\source-inbox-policy.json")|ConvertFrom-Json;$unsafePolicy.automatic_actions.overwrite_existing_sources=$true
 $unsafePath=Join-Path $vault "unsafe-policy.json";$unsafePolicy|ConvertTo-Json -Depth 8|Set-Content -Encoding UTF8 $unsafePath
 $ErrorActionPreference="Continue";& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -VaultRoot $vault -PolicyPath $unsafePath -SkipConversion 2>&1|Out-Null;$code=$LASTEXITCODE;$ErrorActionPreference="Stop"
 if($code -eq 0){throw "Unsafe inbox action policy was accepted."}
 Set-Content -Encoding UTF8 (Join-Path $vault "tools\run-vault-source-conversion.ps1") 'param([string]$Mode,[int]$Limit); Write-Output "{""child"":true}"; exit 0'
 $singleJson=& $runner -VaultRoot $vault -StabilitySeconds 0|Out-String|ConvertFrom-Json
 if($singleJson.conversion_exit_code -ne 0){throw "Conversion child process result was not captured."}
 $lockPath=Join-Path $vault "wiki\_outputs\source-conversions\.inbox.lock";[IO.File]::WriteAllText($lockPath,"held")
 $ErrorActionPreference="Continue";& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $runner -VaultRoot $vault -SkipConversion 2>&1|Out-Null;$code=$LASTEXITCODE;$ErrorActionPreference="Stop"
 if($code -eq 0){throw "Concurrent inbox lock was ignored."}
 Remove-Item -LiteralPath $lockPath -Force
 Write-Host "Source inbox tests passed."
}finally{if(Test-Path $vault){Remove-Item -Recurse -Force $vault}}
