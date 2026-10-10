# T39 — Integrate the approved optional sync adapter and recovery

## Phase

Optional mobile and multi-device integration. Blocked until protocol approval and preceding clients exist; never a launch dependency unless explicitly included in release scope.

## Depends on

T34, T38. Use their accepted desktop/recovery and conflict/security contracts.

## Decision gates

D13 must approve the selected provider or transport, encryption mode, identity and key handling, retention, and supported topology. An unresolved gate blocks implementation or distribution of the affected capability.

## Outcome

Exactly one approved user-controlled transport exchanges canonical vault changes safely across supported devices and exposes conflicts and recoverable failures clearly.

## Context and constraints

The repository currently has metadata code and pure-law proofs only. This brief does not authorize immediate sync scaffolding. Local saving and retrieval remain usable when transport is absent or unavailable. Device caches, cache databases, model packs, and provider handles are excluded. User state stays in open portable files; all inference remains on-device. Owner secrets belong outside repository fixtures and logs.

Add T36 or T37 as blocking prerequisites for each mobile client selected in the
approved topology. The initial adapter needs at least two approved clients, but
it does not require both phone platforms if desktop-to-desktop or one mobile
platform is the accepted first scope.

## Implementation scope

1. Implement only the adapter selected under T38. Respect actual provider enumeration, permission, atomicity, and eventual-delivery limits. Apply version checks, staging, checksums, and transaction completeness before publishing incoming changes.
2. Integrate idempotent mutation handling, retries, cancellation, progress, and durable restart recovery. Verify transferred content integrity independently of transport success, including immutable asset hashes and capture resource references.
3. Apply approved merge rules to concurrent notes, custom tags, corrections, rejected inference, automatic provenance, collection queries, and reminders. Retain conflicts visibly and preserve user assertions; repeated delivery must not duplicate items or ICS events.
4. Implement tombstone retention and reference-safe blob cleanup according to approved policy. Long-disconnected replicas, shared assets, delayed deletions, and partial upload must not cause resurrection or remove still-referenced blobs.
5. Provide actionable conflict and recovery communication: pending changes, inaccessible provider, failed integrity check, unsupported version, retained conflicts, and the effect of a chosen resolution. Avoid presenting queued transport work as a durable remote backup.
6. Implement only the approved encryption assurances. Verify key lifecycle, recovery and exposure boundaries where applicable. If content is plaintext at the selected transport, state that explicitly; transport encryption alone must not be described as end-to-end encryption.

## Acceptance criteria

- [ ] Two or more supported devices converge after disconnection and concurrent edits without silent user-data loss.
- [ ] Reordering, duplicate messages, partial writes, and retries are safe and recoverable.
- [ ] Concurrent metadata and reminders preserve assertions and identities without duplicates.
- [ ] Tombstone expiry and shared-blob scenarios satisfy the approved retention contract.
- [ ] Cache databases and packs never enter transfer inventories.
- [ ] Unsupported providers are labeled unsupported; sync absence leaves offline functionality intact.
- [ ] Reviewed encryption claims match actual storage and transport behavior.

## Validation

Use actual supported desktop/mobile devices and the approved transport with synthetic vaults. Disconnect devices, revoke permissions, terminate during send/receive, reorder and duplicate delivery, corrupt a blob, delay tombstones, and reconnect an old replica. Compare canonical files and conflict records after recovery, not merely index counts. Record provider/device versions and sanitized traces. Run `just check`, `just verdict`, and `git diff --check`; separate protocol proof evidence from adapter and device testing.

## Out of scope

Additional providers, forced backend migration, mandatory accounts, WAL replication, speculative adapters, public credentials, and unapproved encryption policy changes.

## Handoff

Provide the supported transport manifest, recovery guide, conflict examples, retention evidence, reviewed security assurances, and unresolved blockers to any release including sync.
