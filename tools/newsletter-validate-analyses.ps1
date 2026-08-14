param([Parameter(Mandatory)][string]$AnalysisPath)
$ErrorActionPreference='Stop'
$resolvedAnalysisPath=(Resolve-Path -LiteralPath $AnalysisPath).Path
. (Join-Path $PSScriptRoot 'newsletter-source-analysis.ps1')
$records=Get-Content -Raw -LiteralPath $resolvedAnalysisPath|ConvertFrom-Json
foreach($record in @($records)){Test-SourceAnalysisCompleteness $record|Out-Null}
[pscustomobject]@{validated=@($records).Count;input=$resolvedAnalysisPath}|ConvertTo-Json
