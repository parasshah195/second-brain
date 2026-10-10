# T14 — Implement Spaces, Smart Spaces, and bulk membership

## Phase
Deterministic organisation.

## Depends on
T02, T04, T07, T12, T13.

## Decision gates
D07 must approve Smart Space membership semantics. Record approval in the decision register before enabling policy-dependent membership. Recommendations are not approvals.

## Outcome
Users organise items into static Spaces and reproducible Smart Spaces without moving files, downloading models, or giving inference control over their organisation.

## Context and constraints
The local, user-owned open-file vault is authoritative. Collections JSON defines Spaces and Smart Spaces; Metadata JSON carries item `space_ids`. Items Markdown owns user text. `.local` indexes are disposable projections, not membership authorities. These locations describe the agreed vault contract, not already implemented application modules.

Only the Bend pure metadata rule and its proofs exist today. Reuse dependency contracts; do not assume a storage service or native bridge exists. Durable mutations use the coordinated local writer and recover after interruption. Startup and live reconciliation include external edits.

System-created tags are permitted, but `user.tags` and `inference.tags` stay distinct. User corrections, promoted tags, and persistent rejections survive refresh. Smart predicates must identify which tag origin they consume.

## Implementation scope
1. Implement create, rename, list, and remove operations for static Spaces with immutable IDs independent of display names. Define invalid references and duplicate-name handling through the existing schema contract. Rename changes a label, never an item path or identity.
2. Implement explicit add/remove membership and bulk operations using `space_ids`. Coordinate Collections and affected Metadata writes recoverably; expose pending, completed, and failed results honestly. A removed Space does not delete its items or shared assets.
3. Persist Smart Space source text, parsed AST, grammar version, relative-date semantics, and sort configuration. Preserve the authored expression when grammar changes; migrate explicitly or surface an actionable incompatibility.
4. Evaluate deterministic and lexical membership against the complete eligible library. Resolve relative dates using the approved query contract and a documented evaluation clock. Avoid page-sized or top-k membership approximations.
5. Treat semantic retrieval as ordering only unless D07 explicitly approves another policy. Recorded auto-tag predicates are allowed; nearest-neighbour similarity is not an implicit membership rule. No arbitrary manual drop into a Smart Space: explain the predicate or offer a separately confirmed static Space action.
6. Return stable membership and ordering contracts for T17. Surface unavailable predicates and stale projections without silently broadening results.

## Acceptance criteria
- [ ] Renaming a Space preserves its ID, members, item paths, and user text.
- [ ] Bulk add/remove is repeatable and interruption-safe; restart resolves partial writes without unexplained membership loss.
- [ ] A saved Smart Space reproduces its membership after deleting and rebuilding `.local`.
- [ ] Matching items beyond an initial result page remain members; hard filters constrain the entire population.
- [ ] Relative dates advance predictably; incompatible grammar versions produce an explicit migration or error state.
- [ ] External membership and collection edits reconcile at startup and while running.
- [ ] Manual actions cannot manufacture dynamic membership or erase custom tags, corrections, or rejection records.

## Validation
Use synthetic vaults with duplicate Space labels, renamed collections, deleted references, conflicting external edits, and enough matches to exceed pagination. Interrupt bulk writes at each durable boundary, restart, and inspect the open files as well as the UI projection. Run date-boundary and no-model/offline membership workflows. Verify semantic ordering cannot alter the membership set under the default policy.

Run existing `just check` and `just verdict` where applicable; report unavailable checks. Bend proofs establish only their stated laws, not host persistence or membership correctness. Record the actual new workflow checks once an implementation exists, rather than inventing current Cargo or npm commands.

## Out of scope
File relocation, collaborative collections, cloud inference, arbitrary similarity-based membership, and unapproved policy defaults.

## Handoff
Provide public Collections/Metadata examples, membership invariants, bulk recovery evidence, grammar-migration behavior, and D07 approval or remaining blockage. T17 consumes the organisation and action contracts.
