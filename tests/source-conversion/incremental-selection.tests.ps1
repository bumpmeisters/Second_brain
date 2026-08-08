$ErrorActionPreference="Stop"
$vault=Resolve-Path (Join-Path $PSScriptRoot "..\..")
$python=Join-Path $env:USERPROFILE ".cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
$converter=Join-Path $vault "tools\source-to-markdown.py"
$root=Join-Path $vault ".tmp\incremental-selection"
if(Test-Path $root){Remove-Item -Recurse -Force $root}
New-Item -ItemType Directory -Force (Join-Path $root "sources")|Out-Null
Set-Content -Encoding UTF8 (Join-Path $root "sources\native.md") "# native"
Set-Content -Encoding UTF8 (Join-Path $root "sources\new.txt") "new source"
try{
 Push-Location $vault
 & $python $converter --external-root "raw/assets=$($root)\sources" --sidecar --output-dir .tmp/incremental-selection/out --report-dir .tmp/incremental-selection/report
 if($LASTEXITCODE -ne 0){throw "Inventory failed."}
 $rows=@(Import-Csv (Join-Path $root "report\source-inventory.csv"))
 $native=$rows|Where-Object source -eq "raw/assets/native.md"
 if($native.action -ne "native" -or $native.target){throw "Native Markdown must not create a derivative."}
 & $python $converter --external-root "raw/assets=$($root)\sources" --sidecar --output-dir .tmp/incremental-selection/out --report-dir .tmp/incremental-selection/report --convert --include-source raw/assets/new.txt
 if($LASTEXITCODE -ne 0){throw "Selected conversion failed."}
 $target=(Get-ChildItem (Join-Path $root "out") -Recurse -Filter "new.txt.md"|Select-Object -First 1).FullName
 if(-not(Test-Path $target)){throw "Selected source was not converted."}
 if(Get-Content $target|Where-Object{$_ -match "[ `t]+$"}){throw "Generated sidecar contains trailing whitespace."}
 $hash=(Get-FileHash $target).Hash
 & $python $converter --external-root "raw/assets=$($root)\sources" --sidecar --output-dir .tmp/incremental-selection/out --report-dir .tmp/incremental-selection/report --convert --include-source raw/assets/new.txt
 if((Get-FileHash $target).Hash -ne $hash){throw "Idempotent run changed existing sidecar."}
}finally{Pop-Location;if(Test-Path $root){Remove-Item -Recurse -Force $root}}
Write-Host "Incremental selection tests passed."
