param(
    [switch]$FailOnMissingPolicy,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$attributesPath = Join-Path $vaultRoot '.gitattributes'
$attributes = if (Test-Path -LiteralPath $attributesPath -PathType Leaf) { [IO.File]::ReadAllText($attributesPath, [Text.Encoding]::UTF8) } else { '' }
$requiredRules = @(
    '* text=auto eol=lf',
    'raw/** !text !eol',
    'research/assets/** !text !eol',
    '*.bat text eol=crlf',
    '*.cmd text eol=crlf'
)
$missingRules = @($requiredRules | Where-Object { $attributes -notmatch ('(?m)^' + [regex]::Escape($_) + '\s*$') })
$extensions = @('.md', '.ps1', '.json', '.csv', '.yaml', '.yml', '.py', '.txt')
$counts = [ordered]@{ lf = 0; crlf = 0; mixed = 0; no_line_break = 0; missing = 0 }
$files = @(& git -C $vaultRoot -c core.quotepath=false ls-files 2>$null | Where-Object { $_ -match '(?i)\.(md|ps1|json|csv|yaml|yml|py|txt)$' })
foreach ($relative in $files) {
    $path = Join-Path $vaultRoot $relative
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { $counts.missing++; continue }
    $text = [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
    $crlfCount = [regex]::Matches($text, "`r`n").Count
    $bareLfCount = [regex]::Matches($text, "(?<!`r)`n").Count
    if ($crlfCount -and $bareLfCount) { $counts.mixed++ }
    elseif ($crlfCount) { $counts.crlf++ }
    elseif ($bareLfCount) { $counts.lf++ }
    else { $counts.no_line_break++ }
}
$policyPassed = $missingRules.Count -eq 0
$worktreeHygienePassed = $counts.mixed -eq 0
$result = [pscustomobject][ordered]@{
    audit_version = 'line-ending-policy-audit/v2'
    passed = $policyPassed
    worktree_hygiene_passed = $worktreeHygienePassed
    policy_changed = $false
    tracked_text_files = $files.Count
    line_endings = [pscustomobject]$counts
    missing_recommended_rules = $missingRules
    recommendation = if ($missingRules.Count) { 'Review and add explicit text EOL rules in a dedicated clean-worktree change; do not normalize the current dirty worktree.' } elseif (-not $worktreeHygienePassed) { 'Explicit text EOL rules are present. Mixed legacy worktree endings remain an audit finding; normalize only in a separate reviewed clean-worktree change.' } else { 'Explicit text EOL rules are present and no mixed tracked text files were detected.' }
}
if ($Json) { $result | ConvertTo-Json -Depth 6 } else { $result | Format-List audit_version, passed, worktree_hygiene_passed, policy_changed, tracked_text_files, recommendation; [pscustomobject]$counts | Format-List; if ($missingRules.Count) { Write-Host 'Missing required rules:'; $missingRules | ForEach-Object { Write-Host "- $_" } } }
if ($FailOnMissingPolicy -and -not $result.passed) { exit 2 }
