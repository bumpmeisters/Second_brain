param(
 [Parameter(ParameterSetName="Paths",Mandatory=$true)][string[]]$SourcePath,
 [Parameter(ParameterSetName="Manifest",Mandatory=$true)][string]$Manifest,
 [ValidateSet("InventoryOnly","ContentLevel")][string]$Intent="ContentLevel",
 [switch]$Json
)
$ErrorActionPreference="Stop"
$vaultRoot=Resolve-Path (Join-Path $PSScriptRoot "..")
$policy=Get-Content -Raw (Join-Path $vaultRoot "tools\config\source-conversion-policy.json")|ConvertFrom-Json
. (Join-Path $PSScriptRoot "source-conversion-readiness.ps1")
$roots=@($policy.approved_roots|ForEach-Object{Join-Path $vaultRoot $_})
$paths=if($PSCmdlet.ParameterSetName -eq "Manifest"){Get-Content -LiteralPath $Manifest}else{$SourcePath}
$normalized=@(foreach($inputPath in $paths){
 if(-not $inputPath.Trim()){continue}
 $candidate=if([IO.Path]::IsPathRooted($inputPath)){$inputPath}else{Join-Path $vaultRoot $inputPath}
 if(-not(Test-Path -LiteralPath $candidate -PathType Leaf)){throw "Source does not exist: $inputPath"}
 $resolved=(Resolve-Path $candidate).Path
 $inside=$false
 foreach($root in $roots){if($resolved.StartsWith($root+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)){$inside=$true;break}}
 if(-not $inside){throw "Source path is outside approved roots: $inputPath"}
 $resolved.Substring($vaultRoot.Path.Length+1).Replace("\","/")
})
if($Intent -eq "InventoryOnly"){
 $result=@($normalized|ForEach-Object{[pscustomobject]@{source=$_;intent=$Intent;status="ready";reason="inventory-only";target=$null}})
}else{
 $reconciliationError=""
 $binaryPaths=@($normalized|Where-Object{[IO.Path]::GetExtension($_).ToLowerInvariant() -notin @($policy.native_markdown_extensions)})
 if($binaryPaths.Count){
  $temp=Join-Path $env:TEMP ("source-ingest-"+[guid]::NewGuid().ToString("N")+".txt")
  try{$binaryPaths|Set-Content -Encoding UTF8 $temp;try{& (Join-Path $vaultRoot "tools\run-vault-source-conversion.ps1") -Mode Manifest -Manifest $temp|Out-Null}catch{$reconciliationError=$_.Exception.Message}}
  finally{if(Test-Path $temp){Remove-Item -Force $temp}}
 }
 $registryPath=Join-Path $vaultRoot "wiki\_outputs\source-conversions\source-conversion-registry.csv"
 $result=@(Get-SourceConversionReadiness -Source $normalized -RegistryPath $registryPath -NativeMarkdownExtensions @($policy.native_markdown_extensions) -VaultRoot $vaultRoot|ForEach-Object{$reason=$_.reason;if($reconciliationError -and $_.status -eq "blocked"){$reason="reconciliation-error: $reconciliationError"};[pscustomobject]@{source=$_.source;intent=$Intent;status=$_.status;reason=$reason;target=$_.target;recommended_action=$_.recommended_action}})
}
if($Json){$result|ConvertTo-Json -Depth 4}else{$result|Format-Table -AutoSize}
if(@($result|Where-Object status -eq "blocked").Count){exit 2}
