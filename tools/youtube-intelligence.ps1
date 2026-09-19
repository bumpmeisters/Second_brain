param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
try {
    $runtime = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'resolve-python-runtime.ps1') -Purpose ScheduledTask -Json | ConvertFrom-Json
    if ($LASTEXITCODE -ne 0 -or -not $runtime.executable) { throw 'Scheduled-task Python runtime could not be resolved.' }
} catch {
    if (@($Arguments | Where-Object { $_ -in @('semantic-queue', 'read-semantic-source') }).Count) {
        [ordered]@{ status = 'failed'; error = [string]$_ } | ConvertTo-Json -Compress
    }
    Write-Error $_ -ErrorAction Continue
    exit 1
}
& $runtime.executable (Join-Path $PSScriptRoot 'youtube_intelligence.py') --vault-root $root @Arguments
exit $LASTEXITCODE
