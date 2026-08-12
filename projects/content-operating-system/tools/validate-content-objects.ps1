[CmdletBinding()]
param(
    [string]$VaultRoot
)

$ErrorActionPreference = 'Stop'

if (-not $VaultRoot) {
    $VaultRoot = (& git rev-parse --show-toplevel 2>$null).Trim()
}
if (-not $VaultRoot -or -not (Test-Path -LiteralPath $VaultRoot -PathType Container)) {
    throw 'Vault root could not be resolved.'
}

$vaultPath = (Resolve-Path -LiteralPath $VaultRoot).Path
$contractPath = Join-Path $vaultPath 'projects\content-operating-system\tools\config\content-object-contract.json'
$contract = Get-Content -Raw -LiteralPath $contractPath | ConvertFrom-Json
$issues = [System.Collections.Generic.List[string]]::new()

function Add-Issue {
    param([string]$Message)
    $script:issues.Add($Message)
}

function Get-Frontmatter {
    param([string]$Path)

    $text = Get-Content -Raw -LiteralPath $Path
    if (-not $text.StartsWith("---`n") -and -not $text.StartsWith("---`r`n")) {
        return @{}
    }

    $normalized = $text -replace "`r`n", "`n"
    $end = $normalized.IndexOf("`n---`n", 4)
    if ($end -lt 0) {
        return @{}
    }

    $values = @{}
    $frontmatter = $normalized.Substring(4, $end - 4)
    foreach ($line in $frontmatter -split "`n") {
        if ($line -match '^([A-Za-z0-9_-]+):\s*(.*)$') {
            $value = $Matches[2].Trim().Trim('"').Trim("'")
            $values[$Matches[1]] = $value
        }
    }
    return $values
}

