$ErrorActionPreference = 'Stop'
$script:TestsRun = 0; $script:TestsFailed = 0
function Assert-True([bool]$Condition,[string]$Message){$script:TestsRun++;if(!$Condition){$script:TestsFailed++;Write-Host "FAIL: $Message" -ForegroundColor Red}else{Write-Host "PASS: $Message" -ForegroundColor Green}}
function Assert-Throws([scriptblock]$Action,[string]$Pattern,[string]$Message){$ok=$false;try{& $Action}catch{$ok=$_.Exception.Message -match $Pattern};Assert-True $ok $Message}
$testRoot=Split-Path -Parent $MyInvocation.MyCommand.Path
$repo=Split-Path -Parent (Split-Path -Parent $testRoot)
. (Join-Path $repo 'tools/newsletter-intelligence.ps1')
Get-ChildItem -LiteralPath $testRoot -Filter '*.tests.ps1'|Sort-Object Name|ForEach-Object{. $_.FullName}
Write-Host "`n$script:TestsRun assertions; $script:TestsFailed failed."
if($script:TestsFailed -gt 0){exit 1}
