$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$schemaPath = Join-Path $repo 'tools\config\vault-transaction-schema.json'
$decisionPath = Join-Path $repo 'docs\decisions\vault-transaction-v2-contract.md'
$assertions = 0

function Assert-Contract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:assertions++
}

$schema = Get-Content -Raw -LiteralPath $schemaPath | ConvertFrom-Json

Assert-Contract ($schema.schema_version -eq 'vault-transaction/v2') 'Unexpected transaction schema version.'
Assert-Contract ($schema.contract_status -eq 'accepted-for-disposable-spike') 'The contract does not record the approved spike boundary.'
Assert-Contract (-not $schema.spike_guardrails.integration_allowed -and -not $schema.spike_guardrails.default_switch_allowed -and -not $schema.spike_guardrails.real_vault_content_edits_allowed -and $schema.spike_guardrails.stop_decision_required) 'Disposable-spike guardrails are incomplete.'
Assert-Contract (@($schema.implemented_operations).Count -eq 1 -and $schema.implemented_operations[0] -eq 'exact-replace') 'Phase 1 must begin with exact-replace only.'
Assert-Contract ($schema.input_transport.cli -eq 'stdin-json' -and $schema.input_transport.in_process -eq 'powershell-object') 'Approved input transports are missing.'
Assert-Contract (-not $schema.input_transport.payload_in_command_arguments -and -not $schema.input_transport.external_payload_files) 'The contract permits payload disclosure or external payload files.'
Assert-Contract ($schema.limits.max_request_utf8_bytes -gt ($schema.limits.max_find_text_utf8_bytes + $schema.limits.max_replacement_text_utf8_bytes)) 'The request limit cannot hold both maximum payload fields plus JSON metadata.'
Assert-Contract (@($schema.request.required_fields) -contains 'expected_sha256' -and @($schema.request.required_fields) -contains 'expected_match_count') 'Hash or match-count preconditions are missing.'
Assert-Contract (@($schema.request.operation_payloads.'exact-replace'.required_fields) -contains 'find_text' -and @($schema.request.operation_payloads.'exact-replace'.required_fields) -contains 'replacement_text') 'Exact-replace payload fields are incomplete.'
Assert-Contract ($schema.request.newline_default -eq 'Preserve' -and @($schema.request.newline_values).Count -eq 3) 'Newline policy is incomplete.'
Assert-Contract (@($schema.receipt.forbidden_fields) -contains 'payload' -and $schema.receipt.payload_persisted -eq $false -and $schema.receipt.external_payload_files -eq 0) 'Receipt confidentiality requirements are incomplete.'
Assert-Contract ($schema.atomic_write.internal_sibling_file_required -and -not $schema.atomic_write.external_payload_helper_files_allowed -and $schema.atomic_write.cleanup_required) 'Atomic sibling and cleanup boundaries are incomplete.'
Assert-Contract ($schema.atomic_write.pre_replace_failure_target_unchanged -and $schema.atomic_write.post_replace_cleanup_failure -eq 'failure-with-target-state-reported') 'Failure-state reporting is ambiguous.'
$requiredErrors = @('invalid-request', 'protected-path', 'target-hash-mismatch', 'exact-match-count-mismatch', 'post-write-hash-mismatch', 'cleanup-failed')
Assert-Contract (@($requiredErrors | Where-Object { $_ -notin @($schema.error_codes) }).Count -eq 0) 'Required stable error codes are missing.'
Assert-Contract (-not $schema.compatibility.v1_behavior_changed_in_phase_0 -and -not $schema.compatibility.v2_preferred_before_gate_t1 -and $schema.compatibility.representative_edits_required_before_preference -eq 20) 'Compatibility or rollout gate is incorrect.'
Assert-Contract (Test-Path -LiteralPath $decisionPath -PathType Leaf) 'The architecture decision is missing.'

Write-Host "Vault transaction contract tests passed ($assertions assertions)."
