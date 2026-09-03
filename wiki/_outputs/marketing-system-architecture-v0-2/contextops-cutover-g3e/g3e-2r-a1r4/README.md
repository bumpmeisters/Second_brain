# G3E2R-A1R4 supplemental compatibility overlay

This create-only compatibility layer replaces culture- and runtime-sensitive JSON timestamp roundtrips in A1R3 without modifying A1R3, A1R2, A1R, A1, A, G3E-1, B, or any live component.

A1R4 binds only the accepted A1R3 manifest. It preserves ordinal fingerprint v3, the dynamic full wrapper tree, the existing artifacts and runtime roles, and the 9/19/12 Gate Map shape. It adds a canonical raw-JSON timestamp codec, explicit temporal-boundary rules, an A1R4 live-seal profile, Gate Map v5, and A1R4 finalizer, forward, reverse, and verification entrypoints.

All persisted timestamps use `yyyy-MM-dd'T'HH:mm:ss.fffffffzzz`, `InvariantCulture`, `DateTimeStyles.None`, exactly seven fractional digits, and the sole allowed offset `+00:00`. Structural JSON deserialization never supplies temporal values. Prepared and approval may occur in either order, but both must be at or before sealed. The seal TTL is exactly 900 seconds, future skew is at most 60 seconds, forward requires an unexpired seal, and reverse ignores expiry only.

The eventual seal closure is 9 bundles, 52 execution files, 15 artifacts, and 4 runtimes. Eight explicit hash boundaries bind A1, A1R, A1R2, A1R3, A1R4, B, detached seal inputs, and the final seal.

This checkpoint creates no B candidate, snapshot, seal, capability probe, live mutation, authority change, staging, or commit. Routing remains frozen and FWD-020 remains excluded.
