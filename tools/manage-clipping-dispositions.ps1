param(
    [Parameter(Mandatory = $true)][ValidateSet('Sync', 'Backfill', 'Set', 'Check', 'ConfirmAvailability')][string]$Command,
    [string]$VaultRoot = '',
    [string]$ClippingsRoot = '',
    [string]$Policy = 'tools/config/source-selection-policy.json',
    [string]$Register = '',
    [string]$DecisionRoot = 'wiki/_outputs/semantic-ingest',
    [string]$CanonicalSource = '',
    [string]$ExpectedSha256 = '',
    [string]$Availability = '',
    [string]$SelectionStatus = '',
    [string]$ProcessingStatus = '',
    [string]$SemanticDisposition = '',
    [string]$Package = '',
    [string]$DecisionContext = '',
    [string]$DecidedBy = '',
    [string]$ReviewAfter = '',
    [string]$Rationale = '',
    [string]$RunManifest = '',
    [string]$ExpectedManifestSha256 = '',
    [string]$SelectedSourcesJson = '',
    [string]$AuthorityId = '',
    [switch]$Confirm,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$root = if ($VaultRoot) { (Resolve-Path -LiteralPath $VaultRoot).Path } else { (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }

function Resolve-InVault([string]$Path, [switch]$MustExist) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $root $Path }
    $full = [IO.Path]::GetFullPath($candidate)
    if (-not ($full -eq $root -or $full.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase))) {
        throw "Path is outside the vault: $Path"
    }
    if ($MustExist -and -not (Test-Path -LiteralPath $full)) { throw "Path does not exist: $Path" }
    return $full
}

function Get-RelativePath([string]$Path) {
    return $Path.Substring($root.Length + 1).Replace('\', '/')
}

function Get-SourceFiles([string[]]$SourceRoots) {
    $eligibleExtensions = @('.md', '.eml')
    return @($SourceRoots | ForEach-Object {
        Get-ChildItem -LiteralPath $_ -Recurse -File | Where-Object Extension -in $eligibleExtensions
    } | Sort-Object FullName -Unique)
}

function Get-Frontmatter([string]$Path) {
    if ([IO.Path]::GetExtension($Path) -ne '.md') { return '' }
    $reader = [IO.File]::OpenText($Path)
    try {
        if ($reader.ReadLine() -ne '---') { return '' }
        $lines = [Collections.Generic.List[string]]::new()
        while (-not $reader.EndOfStream -and $lines.Count -lt 200) {
            $line = $reader.ReadLine()
            if ($line -eq '---') { return $lines -join "`n" }
            $lines.Add($line)
        }
        return ''
    } finally {
        $reader.Dispose()
    }
}

function Get-Scalar([string]$Frontmatter, [string]$Key) {
    if (-not $Frontmatter) { return '' }
    $match = [regex]::Match($Frontmatter, '(?m)^' + [regex]::Escape($Key) + ':\s*(?:"([^"]*)"|''([^'']*)''|([^\r\n#]+))\s*$')
    if (-not $match.Success) { return '' }
    foreach ($index in 1..3) { if ($match.Groups[$index].Success) { return $match.Groups[$index].Value.Trim() } }
    return ''
}

function Get-SourceIdentity([string]$Source, [string]$Hash) {
    if ($Source -match '(?:youtube\.com/watch\?(?:[^#\r\n]*&)?v=|youtu\.be/)([A-Za-z0-9_-]{6,})') { return 'youtube:' + $matches[1] }
    if ($Source) {
        try {
            $uri = [uri]$Source
            return ($uri.Scheme.ToLowerInvariant() + '://' + $uri.Host.ToLowerInvariant() + $uri.AbsolutePath.TrimEnd('/').ToLowerInvariant())
        } catch { return 'url:' + $Source.Trim().ToLowerInvariant() }
    }
    return 'hash:' + $Hash
}

function Write-Register([object[]]$Rows, [string]$Path) {
    $parent = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    $temp = Join-Path $parent ('.' + [IO.Path]::GetFileName($Path) + '.' + [guid]::NewGuid().ToString('N') + '.tmp')
    try {
        @($Rows | Sort-Object canonical_source) | Export-Csv -LiteralPath $temp -NoTypeInformation -Encoding UTF8
        if (Test-Path -LiteralPath $Path) { Move-Item -LiteralPath $temp -Destination $Path -Force } else { Move-Item -LiteralPath $temp -Destination $Path }
    } finally {
        if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Force }
    }
}

