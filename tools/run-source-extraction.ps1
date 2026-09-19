param(
 [switch]$Convert,[switch]$Validate,[switch]$Pilot,[switch]$Metadata,[int]$Limit=0,[string]$Backend="auto",
 [switch]$AnalyzeBundles,[switch]$Overwrite,[string]$Manifest="",[string]$ReportDir="wiki/_outputs/source-conversions",
 [string]$AnyDocSite="",[string]$PilotBackends="builtin,pandoc,markitdown,docling",
 [ValidateRange(0,2147483647)][int]$MaxPdfPages=0,
 [ValidateRange(1,86400)][int]$PdfTimeoutSeconds=300,
 [ValidateRange(64,65536)][int]$PdfMemoryMiB=2048,
 [ValidateRange(1,2147483647)][int]$PdfMaxInputBytes=209715200,
 [ValidateRange(1,2147483647)][int]$PdfMaxOutputBytes=52428800
)
$ErrorActionPreference="Stop"
$vault=Split-Path -Parent $PSScriptRoot
$resolver=Join-Path $vault "tools\resolve-python-runtime.ps1"
$python=& $resolver -Purpose Agent -PathOnly
if(-not $python){throw "No approved Python runtime found."}
Push-Location $vault
try{
 if($Metadata){& $python "tools/source-to-markdown.py" "--metadata";if($LASTEXITCODE -ne 0){throw "Converter metadata failed."};return}
 $arguments=[Collections.Generic.List[string]]::new()
 foreach($arg in @("tools/source-to-markdown.py","--roots","raw/assets","research/assets","--defer-scanned-pdf")){$arguments.Add($arg)}
 foreach($arg in @("--max-pdf-pages",[string]$MaxPdfPages,"--pdf-timeout-seconds",[string]$PdfTimeoutSeconds,"--pdf-memory-mib",[string]$PdfMemoryMiB,"--pdf-max-input-bytes",[string]$PdfMaxInputBytes,"--pdf-max-output-bytes",[string]$PdfMaxOutputBytes)){$arguments.Add($arg)}
 if($Pilot){foreach($arg in @("--pilot","--output-dir",$ReportDir,"--report-dir",$ReportDir)){$arguments.Add($arg)}}
 else{
  foreach($arg in @("--sidecar","--output-dir","wiki/_extractions","--report-dir",$ReportDir,"--backend",$Backend)){$arguments.Add($arg)}
  if($Convert){$arguments.Add("--convert")}
  if($Validate -or $Convert){$arguments.Add("--validate")}
 }
 if($Limit -gt 0){$arguments.Add("--limit");$arguments.Add([string]$Limit)}
 if($AnyDocSite){$arguments.Add("--anydoc-site");$arguments.Add($AnyDocSite)}
 if($Pilot){$arguments.Add("--pilot-backends");$arguments.Add($PilotBackends)}
 if($Backend -eq "anydoc"){$arguments.Add("--strict")}
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
