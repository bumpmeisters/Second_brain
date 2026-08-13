# Local Python runtime contract

This vault has a machine-readable Python runtime contract at
`tools/config/python-runtime-contract.json`.

It separates two execution contexts:

- `Agent`: prefer the Python runtime bundled with the Codex desktop runtime because it is executable inside the Codex sandbox.
- `ScheduledTask`: prefer the user's stable local Python installation because a Windows task must not depend on a Codex application bundle.

## Resolve and verify

For work performed by a Codex task:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/resolve-python-runtime.ps1 -Purpose Agent -Json
```

For a Windows Scheduled Task or local background collector:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/resolve-python-runtime.ps1 -Purpose ScheduledTask -Json
```

Use `-PathOnly` when a wrapper needs the validated absolute executable path.
Use `-InspectOnly` to verify configuration and file presence without launching Python.

## Sandbox interpretation

The user's Python executable currently resolves to:

```text
%LOCALAPPDATA%\Programs\Python\Python311\python.exe
```

Codex may be able to see this file while its sandbox refuses to execute it with
`Access is denied`. That result is not evidence that Python is uninstalled.
When the `ScheduledTask` preflight must be validated from Codex, retry the exact
command with elevated sandbox permission.

Likewise, `py -0p` may fail to enumerate an otherwise working installation.
Use the runtime contract and absolute executable path as the source of truth.

## Contract changes

Update the contract only when a runtime is installed, removed, or intentionally
upgraded. Keep the minimum version and required standard-library modules explicit.
Scheduled tools must resolve the executable during setup and store or invoke the
absolute validated path rather than relying on ambient `PATH`.
