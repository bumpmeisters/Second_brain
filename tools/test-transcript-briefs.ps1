param(
    [string]$VaultRoot,
    [Parameter(Mandatory = $true)][string]$BriefRoot,
    [Parameter(Mandatory = $true)][string]$IntakeLedger,
    [ValidateRange(1, 5000)][int]$MinimumWords = 350,
    [ValidateRange(1, 5000)][int]$MaximumWords = 500
)

$ErrorActionPreference = 'Stop'
$root = if ($VaultRoot) {
    (Resolve-Path -LiteralPath $VaultRoot).Path
} else {
    (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

if ($MinimumWords -gt $MaximumWords) {
    throw 'MinimumWords must not exceed MaximumWords.'
}

function Resolve-InVault([string]$Path, [switch]$MustExist) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $root $Path }
    $full = [IO.Path]::GetFullPath($candidate)
    if (-not ($full -eq $root -or $full.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase))) {
        throw "Path is outside the vault: $Path"
    }
    if ($MustExist -and -not (Test-Path -LiteralPath $full)) {
        throw "Path does not exist: $Path"
    }
    return $full
}

function Get-Scalar([string]$Text, [string]$Key) {
    $pattern = '(?m)^' + [regex]::Escape($Key) + ':\s*["'']?([^"''\r\n]+)'
    $match = [regex]::Match($Text, $pattern)
    if ($match.Success) { return $match.Groups[1].Value.Trim() }
    return ''
}

$briefPath = Resolve-InVault $BriefRoot -MustExist
$ledgerPath = Resolve-InVault $IntakeLedger -MustExist
$ledger = @(Import-Csv -LiteralPath $ledgerPath)
$ledgerBySource = @{}
foreach ($row in $ledger) { $ledgerBySource[$row.canonical_source] = $row }

$requiredSections = @(
    'Core thesis',
    'Structured outline',
    'Reusable mechanisms',
    'Lean analysis',
    'Caveats',
    'Transcript anchors',
    'Proposed routing'
)
$errors = [Collections.Generic.List[string]]::new()
$files = @(Get-ChildItem -LiteralPath $briefPath -File -Filter '*.md')
if ($files.Count -eq 0) { throw "No transcript briefs found under $BriefRoot." }

foreach ($file in $files) {
    $text = [IO.File]::ReadAllText($file.FullName)
    $label = $file.Name
    foreach ($field in @('type','status','source_path','source_identity','source_sha256','trust_class','created','updated')) {
        if (-not (Get-Scalar $text $field)) { $errors.Add("${label}: missing frontmatter field '$field'.") }
    }
    if ((Get-Scalar $text 'type') -ne 'transcript-brief') {
        $errors.Add("${label}: type must be transcript-brief.")
    }
    foreach ($section in $requiredSections) {
        if ($text -notmatch ('(?m)^##\s+' + [regex]::Escape($section) + '\s*$')) {
            $errors.Add("${label}: missing section '$section'.")
        }
    }
    if ($text -notmatch '(?m)\*\*\d{1,2}:\d{2}(?::\d{2})?\*\*') {
        $errors.Add("${label}: Transcript anchors must include at least one bold timestamp.")
    }

    $body = [regex]::Replace($text, '(?s)^---\s*\r?\n.*?\r?\n---\s*', '')
    $wordCount = [regex]::Matches($body, '\b[\p{L}\p{Nd}][\p{L}\p{Nd}''-]*\b').Count
    if ($wordCount -lt $MinimumWords -or $wordCount -gt $MaximumWords) {
        $errors.Add("${label}: word count $wordCount is outside $MinimumWords-$MaximumWords.")
    }

    $source = Get-Scalar $text 'source_path'
    $declaredHash = Get-Scalar $text 'source_sha256'
    if ($source) {
        if (-not $ledgerBySource.ContainsKey($source)) {
            $errors.Add("${label}: source_path is absent from the intake ledger: $source")
        } else {
            $ledgerRow = $ledgerBySource[$source]
            if ($ledgerRow.shortlisted -ne 'true') {
                $errors.Add("${label}: source was not shortlisted in the intake ledger.")
            }
            if ($ledgerRow.sha256 -ne $declaredHash) {
                $errors.Add("${label}: source_sha256 does not match the intake ledger.")
            }
        }
        try {
            $sourceFile = Resolve-InVault $source -MustExist
            $actualHash = (Get-FileHash -LiteralPath $sourceFile -Algorithm SHA256).Hash
            if ($actualHash -ne $declaredHash) {
                $errors.Add("${label}: source_sha256 does not match the current protected source.")
            }
        } catch {
            $errors.Add("${label}: source file is unavailable: $source")
        }
    }
}

if ($errors.Count -gt 0) {
    throw ("Transcript brief validation failed:`n- " + ($errors -join "`n- "))
}

Write-Host "Transcript brief validation passed for $($files.Count) brief(s)."
