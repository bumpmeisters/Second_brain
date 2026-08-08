param([switch]$Check)
$ErrorActionPreference="Stop"
$vault=Resolve-Path (Join-Path $PSScriptRoot "..")
$canonical=Join-Path $vault "tools\source-to-markdown.py"
$packaged=Join-Path $vault "skills\vault-source-conversion\scripts\source-to-markdown.py"
if($Check){
 if(-not(Test-Path $packaged) -or (Get-FileHash $canonical -Algorithm SHA256).Hash -ne (Get-FileHash $packaged -Algorithm SHA256).Hash){throw "Packaged converter differs from canonical converter."}
 Write-Host "Packaged converter is synchronized."
}else{
 Copy-Item -Force $canonical $packaged
 Write-Host "Packaged converter synchronized."
}
