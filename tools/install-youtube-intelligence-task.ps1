param(
    [string]$TaskName = 'Second Brain YouTube Intelligence',
    [ValidateSet('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')]
    [string]$DayOfWeek = 'Sunday',
    [string]$At = '07:00',
    [switch]$UserBound,
    [switch]$InspectOnly
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$runner = Join-Path $vaultRoot 'tools\run-youtube-intelligence-scheduled.ps1'
if (-not (Test-Path -LiteralPath $runner -PathType Leaf)) {
    throw "Scheduled runner not found: $runner"
}

$arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$runner`" -VaultRoot `"$vaultRoot`""
$runLevel = 'Limited'
$logonType = if ($UserBound) { 'Interactive' } else { 'S4U' }
$multipleInstances = 'IgnoreNew'
$runtimeMinutes = 75
$startWhenAvailable = $true
$networkRequired = $true
$description = 'Policy-bound weekly YouTube metadata, caption, and create-only admission run.'
$definition = [ordered]@{
    task_name = $TaskName
    frequency = 'Weekly'
    day_of_week = $DayOfWeek
    at = $At
    runner = $runner
    arguments = $arguments
    working_directory = $vaultRoot
    run_level = $runLevel
    logon_type = $logonType
    start_when_available = $startWhenAvailable
    multiple_instances = $multipleInstances
    execution_time_limit_minutes = $runtimeMinutes
    network_required = $networkRequired
}
if ($InspectOnly) {
    $definition | ConvertTo-Json -Depth 4
    exit 0
}

$time = [datetime]::ParseExact($At, 'HH:mm', $null)
$powershell = Join-Path $env:WINDIR 'System32\WindowsPowerShell\v1.0\powershell.exe'
$action = New-ScheduledTaskAction -Execute $powershell -Argument $arguments -WorkingDirectory $vaultRoot
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek $DayOfWeek -At $time
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable:$startWhenAvailable `
    -ExecutionTimeLimit (New-TimeSpan -Minutes $runtimeMinutes) `
    -MultipleInstances $multipleInstances -RunOnlyIfNetworkAvailable:$networkRequired
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType $logonType -RunLevel $runLevel
$task = New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Description $description
Register-ScheduledTask -TaskName $TaskName -InputObject $task -Force | Out-Null
$info = Get-ScheduledTaskInfo -TaskName $TaskName
[pscustomobject]@{
    task = $TaskName
    next_run = $info.NextRunTime
    last_run = $info.LastRunTime
    last_result = $info.LastTaskResult
}