function Test-Rows([object[]]$Rows, [object]$PolicyData, [string[]]$SourceRoots) {
    $issues = [Collections.Generic.List[string]]::new()
    $paths = @($Rows.canonical_source)
    if (@($paths | Sort-Object -Unique).Count -ne $Rows.Count) { $issues.Add('Register contains duplicate canonical_source values.') }
    foreach ($row in $Rows) {
        if ($row.availability -notin @($PolicyData.availability_values)) { $issues.Add("Invalid availability for $($row.canonical_source): $($row.availability)") }
        if ($row.selection_status -notin @($PolicyData.selection_status_values)) { $issues.Add("Invalid selection status for $($row.canonical_source): $($row.selection_status)") }
        if ($row.processing_status -notin @($PolicyData.processing_status_values)) { $issues.Add("Invalid processing status for $($row.canonical_source): $($row.processing_status)") }
        if ($row.semantic_disposition -notin @($PolicyData.semantic_disposition_values)) { $issues.Add("Invalid semantic disposition for $($row.canonical_source): $($row.semantic_disposition)") }
        if ($row.selection_status -eq $PolicyData.required_selection_status -and $row.availability -ne $PolicyData.required_availability) {
            $issues.Add("Approved source is not available: $($row.canonical_source)")
        }
        if ($row.semantic_disposition -ne 'pending' -and $row.processing_status -ne 'reviewed') {
            $issues.Add("Semantic disposition requires reviewed processing status: $($row.canonical_source)")
        }
        $path = Resolve-InVault $row.canonical_source
        if (-not $path -or -not (Test-Path -LiteralPath $path -PathType Leaf)) {
            $issues.Add("Registered clipping is missing: $($row.canonical_source)")
        } elseif ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $row.sha256) {
            $issues.Add("Registered clipping hash drifted: $($row.canonical_source)")
        }
    }
    $actual = @(Get-SourceFiles $SourceRoots | ForEach-Object { Get-RelativePath $_.FullName })
    foreach ($path in $actual) { if ($paths -notcontains $path) { $issues.Add("Clipping is absent from the register: $path") } }
    return @($issues)
}

