param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateSet('capture','verify','ready','dossier')][string]$Command,
    [Parameter(ValueFromRemainingArguments=$true)][string[]]$Arguments
)
$ErrorActionPreference = 'Stop'
$pythonPath = & (Join-Path $PSScriptRoot 'resolve-python-runtime.ps1') -Purpose Agent -PathOnly
& $pythonPath (Join-Path $PSScriptRoot 'repository_library.py') $Command @Arguments
exit $LASTEXITCODE
