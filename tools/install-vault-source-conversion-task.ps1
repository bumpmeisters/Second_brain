param(
 [string]$TaskName="Second Brain Vault Source Conversion",
 [ValidateSet("Daily","Weekly")][string]$Frequency="Daily",
 [ValidateSet("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")][string]$DayOfWeek="Sunday",
 [string]$At="03:00",
 [switch]$UserBound,
 [switch]$InspectOnly
)
$ErrorActionPreference="Stop"
$vaultRoot=Resolve-Path (Join-Path $PSScriptRoot "..")
$runner=Join-Path $vaultRoot "tools\import-source-inbox.ps1"
if(-not(Test-Path $runner)){throw "Runner script not found: $runner"}
$arguments="-NoProfile -ExecutionPolicy Bypass -File `"$runner`""
$runLevel="Limited"
$logonType=if($UserBound){"Interactive"}else{"S4U"}
$multipleInstances="IgnoreNew"
$runtimeHours=6
$startWhenAvailable=$true
$description="Policy-bound Second Brain inbox admission and create-only source conversion."
$definition=[ordered]@{task_name=$TaskName;frequency=$Frequency;day_of_week=if($Frequency -eq "Weekly"){$DayOfWeek}else{$null};at=$At;runner=$runner;arguments=$arguments;working_directory=$vaultRoot.Path;run_level=$runLevel;logon_type=$logonType;start_when_available=$startWhenAvailable;multiple_instances=$multipleInstances;execution_time_limit_hours=$runtimeHours}
if($InspectOnly){$definition|ConvertTo-Json -Depth 4;exit 0}
$time=[datetime]::ParseExact($At,"HH:mm",$null)
$powershell=Join-Path $env:WINDIR "System32\WindowsPowerShell\v1.0\powershell.exe"
$action=New-ScheduledTaskAction -Execute $powershell -Argument $arguments -WorkingDirectory $vaultRoot
$trigger=if($Frequency -eq "Daily"){New-ScheduledTaskTrigger -Daily -At $time}else{New-ScheduledTaskTrigger -Weekly -DaysOfWeek $DayOfWeek -At $time}
$settings=New-ScheduledTaskSettingsSet -StartWhenAvailable:$startWhenAvailable -ExecutionTimeLimit (New-TimeSpan -Hours $runtimeHours) -MultipleInstances $multipleInstances
$principal=New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType $logonType -RunLevel $runLevel
$task=New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Description $description
Register-ScheduledTask -TaskName $TaskName -InputObject $task -Force|Out-Null
$info=Get-ScheduledTaskInfo -TaskName $TaskName
[pscustomobject]@{task=$TaskName;frequency=$Frequency;next_run=$info.NextRunTime;last_run=$info.LastRunTime;last_result=$info.LastTaskResult}
