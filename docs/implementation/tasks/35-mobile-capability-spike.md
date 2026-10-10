# T35 — Verify mobile vault and runtime capabilities

## Phase

Optional post-desktop feasibility spike. Work remains blocked until a bounded device investigation is approved; mobile is not a launch dependency.

## Depends on

T01, T02, T12, T13, T22, T32. Their accepted domain, portable data, ordinary retrieval, authored-state, core AI and restore contracts are prerequisites rather than suggestions to redesign the vault.

## Decision gates

D12 approves devices, OS and SDK versions, minimum capability, platform policy, and the spike's exit criteria. D09 approves core mobile model/runtime compatibility. Obtain approval before selecting a production mobile route.

## Outcome

A tested capability matrix establishes whether each proposed mobile platform can safely access portable vaults, perform deterministic offline operations, and deliver bundled meaningful core AI on supported devices through an adapted minimal native runtime with CPU fallback.

## Context and constraints

Only metadata code and pure-law proofs exist today. Portable desktop data does not imply identical mobile execution, filesystem behavior, or background privileges. Open vault state remains authoritative; device-local caches are disposable and model packs remain separate from user content. No capability gap authorizes a cloud fallback, mandatory account, or upload.

The deterministic provider/storage spike can execute incrementally before core inference is ready, but is not sufficient for client adoption. Final mobile route adoption requires T22 core model/runtime evidence, measured organisation quality/coverage/latency, supported-device CPU fallback and redistribution approval; OS-native model availability alone is insufficient.

## Implementation scope

1. Select the smallest approved device experiment. Test iOS document-provider access and security-scoped bookmarks, including relaunch, moved folders, revocation, and provider availability. Test Android Storage Access Framework permissions and persistability across equivalent lifecycle events.
2. Measure actual provider read/write, enumeration, rename, replacement, atomicity, durability, and watcher semantics. Identify which desktop journal and reconciliation assumptions hold, require adaptation, or cannot be supported. Treat permission handles as device-local rather than portable identifiers.
3. Exercise foreground, suspension, process termination, background execution, share-extension or share-intent limits, and constrained power conditions. Distinguish receiving an intent from durably copying source bytes.
4. Test a minimum deterministic no-model workflow using synthetic vault data: open, browse, lexical/filter search, edit an assertion, persist it, relaunch, and recover. Measure memory, storage, battery or power, and cache rebuilding on actual minimum devices.
5. Investigate the accepted Bend host route with real mobile toolchains. Document shared native execution, conformance gaps, or blockers; metadata proofs do not verify mobile IO. Measure bundled core model/runtime storage, organisation precision/recall/coverage/abstention, latency and native CPU fallback on minimum supported devices. Provider-only results may be incremental but cannot establish adoption readiness.
6. Publish the capability matrix with tested device/OS/SDK/provider combinations, reproducible procedures, limits, and a recommendation for a narrow initial client. Stop for owner approval at the exit rather than turning the spike into a generic framework.

## Acceptance criteria

- [ ] Both platform investigations distinguish tested behavior from API documentation.
- [ ] A provider's inability to guarantee atomic writes has an explicit safe limitation or recovery design.
- [ ] Permission revocation and unavailable folders preserve recoverable pending work.
- [ ] Minimum-device deterministic operation succeeds without neural inference as temporary visibly degraded recovery, not a complete mobile product.
- [ ] Adoption evidence includes bundled core AI organisation quality/coverage/latency and native CPU fallback; optional additions and unsupported runtime combinations are separately labeled.
- [ ] The owner accepts, narrows, or rejects each platform route before implementation starts.

## Validation

Use real approved iOS and Android devices, including minimum hardware, with synthetic folders and network disabled. Restart, revoke access, move folders, exhaust storage, terminate mid-write, and inspect the resulting authoritative files on another device. Retain sanitized measurements and provider-specific evidence. Run `just check`, `just verdict`, and `git diff --check` for repository work; report blocked kernel verification without treating platform observations as proofs.

## Out of scope

Production clients, sync selection, broad mobile abstractions, cloud fallback, universal filesystem assumptions, and speculative platform scaffolding.

## Handoff

Give T36, T37, and T38 the accepted capability matrix, chosen narrow execution routes, data-portability gaps, recovery requirements, and unresolved D12 decisions.
