# T33 — Establish cross-cutting quality and performance evidence

## Phase

Desktop qualification. Begin only after the preceding capabilities exist and the approved test scope is recorded.

## Depends on

T17, T18, T19, T22, T24, T27, T32. Their observable contracts supply the desktop test oracle, including original-byte/optional-lossless storage and required core AI; this task cannot substitute invented behavior for missing implementations.

## Decision gates

D03 approves the support matrix and optional branches. D10 approves budgets, measurement conditions, and acceptable tradeoffs. Omitting an unsupported branch requires explicit scope approval and a documented gate.

## Outcome

A reproducible evidence matrix distinguishes proven domain laws, tested host behavior, measured performance, accessibility results, and unresolved release blockers.

## Context and constraints

Today only metadata domain code and pure-law proofs are implemented. Bend proofs and independent kernel evidence do not verify IO, network denial, models, or UI. All fixtures are synthetic; exploit details and real user content remain private. Saving, browsing, lexical search, and filters must work offline without models. Inference runs on-device; only explicit controlled source or model downloads may use networking.

Core local AI organisation, relevance, precision, coverage and the offline bundled-AI workflow are mandatory evidence; D03 cannot waive them. Web-page capture T20/T21 is deferred: ordinary URL bookmarks retain URL, user-provided title and notes without fetching/archiving. Hostile HTML, snapshot/resource security, backup and air-gap tests apply only when future capture is selected, with T20/T21 then blocking as applicable. Add selected optional capability tasks as blocking prerequisites: specialised OCR T26, media/speech T28–T29, native generation T30 and Explore T31. Unselected additions are explicitly unsupported, not a reason to ship without required core AI.

## Implementation scope

1. Map each accepted capability to a host workflow, expected invariant, supported environment, and retained evidence. Separate domain checker results, independent kernel results, cross-language conformance, and actual application tests.
2. Exercise durability and trust boundaries: disk full, process interruption, symlinks and traversal, malformed supported media, invalid JSON, applicable codec bombs, index loss, external edits, and shared-asset deletion. Verify recovery without losing user assertions. Hostile HTML and inert, unprivileged, remote-denied snapshot tests are conditional on future selected capture, not current launch work.
3. Run a complete network-blocked workflow with bundled core AI: capture/import accepted launch sources, save without waiting for enrichment, automatically organise after save, restart, browse, edit notes and custom tags, filter, submit semantic queries on Enter, delete one shared reference, back up, restore, and rebuild. Repeat without or with corrupt core weights as additional visibly degraded recovery/repair tests, not a launch substitute.
4. Evaluate keyboard-only operation, screen-reader names and announcements, contrast, reduced motion, focus order, modal escape, and focus restoration on actual supported hosts.
5. Generate reproducible 10k, 100k, and 1m-item synthetic libraries. Measure cold/warm behavior, search while indexing, cancellation, RAM, disk, battery or power, and model latency. Record hardware, pack versions, distributions, sampling method, and failures.
6. Evaluate relevance against labeled synthetic queries with restrictive filters, multiple assets, chunk-tail matches, and prototype retrieval from few examples. Check independent compatible RRF branches, mandatory hard filters, and one vote per item per branch.

## Acceptance criteria

- [ ] Typing updates parsing, chips, and cheap lexical feedback only; semantic/vision retrieval starts only on Enter.
- [ ] Applicable proposed targets are measured: parsing P95 <2 ms, filtering <16 ms, first lexical results at 100k <50 ms, warm semantic <150 ms, and one-frame input feedback.
- [ ] Saving never waits for enrichment; automatic local organisation runs after save without Enter. Absent/corrupt core models produce visibly degraded usable recovery and actionable repair.
- [ ] Independent held-out fixtures meet approved organisation precision, recall, coverage/abstention, relevance and latency gates on supported hardware, including native CPU fallback; all-abstention cannot pass.
- [ ] Healthy bundled-core offline workflows and additional no-model recovery workflows both pass.
- [ ] Core quality/relevance gates pass on default original content and actual optional losslessly stored content; all metadata, decoded content and familiar formats remain faithful. Exact original-file/source-byte preservation is the default, with optional lossless compression disabled by default. Unsupported, unverifiable, non-saving and signed inputs retain exact input bytes; no canonical lossy compression or retroactive vault recompression is approved.
- [ ] Every failure has severity, reproducible evidence, disposition, and owner.
- [ ] Regressions trigger investigation and fixes rather than silently relaxed SLOs.
- [ ] Accessibility and security gaps remain visible release blockers where applicable.

## Validation

Run `just check`, `just verdict`, and `git diff --check`, preserving their exact output and unavailable-tool status. Execute the actual packaged or development host workflow on the approved matrix and inject faults at real write boundaries. Repeat measurements with cold caches and background indexing; publish sanitized aggregates, not private exploit payloads. Targets remain proposals until measured and accepted; a test plan is not a passing result.

## Out of scope

Unapproved platform expansion, fabricated security certification, production user datasets, and speculative benchmarking frameworks.

## Handoff

Give T34 and T40 the capability/evidence matrix, reproducible fixture recipe, regression list, budget decisions, and explicit unsupported branches.
