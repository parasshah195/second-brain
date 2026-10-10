# T12 — Execute offline typed filters and lexical retrieval

## Phase
Usable model-free search.

## Depends on
T10, T11.

## Decision gates
D10 measurement budgets where final numerical targets are asserted.
No neural pack is a prerequisite.

## Outcome
Run the parsed query through SQLite/FTS with mandatory eligibility, predictable
pagination, snippets and responsive cancellation.

## Context and constraints
The ordinary search path works offline without accounts, model loading or
enrichment completion. Metadata evidence can be absent/partial; inferred
positive and negative filters exclude unknown evidence by default.
Filters constrain membership rather than add ranking points.

## Implementation scope
1. Compile the typed AST through bound SQL/FTS parameters, honoring boolean/
   required lexical semantics and validated units. Treat parser text as data,
   not executable SQL or unchecked FTS syntax.
2. Preserve item-versus-asset scope. “Red screenshots” requires one matching asset;
   different unrelated assets cannot satisfy pieces of that predicate.
3. Implement lexical rank, deterministic tie-breaking, supported sort, stable
   pagination and source/snippet/coverage fields. Filter-only requests use exact
   predicates and visible sort without a query embedding.
4. Support complete-library predicate evaluation for Smart Spaces, not a bounded
   search top-k masquerading as all matching membership.
5. Bind requests to query revisions, coalesce/cancel obsolete live work and keep
   queries off the UI thread. Concurrent indexing offers a consistent readable
   projection instead of waiting for models or full enrichment.
6. Expose unsupported/unknown/partial evidence and errors visibly. Provide one
   shared eligibility contract for later independent vector branches and Explore.

## Acceptance criteria
- [ ] Model-free, network-blocked queries return exact supported matches.
- [ ] Injection-like input is safely treated as query data or an explicit error.
- [ ] Compound asset predicates and negation/unknown cases match fixtures.
- [ ] Pagination and filter-only sort are repeatable.
- [ ] Smart membership includes matches beyond a ranked top-k.
- [ ] Stale queries cannot replace newer results.

## Validation
Compare results with a small independently enumerated synthetic corpus. Include
multi-asset traps, restrictive filters, exact phrases, unknown facts, Unicode,
negation and malicious SQL/FTS-looking input. Exercise rapid edits while indexing,
cancel/retry, rebuilds and absent packs. Measure warm/cold first results at
10k/100k records against proposed SLOs; preserve proof evidence separately.

## Out of scope
Query embeddings, ANN, neural ranking, Enter-only lexical search or claiming
instant results from a slow unindexed disk.

## Handoff
Provide T14/T16/T17/T24/T31 exact eligibility, complete-membership, cancellation,
pagination/snippet contracts and measured ordinary retrieval evidence.