function Resolve-VaultRelativePath {
    param(
        [string]$RelativePath,
        [string]$Label
    )

    if (-not $RelativePath -or $RelativePath -eq '-') {
        Add-Issue "$Label is missing."
        return $null
    }
    if ([System.IO.Path]::IsPathRooted($RelativePath)) {
        Add-Issue "$Label must be repository-relative: $RelativePath"
        return $null
    }

    $candidate = [System.IO.Path]::GetFullPath((Join-Path $vaultPath ($RelativePath -replace '/', '\')))
    if (-not $candidate.StartsWith($vaultPath + [System.IO.Path]::DirectorySeparatorChar, [System.StringComparison]::OrdinalIgnoreCase)) {
        Add-Issue "$Label resolves outside the vault: $RelativePath"
        return $null
    }
    return $candidate
}

$objectFiles = Get-ChildItem -LiteralPath (Join-Path $vaultPath 'projects') -Recurse -File -Filter '*.md'
$objects = @()
$idOwners = @{}
$objectByPath = @{}

foreach ($file in $objectFiles) {
    $frontmatter = Get-Frontmatter -Path $file.FullName
    $type = $frontmatter['type']
    if ($type -notin @('content-context-packet', 'creative-direction', 'content-brief', 'performance-record')) {
        continue
    }
    if ($frontmatter['status'] -eq 'template') {
        continue
    }

    $relativePath = $file.FullName.Substring($vaultPath.Length + 1).Replace('\', '/')
    $requiredFields = $contract.required_fields.$type
    foreach ($requiredField in $requiredFields) {
        if ($type -eq 'content-context-packet' -and $requiredField -eq 'readiness') {
            if ($frontmatter['status'] -eq 'superseded' -or $frontmatter['status'] -in @('ready', 'ready-with-hypotheses', 'blocked')) {
                continue
            }
        }
        if (-not $frontmatter[$requiredField]) {
            Add-Issue "$relativePath is missing required field '$requiredField'."
        }
    }

    $idField = $contract.id_fields.$type
    $objectId = $frontmatter[$idField]
    if ($objectId) {
        if ($idOwners.ContainsKey($objectId)) {
            Add-Issue "Duplicate object ID '$objectId' in $relativePath and $($idOwners[$objectId])."
        } else {
            $idOwners[$objectId] = $relativePath
        }
    }

    if ($type -ne 'content-context-packet') {
        $allowedStatuses = @($contract.statuses.$type)
        if ($frontmatter['status'] -notin $allowedStatuses) {
            Add-Issue "$relativePath has invalid $type status '$($frontmatter['status'])'."
        }
    } elseif ($frontmatter['status'] -ne 'superseded') {
        $contextReadiness = if ($frontmatter['readiness']) { $frontmatter['readiness'] } else { $frontmatter['status'] }
        if ($contextReadiness -notin @('ready', 'ready-with-hypotheses', 'blocked')) {
            Add-Issue "$relativePath has invalid readiness '$contextReadiness'."
        }
    }

    $sourceProject = Resolve-VaultRelativePath -RelativePath $frontmatter['source_project'] -Label "$relativePath source_project"
    if ($sourceProject -and -not (Test-Path -LiteralPath $sourceProject -PathType Container)) {
        Add-Issue "$relativePath references missing source project '$($frontmatter['source_project'])'."
    }
    if ($frontmatter['source_project'] -match '^(raw|research)(/|$)') {
        Add-Issue "$relativePath assigns a protected source root as source_project."
    }
    if ($frontmatter['source_project']) {
        $expectedObjectPrefix = $frontmatter['source_project'].TrimEnd('/') + '/authority/'
        if (-not $relativePath.StartsWith($expectedObjectPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
            Add-Issue "$relativePath is outside its source-project authority folder."
        }
    }

    $objects += [PSCustomObject]@{
        Type = $type
        Id = $objectId
        Path = $relativePath
        FullPath = $file.FullName
        Meta = $frontmatter
    }
    $objectByPath[$relativePath] = $objects[-1]
}

$directions = @{}
$contentSourceProjects = @{}
foreach ($direction in @($objects | Where-Object Type -eq 'creative-direction')) {
    $directionId = $direction.Meta['direction_id']
    if ($directionId) {
        $directions[$directionId] = $direction
    }
    $contentId = $direction.Meta['content_id']
    $sourceProject = $direction.Meta['source_project']
    if ($contentId -and $sourceProject) {
        if ($contentSourceProjects.ContainsKey($contentId) -and $contentSourceProjects[$contentId] -ne $sourceProject) {
            Add-Issue "content_id '$contentId' is assigned to more than one source project."
        } else {
            $contentSourceProjects[$contentId] = $sourceProject
        }
    }
    if ($direction.Meta['status'] -eq 'approved') {
        if (-not $contentId) {
            Add-Issue "$($direction.Path) cannot be approved without content_id."
        }
        $approvalPath = Resolve-VaultRelativePath -RelativePath $direction.Meta['approval_record'] -Label "$($direction.Path) approval_record"
        if ($approvalPath -and -not (Test-Path -LiteralPath $approvalPath -PathType Leaf)) {
            Add-Issue "$($direction.Path) approval_record does not exist."
        }
    }
}

$briefs = @{}
foreach ($brief in @($objects | Where-Object Type -eq 'content-brief')) {
    $briefId = $brief.Meta['brief_id']
    if ($briefId) {
        $briefs[$briefId] = $brief
    }
    $directionId = $brief.Meta['direction_id']
    if (-not $directionId -or -not $directions.ContainsKey($directionId)) {
        Add-Issue "$($brief.Path) references missing direction_id '$directionId'."
    } else {
        $direction = $directions[$directionId]
        if ($brief.Meta['content_id'] -ne $direction.Meta['content_id']) {
            Add-Issue "$($brief.Path) does not match its direction content_id."
        }
        if ($brief.Meta['source_project'] -ne $direction.Meta['source_project']) {
            Add-Issue "$($brief.Path) does not match its direction source_project."
        }
        if ($brief.Meta['status'] -eq 'approved' -and $direction.Meta['status'] -ne 'approved') {
            Add-Issue "$($brief.Path) is approved but direction '$directionId' is not approved."
        }
    }
    if ($brief.Meta['status'] -eq 'approved') {
        $approvalPath = Resolve-VaultRelativePath -RelativePath $brief.Meta['approval_record'] -Label "$($brief.Path) approval_record"
        if ($approvalPath -and -not (Test-Path -LiteralPath $approvalPath -PathType Leaf)) {
            Add-Issue "$($brief.Path) approval_record does not exist."
        }
    }
    foreach ($forbiddenField in @($contract.brief_forbidden_fields)) {
        if ($brief.Meta.ContainsKey($forbiddenField)) {
            Add-Issue "$($brief.Path) redefines Strategic Creative Direction field '$forbiddenField'."
        }
    }

    $briefText = Get-Content -Raw -LiteralPath $brief.FullPath
    foreach ($forbiddenPattern in @(
        '(?im)^##\s+Content core\s*$',
        '(?im)^##\s+Direction\s*$',
        '(?im)^##\s+Personal Take Checkpoint\s*$',
        '(?im)^\s*-\s+\*\*One-sentence thesis\*\*:'
    )) {
        if ($briefText -match $forbiddenPattern) {
            Add-Issue "$($brief.Path) redefines a Strategic Creative Direction field."
        }
    }
}

$registerPath = Resolve-VaultRelativePath -RelativePath $contract.publication_register -Label 'Publication register'
$publishedVariants = @{}
$variantOwners = @{}
if ($registerPath -and (Test-Path -LiteralPath $registerPath -PathType Leaf)) {
    $registerLines = Get-Content -LiteralPath $registerPath
    $inRegister = $false
    foreach ($line in $registerLines) {
        if ($line -eq '## Register') {
            $inRegister = $true
            continue
        }
        if ($inRegister -and $line -match '^##\s+') {
            break
        }
        if (-not $inRegister -or $line -notmatch '^\|') {
            continue
        }

        $cells = @($line.Trim('|') -split '\|' | ForEach-Object { $_.Trim().Trim('`') })
        if ($cells.Count -lt 15 -or $cells[0] -in @('Content ID', '---')) {
            continue
        }

        $contentId = $cells[0]
        $directionId = $cells[1]
        $variantId = $cells[2]
        $sourceProject = $cells[3]
        $briefPath = $cells[4]
        $artifactPath = $cells[5]
        $metadataMode = $cells[6]
        $status = $cells[9]
        $approvalRecord = $cells[11]
        $published = $cells[12]
        $publicationEvidence = $cells[13]

        foreach ($requiredRegisterValue in @(
            @{ Value = $contentId; Label = 'content_id' },
            @{ Value = $directionId; Label = 'direction_id' },
            @{ Value = $variantId; Label = 'variant_id' },
            @{ Value = $sourceProject; Label = 'source project' },
            @{ Value = $briefPath; Label = 'source brief' },
            @{ Value = $artifactPath; Label = 'artifact' }
        )) {
            if (-not $requiredRegisterValue.Value -or $requiredRegisterValue.Value -eq '-') {
                Add-Issue "Publication row '$variantId' is missing $($requiredRegisterValue.Label)."
            }
        }
        if ($variantId) {
            if ($variantOwners.ContainsKey($variantId)) {
                Add-Issue "Duplicate variant_id '$variantId' in the Publication Register."
            } else {
                $variantOwners[$variantId] = $artifactPath
            }
        }
        if ($status -notin @($contract.statuses.publication)) {
            Add-Issue "Publication row '$variantId' has invalid status '$status'."
        }
        if (-not $directionId -or -not $directions.ContainsKey($directionId)) {
            Add-Issue "Publication row '$variantId' references missing direction '$directionId'."
        } elseif ($directions[$directionId].Meta['content_id'] -ne $contentId) {
            Add-Issue "Publication row '$variantId' does not match its direction content_id."
        }

        foreach ($pathCheck in @(
            @{ Value = $sourceProject; Label = "Publication row '$variantId' source project"; Kind = 'Container' },
            @{ Value = $briefPath; Label = "Publication row '$variantId' source brief"; Kind = 'Leaf' },
            @{ Value = $artifactPath; Label = "Publication row '$variantId' artifact"; Kind = 'Leaf' }
        )) {
            $resolved = Resolve-VaultRelativePath -RelativePath $pathCheck.Value -Label $pathCheck.Label
            if ($resolved -and -not (Test-Path -LiteralPath $resolved -PathType $pathCheck.Kind)) {
                Add-Issue "$($pathCheck.Label) does not exist: $($pathCheck.Value)"
            }
        }

        if ($directions.ContainsKey($directionId) -and $directions[$directionId].Meta['source_project'] -ne $sourceProject) {
            Add-Issue "Publication row '$variantId' does not match its direction source_project."
        }
        if ($objectByPath.ContainsKey($briefPath)) {
            $registeredBrief = $objectByPath[$briefPath]
            if ($registeredBrief.Type -ne 'content-brief') {
                Add-Issue "Publication row '$variantId' source brief is not a content-brief object."
            } elseif (
                $registeredBrief.Meta['content_id'] -ne $contentId -or
                $registeredBrief.Meta['direction_id'] -ne $directionId -or
                $registeredBrief.Meta['source_project'] -ne $sourceProject
            ) {
                Add-Issue "Publication row '$variantId' does not match its source brief lineage."
            }
        } else {
            Add-Issue "Publication row '$variantId' source brief is not a registered content object."
        }
        if ($sourceProject -and $artifactPath) {
            $expectedAuthorityPrefix = $sourceProject.TrimEnd('/') + '/authority/'
            if (-not $artifactPath.StartsWith($expectedAuthorityPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
                Add-Issue "Publication row '$variantId' artifact is outside source-project authority."
            }
        }

        if ($metadataMode -notin @($contract.metadata_modes)) {
            Add-Issue "Publication row '$variantId' has invalid metadata_mode '$metadataMode'."
        } elseif ($metadataMode -eq 'embedded') {
            $resolvedArtifact = Resolve-VaultRelativePath -RelativePath $artifactPath -Label "Publication row '$variantId' embedded artifact"
            if ($resolvedArtifact -and (Test-Path -LiteralPath $resolvedArtifact -PathType Leaf)) {
                $artifactMeta = Get-Frontmatter -Path $resolvedArtifact
                $expectedLineage = @{
                    content_id = $contentId
                    direction_id = $directionId
                    brief_id = $objectByPath[$briefPath].Meta['brief_id']
                    variant_id = $variantId
                }
                foreach ($lineageField in @('content_id', 'direction_id', 'brief_id', 'variant_id')) {
                    if ($artifactMeta[$lineageField] -ne $expectedLineage[$lineageField]) {
                        Add-Issue "Publication row '$variantId' embedded artifact has mismatched $lineageField."
                    }
                }
            }
        }
        if ($status -in @('approved-not-published', 'published')) {
            $approvalPath = Resolve-VaultRelativePath -RelativePath $approvalRecord -Label "Publication row '$variantId' approval record"
            if ($approvalPath -and -not (Test-Path -LiteralPath $approvalPath -PathType Leaf)) {
                Add-Issue "Publication row '$variantId' approval record does not exist."
            }
        }
        if ($status -eq 'published') {
            if ($published -ne 'yes' -or -not $publicationEvidence -or $publicationEvidence -eq '-') {
                Add-Issue "Published row '$variantId' lacks publication evidence."
            } else {
                $publishedVariants[$variantId] = $true
            }
        }
    }
} else {
    Add-Issue 'Publication register does not exist.'
}

foreach ($performance in @($objects | Where-Object Type -eq 'performance-record')) {
    $variantId = $performance.Meta['variant_id']
    if (-not $variantId -or -not $publishedVariants.ContainsKey($variantId)) {
        Add-Issue "$($performance.Path) references variant '$variantId', which is not published."
    }
    if (-not $performance.Meta['direction_id'] -or -not $directions.ContainsKey($performance.Meta['direction_id'])) {
        Add-Issue "$($performance.Path) references a missing direction."
    }
    if (-not $performance.Meta['brief_id'] -or -not $briefs.ContainsKey($performance.Meta['brief_id'])) {
        Add-Issue "$($performance.Path) references a missing brief."
    }
}

foreach ($fingerprintProperty in $contract.service_now_fingerprints.PSObject.Properties) {
    $artifactPath = Resolve-VaultRelativePath -RelativePath $fingerprintProperty.Name -Label 'Fingerprint artifact'
    if (-not $artifactPath -or -not (Test-Path -LiteralPath $artifactPath -PathType Leaf)) {
        Add-Issue "Fingerprint artifact is missing: $($fingerprintProperty.Name)"
        continue
    }
    $actualHash = (Get-FileHash -LiteralPath $artifactPath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actualHash -ne $fingerprintProperty.Value.ToLowerInvariant()) {
        Add-Issue "Fingerprint changed for $($fingerprintProperty.Name)."
    }
}

$protectedChanges = @()
if (Test-Path -LiteralPath (Join-Path $vaultPath '.git')) {
    $protectedRoots = @($contract.protected_source_roots)
    $protectedChanges += @(& git -C $vaultPath diff --name-only -- $protectedRoots)
    $protectedChanges += @(& git -C $vaultPath diff --cached --name-only -- $protectedRoots)
}
foreach ($protectedChange in @($protectedChanges | Where-Object { $_ } | Sort-Object -Unique)) {
    Add-Issue "Tracked change exists under a protected source root: $protectedChange"
}

$legacyProjectPath = 'projects/' + 'publishing-system'
$legacyReferenceFiles = Get-ChildItem -LiteralPath $vaultPath -Recurse -File -Include '*.md','*.json','*.ps1','*.yaml','*.yml' |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        $_.FullName -notmatch '[\\/]\.worktrees[\\/]' -and
        $_.FullName -notmatch '[\\/]raw[\\/]' -and
        $_.FullName -notmatch '[\\/]research[\\/]'
    }
foreach ($legacyFile in $legacyReferenceFiles) {
    if ((Get-Content -Raw -LiteralPath $legacyFile.FullName) -match [regex]::Escape($legacyProjectPath)) {
        $relativePath = $legacyFile.FullName.Substring($vaultPath.Length + 1).Replace('\', '/')
        Add-Issue "Legacy active project reference remains in $relativePath."
    }
}

if ($issues.Count -gt 0) {
    foreach ($issue in $issues) {
        Write-Error $issue
    }
    exit 1
}

Write-Output "PASS content-object-contract/v1: $($objects.Count) content objects, $($directions.Count) directions, $($briefs.Count) briefs."
exit 0
