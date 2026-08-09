$ErrorActionPreference="Stop"
$vault=Resolve-Path (Join-Path $PSScriptRoot "..\..")
$installer=Join-Path $vault "tools\install-vault-source-conversion-task.ps1"
$json=& $installer -InspectOnly|Out-String
$d=$json|ConvertFrom-Json
if($d.frequency -ne "Daily"){throw "Default schedule must be daily."}
if($d.runner -notmatch "import-source-inbox.ps1$"){throw "Scheduled action must run inbox admission before conversion."}
if($d.arguments -match "Overwrite|OCR"){throw "Scheduled action widens authority."}
$inboxPolicy=Get-Content -Raw (Join-Path $vault "tools\config\source-inbox-policy.json")|ConvertFrom-Json
if($inboxPolicy.conversion_limit -lt 1 -or $inboxPolicy.conversion_limit -gt 250){throw "Scheduled inbox conversion batch is unbounded."}
if($d.logon_type -ne "S4U"){throw "Scheduled task must support logged-out local operation."}
if($d.run_level -ne "Limited" -or -not $d.start_when_available -or $d.multiple_instances -ne "IgnoreNew"){throw "Scheduled task safety settings are incomplete."}
if($d.execution_time_limit_hours -gt 6){throw "Scheduled task runtime is unbounded."}
$userJson=& $installer -InspectOnly -UserBound|Out-String
$user=$userJson|ConvertFrom-Json
if($user.logon_type -ne "Interactive" -or $user.run_level -ne "Limited"){throw "User-bound task must use the limited interactive principal."}
Write-Host "Scheduled task contract tests passed."
