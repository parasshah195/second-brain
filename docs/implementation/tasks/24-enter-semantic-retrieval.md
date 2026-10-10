# T24 — Fuse independent retrieval branches on Enter

## Phase
Explicit semantic search.

## Depends on
T11, T12, T17, T23.

## Decision gates
None beyond approved prerequisites. Any proposed change to an owner-controlled pure law still requires approval; do not silently reopen prerequisite product decisions.

## Outcome
Run required core semantic retrieval only on Enter and combine independent eligible rankings with lexical retrieval, while preserving complete hard-filter semantics and responsive lexical recovery.

## Context and constraints
Typing supports the live parser, chips, cheap lexical search, and filters. Typing, debounce, and idle must never invoke semantic or vision retrieval or query embedding. Filter-only requests require no embeddings. A cold model is visible but does not block lexical results.

The semantic branch searches the eligible full library, not just FTS hits. Missing, pending, or failed evidence is unknown, not a negative match. Known tags and facets inform the typed parser. Exact custom tag membership stays distinct from generated-tag query origin. All content and queries remain local; model-free save, browsing, FTS, and filters continue offline as visibly degraded recovery. Enter gates query retrieval only: background ingestion organisation automatically runs after save.

## Implementation scope
1. Reuse the T11/T12 typed AST and exact lexical clauses. Bind every submitted request to a query revision and cancel stale model work when the user edits or submits another query. Proposed retrieval coordinator code is future work, not an existing implementation.
2. Execute independent eligible lexical and text-vector branches. Preserve their native ordering and collapse repeated chunks to one item rank within each branch before fusion. T25 adds a compatible vision branch later; do not fabricate vision results now.
3. Apply hard filters before each branch's top-k. Where an underlying branch cannot prefilter, refill/overfetch until the eligible result requirement is met or the eligible space is exhausted; fixed unfiltered top-k followed by filtering is insufficient.
4. Use reciprocal rank fusion with one-based ranks and C=60 as the starting benchmark: each eligible branch contributes `1 / (60 + rank)`. A missing branch contributes zero. Each item has one vote per branch regardless of its chunk count.
5. Honor required exact lexical clauses in eligibility, even for independently retrieved semantic hits. Restrict comparisons to compatible fingerprints and never mix text/vision embedding spaces or versions.
6. Show processed-item coverage before model work, branch availability, partial coverage, and cold-load status. Keep optional boosts bounded and tie-breaking deterministic. T27 personalization is a later extension, not a default hidden score.

## Acceptance criteria
- [ ] Typing, debounce, idle, and filter-only submission produce zero query embeddings.
- [ ] Enter can retrieve a semantic-only eligible item absent from FTS results.
- [ ] Repeated chunks cannot inflate an item's branch contribution.
- [ ] Restrictive filters return eligible hits beyond an initial unfiltered top-k.
- [ ] Exact lexical clauses remain mandatory and ties are repeatable.
- [ ] Cold, missing, failed, or cancelled models leave usable lexical results and honest status.

## Validation
Exercise actual keyboard submission, rapid edits, repeated Enter, cold loads, cancellation, filter-only queries, exact phrases, and semantic-only matches. Include a corpus dominated by filtered-out nearest neighbors and one item with many matching chunks. Compare hand-calculated RRF ranks and verify missing-branch zero contributions. Repeat with networking blocked and all packs disabled. Record retrieval quality, coverage, latency, and cancellation behavior; run `just check` and `just verdict`, without claiming proofs verify models or host IO.

## Out of scope
Semantic search while typing, ANN adoption, learned fusion, mandatory generation, immediate vision integration, and hidden personalization.

## Handoff
Give T25/T27 the branch eligibility, fingerprint, cancellation, collapse, and fusion contracts plus reproducible rank fixtures and recorded quality gaps.
