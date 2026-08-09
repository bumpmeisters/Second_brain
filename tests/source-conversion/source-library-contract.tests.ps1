$ErrorActionPreference = "Stop"

$vault = Resolve-Path (Join-Path $PSScriptRoot "..\..")
Push-Location $vault
try {
    function Assert-Ignored([string]$Path) {
        & git check-ignore --quiet --no-index -- $Path
        if ($LASTEXITCODE -ne 0) { throw "Expected Git to ignore: $Path" }
    }

    function Assert-NotIgnored([string]$Path) {
        & git check-ignore --quiet --no-index -- $Path
        if ($LASTEXITCODE -eq 0) { throw "Expected Git not to ignore: $Path" }
    }

    Assert-Ignored "raw/assets/example.pdf"
    Assert-Ignored "raw/assets/nested/example.docx"
    Assert-Ignored "research/assets/example.pptx"
    Assert-Ignored "research/assets/nested/example.xlsx"

    Assert-NotIgnored "raw/assets/README.md"
    Assert-NotIgnored "research/assets/README.md"
    Assert-NotIgnored "raw/Clippings/example.md"
    Assert-NotIgnored "research/example.md"

    $converter = Join-Path $vault "tools\source-to-markdown.py"
    $skillConverter = Join-Path $vault "skills\vault-source-conversion\scripts\source-to-markdown.py"
    $converterText = Get-Content -LiteralPath $converter -Raw
    if ($converterText -match "DEFAULT_EXTERNAL_ROOTS" -or $converterText -match '"--quellen"') {
        throw "Converter still contains a hard-coded quellen shortcut."
    }
    if ((Get-FileHash -LiteralPath $converter -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $skillConverter -Algorithm SHA256).Hash) {
        throw "Skill converter copy must remain byte-identical to the canonical tool."
    }

    & (Join-Path $vault "tools\sync-source-converter.ps1") -Check | Out-Null
    $python = & (Join-Path $vault "tools\resolve-python-runtime.ps1") -Purpose Agent -PathOnly
    if (-not (Test-Path -LiteralPath $python)) { throw "Approved Python runtime not found: $python" }

    $tempRoot = [System.IO.Path]::GetFullPath((Join-Path $vault ".tmp"))
    $testRoot = [System.IO.Path]::GetFullPath((Join-Path $tempRoot "source-library-contract"))
    if (-not $testRoot.StartsWith(($tempRoot.TrimEnd('\') + '\'), [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing unsafe test cleanup path: $testRoot"
    }
    if (Test-Path -LiteralPath $testRoot) { Remove-Item -LiteralPath $testRoot -Recurse -Force }
    New-Item -ItemType Directory -Force -Path $testRoot | Out-Null
    try {
        & $python $converter --roots raw/assets research/assets --sidecar --output-dir .tmp/source-library-contract/local
        if ($LASTEXITCODE -ne 0) { throw "Local source inventory failed." }
        $localRows = @(Import-Csv (Join-Path $testRoot "local\source-inventory.csv"))
        $expectedSourceFiles = @(
            Get-ChildItem -LiteralPath "raw/assets", "research/assets" -Recurse -File -Force |
                Where-Object { $_.FullName -notin @(
                    (Join-Path $vault "raw\assets\README.md"),
                    (Join-Path $vault "research\assets\README.md")
                ) }
        ).Count
        $setupReadmes = $localRows | Where-Object { $_.source -in @("raw/assets/README.md", "research/assets/README.md") }
        if ($localRows.Count -ne $expectedSourceFiles -or $setupReadmes) {
            throw "Local inventory must match the source files and exclude tracked setup READMEs."
        }
        if ($expectedSourceFiles -gt 0) {
            $rawRow = $localRows | Where-Object { $_.source -like "raw/assets/*.pdf" } | Select-Object -First 1
            $researchRow = $localRows | Where-Object { $_.source -like "research/assets/*.docx" } | Select-Object -First 1
            if ($null -eq $rawRow -or $rawRow.target -notlike ".tmp/source-library-contract/local/raw/assets/*") {
                throw "Raw sidecar target does not mirror raw/assets."
            }
            if ($null -eq $researchRow -or $researchRow.target -notlike ".tmp/source-library-contract/local/research/assets/*") {
                throw "Research sidecar target does not mirror research/assets."
            }
        }

        $external = Join-Path $testRoot "external"
        New-Item -ItemType Directory -Force -Path $external | Out-Null
        [System.IO.File]::WriteAllBytes((Join-Path $external "example.docx"), [byte[]](1, 2, 3))
        & $python $converter --external-root "imported/source=$external" --sidecar --output-dir .tmp/source-library-contract/external
        if ($LASTEXITCODE -ne 0) { throw "Generic external-root inventory failed." }
        $externalRows = @(Import-Csv (Join-Path $testRoot "external\source-inventory.csv"))
        if ($externalRows[0].source -ne "imported/source/example.docx") {
            throw "Generic external-root citation prefix was not preserved."
        }

        $bundleRaw = Join-Path $testRoot "bundle-raw"
        $bundleResearch = Join-Path $testRoot "bundle-research"
        $bundleRelative = "Context_Engineering"
        $bundleExtended = Join-Path $bundleRelative "Context engineering extended"
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleRaw $bundleExtended) | Out-Null
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleRaw "Client_A\Topic\Run") | Out-Null
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleResearch $bundleExtended) | Out-Null
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleResearch "Client_A\Topic\Run") | Out-Null
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleResearch "Client_B\Topic\Run") | Out-Null
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleResearch "Client_C\Topic\Run") | Out-Null

        $baselineBytes = [System.Text.Encoding]::UTF8.GetBytes("baseline research content")
        [System.IO.File]::WriteAllBytes((Join-Path $bundleRaw "$bundleRelative\20251218_Context engineering baseline.docx"), $baselineBytes)
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "$bundleRelative\20251218_Context engineering baseline.docx"), $baselineBytes)
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "$bundleRelative\20251218_Context engineering baseline.pdf"), [byte[]](9, 8, 7))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "$bundleExtended\20251219_Advanced Context Engineering_Gemini_custom prompt.docx"), [byte[]](1, 1, 1))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "$bundleExtended\20251219_Advanced Context Engineering_GPT52_my prompt.docx"), [byte[]](2, 2, 2))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "$bundleRelative\20251221_Context Engineering Marketing Template Blueprints_Gemini.docx"), [byte[]](3, 3, 3))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_A\Topic\Run\20251220_shared-template.docx"), [byte[]](4, 4, 4))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_B\Topic\Run\20251220_shared-template.docx"), [byte[]](4, 4, 4))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_B\Topic\Run\20251219_baseline.docx"), [byte[]](6, 6, 5))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleRaw "Client_A\Topic\Run\20251220_shared-template.docx"), [byte[]](4, 4, 4))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_A\Topic\Run\20251221_best output.docx"), [byte[]](5, 5, 5))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_B\Topic\Run\20251221_draft.docx"), [byte[]](6, 6, 6))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_C\Topic\Run\20251219_baseline.docx"), [byte[]](7, 7, 7))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_C\Topic\Run\20251220_option-a.docx"), [byte[]](8, 8, 8))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_C\Topic\Run\20251220_option-b.docx"), [byte[]](9, 9, 9))
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_C\Topic\Run\20251221_final_prompt.docx"), [byte[]](10, 10, 10))
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleResearch "Client_C\Topic\Run\older") | Out-Null
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_C\Topic\Run\older\20251222_final.docx"), [byte[]](11, 11, 11))
        New-Item -ItemType Directory -Force -Path (Join-Path $bundleResearch "Client_C\Topic\Run\experiments") | Out-Null
        [System.IO.File]::WriteAllBytes((Join-Path $bundleResearch "Client_C\Topic\Run\experiments\20251223_final.docx"), [byte[]](12, 12, 12))

        & $python $converter `
            --external-root "raw/assets=$bundleRaw" `
            --external-root "research/assets=$bundleResearch" `
            --sidecar `
            --output-dir .tmp/source-library-contract/bundle-output `
            --analyze-bundles
        if ($LASTEXITCODE -ne 0) { throw "Bundle analysis failed." }

        $bundleRows = @(Import-Csv (Join-Path $testRoot "bundle-output\source-bundle-analysis.csv"))
        if ($bundleRows.Count -ne 18) { throw "Bundle analysis must contain every fixture source." }
        $contextRows = @($bundleRows | Where-Object { $_.source -like "*Context_Engineering*" })
        if (($contextRows | Select-Object -ExpandProperty bundle_id -Unique).Count -ne 1) {
            throw "Mirrored raw/research project folders must resolve to one bundle."
        }
        $collisionRows = @($bundleRows | Where-Object { $_.source -like "*Topic/Run*" })
        if (($collisionRows | Select-Object -ExpandProperty bundle_id -Unique).Count -ne 3) {
            throw "Different projects must not collide, even when they share trailing folders and duplicate templates."
        }
        $baselineRows = @($bundleRows | Where-Object { $_.source -like "*20251218_Context engineering baseline.docx" })
        if ($baselineRows.Count -ne 2 -or ($baselineRows | Select-Object -ExpandProperty duplicate_group -Unique).Count -ne 1) {
            throw "Byte-identical cross-layer files must share a duplicate group."
        }
        if (($baselineRows | Select-Object -ExpandProperty canonical_source -Unique) -ne "research/assets/Context_Engineering/20251218_Context engineering baseline.docx") {
            throw "AI research must be canonical for an exact raw/research duplicate."
        }
        $formatRows = @($bundleRows | Where-Object { $_.source -like "*20251218_Context engineering baseline.*" })
        if (($formatRows | Select-Object -ExpandProperty format_family -Unique).Count -ne 1) {
            throw "Same-stem DOCX/PDF exports must share a format family."
        }
        $customGemini = $bundleRows | Where-Object { $_.source -like "*Gemini_custom prompt.docx" }
        if ($customGemini.model -ne "gemini" -or $customGemini.prompt_variant -ne "custom-prompt") {
            throw "Model and custom-prompt variants must be detected from filenames."
        }
        $myPrompt = $bundleRows | Where-Object { $_.source -like "*GPT52_my prompt.docx" }
        if ($myPrompt.model -ne "gpt-5.2" -or $myPrompt.prompt_variant -ne "my-prompt") {
            throw "GPT-5.2 and my-prompt variants must be detected from filenames."
        }
        $finalCandidate = $bundleRows | Where-Object { $_.source -like "*20251221*Blueprints*" }
        if ($finalCandidate.artifact_role -ne "final-candidate") {
            throw "The latest non-draft synthesis-like artifact must be a final candidate."
        }
        $bestOutput = $bundleRows | Where-Object { $_.source -like "*best output.docx" }
        if ($bestOutput.artifact_role -ne "final-candidate" -or $bestOutput.notes -like "*chronology*") {
            throw "Explicit best-output filenames must be final candidates without chronology notes."
        }
        $draft = $bundleRows | Where-Object { $_.source -like "*20251221_draft.docx" }
        if ($draft.artifact_role -eq "final-candidate") {
            throw "Draft, working, experiment, test, old, or archive paths must not become chronology-based final candidates."
        }
        $preDraftResult = $bundleRows | Where-Object { $_.source -like "*Client_B*20251220_shared-template.docx" }
        if ($preDraftResult.artifact_role -ne "final-candidate") {
            throw "A newer excluded draft must not suppress the latest eligible final candidate."
        }
        $parallelLatest = @($bundleRows | Where-Object { $_.source -like "*Client_C*20251220*" })
        if (@($parallelLatest | Where-Object artifact_role -eq "final-candidate").Count -ne 0) {
            throw "Multiple latest-date format families must remain parallel branches."
        }
        $finalPrompt = $bundleRows | Where-Object { $_.source -like "*20251221_final_prompt.docx" }
        if ($finalPrompt.artifact_role -eq "final-candidate") {
            throw "Prompt variants must not become final candidates even when their filename contains final."
        }
        $oldFinal = $bundleRows | Where-Object { $_.source -like "*/older/20251222_final.docx" }
        if ($oldFinal.artifact_role -eq "final-candidate") {
            throw "Artifacts in excluded working paths must not become explicit final candidates."
        }
        $experimentFinal = $bundleRows | Where-Object { $_.source -like "*/experiments/20251223_final.docx" }
        if ($experimentFinal.artifact_role -eq "final-candidate") {
            throw "Artifacts in plural experiments paths must not become explicit final candidates."
        }
    }
    finally {
        if (Test-Path -LiteralPath $testRoot) { Remove-Item -LiteralPath $testRoot -Recurse -Force }
    }

    Write-Host "Source library Git contract: PASS"
}
finally {
    Pop-Location
}
