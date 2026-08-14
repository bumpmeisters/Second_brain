$pythonCandidates=@(@(
    (Get-Command python -ErrorAction SilentlyContinue|Select-Object -ExpandProperty Source -ErrorAction SilentlyContinue),
    (Join-Path $env:USERPROFILE '.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe')
)|Where-Object{$_ -and (Test-Path -LiteralPath $_)}|Select-Object -Unique)
Assert-True ($pythonCandidates.Count -gt 0) 'a Python runtime is available for the constrained retrieval boundary'
if($pythonCandidates.Count -gt 0){
    $result=& $pythonCandidates[0] (Join-Path $testRoot 'retrieval_capability_test.py') 2>&1
    Assert-True ($LASTEXITCODE -eq 0) "retrieval capability adversarial fixtures pass: $($result -join ' ')"
}
