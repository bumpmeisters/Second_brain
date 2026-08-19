$ErrorActionPreference = 'Stop'
$vault = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$installer = Join-Path $vault 'tools\install-youtube-intelligence-task.ps1'
$definition = (& $installer -InspectOnly | Out-String) | ConvertFrom-Json
$policy = Get-Content -LiteralPath (Join-Path $vault 'tools\config\youtube-intelligence-policy.json') -Raw | ConvertFrom-Json

if ($definition.frequency -ne 'Weekly' -or $definition.day_of_week -ne 'Sunday' -or $definition.at -ne '07:00') {
    throw 'YouTube task must default to Sunday at 07:00 local time.'
}
if ($definition.runner -notmatch 'run-youtube-intelligence-scheduled.ps1$') {
    throw 'YouTube task must use the bounded scheduled runner.'
}
if ($definition.arguments -match 'full-history|allow-full-history') {
    throw 'Scheduled action must never widen into full-history acquisition.'
}
if ($definition.logon_type -ne 'S4U' -or $definition.run_level -ne 'Limited') {
    throw 'Default YouTube task must use a limited S4U principal.'
}
if (-not $definition.start_when_available -or $definition.multiple_instances -ne 'IgnoreNew') {
    throw 'Missed-run and overlap protections are incomplete.'
}
if (-not $definition.network_required -or $definition.execution_time_limit_minutes -gt 75) {
    throw 'Network and runtime protections are incomplete.'
}
if ($policy.recurring_execution.runtime_limit_minutes -gt 60 -or $policy.max_transcripts_per_run -gt 100) {
    throw 'Policy limits exceed the approved schedule contract.'
}
$userBound = (& $installer -InspectOnly -UserBound | Out-String) | ConvertFrom-Json
if ($userBound.logon_type -ne 'Interactive' -or $userBound.run_level -ne 'Limited') {
    throw 'User-bound fallback must remain limited and interactive.'
}
Write-Host 'YouTube scheduled-task contract tests passed.'
