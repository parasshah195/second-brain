# T10 — Build the rebuildable SQLite and full-text projection

## Phase
Ordinary retrieval foundation.

## Depends on
T07, T09.

## Decision gates
D03 supported corpus/tokenisation. Use tested SQLite builds with current WAL
correctness fixes; distribution/version evidence is recorded, not assumed.

## Outcome
Index canonical records and extracted content for offline filtering, phrases and
snippets, with no user state owned exclusively by SQLite.

## Context and constraints
The search database is disposable. FTS5 external-content mode still needs a
consistent SQL backing table/view; it does not open Markdown files directly.
Use full-detail features needed for phrases and snippets rather than smallest
possible storage at the cost of retrieval behavior.

## Implementation scope
1. Project items, asset references, provenance, typed evidence/user state,
   collections, reminders, revisions and processing coverage from canonical data.
   Separate item facets and asset facets for correct compound predicates.
2. Add FTS5 titles/notes/extracted text with documented tokenizer, phrase/prefix/
   boolean support and snippet locations. Avoid unnecessary canonical duplicates;
   justified rebuildable backing content is allowed.
3. Implement incremental updates, deleted-record removal and complete rebuild
   after queue/database loss. Version indexes independently of vault schemas.
4. Coordinate one writer, reads and checkpoints in device-local WAL mode.
   Exclude SQLite/WAL from sync and disallow unsupported cross-host operation.
5. Build into a temporary projection and publish a coherent index without
   exposing half-built query state. Report rebuild progress/coverage; queries
   can use the available consistent snapshot.
6. Define safe maintenance and cache clearing, including compaction only outside
   interactive paths and sufficient free-space checks.

## Acceptance criteria
- [ ] Removing SQLite/WAL and rebuilding preserves all authored state.
- [ ] Phrase/snippet fixtures match full successfully extracted text.
- [ ] Edits/deletions and invalidated source revisions update coherently.
- [ ] Concurrent indexing does not deliberately block search on enrichment.
- [ ] Unsupported versions/storage modes and rebuild failure leave canonical data safe.

## Validation
Compare rebuilt and incrementally updated projections from the same synthetic
vault. Include phrases, Unicode/tokenizer limits, long-document tails, multiple
assets, stale extracted data and missing evidence. Exercise interruption, disk
limits, reader/writer contention and maintenance. Record index sizes/latencies;
the current pure Bend proofs do not prove SQLite behavior.

## Out of scope
Database-owned custom tags/notes, vector retrieval, minimum-detail FTS shortcuts,
syncing WAL or claiming a database rebuild is instantaneous.

## Handoff
Give T12/T14/T16/T23/T24/T26/T29 queryable projection, revision/coverage/snippet
interfaces, rebuild commands and comparison fixtures.
