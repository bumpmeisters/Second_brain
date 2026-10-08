function Get-SourceConversionAction([string]$Reason){
 switch($Reason){
  "native-markdown" { "read original Markdown"; break }
  "validated-sidecar" { "read sidecar and cite original"; break }
  "pdf-coverage-incomplete" { "inspect covered pages; request separate completion, never infer absence from partial text"; break }
  "pdf-coverage-unknown" { "legacy PDF: inspect original and plan approved coverage migration"; break }
  "pdf-text-review-required" { "inspect blank/image pages in original; OCR needs explicit approval"; break }
  "missing-target" { "retry policy-bound conversion"; break }
  "stale-blocked" { "request approved regeneration"; break }
  "amber" { "review extraction quality before ingest"; break }
  "red" { "repair converter/backend and retry"; break }
  "unregistered" { "run policy-bound reconciliation"; break }
  default { "review source-conversion exception"; break }
 }
}
function Get-PdfSidecarCoverage([string]$Path){
 $text=Get-Content -LiteralPath $Path -Raw
 $meta=@{}
 $parts=$text -split '---',3
 $front=if($parts.Count -eq 3 -and -not $parts[0].Trim()){$parts[1]}else{""}
 foreach($m in [regex]::Matches($front,'(?m)^(pdf_[a-z_]+):\s*([^\r\n]+)')){$meta[$m.Groups[1].Value]=$m.Groups[2].Value.Trim()}
 $reason="pdf-coverage-unknown"
 if($meta.pdf_coverage_version -eq "1"){
  $total=0;$processed=0
  $valid=[int]::TryParse($meta.pdf_pages_total,[ref]$total) -and [int]::TryParse($meta.pdf_pages_processed,[ref]$processed)
  $markers=@([regex]::Matches($text,'(?m)^## Page (\d+)\r?$'))
  $sequence=$valid -and $processed -eq $markers.Count
  for($i=0;$i -lt $markers.Count;$i++){if([int]$markers[$i].Groups[1].Value -ne $i+1){$sequence=$false}}
  $reason=if(-not $valid -or $total -lt 0 -or $meta.pdf_coverage -eq "unknown"){"pdf-coverage-unknown"}else{"pdf-coverage-incomplete"}
  if($sequence -and $total -gt 0 -and $total -eq $processed -and $meta.pdf_coverage -eq "complete" -and $meta.pdf_pages_missing -eq "none" -and $meta.pdf_stop_reason -eq "complete"){
   $reason=if($meta.pdf_text_quality -eq "text-present" -and $meta.pdf_pages_without_text -eq "none"){"validated-sidecar"}else{"pdf-text-review-required"}
  }
 }
 [pscustomobject]@{reason=$reason;coverage=$meta.pdf_coverage;total=$meta.pdf_pages_total;processed=$meta.pdf_pages_processed;missing=$meta.pdf_pages_missing;stop_reason=$meta.pdf_stop_reason}
}
function Get-SourceConversionReadiness {
 param([string[]]$Source,[string]$RegistryPath,[string[]]$NativeMarkdownExtensions,[string]$VaultRoot)
 $registry=@{}
 if(Test-Path $RegistryPath){foreach($row in Import-Csv $RegistryPath){$registry[$row.source]=$row}}
 foreach($item in $Source){
  if([IO.Path]::GetExtension($item).ToLowerInvariant() -in $NativeMarkdownExtensions){$reason="native-markdown";[pscustomobject]@{source=$item;status="ready";reason=$reason;target=$null;recommended_action=(Get-SourceConversionAction $reason)};continue}
  $row=$registry[$item]
  if(-not $row){$reason="unregistered";[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$null;recommended_action=(Get-SourceConversionAction $reason)};continue}
  $pdf=$null
  $candidateTarget=Join-Path $VaultRoot $row.target
  if([IO.Path]::GetExtension($item).ToLowerInvariant() -eq ".pdf" -and (Test-Path -LiteralPath $candidateTarget -PathType Leaf)){$pdf=Get-PdfSidecarCoverage $candidateTarget}
  if($row.state -ne "green"){$reason=if($pdf -and $row.state -eq "amber" -and $pdf.reason -ne "validated-sidecar"){$pdf.reason}else{$row.state};[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$row.target;coverage=$pdf;recommended_action=(Get-SourceConversionAction $reason)};continue}
  $sourcePath=Join-Path $VaultRoot $item;$targetPath=Join-Path $VaultRoot $row.target
  if(-not(Test-Path -LiteralPath $targetPath -PathType Leaf)){$reason="missing-target";[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$row.target;recommended_action=(Get-SourceConversionAction $reason)};continue}
  $currentSha=(Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash.ToLowerInvariant()
  $match=Select-String -LiteralPath $targetPath -Pattern '^source_sha256:\s*([0-9a-fA-F]{64})'|Select-Object -First 1
  $targetSha=if($match){$match.Matches[0].Groups[1].Value.ToLowerInvariant()}else{""}
  if($currentSha -ne $row.sha256 -or $targetSha -ne $row.sha256){$reason="stale-blocked";[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$row.target;recommended_action=(Get-SourceConversionAction $reason)}}
  elseif($pdf -and $pdf.reason -ne "validated-sidecar"){$reason=$pdf.reason;[pscustomobject]@{source=$item;status="blocked";reason=$reason;target=$row.target;coverage=$pdf;recommended_action=(Get-SourceConversionAction $reason)}}
  else{$reason="validated-sidecar";[pscustomobject]@{source=$item;status="ready";reason=$reason;target=$row.target;coverage=$pdf;recommended_action=(Get-SourceConversionAction $reason)}}
 }
}
