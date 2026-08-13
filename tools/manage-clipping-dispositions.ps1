param(
    [Parameter(Mandatory = $true)][ValidateSet('Sync', 'Backfill', 'Set', 'Check')][string]$Command,
    [string]$VaultRoot = '',
    [string]$ClippingsRoot = 'raw/Clippings',
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

function Test-Rows([object[]]$Rows, [object]$PolicyData, [string]$ClippingsPath) {
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
    $eligibleExtensions = @('.md', '.eml')
    $actual = @(Get-ChildItem -LiteralPath $ClippingsPath -File | Where-Object Extension -in $eligibleExtensions | ForEach-Object { Get-RelativePath $_.FullName })
    foreach ($path in $actual) { if ($paths -notcontains $path) { $issues.Add("Clipping is absent from the register: $path") } }
    return @($issues)
}

$policyPath = Resolve-InVault $Policy -MustExist
$policyData = Get-Content -LiteralPath $policyPath -Raw | ConvertFrom-Json
if (-not $Register) { $Register = $policyData.register_path }
$registerPath = Resolve-InVault $Register
$clippingsPath = Resolve-InVault $ClippingsRoot -MustExist
$now = (Get-Date).ToUniversalTime().ToString('o')

if ($Command -eq 'Sync') {
    $existing = if (Test-Path -LiteralPath $registerPath -PathType Leaf) { @(Import-Csv -LiteralPath $registerPath) } else { @() }
    $byPath = @{}
    foreach ($row in $existing) {
        if ($byPath.ContainsKey($row.canonical_source)) { throw "Duplicate register path: $($row.canonical_source)" }
        $byPath[$row.canonical_source] = $row
    }
    $rows = [Collections.Generic.List[object]]::new()
    foreach ($file in @(Get-ChildItem -LiteralPath $clippingsPath -File | Where-Object Extension -in @('.md', '.eml') | Sort-Object Name)) {
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
            source_type = if ($file.Extension -eq '.md') { 'markdown-clipping' } else { 'email-export' }
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
    if ($Command -eq 'Backfill') {
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
        $issues = @(Test-Rows $rows $policyData $clippingsPath)
        if ($issues.Count) { throw ($issues -join [Environment]::NewLine) }
        Write-Register $rows $registerPath
        $result = [pscustomobject][ordered]@{ status = 'backfilled'; register = Get-RelativePath $registerPath; row_count = $rows.Count; updated_rows = $updated }
    } elseif ($Command -eq 'Check') {
        $issues = @(Test-Rows $rows $policyData $clippingsPath)
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
        $issues = @(Test-Rows $rows $policyData $clippingsPath)
        if ($issues.Count) { throw ($issues -join [Environment]::NewLine) }
        Write-Register $rows $registerPath
        $result = [pscustomobject][ordered]@{ status = 'updated'; canonical_source = $row.canonical_source; sha256 = $row.sha256; availability = $row.availability; selection_status = $row.selection_status; package = $row.package }
    }
}

if ($Json) { $result | ConvertTo-Json -Depth 5 } else { $result | Format-List }
