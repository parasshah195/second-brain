# T03 — Implement and prove the first pure domain policies

## Phase
Domain correctness.

## Depends on
T00, T01, T02.

## Decision gates
D01 approval of each law and D02 adopted execution seam. New laws need explicit
approval; proof convenience is not grounds for weakening a human contract.

## Outcome
Extend the actual Bend implementation with the minimal pure policies needed by
the first host slice and keep proofs connected to that implementation.

## Context and constraints
The existing scalar resolver already gives a present user value priority,
including an empty string. Set-valued tags and operation states need their own
contract; scalar proofs are not evidence for those additional behaviors.
The host must use the adopted execution route or state its conformance gap.

## Implementation scope
1. Reuse existing precedence behavior and approved laws. Add narrowly scoped
   typed policies for authored/generated layers, persistent rejection and
   promotion, and effective evidence resolution according to T02.
2. Specify refreshing the generated layer without mutating the custom-tag set.
   An explicit correction/rejection stays effective across inference changes;
   automatic outputs cannot become custom assertions without a user action.
3. Define minimal processing-state/revision transitions, stale-result rejection
   and unknown-evidence predicate behavior required by ingestion/retrieval.
   Unknown is not a negative model finding.
4. Keep pure transformations free of filesystem/model/OS assumptions. Add further
   query/ranking laws with their implementation slices rather than building a
   speculative complete ontology now.
5. Propose exact universal laws for owner approval and discharge them against
   actual `src/` functions through `PROOF.bend`. Add host conformance checks at
   the approved seam, not a second unproved implementation pretending parity.

## Acceptance criteria
- [ ] Existing approved scalar laws still hold, including explicit-empty input.
- [ ] Generated refresh preserves the entire authored tag/correction layer.
- [ ] Rejected labels and stale revisions cannot be reinstated by a pure merge.
- [ ] Each new claimed law is approved and proved against actual implementation.
- [ ] Host integration evidence distinguishes conformance from kernel proofs.

## Validation
Run `bend guide`, `just check` and `just verdict` with the pinned kernel.
Exercise synthetic sets with equal labels in both origins, empty assertions,
explicit removal/rejection, promotion and older job revisions. Check total error/
state behavior and cross-language round trips. Report unavailable checks honestly.

## Out of scope
Proving model accuracy, disk transactions, HTML rendering or all future search
behavior; rewriting laws to make a failing implementation pass.

## Handoff
Provide T04/T06/T08/T11/T12/T13/T27 minimal callable policies, approved laws and
proof/conformance fixtures.
