# T08 — Implement approved deletion and shared-asset collection

## Phase
Data-loss protection.

## Depends on
T03, T05, T07.

## Decision gates
D05 delete/Trash/restore/purge/retention approval. Until resolved, implement only
read-only impact reporting and non-destructive investigative checks.

## Outcome
Make deletion truthful and recoverable according to the approved policy while
preserving every still-referenced shared asset.

## Context and constraints
Item identity differs from blob identity. Deleting one item cannot remove bytes
needed by another, a capture, retained version/Trash record, user link or active
transaction. Deleting a Space deletes only that view/membership.
Disposable refcounts alone never authorise physical deletion.

## Implementation scope
1. Implement the approved logical deletion/restore representation through T04
   transactions and expose an impact preview/confirmation contract.
2. Exclude deleted items promptly from active projections, invalidate their
   background work and unregister reminders through the later scheduling seam.
3. Build complete current reference accounting, including approved recovery
   records and user links. Snapshot/resource accounting is added with deferred
   T20, not implemented now. Encountering unsupported future records holds
   cleanup for repair/review; conflicting/incomplete graphs fail closed.
4. Collect only safely unreferenced blobs after durable record changes.
   Removing one item's asset reference differs from globally deleting a blob;
   the latter needs explicit affected-item review.
5. Restore original user state/IDs and handle collisions without overwriting
   newer notes or files. Permanent purge has explicit guarantees and approval.
6. Ensure replay/restart cannot resurrect deleted imports or delete bytes twice.
   Keep retention/history pruning out unless D05 specifically approves it.

## Acceptance criteria
- [ ] Two items sharing an asset remain independent through delete and restore.
- [ ] Captures, recovery records, user links and transactions protect their blobs.
- [ ] Restart and index rebuild preserve active/deleted state.
- [ ] Stale jobs cannot recreate a deleted record.
- [ ] Actual recovery/purge guarantees match UI confirmation.
- [ ] Incomplete reference graphs fail closed for garbage collection.

## Validation
Exercise item-only deletion, reference removal, global impact review, restore
collision, purge interruption and deletion during import/enrichment. Rebuild
without SQLite and verify notes/custom tags/reminders/collections and shared
bytes. Include live and externally edited reference graphs. Record which
failure phases were injected; proofs of pure eligibility do not prove IO cleanup.

## Out of scope
Automatic near-duplicate merging, undeclared Trash expiry, implicit global
asset deletion or sync tombstones before T38's protocol.

## Handoff
Provide T15/T19/T32/T38 durable deletion, restore, reminder cancellation and
garbage-collection safety contracts plus impact/fault fixtures.
