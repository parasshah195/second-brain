# T31 — Explore relationships and near duplicates without destructive merging

## Phase
Optional library exploration.

## Depends on
T12, T14, T17, T18, T23, T25, T27.

## Decision gates
D10 approves relationship-quality criteria and exploration budgets. Relationship storage and filter semantics inherit approved prerequisites; changes to pure laws require owner approval.

## Outcome
Provide inspectable, keyboard-accessible relationships and near-duplicate suggestions while keeping explicit user edges canonical and inferred similarity non-destructive.

## Context and constraints
Begin with cheap evidence: same source, author, time, and color. Explore's semantic and visual relationships are optional additions to required core organisation and must compare only compatible fingerprints/spaces. Missing, pending, or failed model evidence is unknown. Cosine similarity is not calibrated confidence. Model-off behavior is visibly degraded recovery, not a complete launch product.

User-created relationships and annotations belong in portable user-owned data. Derived relationships are reusable device-local projections with provenance and rebuild rules, not silent canonical assertions. `near_duplicate_of` is a relationship: it never implies physical deduplication, replacement, automatic merge, or deletion. Original media and user Markdown remain unchanged. Exploration must preserve privacy and basic model-free operation.

## Implementation scope
1. Reuse T12's typed query/filter AST and T14/T17 navigation foundations rather than introducing an independent exploration engine. Apply hard prefilters consistently to related-item candidates.
2. Compute cheap metadata relationships first and explain their actual evidence. Treat absent authors/dates/color evidence as unknown instead of filling guesses. Proposed relationship projection and Explore view are future implementation locations.
3. Add optional semantically/visually similar references using T23/T25-compatible fingerprints. Collapse repeated chunks/frames at item level and preserve matched offsets/timestamps for explanation without popularity from vector count.
4. Separate canonical explicit edges from derived reusable edges. Define edge type, direction/symmetry, origin, source revisions, fingerprint, score, calibrated confidence where justified, and generation state.
5. Display near-duplicate candidates with side-by-side evidence and non-destructive actions such as opening, annotation, or explicitly recording a relationship. Low-confidence candidates remain suggestions; source similarity alone must not erase distinct versions.
6. Explain why each item is related, what is loading, what coverage is partial, and which model is missing. Protect annotation privacy: no cloud requests, no leakage through generated exports or diagnostics, and no inference that silently replaces a user's annotation.
7. Support keyboard navigation, focus return, meaningful labels, and access to evidence without relying exclusively on thumbnails or color. Initiating semantic/vision retrieval requires Enter, never typing, debounce, or idle.

## Acceptance criteria
- [ ] Model-off Explore shows useful cheap relationships and explicit edges.
- [ ] Derived edges expose origin, revision, score/uncertainty, and loading/coverage state.
- [ ] Prefilters use the same AST semantics as search, including exact custom-tag membership.
- [ ] Incompatible embedding spaces/versions cannot create similarity edges.
- [ ] False positives and near duplicates cannot trigger merge, deletion, or asset replacement.
- [ ] Keyboard users can inspect, open, annotate, and return from relationships.
- [ ] User edges and annotations survive disposable-cache rebuilds.

## Validation
Use synthetic same-source revisions, same-author unrelated items, nearby dates, matching colors, genuinely similar media, misleading near duplicates, and many-frame/chunk items. Evaluate false positives against labeled examples and verify low-confidence display. Edit sources, remove models, cancel requests, rebuild projections, and check annotation/edge persistence. Exercise actual keyboard focus flows and restrictive typed filters. Block networking and test model-off save/browse/FTS plus Explore; inspect diagnostics for private annotations. Run `just check` and `just verdict`; separate UI/native/quality evidence from pure proof claims.

## Out of scope
Physical deduplication, automatic merge/delete, social sharing, cloud recommendation services, graph-database infrastructure, and semantic work while typing.

## Handoff
Supply edge ownership/schema examples, evidence explanations, accessibility workflow results, false-positive measurements, and unresolved D10 quality gaps for owner review.
