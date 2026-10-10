# T00 — Approve the startup contract and first desktop slice

## Phase
Startup decision gate.

## Depends on
None. Merge the reviewed planning documentation before implementation begins.

## Decision gates
D01 behavioral-rule review, initial D03 AI-powered scope, D04 compression details
and D05 deletion policy. MIT licensing and the default compression mode are settled.
D02 adoption follows the separate T01 spike; exact model/mobile/sync approvals
are not conditions for closing this startup subset.

## Outcome
Give agents an explicit, owner-approved contract for the first buildable slice,
without treating recommendations as permission or blocking storage on every
future feature choice.

## Context and constraints
The repository currently implements only scalar metadata precedence in Bend
and two draft universal laws. It has no vault, shell, search engine or model
runtime. Project code is already MIT licensed. Existing proof results do not make
the draft human-owned behavioral contract approved.

Confirmed behavior already includes Enter-only semantic/visual retrieval,
live inexpensive lexical/filter parsing, and automatic generated tags that
never overwrite or remove custom tags. Keep these settled requirements intact.
Native local AI ships as core functionality, selected for measured organisation
quality and minimal useful footprint/latency. Model-free behavior is recovery,
not a completed release. Lossy compression defaults on with all metadata intact
and a disable setting. Web capture is deferred; ordinary URL bookmarks remain.

## Implementation scope
1. Review the wiki and decision register with the owner. Record selections in
   the register and issue, not in an inaccessible discussion.
2. Honour the committed MIT license; do not reopen selection. Explain and review
   `user_assertion_wins` and `inference_is_fallback`, including an explicit
   empty assertion. Record any requested contract revision before code changes.
3. Select the first desktop platform/versions, content types, query/content
   languages and named AI-powered capability slice. Development foundations may
   precede core integration, but release requires bundled AI and useful quality.
4. Record lossy-on default/all-metadata preservation/disable-setting decisions.
   Resolve supported profiles and validation, not whether the default is lossy.
5. Resolve delete/restore/purge semantics before destructive implementation.
   Recommend app Trash, confirmed manual purge and no automatic expiry.
6. Identify later approvals by task rather than forcing all D01–D13 closed now.
   T01 may investigate integration independently; adoption needs evidence.

## Acceptance criteria
- [ ] Owner selections, rationale and affected tasks are publicly recorded.
- [ ] MIT is recorded as settled; exact draft behavioral-rule status is explicit.
- [ ] First-slice platforms, content/languages and deferred features are listed.
- [ ] Default lossy compression/settings/metadata policy and deletion recovery are unambiguous.
- [ ] Pending later decisions stay marked pending; no signing secrets are recorded.

## Validation
Compare the approved decisions against every affected brief and the current
laws. Check all confirmed product decisions, including native AI and capture deferral.
If a law file changes after approval, run the applicable existing proof and
whitespace checks; do not manufacture runtime verification for a decision task.

## Out of scope
Selecting weights, signing releases, implementing storage, approving all future
mobile/sync features, or weakening a law to match convenient code.

## Handoff
Provide T02–T08 the accepted startup subset. Record what remains gated for
capture, reminders, models, distribution and future expansion.
