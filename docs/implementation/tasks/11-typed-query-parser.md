# T11 — Compile explicit and natural queries into one typed plan

## Phase
Deterministic query language.

## Depends on
T02, T03.

## Decision gates
D08 time/week-start/date boundaries and D03 initial phrase/language scope.
Approved law changes require D01 review.

## Outcome
Provide a deterministic parser, explainable filters and original-text spans
without a model call or a second query dialect.

## Context and constraints
Unqualified relative dates mean saved time. “Taken”, “published” and “due” choose
other fields without silently substituting a missing date. User/device/location
ambiguities remain inspectable. The full ontology is a target, not all launch
phrases implemented at once.

## Implementation scope
1. Publish a versioned AST for typed predicates, residual text, boolean groups,
   sort and query interpretation decisions. Compile natural phrases and explicit
   field syntax into that same representation.
2. Implement selected date/type/format/source/domain/colour/user-state/custom/
   automatic-tag/Space predicates and conservative extensibility for later typed
   evidence, using T02 field ownership.
3. Define quoting/escaping/parentheses, `NOT > AND > OR`, comparisons/units,
   `after`/`before` interval semantics and supported compatibility aliases.
4. Resolve relative dates with approved timezone/week-start rules; preserve the
   expression and expose the resolved interval. Distinguish exact required
   phrases from optional residual discovery text.
5. Return zero-based end-exclusive frontend UTF-16 spans, converting explicitly
   from native offsets. Keep original query text and suppress demoted chip
   interpretations until changed/reactivated.
6. Explain unknown syntax, ambiguous author/device/place/tag names and unsupported
   predicates. Unknown analysis is not a negative fact. Mutating reminder
   commands are separate confirmed actions, never side effects of parsing search.

## Acceptance criteria
- [ ] Natural and explicit equivalents produce equivalent typed plans.
- [ ] Operators/quotes/units/date fields have documented deterministic semantics.
- [ ] Non-ASCII span ranges decorate the intended text.
- [ ] Chip removal does not immediately recreate the same interpretation.
- [ ] Typing/parsing produces zero model calls and zero canonical mutations.

## Validation
Use golden and property fixtures for nested boolean expressions, quoted names,
escape sequences, invalid units, tag-origin collisions, missing evidence,
leap dates/DST/timezones and relative Smart Space reevaluation. Include emoji
and combining characters in span cases. Benchmark parse P95 as a target;
run pure proofs against actual parser policies where claimed and host conformance
checks where converted.

## Out of scope
LLM query guessing, semantic calls while typing, arbitrary English comprehension
or silently changing the approved grammar on model upgrades.

## Handoff
Provide T12/T14/T15/T17/T24 a versioned grammar, AST, interpretation/offset contract
and reproducible equivalence/ambiguity fixtures.
