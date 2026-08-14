param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string[]]$TouchedPath,

    [ValidateSet('warn_unrelated','block_any')]
    [string]$RepositoryPolicy='warn_unrelated'
)

$ErrorActionPreference='Stop'
$repo=Split-Path -Parent $PSScriptRoot
$repoFull=[IO.Path]::GetFullPath($repo).TrimEnd('\','/')
$relativePaths=@()

foreach($path in $TouchedPath){
    $candidate=if([IO.Path]::IsPathRooted($path)){$path}else{Join-Path $repoFull $path}
    $full=[IO.Path]::GetFullPath($candidate)
    if(-not $full.StartsWith($repoFull+'\',[StringComparison]::OrdinalIgnoreCase)){
        throw "touched path is outside the repository: $path"
    }
    if(-not (Test-Path -LiteralPath $full)){
        throw "touched path does not exist: $path"
    }
    $relativePaths+=$full.Substring($repoFull.Length+1).Replace('\','/')
}
$relativePaths=@($relativePaths|Sort-Object -Unique)

$fixtureScript=Join-Path $repoFull 'tests/newsletter-intelligence/run-tests.ps1'
$previousErrorActionPreference=$ErrorActionPreference
$ErrorActionPreference='Continue'
$fixtureOutput=(& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $fixtureScript 2>&1|Out-String).Trim()
$fixtureExit=$LASTEXITCODE

$scopedArgs=@('diff','--check','--')+$relativePaths
$scopedOutput=(& git @scopedArgs 2>&1|Out-String).Trim()
$scopedExit=$LASTEXITCODE

$repositoryOutput=(& git diff --check 2>&1|Out-String).Trim()
$repositoryExit=$LASTEXITCODE
$ErrorActionPreference=$previousErrorActionPreference

$hardGatePassed=($fixtureExit -eq 0 -and $scopedExit -eq 0)
$repositoryHasWarnings=($repositoryExit -ne 0)
$repositoryBlocks=($repositoryHasWarnings -and $RepositoryPolicy -eq 'block_any')
$status=if(-not $hardGatePassed -or $repositoryBlocks){
    'validation_blocked'
}elseif($repositoryHasWarnings){
    'complete_with_repository_warnings'
}else{
    'complete'
}

$result=[pscustomobject]@{
    schema_version='1.0'
    record_type='newsletter_weekly_validation'
    status=$status
    hard_pipeline_gates=[pscustomobject]@{
        passed=$hardGatePassed
        fixture_suite=[pscustomobject]@{
            passed=($fixtureExit -eq 0)
            exit_code=$fixtureExit
            output=$fixtureOutput
        }
        touched_file_diff_check=[pscustomobject]@{
            passed=($scopedExit -eq 0)
            exit_code=$scopedExit
            paths=$relativePaths
            output=$scopedOutput
        }
    }
    repository_health=[pscustomobject]@{
        policy=$RepositoryPolicy
        passed=($repositoryExit -eq 0)
        blocks_completion=$repositoryBlocks
        exit_code=$repositoryExit
        output=$repositoryOutput
    }
    evaluated_at=[datetimeoffset]::UtcNow.ToString('o')
}

$result|ConvertTo-Json -Depth 8
if($status -eq 'validation_blocked'){exit 1}
