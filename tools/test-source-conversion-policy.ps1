param([string]$PolicyPath = "")
$ErrorActionPreference = "Stop"
$vaultRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
if (-not $PolicyPath) { $PolicyPath = Join-Path $vaultRoot "tools\config\source-conversion-policy.json" }
if (-not [System.IO.Path]::IsPathRooted($PolicyPath)) { $PolicyPath = Join-Path $vaultRoot $PolicyPath }
if (-not (Test-Path -LiteralPath $PolicyPath)) { throw "Source conversion policy not found: $PolicyPath" }
$policy = Get-Content -Raw -LiteralPath $PolicyPath | ConvertFrom-Json
$expectedRoots = @("raw/assets", "research/assets")
$roots = @($policy.approved_roots)
if ($roots.Count -ne $expectedRoots.Count -or @($roots | Where-Object { $_ -notin $expectedRoots }).Count) { throw "Policy contains unknown or missing approved roots." }
$allowedExtensions = @(".txt", ".csv", ".json", ".yaml", ".yml", ".html", ".htm", ".docx", ".pdf", ".pptx", ".xlsx")
foreach ($extension in @($policy.eligible_extensions)) { if ($extension -notin $allowedExtensions) { throw "Policy contains unknown eligible extension: $extension" } }
foreach ($extension in @($policy.native_markdown_extensions)) { if ($extension -notin @(".md", ".markdown")) { throw "Policy contains unsafe native Markdown extension: $extension" } }
if($policy.backend -notin @("auto","builtin","pandoc","markitdown","docling")){throw "Policy contains unknown backend: $($policy.backend)"}
$actions = $policy.automatic_actions
if (-not $actions.create_missing_sidecars -or -not $actions.validate_sidecars -or -not $actions.update_registry) { throw "Policy must authorize create-only conversion, validation, and registry updates." }
foreach ($unsafe in @("overwrite_sidecars", "run_ocr", "modify_sources", "delete_files", "semantic_ingest")) { if ($actions.$unsafe) { throw "Unsafe automatic action is enabled: $unsafe" } }
if ([int]$policy.thresholds.maximum_failure_rate_percent -lt 0 -or [int]$policy.thresholds.maximum_failure_rate_percent -gt 5) { throw "Failure threshold must remain between 0 and 5 percent." }
if ([int]$policy.thresholds.minimum_free_disk_gib -lt 1) { throw "Minimum free disk headroom must be at least 1 GiB." }
if ([int]$policy.thresholds.lock_timeout_minutes -lt 1) { throw "Lock timeout must be positive." }
$metadataJson=& (Join-Path $vaultRoot "tools\run-source-extraction.ps1") -Metadata|Out-String
$metadata=$metadataJson|ConvertFrom-Json
if($metadata.converter_profile_version -ne $policy.converter_profile_version){throw "Converter profile differs from policy."}
if(@(Compare-Object @($metadata.native_markdown_extensions) @($policy.native_markdown_extensions)).Count){throw "Converter native Markdown extensions differ from policy."}
foreach($extension in @($policy.eligible_extensions)){if($extension -notin @($metadata.convertible_extensions)){throw "Policy enables an extension unsupported by the converter: $extension"}}
[pscustomobject]@{ valid = $true; policy = (Resolve-Path $PolicyPath).Path; profile = $policy.converter_profile_version }
