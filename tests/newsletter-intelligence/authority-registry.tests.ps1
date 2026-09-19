$sourceRegistryPath=Join-Path $repo 'wiki/_outputs/newsletter-intelligence/source-registry.json'
$identityRegistryPath=Join-Path $repo 'wiki/_outputs/newsletter-intelligence/identity-registry.json'

Assert-True (Test-Path -LiteralPath $sourceRegistryPath -PathType Leaf) 'canonical source registry exists'
Assert-True (Test-Path -LiteralPath $identityRegistryPath -PathType Leaf) 'canonical identity registry exists'

if((Test-Path -LiteralPath $sourceRegistryPath -PathType Leaf) -and (Test-Path -LiteralPath $identityRegistryPath -PathType Leaf)){
  $sourceRegistry=Get-Content -Raw -LiteralPath $sourceRegistryPath|ConvertFrom-Json
  $identityRegistry=Get-Content -Raw -LiteralPath $identityRegistryPath|ConvertFrom-Json
  Assert-True (Test-NewsletterRecord -Record $sourceRegistry) 'canonical source registry validates'
  Assert-True (Test-NewsletterRecord -Record $identityRegistry) 'canonical identity registry validates'

  $sourceDecisions=@{}
  foreach($source in @($sourceRegistry.sources)){$sourceDecisions[$source.newsletter_id]=[string]$source.decision}
  $identityDecisions=@{}
  foreach($newsletter in @($identityRegistry.canonical_newsletters)){
    foreach($stream in @($newsletter.streams)){$identityDecisions[$stream.newsletter_id]=[string]$stream.decision}
  }
  $sameIds=($sourceDecisions.Count -eq $identityDecisions.Count) -and @($sourceDecisions.Keys|Where-Object{-not $identityDecisions.ContainsKey($_)}).Count -eq 0
  $sameDecisions=$sameIds -and @($sourceDecisions.Keys|Where-Object{$sourceDecisions[$_] -ne $identityDecisions[$_]}).Count -eq 0
  Assert-True $sameIds 'source and identity registries cover the same newsletter streams'
  Assert-True $sameDecisions 'source and identity registries agree on every stream decision'
}

& git -C $repo check-ignore -q -- $sourceRegistryPath 2>$null
Assert-True ($LASTEXITCODE -eq 1) 'canonical source registry is not ignored by Git'
& git -C $repo check-ignore -q -- $identityRegistryPath 2>$null
Assert-True ($LASTEXITCODE -eq 1) 'canonical identity registry is not ignored by Git'
