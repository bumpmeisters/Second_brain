$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$fixture = Join-Path $repo '.tmp\semantic-ingest-generator-tests'
if (-not $fixture.StartsWith($repo + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) { throw 'Fixture escaped repository.' }

function Write-Utf8([string]$Path, [string]$Content) {
    $parent = Split-Path -Parent $Path
    if ($parent -and -not (Test-Path $parent)) { New-Item -ItemType Directory -Force $parent | Out-Null }
    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

try {
    if (Test-Path $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
    @('tools\config', 'wiki\_outputs', 'raw\Clippings', 'raw\imports\automated-clippings\youtube\channel-1') | ForEach-Object { New-Item -ItemType Directory -Force (Join-Path $fixture $_) | Out-Null }
    Copy-Item (Join-Path $repo 'tools\new-semantic-ingest-package.ps1') (Join-Path $fixture 'tools\new-semantic-ingest-package.ps1')
    Copy-Item (Join-Path $repo 'tools\test-semantic-ingest-package.ps1') (Join-Path $fixture 'tools\test-semantic-ingest-package.ps1')
    Copy-Item (Join-Path $repo 'tools\config\semantic-ingest-schema.json') (Join-Path $fixture 'tools\config\semantic-ingest-schema.json')
    Copy-Item (Join-Path $repo 'tools\config\source-selection-policy.json') (Join-Path $fixture 'tools\config\source-selection-policy.json')

    $intake = @()
    foreach ($item in @(
        @{ name = 'p2-a.md'; package = 'P2'; title = 'P2 A' },
        @{ name = 'p2-b.md'; package = 'P2'; title = 'P2 B' },
        @{ name = 'p1-done.md'; package = 'P1'; title = 'P1 Done' },
        @{ name = 'p1-reroute.md'; package = 'P1'; title = 'Rerouted Content' },
        @{ name = 'p32-gated.md'; package = 'P32'; title = 'P32 Gated' }
    )) {
        $relative = 'raw/Clippings/' + $item.name
        $path = Join-Path $fixture $relative
        Write-Utf8 $path ('# ' + $item.title)
        $intake += [pscustomobject][ordered]@{ canonical_source = $relative; canonical_title = $item.title; package = $item.package; subtopic = 'fixture'; source_type = 'web-article'; status = 'assigned-ready-for-package-review'; sha256 = (Get-FileHash $path -Algorithm SHA256).Hash; cross_title_duplicate = 'false' }
    }
    $intakePath = Join-Path $fixture 'wiki\_outputs\intake.csv'
    $intake | Export-Csv $intakePath -NoTypeInformation -Encoding UTF8
    @([pscustomobject]@{ canonical_source = 'raw/Clippings/p1-reroute.md'; semantic_decision = 'registered-only'; routing = 'rerouted-P2'; review_status = 'approved' }) | Export-Csv (Join-Path $fixture 'wiki\_outputs\p1-routes.csv') -NoTypeInformation -Encoding UTF8
    @([pscustomobject]@{ canonical_source = 'raw/Clippings/p1-done.md'; semantic_decision = 'extended-claim'; routing = 'stay-P1'; review_status = 'approved' }) | Export-Csv (Join-Path $fixture 'wiki\_outputs\p1-complete.csv') -NoTypeInformation -Encoding UTF8
    $p32Intake = $intake | Where-Object package -eq 'P32' | Select-Object -First 1
    @([pscustomobject][ordered]@{
        canonical_source = $p32Intake.canonical_source
        sha256 = $p32Intake.sha256
        availability = 'unknown'
        selection_status = 'pending'
        processing_status = 'unread'
        semantic_disposition = 'pending'
        package = ''
    }) | Export-Csv (Join-Path $fixture 'wiki\_outputs\dispositions.csv') -NoTypeInformation -Encoding UTF8

    $generator = Join-Path $fixture 'tools\new-semantic-ingest-package.ps1'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $generator -PackageId P2 -IntakeLedger 'wiki/_outputs/intake.csv' -RerouteLedger 'wiki/_outputs/p1-routes.csv' -CompletedLedger 'wiki/_outputs/p1-complete.csv' | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Generator failed.' }
    $dir = Join-Path $fixture 'wiki\_outputs\semantic-ingest\p2'
    $rows = @(Import-Csv (Join-Path $dir 'decisions.csv'))
    if ($rows.Count -ne 3) { throw "Expected 3 package rows, got $($rows.Count)." }
    if (@($rows.canonical_source | Sort-Object -Unique).Count -ne 3) { throw 'Generator did not deduplicate canonical sources.' }
    $routed = $rows | Where-Object canonical_source -eq 'raw/Clippings/p1-reroute.md'
    if ($routed.rationale -notlike 'Rerouted into P2*' -or $routed.routing -ne 'stay-P2') { throw 'Rerouted source was not normalized for its destination package.' }
    $manifestPath = Join-Path $dir 'package.json'
    $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json
    if ($manifest.backlog.expected_open_count -ne 4) { throw "Expected open backlog 4, got $($manifest.backlog.expected_open_count)." }
    if ($manifest.routing.reroute_ledgers -notcontains 'wiki/_outputs/p1-routes.csv') { throw 'Reroute provenance missing from manifest.' }
    if ($manifest.backlog.completed_ledgers -notcontains 'wiki/_outputs/p1-complete.csv') { throw 'Completed ledger missing from manifest.' }
    if ($manifest.backlog.completed_ledgers -contains 'wiki/_outputs/p1-routes.csv') { throw 'Reroute ledger leaked into completed-ledger accounting.' }
    if ($manifest.validation.validation_status -ne 'not-run') { throw 'Generated validation record must start as not-run.' }
    $schema = Get-Content (Join-Path $repo 'tools\config\semantic-ingest-schema.json') -Raw | ConvertFrom-Json
    if ($manifest.validation.validator_version -ne $schema.validator_version) { throw 'Generated validator version is missing or stale.' }

    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $generator -PackageId P32 -IntakeLedger 'wiki/_outputs/intake.csv' -DispositionRegister 'wiki/_outputs/dispositions.csv' 2>$null | Out-Null
    $blockedCode = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'
    if ($blockedCode -eq 0 -or (Test-Path (Join-Path $fixture 'wiki\_outputs\semantic-ingest\p32'))) { throw 'Pending source bypassed the P32 selection gate.' }

    $disposition = Import-Csv (Join-Path $fixture 'wiki\_outputs\dispositions.csv')
    $disposition.availability = 'available'
    $disposition.selection_status = 'approved-for-semantic-review'
    $disposition.package = 'P32'
    $disposition | Export-Csv (Join-Path $fixture 'wiki\_outputs\dispositions.csv') -NoTypeInformation -Encoding UTF8
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $generator -PackageId P32 -IntakeLedger 'wiki/_outputs/intake.csv' -DispositionRegister 'wiki/_outputs/dispositions.csv' | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Approved P32 source did not pass the selection gate.' }

    & git -C $fixture init --quiet
    & git -C $fixture config user.email 'fixture@example.invalid'
    & git -C $fixture config user.name 'Semantic Ingest Fixture'
    & git -C $fixture config core.autocrlf false
    & git -C $fixture add .
    & git -C $fixture commit --quiet -m baseline
    $validator = Join-Path $fixture 'tools\test-semantic-ingest-package.ps1'
    $validation = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $validator -Manifest $manifestPath -Mode Draft -Profile Fast -Json | Out-String | ConvertFrom-Json
    if ($LASTEXITCODE -ne 0 -or -not $validation.passed -or $validation.profile -ne 'Fast') { throw 'Generated draft did not pass fast validation.' }
    $p32Validation = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $validator -Manifest (Join-Path $fixture 'wiki\_outputs\semantic-ingest\p32\package.json') -Mode Draft -Profile Fast -Json | Out-String | ConvertFrom-Json
    if ($LASTEXITCODE -ne 0 -or -not $p32Validation.passed) { throw ('Approved P32 package failed selection-gate validation: ' + ($p32Validation | ConvertTo-Json -Depth 8 -Compress)) }

    $standingSource = 'raw/imports/automated-clippings/youtube/channel-1/2026-08-17--standing.md'
    $standingPath = Join-Path $fixture $standingSource
    Write-Utf8 $standingPath '# Standing source'
    $standingHash = (Get-FileHash $standingPath -Algorithm SHA256).Hash
    $standingIntake = [pscustomobject][ordered]@{ canonical_source = $standingSource; canonical_title = 'Standing source'; package = 'P33'; subtopic = 'fixture'; source_type = 'youtube-transcript'; status = 'assigned-ready-for-package-review'; sha256 = $standingHash; cross_title_duplicate = 'false' }
    @($standingIntake) | Export-Csv (Join-Path $fixture 'wiki\_outputs\standing-intake.csv') -NoTypeInformation -Encoding UTF8
    @([pscustomobject][ordered]@{ canonical_source = $standingSource; sha256 = $standingHash; source_identity = 'youtube:standing'; source_type = 'youtube-transcript'; availability = 'unknown'; selection_status = 'pending'; processing_status = 'unread'; semantic_disposition = 'pending'; package = ''; decision_context = ''; decided_by = ''; decided_at = ''; review_after = ''; rationale = ''; discovered_at = (Get-Date).ToUniversalTime().ToString('o'); updated_at = (Get-Date).ToUniversalTime().ToString('o') }) | Export-Csv (Join-Path $fixture 'wiki\_outputs\standing-dispositions.csv') -NoTypeInformation -Encoding UTF8
    $runManifest = [ordered]@{ schema_version = 'youtube-intelligence-run/v1'; run_id = 'fixture-run'; captured_sources = @([ordered]@{ canonical_source = $standingSource; sha256 = $standingHash }) }
    $runManifest | ConvertTo-Json -Depth 5 | Set-Content (Join-Path $fixture 'wiki\_outputs\standing-run.json') -Encoding UTF8
    $selectionPolicyPath = Join-Path $fixture 'tools\config\source-selection-policy.json'
    $standingPolicy = Get-Content $selectionPolicyPath -Raw | ConvertFrom-Json
    $standingPolicy.standing_authorities[0].enabled = $true
    $standingPolicy | ConvertTo-Json -Depth 8 | Set-Content $selectionPolicyPath -Encoding UTF8
    $manifestHash = (Get-FileHash (Join-Path $fixture 'wiki\_outputs\standing-run.json') -Algorithm SHA256).Hash
    $selectedSourcesJson = @([ordered]@{ canonical_source = $standingSource; sha256 = $standingHash }) | ConvertTo-Json -Compress
    & (Join-Path $repo 'tools\manage-clipping-dispositions.ps1') -Command ConfirmAvailability -VaultRoot $fixture -ClippingsRoot 'raw/imports/automated-clippings/youtube' -Register 'wiki/_outputs/standing-dispositions.csv' -RunManifest 'wiki/_outputs/standing-run.json' -ExpectedManifestSha256 $manifestHash -SelectedSourcesJson $selectedSourcesJson -AuthorityId youtube-p35-l2 -Confirm | Out-Null
    $standingDisposition = Import-Csv (Join-Path $fixture 'wiki\_outputs\standing-dispositions.csv') | Select-Object -First 1
    if ($standingDisposition.availability -ne 'available' -or $standingDisposition.selection_status -ne 'pending') { throw 'Availability confirmation did not preserve the standing-authority selection boundary.' }
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $generator -PackageId P33 -IntakeLedger 'wiki/_outputs/standing-intake.csv' -DispositionRegister 'wiki/_outputs/standing-dispositions.csv' -StandingAuthorityId 'youtube-p35-l2' -StandingAuthorityRunManifest 'wiki/_outputs/standing-run.json' | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Exact standing-authority source did not pass the generator gate.' }
    $standingPackage = Get-Content (Join-Path $fixture 'wiki\_outputs\semantic-ingest\p33\package.json') -Raw | ConvertFrom-Json
    $standingDecision = Import-Csv (Join-Path $fixture 'wiki\_outputs\semantic-ingest\p33\decisions.csv') | Select-Object -First 1
    if ($standingPackage.standing_authority.authority_id -ne 'youtube-p35-l2' -or $standingDecision.decision_authority -ne 'standing-policy' -or $standingDecision.authority_run_id -ne 'fixture-run') {
        throw 'Standing-authority provenance was not written to the package and decision ledger.'
    }
    $standingValidation = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $validator -Manifest (Join-Path $fixture 'wiki\_outputs\semantic-ingest\p33\package.json') -Mode Draft -Profile Full -Json | Out-String | ConvertFrom-Json
    if ($LASTEXITCODE -ne 0 -or -not $standingValidation.passed) { throw ('Standing-authority package failed validation: ' + ($standingValidation | ConvertTo-Json -Depth 8 -Compress)) }

    $ErrorActionPreference = 'Continue'
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $generator -PackageId P2 -IntakeLedger 'wiki/_outputs/intake.csv' -RerouteLedger 'wiki/_outputs/p1-routes.csv' -CompletedLedger 'wiki/_outputs/p1-complete.csv' 2>$null | Out-Null
    $overwriteCode = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'
    if ($overwriteCode -eq 0) { throw 'Create-only generator unexpectedly overwrote an existing package.' }
}
finally {
    if (Test-Path $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}

Write-Host 'Semantic-ingest package generator tests passed (19 assertions).'
