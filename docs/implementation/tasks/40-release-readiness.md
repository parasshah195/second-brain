# T40 — Stage release readiness for explicit owner approval

## Phase

Desktop-first release qualification. Blocked until candidate artifacts and cross-cutting evidence exist. This task prepares an approval decision; it does not publish a release.

## Depends on

T33, T34.

## Decision gates

D03 approves launch scope; D11 approves distribution. Application code licensing is verified MIT; retain its notices without reopening selection. The accepted capability manifest must account for every other applicable decision: D01 owner-controlled pure laws, D02 Bend/native execution, D04 original-byte default/optional-lossless settings and implementation limits, D05 retention, D06 future capture implementation, D07 smart behavior, D08 reminders, D09 packs, D10 budgets, D12 mobile, and D13 sync/security. Explaining domain laws is not approval to revise them. Third-party model/codec/dependency rights remain separate from MIT code licensing. Unaccepted applicable gates block readiness.

## Outcome

The owner receives a complete, honest release-readiness dossier and can approve or reject a narrowly defined candidate. Publication and production-branch promotion require separate explicit authorization.

## Context and constraints

Only metadata code and pure-law proofs are currently implemented. No task brief or planned test establishes production capability. Desktop launches first with required bundled core AI; mobile, sync and specialised native generation remain later unless explicitly accepted into this release. Web-page capture T20/T21 is deferred; current URL bookmarks retain URL, user-provided title and notes without fetching or archiving pages. Snapshot/resource security, backup and air-gap tests apply only to a future selected capture capability; D06 implementation choices remain pending, not its settled deferral. No cloud accounts or uploads are required, and inference stays on-device. Security exploits and user content remain private; public evidence uses synthetic data and sanitized summaries.

If approved release scope includes mobile or sync, add the applicable T35–T39
tasks and their capability branches as blocking prerequisites. Native generation,
advanced media and capture similarly require completed selected implementation
tasks and qualification evidence. Unselected future branches do not block a
desktop-only candidate.

## Implementation scope

1. Assemble a versioned capability manifest listing supported platforms, source types, retrieval branches, model packs, reminder behavior, recovery guarantees, and unavailable features. Link each claim to actual evidence and its accepted decision; do not imply every intended product facet exists.
2. Review pure-law checker results, independent-kernel results, execution-seam conformance, host CI, security faults, offline workflows, accessibility, relevance, and measured latency/resource budgets separately. Describe proof boundaries and unresolved assumptions.
3. Validate fresh-machine normal and full air-gap installation with bundled verified core weights/runtime. Measure automatic post-save organisation, precision, recall, coverage/abstention, relevance, latency and native CPU fallback on supported hardware. Additionally remove/corrupt core weights and verify visible degraded health, repair, save/browse, lexical/filter rebuild and moved-vault restore without network. Optional extra pack installation must be explicit and verifiable.
4. Exercise backup/restore, purge and deletion retention, shared references, custom tags, automatic provenance, corrections, rejections, and notes across restart and upgrade. Test exact original-file/source-byte preservation by default and optional lossless compression disabled by default. Enabled lossless output must preserve all metadata, decoded content and familiar formats. Confirm unsupported, unverifiable, non-saving and signed inputs retain exact input bytes, stored assets survive recovery unchanged, and upgrades/settings changes never retroactively recompress existing vault content. No canonical lossy compression is approved.
5. Review actual software/model/codec licenses, notices, SBOM, artifact hashes, signing and notarization status, and uninstall behavior. Identify the eligible human reviewer needed for production-branch approval without bypassing protection.
6. Present failed gates, known limitations, rollback/recovery guidance, and a recommended scope decision. Obtain explicit owner approval for release publication and production promotion; ordinary task closure is not release authorization.

## Acceptance criteria

- [ ] Every advertised capability has accepted scope and actual evidence.
- [ ] Failed applicable security, durability, accessibility, or legal gates block readiness.
- [ ] Fresh-machine offline installation ships meaningful core AI and meets approved precision, recall, coverage/abstention and latency gates; no model-free launch or all-abstention pass is allowed.
- [ ] Additional model-free recovery tests pass on approved hosts with visible degraded health and actionable repair.
- [ ] User assertions survive purge/delete scenarios where retention requires preservation.
- [ ] Model and signing rights are approved for the exact distributed artifacts; verified MIT application notices are retained.
- [ ] Exact original-file/source-byte preservation is the default; optional lossless compression is disabled by default and preserves all metadata, decoded content and familiar formats. Core quality gates pass on default original content and actual optional losslessly stored content. Unsupported, unverifiable, non-saving and signed inputs retain exact input bytes; no canonical lossy compression or retroactive vault recompression is approved.
- [ ] Optional mobile/sync inclusion has all applicable predecessor evidence.
- [ ] Owner decision and required human review are recorded without automated launch or publication.

## Validation

Run `just check`, `just verdict`, and `git diff --check` on the candidate source and record exact outcomes, including unavailable tools. Repeat actual clean-device air-gap, restore, accessibility, fault, and resource workflows from T33/T34 using synthetic data. Check candidate hashes against the reviewed manifest. Treat unexecuted plans as missing evidence, not passes; preserve failures and seek approval rather than manufacturing readiness.

## Out of scope

Release publication, package upload, production merge, automatic signing credential use, relaxing gates to obtain a pass, and silently expanding launch scope.

## Handoff

Deliver the candidate dossier, blocking decisions, reviewer requirement, and owner-only publication checklist. State whether readiness is approved, rejected, or blocked; production action remains separately authorized.
