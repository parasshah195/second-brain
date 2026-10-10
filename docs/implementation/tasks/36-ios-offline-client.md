# T36 — Build the approved iOS capture and offline library client

## Phase

Optional mobile implementation after an approved spike. Remains blocked until iOS scope and preceding storage contracts are accepted; desktop launch does not depend on it.

## Depends on

T35, T12, T13, T14, T15, T19, T22, T24, T27. Reuse their approved import, compression, metadata, retrieval and core AI contracts.

## Decision gates

D12 approves iOS platform, SDK, minimum devices, and native/Rust shared-data route. D09 approves required core mobile model/runtime compatibility and any optional inference additions. Neither decision may be inferred from desktop support.

## Outcome

An approved iOS device can capture supported shared content durably and use an existing portable library offline, with honest platform capability limits.

## Context and constraints

The repository currently contains metadata code and proofs only. iOS execution must follow T35 evidence, not a speculative cross-platform framework. Vault notes, JSON assertions and provenance, immutable assets, future selected captures, collections, and ICS remain portable user state. Security-scoped access and device caches remain local. Released clients bundle meaningful core AI through an adapted minimal native runtime with tested CPU fallback on supported devices; accounts, uploads, and sync are not prerequisites.

Automatic local organisation runs after save without waiting for Enter or blocking persistence. Query semantic/vision retrieval remains Enter-only. Missing/corrupt/disabled core AI is a visible temporary unhealthy/degraded recovery state with repair, not an accepted model-free client. OS-native model availability alone cannot supply core AI. Web-page fetching, snapshots and viewers are deferred; ordinary URL bookmarks retain URL, user-provided title and notes without fetching or archiving pages.

## Implementation scope

1. Implement the accepted native/Rust route and document the Bend execution or conformance seam. Use document-provider access and bookmark lifetimes verified by T35, avoiding assumptions that mobile files behave like unrestricted desktop folders.
2. Handle share-sheet entry with durable import intent, source access lifetime, copy completion, cancellation, and recovery. Distinguish “queued” from “bytes safely persisted”; never display durable capture success merely because a URL or attachment reference was received.
3. Provide offline browsing, lexical/FTS retrieval, mandatory filters, notes, custom tags, automatic tag provenance, and Spaces. Preserve user corrections, rejections, and promotions when enrichment runs. Support reminder reading or scheduling only within approved platform permissions.
4. Keep parsing, chips, and cheap lexical feedback live. Start semantic or vision query retrieval only on Enter with compatible bundled core weights. Missing core weights leave deterministic recovery usable with visible degraded health and repair; no hidden download or cloud inference path.
5. Handle suspension, termination, revoked access, stale enrichment jobs, external edits, and provider conflicts through accepted durable recovery and reconciliation rules. Jobs must not overwrite newer user assertions.
6. Record platform limits for sharing, clipboard access, notifications, and document providers instead of promising unavailable behavior. Only if future page capture is selected, add T20/T21 as applicable blockers and display captured HTML through an inert, unprivileged, remote-denied viewer; no viewer is required for current URL bookmarks.
7. Inherit T19's exact original-file/source-byte preservation default and optional
   lossless setting, disabled by default and prospective only. Validate all
   embedded/canonical metadata, decoded content and familiar formats on native
   outputs; retain exact input bytes for unsupported, unverifiable, non-saving
   and signed inputs. Record import policy/hash revisions; no canonical lossy
   compression or retroactive recompression.

## Acceptance criteria

- [ ] Minimum approved hardware delivers bundled core AI organisation meeting measured precision, recall, coverage/abstention and latency gates offline with native CPU fallback; separate no-model tests verify visible temporary recovery and repair.
- [ ] Interrupted sharing leaves a recoverable pending import or a clear failure, never fictitious saved bytes.
- [ ] Notes and custom tags persist across restart and are not erased by automatic tagging.
- [ ] Revocation and stale jobs do not corrupt authoritative content.
- [ ] Enter-only query retrieval, automatic post-save organisation and hard-filter constraints match the desktop contract.
- [ ] Reminder and background features expose permissions and tested limitations.
- [ ] Mobile original-byte default/optional-lossless settings, metadata/decoded-content/format fidelity and fail-safe input retention pass; core organisation meets quality gates on default original content and actual optional losslessly stored content.

## Validation

On actual approved devices and SDK builds, exercise sharing, suspension, process termination, low storage, permission revocation, moved folders, provider unavailability, and conflicting external edits using synthetic data. Deny networking and run the full workflow with bundled core AI, including automatic organisation and Enter-only queries; additionally remove/corrupt core weights and test degraded recovery and repair. Record device, OS, SDK, provider, precision, recall, coverage/abstention, latency, memory, and recovery evidence. Run `just check`, `just verdict`, and `git diff --check`; domain checks do not prove platform behavior.

Exercise native metadata-rich lossless optimisation, toggle persistence and exact
new-import source-byte preservation by default/when disabled. Retain exact input
bytes for unsupported, unverifiable, non-saving and signed inputs; check unchanged
existing assets after preference changes/upgrades and measure AI on default
original content and actual optional losslessly stored content.

## Out of scope

Mandatory sync, unapproved iOS versions, cloud inference, interactive offline web replicas, unrestricted background clipboard access, and generic mobile infrastructure.

## Handoff

Provide supported capability and permission manifests, recovery evidence, and explicit unavailable features to T39 and any release that elects to include iOS.
