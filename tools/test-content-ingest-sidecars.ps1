param([Parameter(Mandatory=$true)][string[]]$SourcePath)
$ErrorActionPreference="Stop"
$vaultRoot=Resolve-Path (Join-Path $PSScriptRoot "..")
$policy=Get-Content -Raw (Join-Path $vaultRoot "tools\config\source-conversion-policy.json")|ConvertFrom-Json
. (Join-Path $PSScriptRoot "source-conversion-readiness.ps1")
$registryPath=Join-Path $vaultRoot "wiki\_outputs\source-conversions\source-conversion-registry.csv"
$result=@(Get-SourceConversionReadiness -Source @($SourcePath|ForEach-Object{$_.Replace("\","/")}) -RegistryPath $registryPath -NativeMarkdownExtensions @($policy.native_markdown_extensions) -VaultRoot $vaultRoot)
$blocked=@($result|Where-Object status -eq "blocked")
if($blocked.Count){$blocked|Format-Table -AutoSize;throw "Content-ingested binary sources are missing green sidecars."}
Write-Host "Content-ingest sidecar lint passed."