$policyPath = Resolve-InVault $Policy -MustExist
$policyData = Get-Content -LiteralPath $policyPath -Raw | ConvertFrom-Json
if (-not $Register) { $Register = $policyData.register_path }
$registerPath = Resolve-InVault $Register
$configuredRoots = if ($ClippingsRoot) { @($ClippingsRoot) } else { @($policyData.applies_to_prefixes) }
$sourceRoots = @($configuredRoots | ForEach-Object {
    $relative = ([string]$_).TrimEnd('/', '\')
    $resolved = Resolve-InVault $relative
    if (Test-Path -LiteralPath $resolved -PathType Container) { $resolved }
})
if (-not $sourceRoots.Count) { throw 'No configured source-selection roots exist.' }
$now = (Get-Date).ToUniversalTime().ToString('o')

if ($Command -eq 'Sync') {
    $existing = if (Test-Path -LiteralPath $registerPath -PathType Leaf) { @(Import-Csv -LiteralPath $registerPath) } else { @() }
    $byPath = @{}
    foreach ($row in $existing) {
        if ($byPath.ContainsKey($row.canonical_source)) { throw "Duplicate register path: $($row.canonical_source)" }
        $byPath[$row.canonical_source] = $row
    }
    $rows = [Collections.Generic.List[object]]::new()
    foreach ($file in @(Get-SourceFiles $sourceRoots)) {
        $relative = Get-RelativePath $file.FullName
        $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
        if ($byPath.ContainsKey($relative)) {
            $row = $byPath[$relative]
            if ($row.sha256 -ne $hash) { throw "Existing clipping changed after registration: $relative" }
            $rows.Add($row)
            [void]$byPath.Remove($relative)
            continue
        }
        $frontmatter = Get-Frontmatter $file.FullName
        $source = Get-Scalar $frontmatter 'source'
        $rows.Add([pscustomobject][ordered]@{
            canonical_source = $relative
            sha256 = $hash
            source_identity = Get-SourceIdentity $source $hash
            source_type = if ($relative.StartsWith('raw/imports/automated-clippings/youtube/', [StringComparison]::OrdinalIgnoreCase)) { 'youtube-transcript' } elseif ($file.Extension -eq '.md') { 'markdown-clipping' } else { 'email-export' }
            availability = 'unknown'
            selection_status = 'pending'
            processing_status = 'unread'
            semantic_disposition = 'pending'
            package = ''
            decision_context = ''
            decided_by = ''
            decided_at = ''
            review_after = ''
            rationale = ''
            discovered_at = $now
            updated_at = $now
        })
    }
    if ($byPath.Count) { throw "Register contains missing clipping paths: $(@($byPath.Keys) -join '; ')" }
    Write-Register @($rows) $registerPath
    $result = [pscustomobject][ordered]@{ status = 'synced'; register = Get-RelativePath $registerPath; row_count = $rows.Count; new_rows = $rows.Count - $existing.Count }
} else {
    if (-not (Test-Path -LiteralPath $registerPath -PathType Leaf)) { throw "Disposition register does not exist. Run Sync first: $Register" }
    $rows = @(Import-Csv -LiteralPath $registerPath)
    if ($Command -eq 'ConfirmAvailability') {
        if (-not $Confirm) { throw 'ConfirmAvailability requires -Confirm.' }
        if (-not $RunManifest -or $ExpectedManifestSha256 -notmatch '^[0-9A-Fa-f]{64}$' -or -not $SelectedSourcesJson -or -not $AuthorityId) {
            throw 'ConfirmAvailability requires a run manifest, its exact SHA-256, selected sources JSON, and an authority id.'
        }
        $authorityMatches = @($policyData.standing_authorities | Where-Object authority_id -eq $AuthorityId)
        if ($authorityMatches.Count -ne 1 -or -not $authorityMatches[0].enabled) { throw "Standing authority is missing or disabled: $AuthorityId" }
        $authority = $authorityMatches[0]
        if (-not $authority.requires_exact_path_and_sha256) { throw "Standing authority does not require exact path and SHA-256: $AuthorityId" }
        $manifestPath = Resolve-InVault $RunManifest -MustExist
        $manifestHash = (Get-FileHash -LiteralPath $manifestPath -Algorithm SHA256).Hash
        if ($manifestHash -ne $ExpectedManifestSha256.ToUpperInvariant()) { throw 'Run manifest SHA-256 mismatch.' }
        $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
        if ($manifest.schema_version -ne $authority.required_manifest_schema -or -not $manifest.run_id) { throw 'Run manifest schema or run id is invalid.' }

        $manifestSources = @{}
        foreach ($source in @($manifest.captured_sources)) {
            $canonical = ([string]$source.canonical_source).Replace('\', '/')
            $sha = ([string]$source.sha256).ToUpperInvariant()
            if (-not $canonical -or $sha -notmatch '^[0-9A-F]{64}$') { throw 'Run manifest contains an invalid source path or SHA-256.' }
            if ($manifestSources.ContainsKey($canonical)) { throw "Run manifest contains a duplicate source: $canonical" }
            $manifestSources[$canonical] = $sha
        }

        # Windows PowerShell 5.1 emits a top-level JSON array as one Object[]
        # pipeline object. Parse first, then expand it so each source is
        # validated independently instead of coercing all paths into one string.
        $parsedSelectedSources = $SelectedSourcesJson | ConvertFrom-Json
        $selectedSources = @($parsedSelectedSources)
        if ($selectedSources.Count -lt 1 -or $selectedSources.Count -gt 25) { throw 'ConfirmAvailability requires between 1 and 25 selected sources.' }
        $selectedPaths = @{}
        $updates = [Collections.Generic.List[object]]::new()
        foreach ($source in $selectedSources) {
            $canonical = ([string]$source.canonical_source).Replace('\', '/')
            $sha = ([string]$source.sha256).ToUpperInvariant()
            if (-not $canonical.StartsWith($authority.source_prefix, [StringComparison]::OrdinalIgnoreCase) -or $sha -notmatch '^[0-9A-F]{64}$') {
                throw "Selected source is outside the standing authority or has an invalid SHA-256: $canonical"
            }
            if ($selectedPaths.ContainsKey($canonical)) { throw "Selected availability batch contains a duplicate source: $canonical" }
            $selectedPaths[$canonical] = $true
            if (-not $manifestSources.ContainsKey($canonical) -or $manifestSources[$canonical] -ne $sha) {
                throw "Selected source does not exactly match the run manifest: $canonical"
            }
            $matches = @($rows | Where-Object canonical_source -eq $canonical)
            if ($matches.Count -ne 1) { throw "Expected one registered source, found $($matches.Count): $canonical" }
            $row = $matches[0]
            if ($row.sha256 -ne $sha) { throw "Disposition register hash does not match the run manifest: $canonical" }
            if ($row.availability -notin @('unknown', 'available')) { throw "Conflicting availability cannot be auto-confirmed: $canonical ($($row.availability))" }
            $sourcePath = Resolve-InVault $canonical -MustExist
            if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf) -or (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash -ne $sha) {
                throw "Selected source file is missing or changed: $canonical"
            }
            if ($row.availability -eq 'unknown') { $updates.Add($row) }
        }

        foreach ($row in $updates) {
            $row.availability = 'available'
            $row.decision_context = "standing-availability:$($manifest.run_id):$(Get-RelativePath $manifestPath):$manifestHash"
            $row.decided_by = $authority.decision_actor
            $row.decided_at = $now
            $row.rationale = 'Availability confirmed from an exact standing-authority run manifest after path and SHA-256 verification.'
            $row.updated_at = $now
        }
        $issues = @(Test-Rows $rows $policyData $sourceRoots)
        if ($issues.Count) { throw ($issues -join [Environment]::NewLine) }
        if ($updates.Count) { Write-Register $rows $registerPath }
        $result = [pscustomobject][ordered]@{
            status = 'availability-confirmed'
            run_id = $manifest.run_id
            manifest = Get-RelativePath $manifestPath
            manifest_sha256 = $manifestHash
            selected_count = $selectedSources.Count
            changed_count = $updates.Count
        }
    } elseif ($Command -eq 'Backfill') {
        $decisionRootPath = Resolve-InVault $DecisionRoot -MustExist
        $byPath = @{}
        foreach ($row in $rows) { $byPath[$row.canonical_source] = $row }
        $updated = 0
        foreach ($ledger in @(Get-ChildItem -LiteralPath $decisionRootPath -Recurse -File -Filter 'decisions.csv' | Sort-Object @{Expression={ if ($_.Directory.Name -match '^p([0-9]+)$') { [int]$matches[1] } else { 0 } }}, FullName)) {
            foreach ($decision in @(Import-Csv -LiteralPath $ledger.FullName | Where-Object {
                $_.review_status -eq 'approved' -and $_.semantic_decision -ne 'pending' -and $_.routing -match '^stay-P[0-9]+$'
            })) {
                if (-not $byPath.ContainsKey($decision.canonical_source)) { continue }
                $row = $byPath[$decision.canonical_source]
                if ($row.sha256 -ne $decision.sha256) { throw "Historical decision hash mismatch: $($decision.canonical_source)" }
                $disposition = switch ($decision.semantic_decision) {
                    { $_ -in @('new-claim', 'extended-claim', 'corroborating') } { 'promotional'; break }
                    'registered-only' { 'registered-only'; break }
                    'out-of-scope' { 'out-of-scope'; break }
                    'duplicate-variant' { 'duplicate'; break }
                    'blocked' { 'blocked'; break }
                    default { 'pending' }
                }
                $row.availability = 'available'
                $row.selection_status = 'approved-for-semantic-review'
                $row.processing_status = 'reviewed'
                $row.semantic_disposition = $disposition
                $row.package = $decision.routing.Substring(5)
                $row.decision_context = 'historical-semantic-ingest:' + (Get-RelativePath $ledger.FullName)
                $row.decided_by = 'approved-package-checkpoint'
                $row.decided_at = $now
                $row.rationale = 'Backfilled from an approved, completed semantic-ingest decision.'
                $row.updated_at = $now
                $updated++
            }
        }
        $issues = @(Test-Rows $rows $policyData $sourceRoots)
        if ($issues.Count) { throw ($issues -join [Environment]::NewLine) }
        Write-Register $rows $registerPath
        $result = [pscustomobject][ordered]@{ status = 'backfilled'; register = Get-RelativePath $registerPath; row_count = $rows.Count; updated_rows = $updated }
    } elseif ($Command -eq 'Check') {
        $issues = @(Test-Rows $rows $policyData $sourceRoots)
        $result = [pscustomobject][ordered]@{ status = if ($issues.Count) { 'failed' } else { 'ok' }; register = Get-RelativePath $registerPath; row_count = $rows.Count; issue_count = $issues.Count; issues = $issues }
        if ($issues.Count) {
            if ($Json) { $result | ConvertTo-Json -Depth 5 } else { $result | Format-List }
            throw "Clipping disposition check failed with $($issues.Count) issue(s)."
        }
    } else {
        if (-not $Confirm) { throw 'Set requires -Confirm.' }
        if (-not $CanonicalSource -or $ExpectedSha256 -notmatch '^[0-9A-Fa-f]{64}$') { throw 'Set requires canonical source and exact SHA-256.' }
        $matches = @($rows | Where-Object canonical_source -eq $CanonicalSource)
        if ($matches.Count -ne 1) { throw "Expected one registered source, found $($matches.Count): $CanonicalSource" }
        $row = $matches[0]
        if ($row.sha256 -ne $ExpectedSha256) { throw "Disposition preview hash does not match the register: $CanonicalSource" }
        if ($Availability) { if ($Availability -notin @($policyData.availability_values)) { throw "Invalid availability: $Availability" }; $row.availability = $Availability }
        if ($SelectionStatus) { if ($SelectionStatus -notin @($policyData.selection_status_values)) { throw "Invalid selection status: $SelectionStatus" }; $row.selection_status = $SelectionStatus }
        if ($ProcessingStatus) { if ($ProcessingStatus -notin @($policyData.processing_status_values)) { throw "Invalid processing status: $ProcessingStatus" }; $row.processing_status = $ProcessingStatus }
        if ($SemanticDisposition) { if ($SemanticDisposition -notin @($policyData.semantic_disposition_values)) { throw "Invalid semantic disposition: $SemanticDisposition" }; $row.semantic_disposition = $SemanticDisposition }
        if ($Package) { if ($Package -notmatch '^P[0-9]+$') { throw "Invalid package: $Package" }; $row.package = $Package }
        if ($DecisionContext) { $row.decision_context = $DecisionContext }
        if ($DecidedBy) { $row.decided_by = $DecidedBy }
        if ($ReviewAfter) { [void][datetime]::Parse($ReviewAfter); $row.review_after = $ReviewAfter }
        if ($Rationale) { $row.rationale = $Rationale }
        if ($row.selection_status -eq $policyData.required_selection_status -and ($row.availability -ne $policyData.required_availability -or -not $row.decided_by -or -not $row.decision_context)) {
            throw 'Approval requires available source, decided_by, and decision_context.'
        }
        if ($row.semantic_disposition -ne 'pending' -and $row.processing_status -ne 'reviewed') { throw 'Semantic disposition requires processing_status reviewed.' }
        $row.decided_at = $now
        $row.updated_at = $now
        $issues = @(Test-Rows $rows $policyData $sourceRoots)
        if ($issues.Count) { throw ($issues -join [Environment]::NewLine) }
        Write-Register $rows $registerPath
        $result = [pscustomobject][ordered]@{ status = 'updated'; canonical_source = $row.canonical_source; sha256 = $row.sha256; availability = $row.availability; selection_status = $row.selection_status; package = $row.package }
    }
}

if ($Json) { $result | ConvertTo-Json -Depth 5 } else { $result | Format-List }
