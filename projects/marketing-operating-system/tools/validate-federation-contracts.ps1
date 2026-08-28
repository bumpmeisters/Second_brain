[CmdletBinding()]
param(
    [ValidateSet('Registry', 'Handoff', 'All')]
    [string]$Mode = 'All',

    [string]$VaultRoot,

    [string]$RegistryPath,

    [string]$HandoffPath,

    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$script:Findings = [System.Collections.Generic.List[object]]::new()
$script:ResolvedVaultRoot = $null

function Add-Finding {
    param(
        [Parameter(Mandatory = $true)][string]$Code,
        [Parameter(Mandatory = $true)][string]$Area,
        [Parameter(Mandatory = $true)][string]$Message,
        [string]$Target = ''
    )

    $script:Findings.Add([pscustomobject]@{
        code = $Code
        area = $Area
        message = $Message
        target = $Target
    })
}

function Test-Property {
    param(
        [object]$Object,
        [string]$Name
    )

    if ($null -eq $Object) {
        return $false
    }

    return $null -ne $Object.PSObject.Properties[$Name]
}

function Get-PropertyValue {
    param(
        [object]$Object,
        [string]$Name
    )

    if (-not (Test-Property -Object $Object -Name $Name)) {
        return $null
    }

    return $Object.PSObject.Properties[$Name].Value
}

function Test-NonEmptyValue {
    param([object]$Value)

    if ($null -eq $Value) {
        return $false
    }

    if ($Value -is [string]) {
        return -not [string]::IsNullOrWhiteSpace($Value)
    }

    return $true
}

function Test-DeclaredType {
    param(
        [object]$Value,
        [string]$DeclaredType
    )

    switch ($DeclaredType) {
        'string' { return $Value -is [string] }
        'array' { return $Value -is [System.Array] }
        'object' { return ($null -ne $Value) -and ($Value -isnot [string]) -and ($Value -isnot [System.Array]) }
        default { return $false }
    }
}

function Resolve-VaultPath {
    param([string]$RepositoryRelativePath)

    if ([string]::IsNullOrWhiteSpace($RepositoryRelativePath)) {
        return $null
    }

    if ([System.IO.Path]::IsPathRooted($RepositoryRelativePath)) {
        return $null
    }

    $candidate = [System.IO.Path]::GetFullPath((Join-Path $script:ResolvedVaultRoot ($RepositoryRelativePath -replace '/', '\')))
    $rootWithSeparator = $script:ResolvedVaultRoot.TrimEnd('\') + '\'
    if (($candidate -ne $script:ResolvedVaultRoot) -and (-not $candidate.StartsWith($rootWithSeparator, [System.StringComparison]::OrdinalIgnoreCase))) {
        return $null
    }

    return $candidate
}

function Get-Sha256 {
    param([string]$LiteralPath)

    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Read-JsonFile {
    param([string]$LiteralPath)

    return Get-Content -LiteralPath $LiteralPath -Raw -Encoding UTF8 | ConvertFrom-Json
}

function Get-FrontmatterValue {
    param(
        [string]$LiteralPath,
        [string]$Field
    )

    if ([System.IO.Path]::GetExtension($LiteralPath) -ne '.md') {
        return $null
    }

    $content = Get-Content -LiteralPath $LiteralPath -Raw -Encoding UTF8
    $frontmatterMatch = [regex]::Match($content, '\A---\r?\n(?<yaml>.*?)\r?\n---(?:\r?\n|\z)', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $frontmatterMatch.Success) {
        return $null
    }

    $match = [regex]::Match($frontmatterMatch.Groups['yaml'].Value, "(?m)^$([regex]::Escape($Field)):\s*([^\r\n]+)\s*$")
    if (-not $match.Success) {
        return $null
    }

    return $match.Groups[1].Value.Trim().Trim('"').Trim("'")
}

function Assert-SchemaBinding {
    param(
        [object]$Schema,
        [string]$ExpectedFormat,
        [string]$SchemaPath
    )

    if ((Get-PropertyValue -Object $Schema -Name 'schema_format') -ne $ExpectedFormat) {
        throw "Unsupported schema format in $SchemaPath."
    }

    $binding = Get-PropertyValue -Object $Schema -Name 'semantic_contract'
    if ($null -eq $binding) {
        throw "Missing semantic_contract binding in $SchemaPath."
    }

    $contractRelativePath = [string](Get-PropertyValue -Object $binding -Name 'canonical_path')
    $contractPath = Resolve-VaultPath -RepositoryRelativePath $contractRelativePath
    if (($null -eq $contractPath) -or (-not (Test-Path -LiteralPath $contractPath -PathType Leaf))) {
        throw "Schema contract does not resolve: $contractRelativePath"
    }

    $expectedHash = [string](Get-PropertyValue -Object $binding -Name 'sha256')
    if ((Get-Sha256 -LiteralPath $contractPath) -ne $expectedHash.ToUpperInvariant()) {
        throw "Schema contract fingerprint mismatch: $contractRelativePath"
    }

    $expectedVersion = [string](Get-PropertyValue -Object $binding -Name 'version')
    $actualVersion = Get-FrontmatterValue -LiteralPath $contractPath -Field 'version'
    if ($actualVersion -ne $expectedVersion) {
        throw "Schema contract version mismatch: $contractRelativePath"
    }
}

function Test-Registry {
    param(
        [string]$LiteralPath,
        [object]$Schema
    )

    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) {
        Add-Finding -Code 'MOS-REG-001' -Area 'registry' -Message 'Registry file does not exist.' -Target $LiteralPath
        return @()
    }

    $rows = @(Import-Csv -LiteralPath $LiteralPath)
    if ($rows.Count -eq 0) {
        Add-Finding -Code 'MOS-REG-001' -Area 'registry' -Message 'Registry has no data rows.' -Target $LiteralPath
        return @()
    }

    $actualColumns = @($rows[0].PSObject.Properties.Name)
    $requiredColumns = @($Schema.required_columns)
    $missingColumns = @($requiredColumns | Where-Object { $_ -notin $actualColumns })
    $additionalColumns = @($actualColumns | Where-Object { $_ -notin $requiredColumns })
    if (($missingColumns.Count -gt 0) -or ((-not [bool]$Schema.additional_columns) -and ($additionalColumns.Count -gt 0))) {
        Add-Finding -Code 'MOS-REG-001' -Area 'registry' -Message "Registry columns do not match the schema. Missing: $($missingColumns -join ', '); additional: $($additionalColumns -join ', ')." -Target $LiteralPath
    }

    foreach ($row in $rows) {
        foreach ($column in $requiredColumns) {
            if (-not (Test-NonEmptyValue -Value (Get-PropertyValue -Object $row -Name $column))) {
                Add-Finding -Code 'MOS-REG-001' -Area 'registry' -Message "Required registry value is empty: $column." -Target ([string]$row.system_id)
            }
        }
    }

    $ids = @($rows | ForEach-Object { [string]$_.system_id })
    $uniqueIds = @($ids | Sort-Object -Unique)
    $requiredIds = @($Schema.required_system_ids)
    if (($ids.Count -ne $uniqueIds.Count) -or (@($ids | Where-Object { $_ -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$' }).Count -gt 0)) {
        Add-Finding -Code 'MOS-REG-002' -Area 'registry' -Message 'system_id values must be unique, lowercase, and hyphenated.' -Target $LiteralPath
    }

    if ((@($requiredIds | Where-Object { $_ -notin $uniqueIds }).Count -gt 0) -or (@($uniqueIds | Where-Object { $_ -notin $requiredIds }).Count -gt 0)) {
        Add-Finding -Code 'MOS-REG-002' -Area 'registry' -Message 'Registry system set does not match the required federation set.' -Target $LiteralPath
    }

    foreach ($enumProperty in $Schema.enums.PSObject.Properties) {
        $field = $enumProperty.Name
        $allowedValues = @($enumProperty.Value)
        foreach ($row in $rows) {
            $value = [string](Get-PropertyValue -Object $row -Name $field)
            if ($value -notin $allowedValues) {
                Add-Finding -Code 'MOS-REG-003' -Area 'registry' -Message "Invalid $field value: $value." -Target ([string]$row.system_id)
            }
        }
    }

    foreach ($row in $rows) {
        foreach ($field in @($Schema.path_fields)) {
            $relativePath = [string](Get-PropertyValue -Object $row -Name $field)
            if ($relativePath -in @('none', 'not-applicable')) {
                continue
            }

            $resolved = Resolve-VaultPath -RepositoryRelativePath $relativePath
            if (($null -eq $resolved) -or (-not (Test-Path -LiteralPath $resolved))) {
                Add-Finding -Code 'MOS-REG-004' -Area 'registry' -Message "Unresolved or out-of-vault $field reference: $relativePath." -Target ([string]$row.system_id)
            }
        }

        $evidence = [string](Get-PropertyValue -Object $row -Name 'evidence_ref')
        foreach ($reference in @($evidence -split [regex]::Escape([string]$Schema.evidence_delimiter))) {
            $trimmedReference = $reference.Trim()
            $resolvedEvidence = Resolve-VaultPath -RepositoryRelativePath $trimmedReference
            if (($null -eq $resolvedEvidence) -or (-not (Test-Path -LiteralPath $resolvedEvidence))) {
                Add-Finding -Code 'MOS-REG-004' -Area 'registry' -Message "Unresolved or out-of-vault evidence reference: $trimmedReference." -Target ([string]$row.system_id)
            }
        }

        if (($row.current_lifecycle_status -eq 'planned') -and (($row.current_operational_authority -ne 'none') -or ($row.current_routing_status -ne 'inactive'))) {
            Add-Finding -Code 'MOS-REG-005' -Area 'registry' -Message 'A planned current shell cannot claim current authority or routing.' -Target ([string]$row.system_id)
        }

        $currentProjection = @($row.current_root, $row.current_lifecycle_status, $row.current_operational_authority, $row.current_routing_status) -join '|'
        $targetProjection = @($row.target_root, $row.target_lifecycle_status, $row.target_operational_authority, $row.target_routing_status) -join '|'
        if (($currentProjection -ne $targetProjection) -and [string]::IsNullOrWhiteSpace([string]$row.next_transition_gate)) {
            Add-Finding -Code 'MOS-REG-006' -Area 'registry' -Message 'A current-to-target transition requires an explicit next gate.' -Target ([string]$row.system_id)
        }

        if ($row.federation_boundary_contract_ref -eq $row.controlling_authority_ref) {
            Add-Finding -Code 'MOS-REG-007' -Area 'registry' -Message 'The federation boundary contract cannot also be the current system controller.' -Target ([string]$row.system_id)
        }
    }

    return $rows
}

function Test-ExpectedObjectFields {
    param(
        [object]$Object,
        [string[]]$Fields,
        [string]$Code,
        [string]$Label
    )

    foreach ($field in $Fields) {
        if (-not (Test-NonEmptyValue -Value (Get-PropertyValue -Object $Object -Name $field))) {
            Add-Finding -Code $Code -Area 'handoff' -Message "$Label is missing required field $field." -Target $Label
        }
    }
}

function Test-ExactReference {
    param(
        [object]$Reference,
        [string]$Label
    )

    if ($null -eq $Reference) {
        return $null
    }

    $relativePath = [string](Get-PropertyValue -Object $Reference -Name 'canonical_path')
    $resolved = Resolve-VaultPath -RepositoryRelativePath $relativePath
    if (($null -eq $resolved) -or (-not (Test-Path -LiteralPath $resolved -PathType Leaf))) {
        Add-Finding -Code 'MOS-HO-007' -Area 'handoff' -Message "$Label does not resolve within the vault: $relativePath." -Target $Label
        return $null
    }

    $expectedHash = [string](Get-PropertyValue -Object $Reference -Name 'sha256')
    if (($expectedHash -notmatch '^[A-F0-9]{64}$') -or ((Get-Sha256 -LiteralPath $resolved) -ne $expectedHash)) {
        Add-Finding -Code 'MOS-HO-003' -Area 'handoff' -Message "$Label fingerprint is missing, malformed, or mismatched." -Target $relativePath
    }

    return $resolved
}

function Test-ContractVersion {
    param(
        [object]$Reference,
        [string]$ResolvedPath,
        [object]$Schema,
        [string]$Label
    )

    if ($null -eq $ResolvedPath) {
        return
    }

    $declaredVersion = [string](Get-PropertyValue -Object $Reference -Name 'version')
    $contractId = [string](Get-PropertyValue -Object $Reference -Name 'contract_id')
    $relativePath = [string](Get-PropertyValue -Object $Reference -Name 'canonical_path')
    if ($declaredVersion -eq [string]$Schema.legacy_unversioned_literal) {
        if ($contractId -ne "legacy:$relativePath") {
            Add-Finding -Code 'MOS-HO-003' -Area 'handoff' -Message "$Label legacy identifier must bind to its exact canonical path." -Target $relativePath
        }

        if (Test-NonEmptyValue -Value (Get-FrontmatterValue -LiteralPath $ResolvedPath -Field 'version')) {
            Add-Finding -Code 'MOS-HO-003' -Area 'handoff' -Message "$Label declares legacy-unversioned although the referenced contract has an intrinsic version." -Target $relativePath
        }
        return
    }

    $actualVersion = Get-FrontmatterValue -LiteralPath $ResolvedPath -Field 'version'
    if ((Test-NonEmptyValue -Value $actualVersion) -and ($actualVersion -ne $declaredVersion)) {
        Add-Finding -Code 'MOS-HO-003' -Area 'handoff' -Message "$Label version does not match the referenced contract." -Target $relativePath
    }
}

function Get-StateRank {
    param(
        [string]$Kind,
        [string]$Value
    )

    $maps = @{
        evidence = @{
            sourced = 0
            inferred = 1
            hypothesis = 1
            'needs-verification' = 2
            contradicted = 3
            missing = 4
        }
        freshness = @{
            current = 0
            unknown = 1
            stale = 2
        }
        approval = @{
            approved = 0
            'not-required' = 0
            pending = 1
            held = 2
            rejected = 3
        }
    }

    if (-not $maps[$Kind].ContainsKey($Value)) {
        return 99
    }

    return [int]$maps[$Kind][$Value]
}

function Test-Handoff {
    param(
        [string]$LiteralPath,
        [object]$Schema,
        [object[]]$RegistryRows
    )

    if ([string]::IsNullOrWhiteSpace($LiteralPath) -or (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf))) {
        Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message 'Handoff file does not exist.' -Target $LiteralPath
        return
    }

    try {
        $handoff = Read-JsonFile -LiteralPath $LiteralPath
    }
    catch {
        Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message "Handoff is not valid JSON: $($_.Exception.Message)" -Target $LiteralPath
        return
    }

    $forbiddenFields = @($Schema.forbidden_payload_fields)
    foreach ($field in @($Schema.required_fields)) {
        $fieldExists = Test-Property -Object $handoff -Name $field
        $fieldValue = Get-PropertyValue -Object $handoff -Name $field
        $emptyValueIsValid = $field -eq 'open_questions'
        if ((-not $fieldExists) -or ((-not $emptyValueIsValid) -and (-not (Test-NonEmptyValue -Value $fieldValue)))) {
            $code = if ($field -eq 'authority_ref') { 'MOS-HO-002' } elseif ($field -match 'owner') { 'MOS-HO-004' } else { 'MOS-HO-001' }
            Add-Finding -Code $code -Area 'handoff' -Message "Required envelope field is missing or empty: $field." -Target $LiteralPath
        }
    }

    foreach ($property in $handoff.PSObject.Properties) {
        if ($property.Name -in $forbiddenFields) {
            Add-Finding -Code 'MOS-HO-008' -Area 'handoff' -Message "Copied payload field is forbidden: $($property.Name)." -Target $LiteralPath
        }
        elseif ((-not [bool]$Schema.additional_fields) -and ($property.Name -notin @($Schema.required_fields))) {
            Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message "Unexpected envelope field: $($property.Name)." -Target $LiteralPath
        }
    }

    foreach ($typeRule in $Schema.field_types.PSObject.Properties) {
        if (Test-Property -Object $handoff -Name $typeRule.Name) {
            # Read the property directly so PowerShell does not unwrap a one-item array
            # or collapse an empty array while returning it from a helper function.
            $value = $handoff.PSObject.Properties[$typeRule.Name].Value
            if (-not (Test-DeclaredType -Value $value -DeclaredType ([string]$typeRule.Value))) {
                Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message "Envelope field has the wrong type: $($typeRule.Name) must be $($typeRule.Value)." -Target $LiteralPath
            }
        }
    }

    if ((Get-PropertyValue -Object $handoff -Name 'envelope_version') -ne $Schema.schema_id) {
        Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message 'Envelope version does not match the handoff schema identifier.' -Target $LiteralPath
    }

    foreach ($enumField in @('evidence_state', 'freshness_state', 'approval_state', 'readiness_state', 'effect_mode')) {
        $value = [string](Get-PropertyValue -Object $handoff -Name $enumField)
        if ((Test-NonEmptyValue -Value $value) -and ($value -notin @($Schema.enums.$enumField))) {
            Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message "Invalid $enumField value: $value." -Target $LiteralPath
        }
    }

    $validatorRef = Get-PropertyValue -Object $handoff -Name 'validator_ref'
    if ($null -ne $validatorRef) {
        Test-ExpectedObjectFields -Object $validatorRef -Fields @($Schema.object_requirements.validator_ref) -Code 'MOS-HO-001' -Label 'validator_ref'
        $validatorState = [string](Get-PropertyValue -Object $validatorRef -Name 'result_state')
        if ((Test-NonEmptyValue -Value $validatorState) -and ($validatorState -notin @($Schema.enums.validator_result_state))) {
            Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message "Invalid validator result state: $validatorState." -Target 'validator_ref'
        }
    }

    $producer = [string](Get-PropertyValue -Object $handoff -Name 'producer_system')
    $consumer = [string](Get-PropertyValue -Object $handoff -Name 'consumer_system')
    foreach ($systemId in @($producer, $consumer)) {
        $row = @($RegistryRows | Where-Object { $_.system_id -eq $systemId })
        if (($row.Count -ne 1) -or ($row[0].current_operational_authority -ne 'active') -or ($row[0].current_routing_status -ne 'active')) {
            Add-Finding -Code 'MOS-HO-011' -Area 'handoff' -Message "System lacks active current authority and routing: $systemId." -Target $systemId
        }
    }

    if ((Test-NonEmptyValue -Value $producer) -and ($producer -eq $consumer)) {
        Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message 'Producer and consumer must be different registered systems.' -Target $LiteralPath
    }

    $sourceProject = [string](Get-PropertyValue -Object $handoff -Name 'source_project')
    $resolvedSourceProject = Resolve-VaultPath -RepositoryRelativePath $sourceProject
    if (($null -eq $resolvedSourceProject) -or (-not (Test-Path -LiteralPath $resolvedSourceProject -PathType Container))) {
        Add-Finding -Code 'MOS-HO-007' -Area 'handoff' -Message 'source_project does not resolve to an existing vault directory.' -Target $sourceProject
    }

    $authority = Get-PropertyValue -Object $handoff -Name 'authority_ref'
    if ($null -ne $authority) {
        Test-ExpectedObjectFields -Object $authority -Fields @($Schema.object_requirements.authority_ref) -Code 'MOS-HO-002' -Label 'authority_ref'
        $authorityPath = Test-ExactReference -Reference $authority -Label 'authority_ref'
        if ($null -ne $authorityPath) {
            try {
                $authorityRecord = Read-JsonFile -LiteralPath $authorityPath
                foreach ($field in @('decision_id', 'decision_actor', 'decision_date')) {
                    if ((Get-PropertyValue -Object $authorityRecord -Name $field) -ne (Get-PropertyValue -Object $authority -Name $field)) {
                        Add-Finding -Code 'MOS-HO-002' -Area 'handoff' -Message "authority_ref $field does not match its decision record." -Target ([string]$authority.canonical_path)
                    }
                }

                if ((Get-PropertyValue -Object $authorityRecord -Name 'status') -ne (Get-PropertyValue -Object $authority -Name 'approval_state')) {
                    Add-Finding -Code 'MOS-HO-002' -Area 'handoff' -Message 'authority_ref approval state does not match its decision record.' -Target ([string]$authority.canonical_path)
                }

                if ((Get-PropertyValue -Object $authorityRecord -Name 'source_project') -ne $sourceProject) {
                    Add-Finding -Code 'MOS-HO-002' -Area 'handoff' -Message 'authority_ref source project does not match the handoff owner.' -Target ([string]$authority.canonical_path)
                }

                $recordScope = @((Get-PropertyValue -Object $authorityRecord -Name 'authorized_scope'))
                $referenceScope = @((Get-PropertyValue -Object $authority -Name 'authorized_scope'))
                if ((@($recordScope | Where-Object { $_ -notin $referenceScope }).Count -gt 0) -or (@($referenceScope | Where-Object { $_ -notin $recordScope }).Count -gt 0)) {
                    Add-Finding -Code 'MOS-HO-002' -Area 'handoff' -Message 'authority_ref scope does not match its decision record.' -Target ([string]$authority.canonical_path)
                }
            }
            catch {
                Add-Finding -Code 'MOS-HO-002' -Area 'handoff' -Message 'authority_ref does not point to a readable JSON decision record.' -Target ([string]$authority.canonical_path)
            }
        }
    }

    $decisionJob = Get-PropertyValue -Object $handoff -Name 'decision_job'
    $allowedDecision = Get-PropertyValue -Object $handoff -Name 'allowed_decision'
    if ($null -ne $decisionJob) {
        Test-ExpectedObjectFields -Object $decisionJob -Fields @($Schema.object_requirements.decision) -Code 'MOS-HO-005' -Label 'decision_job'
    }
    if ($null -ne $allowedDecision) {
        Test-ExpectedObjectFields -Object $allowedDecision -Fields @($Schema.object_requirements.decision) -Code 'MOS-HO-005' -Label 'allowed_decision'
    }

    $prohibited = @((Get-PropertyValue -Object $handoff -Name 'prohibited_decisions'))
    foreach ($decision in $prohibited) {
        Test-ExpectedObjectFields -Object $decision -Fields @($Schema.object_requirements.decision) -Code 'MOS-HO-005' -Label 'prohibited_decision'
    }

    $allowedId = [string](Get-PropertyValue -Object $allowedDecision -Name 'id')
    $prohibitedIds = @($prohibited | ForEach-Object { [string](Get-PropertyValue -Object $_ -Name 'id') })
    if (($allowedId -in $prohibitedIds) -or ($allowedId -in @($Schema.reserved_upstream_decisions))) {
        Add-Finding -Code 'MOS-HO-005' -Area 'handoff' -Message 'Allowed decision overlaps a prohibited or reserved upstream decision.' -Target $allowedId
    }

    if (@($Schema.reserved_upstream_decisions | Where-Object { $_ -notin $prohibitedIds }).Count -gt 0) {
        Add-Finding -Code 'MOS-HO-005' -Area 'handoff' -Message 'The handoff does not prohibit every reserved upstream decision.' -Target $LiteralPath
    }

    if ($null -ne $authority) {
        $authorityScope = @((Get-PropertyValue -Object $authority -Name 'authorized_scope'))
        if ((Test-NonEmptyValue -Value $allowedId) -and ($allowedId -notin $authorityScope)) {
            Add-Finding -Code 'MOS-HO-002' -Area 'handoff' -Message 'Allowed decision is outside the recorded authority scope.' -Target $allowedId
        }
    }

    $contractReferences = @(
        @{ Name = 'input_contract_ref'; Value = (Get-PropertyValue -Object $handoff -Name 'input_contract_ref') },
        @{ Name = 'output_contract_ref'; Value = (Get-PropertyValue -Object $handoff -Name 'output_contract_ref') },
        @{ Name = 'specialized_contract_ref'; Value = (Get-PropertyValue -Object $handoff -Name 'specialized_contract_ref') }
    )
    foreach ($entry in $contractReferences) {
        $reference = $entry.Value
        if ($null -eq $reference) {
            continue
        }

        Test-ExpectedObjectFields -Object $reference -Fields @($Schema.object_requirements.contract_ref) -Code 'MOS-HO-001' -Label $entry.Name
        $resolvedContract = Test-ExactReference -Reference $reference -Label $entry.Name
        Test-ContractVersion -Reference $reference -ResolvedPath $resolvedContract -Schema $Schema -Label $entry.Name
        $owner = [string](Get-PropertyValue -Object $reference -Name 'contract_owner')
        if (@($RegistryRows | Where-Object { $_.system_id -eq $owner }).Count -ne 1) {
            Add-Finding -Code 'MOS-HO-004' -Area 'handoff' -Message "$($entry.Name) owner is not a registered system." -Target $owner
        }

        if (($entry.Name -eq 'specialized_contract_ref') -and ($null -ne $resolvedContract)) {
            $status = Get-FrontmatterValue -LiteralPath $resolvedContract -Field 'status'
            $operationalAuthority = Get-FrontmatterValue -LiteralPath $resolvedContract -Field 'operational_authority'
            if (($status -eq 'draft') -or ($operationalAuthority -eq 'none')) {
                Add-Finding -Code 'MOS-HO-009' -Area 'handoff' -Message 'A draft or non-operational MOS contract cannot be used as the active specialized contract.' -Target ([string]$reference.canonical_path)
            }
        }
    }

    $packet = Get-PropertyValue -Object $handoff -Name 'specialized_packet_ref'
    if ($null -ne $packet) {
        Test-ExpectedObjectFields -Object $packet -Fields @($Schema.object_requirements.specialized_packet_ref) -Code 'MOS-HO-004' -Label 'specialized_packet_ref'
        $packetPath = Test-ExactReference -Reference $packet -Label 'specialized_packet_ref'
        if ((Get-PropertyValue -Object $packet -Name 'packet_owner') -ne $sourceProject) {
            Add-Finding -Code 'MOS-HO-004' -Area 'handoff' -Message 'The specialized packet must remain source-project owned.' -Target ([string]$packet.canonical_path)
        }
        $packetRelativePath = [string](Get-PropertyValue -Object $packet -Name 'canonical_path')
        if (-not $packetRelativePath.StartsWith($sourceProject.TrimEnd('/') + '/', [System.StringComparison]::OrdinalIgnoreCase)) {
            Add-Finding -Code 'MOS-HO-004' -Area 'handoff' -Message 'The specialized packet path must remain inside the source project.' -Target $packetRelativePath
        }
        if ($null -ne $packetPath) {
            try {
                $packetRecord = Read-JsonFile -LiteralPath $packetPath
                foreach ($field in @('packet_id', 'version', 'packet_owner')) {
                    if ((Get-PropertyValue -Object $packetRecord -Name $field) -ne (Get-PropertyValue -Object $packet -Name $field)) {
                        Add-Finding -Code 'MOS-HO-003' -Area 'handoff' -Message "specialized_packet_ref $field does not match the packet." -Target ([string]$packet.canonical_path)
                    }
                }
                if ((Get-PropertyValue -Object $packetRecord -Name 'source_project') -ne $sourceProject) {
                    Add-Finding -Code 'MOS-HO-004' -Area 'handoff' -Message 'The specialized packet source project does not match the handoff owner.' -Target ([string]$packet.canonical_path)
                }
            }
            catch {
                Add-Finding -Code 'MOS-HO-003' -Area 'handoff' -Message 'specialized_packet_ref is not a readable JSON packet.' -Target ([string]$packet.canonical_path)
            }
        }
    }

    $artifacts = @((Get-PropertyValue -Object $handoff -Name 'canonical_artifact_refs'))
    if ($artifacts.Count -eq 0) {
        Add-Finding -Code 'MOS-HO-001' -Area 'handoff' -Message 'At least one canonical artifact reference is required.' -Target $LiteralPath
    }

    foreach ($artifact in $artifacts) {
        foreach ($field in @($Schema.object_requirements.canonical_artifact_ref)) {
            if (-not (Test-NonEmptyValue -Value (Get-PropertyValue -Object $artifact -Name $field))) {
                $code = if ($field -eq 'artifact_owner') { 'MOS-HO-004' } else { 'MOS-HO-001' }
                Add-Finding -Code $code -Area 'handoff' -Message "canonical_artifact_ref is missing required field $field." -Target ([string](Get-PropertyValue -Object $artifact -Name 'artifact_id'))
            }
        }

        $null = Test-ExactReference -Reference $artifact -Label 'canonical_artifact_ref'
        if ((Get-PropertyValue -Object $artifact -Name 'artifact_owner') -ne $sourceProject) {
            Add-Finding -Code 'MOS-HO-004' -Area 'handoff' -Message 'Canonical artifacts must remain source-project owned.' -Target ([string](Get-PropertyValue -Object $artifact -Name 'artifact_id'))
        }
        $artifactRelativePath = [string](Get-PropertyValue -Object $artifact -Name 'canonical_path')
        if (-not $artifactRelativePath.StartsWith($sourceProject.TrimEnd('/') + '/', [System.StringComparison]::OrdinalIgnoreCase)) {
            Add-Finding -Code 'MOS-HO-004' -Area 'handoff' -Message 'Canonical artifact paths must remain inside the source project.' -Target $artifactRelativePath
        }

        foreach ($stateField in @('evidence_state', 'freshness_state', 'approval_state')) {
            $stateValue = [string](Get-PropertyValue -Object $artifact -Name $stateField)
            if ((Test-NonEmptyValue -Value $stateValue) -and ($stateValue -notin @($Schema.enums.$stateField))) {
                Add-Finding -Code 'MOS-HO-006' -Area 'handoff' -Message "Invalid artifact $stateField value: $stateValue." -Target ([string](Get-PropertyValue -Object $artifact -Name 'artifact_id'))
            }
        }
    }

    $evidenceRanks = @($artifacts | ForEach-Object { Get-StateRank -Kind 'evidence' -Value ([string](Get-PropertyValue -Object $_ -Name 'evidence_state')) })
    $freshnessRanks = @($artifacts | ForEach-Object { Get-StateRank -Kind 'freshness' -Value ([string](Get-PropertyValue -Object $_ -Name 'freshness_state')) })
    $approvalRanks = @($artifacts | ForEach-Object { Get-StateRank -Kind 'approval' -Value ([string](Get-PropertyValue -Object $_ -Name 'approval_state')) })
    $envelopeEvidenceRank = Get-StateRank -Kind 'evidence' -Value ([string](Get-PropertyValue -Object $handoff -Name 'evidence_state'))
    $envelopeFreshnessRank = Get-StateRank -Kind 'freshness' -Value ([string](Get-PropertyValue -Object $handoff -Name 'freshness_state'))
    $envelopeApprovalRank = Get-StateRank -Kind 'approval' -Value ([string](Get-PropertyValue -Object $handoff -Name 'approval_state'))

    $weakestEvidence = if ($evidenceRanks.Count -gt 0) { ($evidenceRanks | Measure-Object -Maximum).Maximum } else { 99 }
    $weakestFreshness = if ($freshnessRanks.Count -gt 0) { ($freshnessRanks | Measure-Object -Maximum).Maximum } else { 99 }
    $weakestApproval = if ($approvalRanks.Count -gt 0) { ($approvalRanks | Measure-Object -Maximum).Maximum } else { 99 }
    if (($envelopeEvidenceRank -lt $weakestEvidence) -or ($envelopeFreshnessRank -lt $weakestFreshness) -or ($envelopeApprovalRank -lt $weakestApproval)) {
        Add-Finding -Code 'MOS-HO-006' -Area 'handoff' -Message 'Envelope state hides a weaker canonical-artifact state.' -Target $LiteralPath
    }

    $computedReadiness = 'ready'
    if (($weakestEvidence -ge 2) -or ($weakestFreshness -ge 1) -or ($weakestApproval -ge 1) -or ($envelopeEvidenceRank -ge 2) -or ($envelopeFreshnessRank -ge 1) -or ($envelopeApprovalRank -ge 1)) {
        $computedReadiness = 'blocked'
    }
    elseif (($weakestEvidence -eq 1) -or ($envelopeEvidenceRank -eq 1)) {
        $computedReadiness = 'ready-with-hypotheses'
    }

    if ((Get-PropertyValue -Object $handoff -Name 'readiness_state') -ne $computedReadiness) {
        Add-Finding -Code 'MOS-HO-006' -Area 'handoff' -Message "Declared readiness does not match conservative roll-up: $computedReadiness." -Target $LiteralPath
    }

    $effectMode = [string](Get-PropertyValue -Object $handoff -Name 'effect_mode')
    $rollback = Get-PropertyValue -Object $handoff -Name 'rollback_ref'
    if ($effectMode -eq 'non-mutating') {
        if ($rollback -ne [string]$Schema.not_applicable_literal) {
            Add-Finding -Code 'MOS-HO-010' -Area 'handoff' -Message 'A non-mutating handoff must declare rollback_ref as not-applicable.' -Target $LiteralPath
        }
    }
    elseif ($effectMode -eq 'state-changing') {
        if (($null -eq $rollback) -or ($rollback -is [string])) {
            Add-Finding -Code 'MOS-HO-010' -Area 'handoff' -Message 'A state-changing handoff requires an exact rollback contract reference.' -Target $LiteralPath
        }
        else {
            Test-ExpectedObjectFields -Object $rollback -Fields @($Schema.object_requirements.rollback_ref) -Code 'MOS-HO-010' -Label 'rollback_ref'
            $rollbackPath = Test-ExactReference -Reference $rollback -Label 'rollback_ref'
            Test-ContractVersion -Reference $rollback -ResolvedPath $rollbackPath -Schema $Schema -Label 'rollback_ref'
        }
    }
}

function Write-ValidationResult {
    param(
        [int]$ExitCode,
        [string]$Verdict,
        [hashtable]$Inputs
    )

    $result = [ordered]@{
        validator_id = 'mos-federation-validator/v1-draft'
        mode = $Mode
        verdict = $Verdict
        exit_code = $ExitCode
        inputs = $Inputs
        finding_codes = @($script:Findings | ForEach-Object { $_.code } | Sort-Object -Unique)
        findings = @($script:Findings)
        authority_effect = 'none'
    }

    if ($Json) {
        Write-Output ($result | ConvertTo-Json -Depth 12 -Compress)
    }
    else {
        Write-Output "$Verdict | $($script:Findings.Count) finding(s) | authority effect: none"
        foreach ($finding in $script:Findings) {
            Write-Output "[$($finding.code)] $($finding.message) ($($finding.target))"
        }
    }
}

try {
    if ([string]::IsNullOrWhiteSpace($VaultRoot)) {
        $VaultRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..\..'))
    }
    $script:ResolvedVaultRoot = (Resolve-Path -LiteralPath $VaultRoot).Path.TrimEnd('\')

    if ([string]::IsNullOrWhiteSpace($RegistryPath)) {
        $RegistryPath = Join-Path $script:ResolvedVaultRoot 'projects\marketing-operating-system\registry\systems.csv'
    }
    elseif (-not [System.IO.Path]::IsPathRooted($RegistryPath)) {
        $RegistryPath = Join-Path $script:ResolvedVaultRoot ($RegistryPath -replace '/', '\')
    }

    if ((-not [string]::IsNullOrWhiteSpace($HandoffPath)) -and (-not [System.IO.Path]::IsPathRooted($HandoffPath))) {
        $HandoffPath = Join-Path $script:ResolvedVaultRoot ($HandoffPath -replace '/', '\')
    }

    $registrySchemaPath = Join-Path $PSScriptRoot 'config\system-registry-schema.json'
    $handoffSchemaPath = Join-Path $PSScriptRoot 'config\cross-system-handoff-schema.json'
    $registrySchema = Read-JsonFile -LiteralPath $registrySchemaPath
    $handoffSchema = Read-JsonFile -LiteralPath $handoffSchemaPath
    Assert-SchemaBinding -Schema $registrySchema -ExpectedFormat 'mos-declarative-schema/v1-draft' -SchemaPath $registrySchemaPath
    Assert-SchemaBinding -Schema $handoffSchema -ExpectedFormat 'mos-declarative-schema/v1-draft' -SchemaPath $handoffSchemaPath

    $registryRows = @()
    if ($Mode -in @('Registry', 'All', 'Handoff')) {
        $registryRows = @(Test-Registry -LiteralPath $RegistryPath -Schema $registrySchema)
    }

    if ($Mode -in @('Handoff', 'All')) {
        if ([string]::IsNullOrWhiteSpace($HandoffPath)) {
            throw 'HandoffPath is required for Handoff or All mode.'
        }
        Test-Handoff -LiteralPath $HandoffPath -Schema $handoffSchema -RegistryRows $registryRows
    }

    $inputs = @{
        registry_path = $RegistryPath
        registry_sha256 = if (Test-Path -LiteralPath $RegistryPath -PathType Leaf) { Get-Sha256 -LiteralPath $RegistryPath } else { $null }
        handoff_path = $HandoffPath
        handoff_sha256 = if ((-not [string]::IsNullOrWhiteSpace($HandoffPath)) -and (Test-Path -LiteralPath $HandoffPath -PathType Leaf)) { Get-Sha256 -LiteralPath $HandoffPath } else { $null }
    }

    if ($script:Findings.Count -gt 0) {
        Write-ValidationResult -ExitCode 1 -Verdict 'BLOCK' -Inputs $inputs
        exit 1
    }

    Write-ValidationResult -ExitCode 0 -Verdict 'PASS' -Inputs $inputs
    exit 0
}
catch {
    Add-Finding -Code 'MOS-VAL-001' -Area 'validator' -Message $_.Exception.Message -Target ''
    Write-ValidationResult -ExitCode 2 -Verdict 'ERROR' -Inputs @{
        registry_path = $RegistryPath
        handoff_path = $HandoffPath
    }
    exit 2
}
