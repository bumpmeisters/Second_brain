# Retrieval permission profile

Live retrieval uses a separate, opt-in Codex permission profile. The normal workspace and unattended automation posture remains offline.

## Install

The reviewed template is `tools/config/newsletter-retrieval-profile.toml`. Install it into the user-level Codex config from a normal PowerShell process outside an offline Codex sandbox:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/install-newsletter-retrieval-profile.ps1
```

The installer:

- refuses legacy `sandbox_mode` and `[sandbox_workspace_write]` configurations because they do not compose with permission profiles;
- refuses to overwrite a different profile with the same name;
- creates a timestamped backup by default;
- appends the profile atomically;
- is idempotent when the exact profile is already present;
- does not set `default_permissions`.

The profile extends `:workspace`, enables network access, and allowlists only reviewed public hosts. It does not use `danger-full-access` or a wildcard domain. A new candidate host requires a separate targeted update to both the reviewed template and installed profile.

## Activate and test

When the desktop exposes a permission selector, choose `newsletter-retrieval` only for the confirmed interactive retrieval task. When it does not, use the managed switch from normal PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/switch-newsletter-retrieval-profile.ps1 -Mode Activate
```

Activation creates a hash-bound state record and exact backup before temporarily setting `default_permissions = "newsletter-retrieval"`. Restart Codex or open a fresh task so the selection is loaded. Do not activate it for unattended weekly preparation.

Run the local, non-networking capability check:

```powershell
python tools/newsletter_batch.py preflight `
  --input-root <confirmed-prepared-batch>
```

A usable task returns `status: ready`, `network_available: true`, and exit code `0`. An offline task returns `status: retrieval_pending_network`, names `CODEX_SANDBOX_NETWORK_DISABLED`, and exits `3` before retrieval creates output or opens a socket.

The preflight proves only that the runtime does not declare Codex's offline-network marker. The constrained retrieval adapter remains authoritative for DNS, public-address, redirect, MIME, timeout, and size enforcement.

Only after an explicit human batch confirmation and a ready preflight may `tools/newsletter_batch.py retrieve` run. A previously completed batch must not be retrieved again merely to test the profile.

After the confirmed retrieval, restore the exact pre-activation configuration from normal PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/switch-newsletter-retrieval-profile.ps1 -Mode Restore
```

Restoration fails closed if either the active config or backup hash changed. Restart Codex after restoration. The reviewed profile remains installed but is no longer the global default.
