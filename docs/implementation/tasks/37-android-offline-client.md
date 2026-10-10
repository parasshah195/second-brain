# T37 — Build the approved Android capture and offline library client

## Phase

Optional mobile implementation after the approved capability spike. Blocked until platform scope and predecessor contracts exist; not required for desktop launch.

## Depends on

T35, T12, T13, T14, T15, T19, T22, T24, T27. Their import, compression, metadata, retrieval and core AI contracts remain authoritative.

## Decision gates

D12 approves Android target versions, minimum devices, providers, and execution route. D09 approves required core mobile model/runtime compatibility and any optional inference additions. Unapproved providers or inference backends remain explicitly unsupported.

## Outcome

An approved Android device durably imports supported shared content and operates an existing portable vault offline, with provider and background limits visible to users.

## Context and constraints

Only metadata code and pure-law proofs exist now. Android Storage Access Framework access is not POSIX filesystem access: enumeration, replacement, rename, permissions, and durability vary by provider. Portable identifiers belong in authoritative files; provider handles and cache identities are device-local. Released clients bundle meaningful core AI through an adapted minimal native runtime with tested CPU fallback on supported devices. Local inference never authorizes uploading content or requiring an account.

Automatic local organisation runs after save without waiting for Enter or blocking persistence. Query semantic/vision retrieval remains Enter-only. Missing/corrupt/disabled core AI is a visible temporary unhealthy/degraded recovery state with repair, not an accepted lexical-only client. OS-native model availability alone cannot supply core AI. Web-page fetching, snapshots and viewers are deferred; ordinary URL bookmarks retain URL, user-provided title and notes without fetching or archiving pages.

## Implementation scope

1. Implement the narrow route accepted by T35. Persist URI permissions only where supported and distinguish unavailable providers from missing data. Adapt journaling and reconciliation to tested provider semantics rather than assuming atomic rename or reliable watchers.
2. Handle share-intent lifecycle, temporary source grants, staging, durable registration, byte copying, cancellation, and restart recovery. Successful receipt of an intent does not mean the asset has been safely copied.
3. Provide offline browsing, lexical/FTS search, mandatory filters, notes, Spaces, custom tags, and automatic tag/provenance display. Enrichment may create `inference.tags` automatically but cannot remove or overwrite `user.tags`, corrections, rejections, or promotions.
4. Keep parsing, chips, and cheap lexical feedback responsive. Gate semantic/vision retrieval on Enter and compatible approved local packs. Test LiteRT CPU fallback and each selected execution provider on actual devices; do not promise universal NPU support.
5. Use WorkManager or another approved native mechanism only within tested background constraints. Describe deferred work, battery restrictions, process death, reboot, stale-job cancellation, and recovery. Device caches remain disposable and rebuildable.
6. Implement applicable reminder permissions and scheduling with explicit reboot and delivery limitations. Resolve external edits and provider conflicts without silently losing assertions. Only if future page capture is selected, add T20/T21 as applicable blockers and keep snapshot viewing inert, unprivileged, and remote-denied; no viewer is required for current URL bookmarks.
7. Apply T19's default-on lossy compression and persistent prospective disable
   setting to native/SAF imports. Preserve all metadata, retain input on
   unsupported/unverifiable encoder output, and bind policy/hash revisions to
   each import. A preference change never silently rewrites the existing vault.

## Acceptance criteria

- [ ] A minimum approved device delivers bundled core AI organisation meeting measured precision, recall, coverage/abstention and latency gates offline with native CPU fallback; separate no-model tests verify visible temporary recovery and repair.
- [ ] Permission revocation and non-persistable source grants produce recoverable states.
- [ ] Process death during import never produces false durable-success feedback.
- [ ] Custom assertions survive external reconciliation and repeated enrichment.
- [ ] Required core native CPU fallback and selected accelerators have measured capability records; Enter-only queries and automatic post-save organisation match desktop behavior.
- [ ] Reminder behavior after reboot, denied permission, and background restriction is accurately reported.
- [ ] Compression settings/fidelity/fail-safe retention pass, and useful core-AI quality is measured on actual stored default-compressed content.

## Validation

On real approved devices and providers, run synthetic share imports, fill storage, revoke grants, terminate the process, reboot, restrict background execution, move folders, and edit files externally. Inspect authoritative files after recovery and rebuild caches with networking denied and bundled core AI installed. Measure automatic organisation and Enter-only retrieval; additionally remove/corrupt core weights to test visible degraded recovery and repair. Record OS, SDK, hardware, precision, recall, coverage/abstention, latency, memory, and power evidence for native CPU fallback and selected accelerators. Run `just check`, `just verdict`, and `git diff --check`, reporting unavailable kernel verification honestly.

Test metadata-rich native encoding through supported providers, on/off preference
persistence, disabled new-import byte preservation, failed/unverifiable candidates
and unchanged existing assets after a setting change. Use stored compressed input
for AI quality evidence rather than only pristine source files.

## Out of scope

Mandatory sync, provider-independent POSIX emulation, universal NPU claims, cloud inference, unrestricted background work, and speculative framework code.

## Handoff

Supply T39 and optional mobile releases with provider support, permission behavior, recovery evidence, inference availability, reminder limitations, and unresolved D12/D09 decisions.
