# T07 — Reconcile external edits and vault integrity

## Phase
Open-folder interoperability.

## Depends on
T02, T04, T06.

## Decision gates
D05 whole-item external deletion/recovery semantics where destructive behavior
would follow; missing components remain non-destructive repair states.

## Outcome
Reflect external changes while preserving identities, user intent and safe
reference accounting when the app misses filesystem events.

## Context and constraints
Users own and can edit the vault outside the app. Watchers are hints, not a
complete journal. Startup scans establish authoritative reconciliation.
SQLite, jobs and refcount caches must be rebuildable from canonical data.

## Implementation scope
1. Scan supported canonical records at startup, then watch and coalesce live
   changes. Handle rename/write-save patterns without treating transient files
   as new items or deletions.
2. Match by stable ID, not filename. Detect duplicate IDs, invalid versions,
   malformed JSON, missing companions/resources and hash-addressed byte changes.
3. Preserve external Markdown and unknown JSON fields. Quarantine/explain
   conflicts instead of silently choosing a writer or overwriting user content.
4. Reconcile confirmed whole-record removal according to D05. A missing asset
   does not delete all its referencing items or notes.
5. Invalidate source-revision-specific jobs/projections and schedule bounded
   re-extraction. Rebuild reference graphs before enabling orphan collection.
6. Define repair reports for the UI/export path: affected IDs, surviving data,
   reversible actions and unsupported storage-provider behaviors.

## Acceptance criteria
- [ ] Live edits and edits made while closed become visible after reconciliation.
- [ ] Renames preserve IDs and multi-item shared references.
- [ ] Duplicate/malformed/missing records are repairable, not silently dropped.
- [ ] Hash mismatches cannot masquerade as old verified bytes.
- [ ] Incomplete/conflicting scans prevent destructive orphan cleanup.

## Validation
Externally rename notes, rewrite through temporary files, edit tags/corrections,
remove a companion, corrupt a blob and introduce duplicate IDs while the app
is open and closed. Restart with disposable indexes removed. Simulate lost
watcher events, partial writes and stale extraction results; compare canonical
user content byte-for-byte where unchanged. Use synthetic vaults, never
personal libraries. Run existing pure proofs separately.

## Out of scope
Multi-device merge protocols, automatic repair that discards user data,
background global filesystem scanning or proving watcher delivery guarantees.

## Handoff
Provide T08/T10/T13/T14/T32/T38 startup/live revision, conflict and reference-graph
contracts with reproducible external-edit fixtures.
