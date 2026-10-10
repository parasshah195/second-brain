# T13 — Persist notes, custom tags and explicit user intent

## Phase
Authored library state.

## Depends on
T03, T04, T07, T09.

## Decision gates
No additional product gate beyond adopted schemas/domain contracts. Any
destructive operation uses T08 rather than inventing independent deletion rules.

## Outcome
Make user editing the authoritative layer and expose automatic-tag acceptance/
rejection operations without letting enrichment overwrite authored content.

## Context and constraints
Markdown body/title ownership follows T02; extracted source titles and model
suggestions are fallback evidence, not authorship. Item JSON separates custom
tags from generated tags. The user may annotate one logical reference without
changing another item that happens to share its asset.

## Implementation scope
1. Implement durable note/title editing and structured custom tags/fields,
   favourites, pinned/read/archive/last-viewed state and explicit relationships
   according to T02 ownership.
2. Route writes through T04 with revisions and conflict checks. Preserve unknown
   JSON fields and externally edited Markdown; never rewrite the body to store
   generated extraction or large volatile inference fields.
3. Implement pure T03-backed effective tag/correction behavior. Automatic refresh
   can replace only the generated layer. Equal labels keep their distinct origins;
   custom assertions remain authoritative and explicit-empty values remain meaningful.
4. Provide explicit reject and promote operations for generated labels and user
   corrections. Persist rejections/negative examples so later indexing/model
   changes cannot undo them; promotion is a user action, not implicit training.
5. Reuse T09's generated-label update path for approved metadata-derived tags,
   preserving the same provenance/revision/rejection contract later used by
   T27's model-based generation.
6. Emit revisions/projection changes for search and collection/reminder consumers.
   No SQLite column is the sole record of authored state.

## Acceptance criteria
- [ ] Notes/custom tags and all supported user state survive index removal/rebuild.
- [ ] Model/extraction refresh never edits or removes custom tags or user text.
- [ ] Rejection/promotion/corrections persist across restart and stale completions.
- [ ] Shared-asset items retain independent authored state.
- [ ] Concurrent external edits produce a recoverable conflict, not silent overwrite.

## Validation
Round-trip notes with Unicode/front matter and unknown JSON fields. Refresh
automatic labels after edits, reject/promote a label, remove packs/caches and
restart. Inject interrupted writes and concurrent external edits. Include equal
custom/automatic label names and explicit-empty assertions. Run approved pure
proofs and actual host-write/conformance tests; keep claims distinct.

## Out of scope
Model training, automatic assignment of manual Space membership, rewriting notes
as generated summaries or implementing UI before T16/T17.

## Handoff
Give T14/T15/T17/T27/T32/T38 authored-state, tag-origin, correction/rejection and
revision contracts with canonical fixtures.
