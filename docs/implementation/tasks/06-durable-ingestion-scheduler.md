# T06 — Coordinate durable ingestion and bounded background work

## Phase
Non-blocking ingestion.

## Depends on
T03, T05.

## Decision gates
D03 supported import sources; D10 worker/resource budgets. Safe bounded
investigation may establish measurements before a final numerical budget.

## Outcome
Save notes, URL bookmarks and import intents quickly, then complete durable
asset/enrichment work through restart-safe, revision-aware jobs.

## Context and constraints
AI, compression and full downloads are outside the save critical path.
Required core AI autoorganises after ingestion; it is not an optional product
tier. Cold/faulted AI has visible degraded status and repair without blocking
durable saves. The meaningful job state is canonical; a SQLite queue is reconstructible.
An item saying Importing is not a claim that its bytes are backed up.
Existing-vault save/browse works without models or network.

## Implementation scope
1. Persist a stable item with note/source/saved time and recoverable work intent
   before acknowledging the registered save. Implement selected-file/drop,
   clipboard-text and explicit URL-bookmark inputs for the approved slice.
2. Distinguish pending/running/ready/partial/failed/cancelled stages and meaningful
   errors. Store retry/source/revision information without storing credentials.
3. Route copying through T05 and canonical commits through T04. Make restart
   reconstruction and retries idempotent; no duplicate authored records from
   replaying one registered intent.
4. Bind work to item/source revisions and recheck before commit. Deletion or a
   newer edit invalidates old jobs; they cannot resurrect old state.
5. Implement small bounded scheduling with interactive priority, cancellation,
   pause/resume where feasible and idle-zero expensive work. Respect resource/
   battery/thermal pressure where supported; expose actual capability limits.
6. Register extraction, previews, default metadata-safe compression and required
   core inference as background stages. Failure does not make durable saves fail,
   but organisation readiness is honest. URL bookmarks never fetch/archive pages;
   capture T20/T21 is explicitly deferred.

## Acceptance criteria
- [ ] User/source information survives a crash after acknowledged save.
- [ ] Asset readiness is truthful and independent of annotation availability.
- [ ] Queue loss/restart reconstructs pending work from canonical state.
- [ ] Retry, cancellation and stale completion preserve latest authored state.
- [ ] Empty queues do no model work; heavy work never waits on the UI thread.

## Validation
Exercise actual note/bookmark/local-file imports, large files, abrupt process
stop, missing source, disk failure, retry, deletion and edit during work.
Remove disposable queue/index files and restart. Run with no models and blocked
network. Measure save acknowledgment separately from copy completion, worker
memory and responsiveness under ingestion. Preserve pure proof checks.

## Out of scope
Full-page browser automation, model selection, unbounded concurrency, silent
background uploads or treating progress UI as evidence of durable bytes.

## Handoff
Provide T07/T09/T15/T16/T18/T22–T30 observable job/state/cancellation contracts,
revision fixtures and restart evidence.
