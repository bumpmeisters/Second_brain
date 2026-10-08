param(
    [string]$VaultRoot = '',
    [string]$TaskId = '',
    [string]$SessionPath = '',
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
if (-not $VaultRoot) { $VaultRoot = Join-Path $PSScriptRoot '..' }
$VaultRoot = [IO.Path]::GetFullPath($VaultRoot).TrimEnd('\', '/')
$sessionRoot = Join-Path $VaultRoot 'sessions'
$indexPath = Join-Path $sessionRoot 'index.md'
$issues = [Collections.Generic.List[string]]::new()
$notes = @()
$ids = @{}
$indexText = ''
if (-not (Test-Path -LiteralPath $indexPath -PathType Leaf)) {
    $issues.Add('Missing sessions/index.md.')
} else {
    $indexText = [IO.File]::ReadAllText($indexPath, [Text.Encoding]::UTF8)
    $notes = @(Get-ChildItem -LiteralPath $sessionRoot -File -Filter '*.md' | Where-Object Name -ne 'index.md')
}

foreach ($note in $notes) {
    $text = [IO.File]::ReadAllText($note.FullName, [Text.Encoding]::UTF8)
    $fields = @{}
    if ($text -match '(?s)^---\r?\n(.*?)\r?\n---') {
        foreach ($match in [regex]::Matches($matches[1], '(?m)^([a-z_]+):\s*([^\r\n]+)')) {
            $key = $match.Groups[1].Value
            if ($fields.ContainsKey($key)) { $issues.Add("$($note.Name): duplicate field $key.") }
            $fields[$key] = $match.Groups[2].Value.Trim()
        }
    }
    foreach ($field in @('type', 'status', 'capture', 'task_id', 'created', 'updated')) {
        if (-not $fields[$field]) { $issues.Add("$($note.Name): missing $field.") }
    }
    if ($fields.type -ne 'session-note') { $issues.Add("$($note.Name): type must be session-note.") }
    if ($fields.status -notin @('active', 'paused', 'blocked', 'complete')) { $issues.Add("$($note.Name): invalid status.") }
    if ($fields.capture -notin @('reconstructed', 'exported')) { $issues.Add("$($note.Name): invalid capture provenance.") }
    foreach ($field in @('created', 'updated')) {
        $date = [datetime]::MinValue
        if (-not [datetime]::TryParseExact([string]$fields[$field], 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$date)) {
            $issues.Add("$($note.Name): invalid $field date.")
        }
    }
    if ($fields.updated -lt $fields.created) { $issues.Add("$($note.Name): updated precedes created.") }
    if ($note.Name -notmatch '^\d{4}-\d{2}-\d{2}-[a-z0-9]+(?:-[a-z0-9]+)*\.md$' -or -not $note.Name.StartsWith([string]$fields.created)) {
        $issues.Add("$($note.Name): expected creation date and lowercase hyphenated title in filename.")
    }
    $id = [string]$fields.task_id
    if ($id -ne 'unknown' -and $id -notmatch '^[0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12}$') {
        $issues.Add("$($note.Name): task_id must be a verified UUID or unknown.")
    }
    if ($id -and $id -ne 'unknown') {
        if ($ids.ContainsKey($id)) { $issues.Add("Duplicate task_id $id; update the existing note.") }
        $ids[$id] = $note.FullName
    }
    foreach ($escapedHeading in @('Anlass und Herkunft', 'Verlauf und Entscheidungsgr\u00fcnde', 'Entscheidungen und Stand', 'Ergebnisse und Pr\u00fcfung', 'Offen und n\u00e4chster Einstieg')) {
        $heading = [regex]::Unescape($escapedHeading)
        $pattern = '(?ms)^## ' + [regex]::Escape($heading) + '\r?\n(?<body>.*?)(?=^## |\z)'
        if ($text -notmatch $pattern -or -not $matches['body'].Trim()) { $issues.Add("$($note.Name): missing or empty section $heading.") }
    }
    $rows = @($indexText -split '\r?\n' | Where-Object { $_ -match ('^\|.*\]\(' + [regex]::Escape($note.Name) + '\)') })
    if ($rows.Count -ne 1) {
        $issues.Add("$($note.Name): expected exactly one index row.")
    } elseif ($rows[0] -notmatch ('\|\s*' + [regex]::Escape([string]$fields.created) + '\s*\|') -or
              $rows[0] -notmatch ('\|\s*`' + [regex]::Escape($id) + '`\s*\|\s*' + [regex]::Escape([string]$fields.status) + '\s*\|\s*$')) {
        $issues.Add("$($note.Name): index date, task_id or status disagrees with note.")
    }
}

# Resolve ordinary Markdown file links in both notes and index. Anchors and web links are excluded.
foreach ($file in @($notes) + @((Get-Item -LiteralPath $indexPath -ErrorAction SilentlyContinue))) {
    if (-not $file) { continue }
    $text = [IO.File]::ReadAllText($file.FullName, [Text.Encoding]::UTF8)
    foreach ($match in [regex]::Matches($text, '\[[^\]\r\n]*\]\(([^)\r\n]+)\)')) {
        $target = $match.Groups[1].Value.Trim('<', '>')
        if ($target -match '^[a-z][a-z0-9+.-]*:|^#') { continue }
        $target = [Uri]::UnescapeDataString(($target -split '#', 2)[0])
        if ($target -and -not (Test-Path -LiteralPath (Join-Path $file.DirectoryName $target))) {
            $issues.Add("$($file.Name): broken file link $target.")
        }
    }
}
if ($TaskId) {
    if ($TaskId -eq 'unknown' -or -not $ids.ContainsKey($TaskId)) { $issues.Add("No session note for requested task_id $TaskId. Use SessionPath only when the ID is unavailable.") }
}
if ($SessionPath) {
    $requested = [IO.Path]::GetFullPath((Join-Path $VaultRoot $SessionPath))
    if (-not @($notes | Where-Object FullName -eq $requested).Count) { $issues.Add("Requested session note is missing or outside sessions/: $SessionPath.") }
}
$result = [pscustomobject][ordered]@{
    audit_version = 'session-notes/v1'
    passed = ($issues.Count -eq 0)
    notes_checked = $notes.Count
    requested_task_id = $TaskId
    requested_session_path = $SessionPath
    errors = @($issues)
}
if ($Json) { $result | ConvertTo-Json -Depth 4 }
else {
    Write-Output "Session notes: $($notes.Count) checked, $($issues.Count) error(s)."
    foreach ($issue in $issues) { Write-Output "- $issue" }
}
if (-not $result.passed) { exit 2 }
