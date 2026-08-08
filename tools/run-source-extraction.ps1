param(
 [switch]$Convert,[switch]$Validate,[switch]$Pilot,[switch]$Metadata,[int]$Limit=0,[string]$Backend="auto",
 [switch]$AnalyzeBundles,[switch]$Overwrite,[string]$Manifest="",[string]$ReportDir="wiki/_outputs/source-conversions"
)
$ErrorActionPreference="Stop"
$vault=Split-Path -Parent $PSScriptRoot
$candidates=@(
 (Join-Path $env:USERPROFILE ".cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"),
 (Join-Path (Split-Path -Parent $vault) ".venvs\sb-extract\Scripts\python.exe")
)|Select-Object -Unique
$python=$candidates|Where-Object{Test-Path -LiteralPath $_}|Select-Object -First 1
if(-not $python){throw "No approved Python runtime found."}
Push-Location $vault
try{
 if($Metadata){& $python "tools/source-to-markdown.py" "--metadata";if($LASTEXITCODE -ne 0){throw "Converter metadata failed."};return}
 $arguments=[Collections.Generic.List[string]]::new()
 foreach($arg in @("tools/source-to-markdown.py","--roots","raw/assets","research/assets","--defer-scanned-pdf")){$arguments.Add($arg)}
 if($Pilot){foreach($arg in @("--pilot","--output-dir","wiki/_outputs/source-conversions","--report-dir",$ReportDir)){$arguments.Add($arg)}}
 else{
  foreach($arg in @("--sidecar","--output-dir","wiki/_extractions","--report-dir",$ReportDir,"--backend",$Backend)){$arguments.Add($arg)}
  if($Convert){$arguments.Add("--convert")}
  if($Validate -or $Convert){$arguments.Add("--validate")}
 }
 if($Limit -gt 0){$arguments.Add("--limit");$arguments.Add([string]$Limit)}
 if($AnalyzeBundles){$arguments.Add("--analyze-bundles")}
 if($Overwrite){$arguments.Add("--overwrite")}
 if($Manifest){$arguments.Add("--include-manifest");$arguments.Add($Manifest)}
 $previousErrorAction=$ErrorActionPreference
 $ErrorActionPreference="Continue"
 & $python $arguments
 $pythonExitCode=$LASTEXITCODE
 $ErrorActionPreference=$previousErrorAction
 if($pythonExitCode -ne 0){throw "Source extraction failed with exit code $pythonExitCode"}
}finally{Pop-Location}
