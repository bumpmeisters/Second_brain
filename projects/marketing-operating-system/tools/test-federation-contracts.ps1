[CmdletBinding()]
param(
    [string]$VaultRoot,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$results = [System.Collections.Generic.List[object]]::new()
$tempRoot = $null
$cleanupVerified = $false
$suiteError = $null

function Get-Sha256 {
    param([string]$LiteralPath)

    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Resolve-InRoot {
    param(
        [string]$Root,
        [string]$RepositoryRelativePath
    )

    if ([System.IO.Path]::IsPathRooted($RepositoryRelativePath)) {
        throw "Expected repository-relative path: $RepositoryRelativePath"
    }

    $resolvedRoot = [System.IO.Path]::GetFullPath($Root).TrimEnd('\')
    $candidate = [System.IO.Path]::GetFullPath((Join-Path $resolvedRoot ($RepositoryRelativePath -replace '/', '\')))
    $rootWithSeparator = $resolvedRoot + '\'
    if (($candidate -ne $resolvedRoot) -and (-not $candidate.StartsWith($rootWithSeparator, [System.StringComparison]::OrdinalIgnoreCase))) {
        throw "Path escapes root: $RepositoryRelativePath"
    }

    return $candidate
}

function Copy-IntoTemp {
    param([string]$RepositoryRelativePath)

    $source = Resolve-InRoot -Root $resolvedVaultRoot -RepositoryRelativePath $RepositoryRelativePath
    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
        throw "Required test input is missing: $RepositoryRelativePath"
    }

    $destination = Resolve-InRoot -Root $tempRoot -RepositoryRelativePath $RepositoryRelativePath
    $destinationParent = Split-Path -Parent $destination
    if (-not (Test-Path -LiteralPath $destinationParent -PathType Container)) {
        $null = New-Item -ItemType Directory -Path $destinationParent -Force
    }
    Copy-Item -LiteralPath $source -Destination $destination -Force
}

function Set-RegistryMutation {
    param(
        [string]$SourcePath,
        [string]$DestinationPath,
        [object]$Mutation
    )

    $rows = @(Import-Csv -LiteralPath $SourcePath)
    $operation = [string]$Mutation.operation
    switch ($operation) {
        'none' { }
        'duplicate-row' {
            $matching = @($rows | Where-Object { $_.system_id -eq $Mutation.system_id })
            if ($matching.Count -ne 1) {
                throw "Mutation target is not unique: $($Mutation.system_id)"
            }
            $rows = @($rows) + @($matching[0])
        }
        'set-cell' {
            $matching = @($rows | Where-Object { $_.system_id -eq $Mutation.system_id })
            if ($matching.Count -ne 1) {
                throw "Mutation target is not unique: $($Mutation.system_id)"
            }
            $matching[0].PSObject.Properties[[string]$Mutation.field].Value = [string]$Mutation.value
        }
        'set-cells' {
            $matching = @($rows | Where-Object { $_.system_id -eq $Mutation.system_id })
            if ($matching.Count -ne 1) {
                throw "Mutation target is not unique: $($Mutation.system_id)"
            }
            foreach ($change in $Mutation.changes.PSObject.Properties) {
                $matching[0].PSObject.Properties[$change.Name].Value = [string]$change.Value
            }
        }
        'copy-cell' {
            $matching = @($rows | Where-Object { $_.system_id -eq $Mutation.system_id })
            if ($matching.Count -ne 1) {
                throw "Mutation target is not unique: $($Mutation.system_id)"
            }
            $value = $matching[0].PSObject.Properties[[string]$Mutation.source_field].Value
            $matching[0].PSObject.Properties[[string]$Mutation.target_field].Value = $value
        }
        default {
            throw "Unsupported registry mutation: $operation"
        }
    }

    $rows | Export-Csv -LiteralPath $DestinationPath -NoTypeInformation -Encoding UTF8
}

function Set-HandoffMutation {
    param(
        [string]$SourcePath,
        [string]$DestinationPath,
        [object]$Mutation
    )

    $handoff = Get-Content -LiteralPath $SourcePath -Raw -Encoding UTF8 | ConvertFrom-Json
    $operation = [string]$Mutation.operation
    switch ($operation) {
        'none' { }
        'remove-field' {
            $handoff.PSObject.Properties.Remove([string]$Mutation.field)
        }
        'remove-artifact-field' {
            $artifact = @($handoff.canonical_artifact_refs)[[int]$Mutation.index]
            $artifact.PSObject.Properties.Remove([string]$Mutation.field)
        }
        'append-prohibited-decision' {
            $newDecision = [pscustomobject][ordered]@{
                id = [string]$Mutation.id
                description = [string]$Mutation.description
            }
            $handoff.prohibited_decisions = @($handoff.prohibited_decisions) + @($newDecision)
        }
        'set-artifact-field' {
            $artifact = @($handoff.canonical_artifact_refs)[[int]$Mutation.index]
            $artifact.PSObject.Properties[[string]$Mutation.field].Value = [string]$Mutation.value
        }
        'add-field' {
            $handoff | Add-Member -NotePropertyName ([string]$Mutation.field) -NotePropertyValue ([string]$Mutation.value)
        }
        'set-field' {
            $handoff.PSObject.Properties[[string]$Mutation.field].Value = [string]$Mutation.value
        }
        'replace-specialized-contract-with-mos-draft' {
            $handoff.specialized_contract_ref = [pscustomobject][ordered]@{
                contract_id = [string]$Mutation.contract_id
                canonical_path = [string]$Mutation.canonical_path
                version = [string]$Mutation.version
                sha256 = [string]$Mutation.sha256
                contract_owner = [string]$Mutation.contract_owner
            }
        }
        default {
            throw "Unsupported handoff mutation: $operation"
        }
    }

    $handoff | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $DestinationPath -Encoding UTF8
}

function Remove-VerifiedTempRoot {
    param([string]$LiteralPath)

    if ([string]::IsNullOrWhiteSpace($LiteralPath)) {
        return $true
    }

    $fullPath = [System.IO.Path]::GetFullPath($LiteralPath).TrimEnd('\')
    $tempParent = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath()).TrimEnd('\')
    $leaf = Split-Path -Leaf $fullPath
    $marker = Join-Path $fullPath '.mos-p2b2-test-root'
    if ((Split-Path -Parent $fullPath) -ne $tempParent) {
        throw "Refusing cleanup outside the exact temp parent: $fullPath"
    }
    if ($leaf -notlike 'mos-p2b2-tests-*') {
        throw "Refusing cleanup for unexpected temp name: $leaf"
    }
    if (-not (Test-Path -LiteralPath $marker -PathType Leaf)) {
        throw "Refusing cleanup without test marker: $fullPath"
    }

    Remove-Item -LiteralPath $fullPath -Recurse -Force
    return -not (Test-Path -LiteralPath $fullPath)
}

try {
    if ([string]::IsNullOrWhiteSpace($VaultRoot)) {
        $VaultRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..\..'))
    }
    $resolvedVaultRoot = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')

    $manifestPath = Join-Path $PSScriptRoot '..\evals\fixtures\fixture-cases.json'
    $manifestPath = (Resolve-Path -LiteralPath $manifestPath).Path
    $manifest = Get-Content -LiteralPath $manifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($manifest.fixture_contract -ne 'mos-p2b2-fixtures/v1') {
        throw 'Unsupported fixture contract.'
    }
    if (@($manifest.cases).Count -ne 16) {
        throw "Expected exactly 16 fixture cases; found $(@($manifest.cases).Count)."
    }

    $allFingerprintInputs = @($manifest.accepted_inputs) + @($manifest.fixture_inputs)
    foreach ($input in $allFingerprintInputs) {
        $path = Resolve-InRoot -Root $resolvedVaultRoot -RepositoryRelativePath ([string]$input.canonical_path)
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
            throw "Fingerprint input is missing: $($input.canonical_path)"
        }
        if ((Get-Sha256 -LiteralPath $path) -ne [string]$input.sha256) {
            throw "Fingerprint input changed: $($input.canonical_path)"
        }
    }

    $tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("mos-p2b2-tests-" + [guid]::NewGuid().ToString('N'))
    $null = New-Item -ItemType Directory -Path $tempRoot
    Set-Content -LiteralPath (Join-Path $tempRoot '.mos-p2b2-test-root') -Value 'fixture-only' -Encoding ASCII

    $copyPaths = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($input in $allFingerprintInputs) {
        $null = $copyPaths.Add([string]$input.canonical_path)
    }
    foreach ($path in @(
        'AGENTS.md',
        'projects/marketing-operating-system/AGENTS.md',
        'projects/marketing-operating-system/decisions/log.md',
        'projects/marketing-operating-system/evals/fixtures/fixture-cases.json',
        'projects/marketing-operating-system/tools/validate-federation-contracts.ps1',
        'projects/No and low code_1st Marketing Agent/AGENTS.md',
        'projects/No and low code_1st Marketing Agent/README.md',
        'projects/marketing-contextops/AGENTS.md',
        'projects/ABM-operating-system/AGENTS.md',
        'projects/content-operating-system/AGENTS.md',
        'projects/company-workspaces/AGENTS.md'
    )) {
        $null = $copyPaths.Add($path)
    }
    foreach ($path in $copyPaths) {
        Copy-IntoTemp -RepositoryRelativePath $path
    }

    foreach ($mapping in @($manifest.support_copy_map)) {
        $source = Resolve-InRoot -Root $tempRoot -RepositoryRelativePath ([string]$mapping.source)
        $target = Resolve-InRoot -Root $tempRoot -RepositoryRelativePath ([string]$mapping.target)
        $targetParent = Split-Path -Parent $target
        if (-not (Test-Path -LiteralPath $targetParent -PathType Container)) {
            $null = New-Item -ItemType Directory -Path $targetParent -Force
        }
        Copy-Item -LiteralPath $source -Destination $target -Force
    }

    $protectedTempPaths = @($copyPaths | ForEach-Object { Resolve-InRoot -Root $tempRoot -RepositoryRelativePath $_ })
    $protectedTempPaths += @($manifest.support_copy_map | ForEach-Object { Resolve-InRoot -Root $tempRoot -RepositoryRelativePath ([string]$_.target) })
    $protectedHashesBefore = @{}
    foreach ($path in $protectedTempPaths) {
        $protectedHashesBefore[$path] = Get-Sha256 -LiteralPath $path
    }
    $originalValidatorHash = Get-Sha256 -LiteralPath (Join-Path $PSScriptRoot 'validate-federation-contracts.ps1')

    $caseRoot = Join-Path $tempRoot '_cases'
    $null = New-Item -ItemType Directory -Path $caseRoot
    $tempValidator = Resolve-InRoot -Root $tempRoot -RepositoryRelativePath 'projects/marketing-operating-system/tools/validate-federation-contracts.ps1'
    $tempRegistry = Resolve-InRoot -Root $tempRoot -RepositoryRelativePath 'projects/marketing-operating-system/registry/systems.csv'
    $powershellExe = Join-Path $PSHOME 'powershell.exe'

    foreach ($case in @($manifest.cases)) {
        $caseExtension = if ($case.mode -eq 'Registry') { '.csv' } else { '.json' }
        $casePath = Join-Path $caseRoot ([string]$case.case_id + $caseExtension)
        $fixturePath = Resolve-InRoot -Root $tempRoot -RepositoryRelativePath ([string]$case.fixture)
        if ($case.mode -eq 'Registry') {
            Set-RegistryMutation -SourcePath $fixturePath -DestinationPath $casePath -Mutation $case.mutation
            $validatorOutput = & $powershellExe -NoProfile -ExecutionPolicy Bypass -File $tempValidator -Mode Registry -VaultRoot $tempRoot -RegistryPath $casePath -Json 2>&1
        }
        else {
            Set-HandoffMutation -SourcePath $fixturePath -DestinationPath $casePath -Mutation $case.mutation
            $validatorOutput = & $powershellExe -NoProfile -ExecutionPolicy Bypass -File $tempValidator -Mode Handoff -VaultRoot $tempRoot -RegistryPath $tempRegistry -HandoffPath $casePath -Json 2>&1
        }
        $actualExitCode = $LASTEXITCODE
        $outputText = @($validatorOutput | ForEach-Object { [string]$_ }) -join "`n"
        try {
            $validationResult = $outputText | ConvertFrom-Json
            $actualCodes = @($validationResult.finding_codes | Sort-Object -Unique)
            $validationFindings = @($validationResult.findings)
        }
        catch {
            $actualCodes = @('TEST-RUNNER-INVALID-JSON')
            $validationFindings = @([pscustomobject]@{
                code = 'TEST-RUNNER-INVALID-JSON'
                message = $outputText
            })
        }

        $expectedCodes = @($case.expected_codes | Sort-Object -Unique)
        $missingCodes = @($expectedCodes | Where-Object { $_ -notin $actualCodes })
        $unexpectedCodes = @($actualCodes | Where-Object { $_ -notin $expectedCodes })
        $passed = ($actualExitCode -eq [int]$case.expected_exit_code) -and ($missingCodes.Count -eq 0) -and ($unexpectedCodes.Count -eq 0)
        $results.Add([pscustomobject]@{
            case_id = [string]$case.case_id
            passed = $passed
            expected_exit_code = [int]$case.expected_exit_code
            actual_exit_code = $actualExitCode
            expected_codes = $expectedCodes
            actual_codes = $actualCodes
            missing_codes = $missingCodes
            unexpected_codes = $unexpectedCodes
            validation_findings = $validationFindings
        })
    }

    foreach ($path in $protectedTempPaths) {
        if ((-not (Test-Path -LiteralPath $path -PathType Leaf)) -or ((Get-Sha256 -LiteralPath $path) -ne $protectedHashesBefore[$path])) {
            throw "Rollback check failed for protected temp input: $path"
        }
    }
    foreach ($input in $allFingerprintInputs) {
        $path = Resolve-InRoot -Root $resolvedVaultRoot -RepositoryRelativePath ([string]$input.canonical_path)
        if ((Get-Sha256 -LiteralPath $path) -ne [string]$input.sha256) {
            throw "Non-mutation check failed for vault input: $($input.canonical_path)"
        }
    }
    if ((Get-Sha256 -LiteralPath (Join-Path $PSScriptRoot 'validate-federation-contracts.ps1')) -ne $originalValidatorHash) {
        throw 'Non-mutation check failed for the validator.'
    }
}
catch {
    $suiteError = $_.Exception.Message
}
finally {
    if ($null -ne $tempRoot) {
        try {
            $cleanupVerified = Remove-VerifiedTempRoot -LiteralPath $tempRoot
        }
        catch {
            $cleanupVerified = $false
            if ($null -eq $suiteError) {
                $suiteError = $_.Exception.Message
            }
        }
    }
}

$failedCases = @($results | Where-Object { -not $_.passed })
$suitePassed = ($null -eq $suiteError) -and $cleanupVerified -and ($results.Count -eq 16) -and ($failedCases.Count -eq 0)
$report = [ordered]@{
    test_contract = 'mos-p2b2-fixtures/v1'
    verdict = if ($suitePassed) { 'PASS' } else { 'FAIL' }
    case_count = $results.Count
    passed_count = @($results | Where-Object { $_.passed }).Count
    failed_count = $failedCases.Count
    isolated_temp_cleanup_verified = $cleanupVerified
    vault_mutation = 'none'
    suite_error = $suiteError
    cases = @($results)
}

if ($Json) {
    Write-Output ($report | ConvertTo-Json -Depth 12 -Compress)
}
else {
    Write-Output "$($report.verdict) | $($report.passed_count)/$($report.case_count) fixture cases passed | cleanup: $cleanupVerified | vault mutation: none"
    foreach ($caseResult in $failedCases) {
        Write-Output "FAIL $($caseResult.case_id) | exit $($caseResult.actual_exit_code)/$($caseResult.expected_exit_code) | actual codes: $($caseResult.actual_codes -join ', ') | expected codes: $($caseResult.expected_codes -join ', ')"
    }
    if ($null -ne $suiteError) {
        Write-Output "ERROR $suiteError"
    }
}

if ($suitePassed) {
    exit 0
}
exit 1
