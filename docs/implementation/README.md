# Ordered implementation plan

This is the execution entry point for humans and coding agents. Read the
[system wiki](../wiki/README.md) for product behavior and the
[decision register](DECISIONS.md) for approvals. Each task below has a standalone
brief with scope, prerequisites, acceptance checks, validation and handoff.
The GitHub issue contains that brief; implementation belongs in focused PRs.

**Baseline:** only the Bend scalar metadata module and draft laws are implemented.
The plan covers the full system, not features already delivered or a commitment
to ship the whole vision in the first release.

**Confirmed release premise:** native compact local AI and automatic organisation
are required and bundled. Exact original-file/source-byte preservation is the
default; optional lossless compression is disabled by default and preserves all
metadata, decoded content and familiar formats. No canonical lossy compression
is approved. Web capture is later work. Model-free operation is
safe degraded recovery or an incomplete milestone, not a complete release.

## Readiness and execution

1. The maintainer merges these planning documents into `develop`.
2. T00 records the startup approvals. T01 is a bounded investigation that can
   run alongside that discussion; D02 adoption follows its measured result.
3. Pick a task whose actual prerequisites are complete and whose decision gates
   are approved. Read the current code, `AGENTS.md` and concern instructions.
4. State the selected scope in the issue. Reuse existing implementations; add the
   smallest complete slice rather than scaffolding future tasks.
5. Satisfy every acceptance criterion with actual evidence. An unavailable check
   is a reported blocker/limit, not a pass. Run the existing proof checks and
   `git diff --check`, plus new host/model/device checks applicable to the slice.
6. Open a PR into `develop`, link its issue, include commands/results and preserve
   privacy. Close the issue only after acceptance and reviewed integration.
   `main` and production publication require separate owner release approval.
7. Update the wiki/decision register if an approved contract changes, then adjust
   affected briefs and GitHub blocking relationships together.

Native GitHub **blocked-by** relationships encode hard task dependencies.
Decision-gate labels indicate separate human approval; a dependency-free issue
can still be gated. T IDs provide a stable logical order even if GitHub numbers
change. Tasks with satisfied prerequisites may run in parallel; this is a DAG,
not an unnecessary single-agent queue.

Each task's `Depends on` section lists hard prerequisites. Conditional capabilities
are described in its scope: the release owner adds them as blocking prerequisites
when selecting that capability. Core AI, automatic organisation and validated
original-byte/optional-lossless storage are hard release prerequisites.
Unselected capture, specialised media/generation, mobile or sync do not block
the current release.

## Suggested execution lanes

| Stage | Tasks | Completion means |
| --- | --- | --- |
| Startup | T00–T01 | Approved first slice and evidenced Bend/native route |
| Foundation | T02–T08 | Portable contracts, durable imports, external reconciliation, safe deletion |
| Ordinary retrieval | T09–T13 | Local extraction, rebuildable FTS, typed queries and authored state |
| Desktop slices | T14–T19 | Spaces, reminders, development UI, previews and original-byte storage with optional lossless compression |
| Deferred capture | T20–T21 | Later snapshot/viewer and browser-capture work; not current prerequisites |
| Required local AI | T22–T25, T27 | Bundled compact core, compatible representations, Enter/RRF and automatic organisation |
| Scoped extra capabilities | T26, T28–T31 | OCR, media, generation and Explore as selected |
| Quality and delivery | T32–T34, T40 | Portable recovery, selected-capability evidence and approved release candidates |
| Later expansion | T35–T39 | Tested mobile capabilities and approved optional sync protocol/clients |

After T04/T05, reconciliation, extraction and preview work can form separate
lanes when their stated prerequisites exist. Parser/domain work can proceed
alongside indexing. Authoring/collections and UI converge on shared contracts.
Background inference never delays durable saves or live lexical feedback, but
the shipped product must include functioning, quality-qualified core AI.

## Task and GitHub index

The [parent roadmap is GitHub issue #7](https://github.com/parasshah195/second-brain/issues/7),
with 41 native sub-issues and blocked-by relationships. Task briefs remain in Git
for review and agents without issue-tracker access; each issue contains the
same execution specification with public dependency links.

| Task | Brief | GitHub issue |
| --- | --- | --- |
| T00 | [Approve startup decisions](tasks/00-approve-startup-decisions.md) | [#8](https://github.com/parasshah195/second-brain/issues/8) |
| T01 | [Validate Bend/native seam](tasks/01-validate-bend-native-seam.md) | [#9](https://github.com/parasshah195/second-brain/issues/9) |
| T02 | [Canonical vault schema](tasks/02-canonical-vault-schema.md) | [#10](https://github.com/parasshah195/second-brain/issues/10) |
| T03 | [Pure domain contracts](tasks/03-pure-domain-contracts.md) | [#12](https://github.com/parasshah195/second-brain/issues/12) |
| T04 | [Safe vault transactions](tasks/04-safe-vault-transactions.md) | [#13](https://github.com/parasshah195/second-brain/issues/13) |
| T05 | [Content-addressed assets](tasks/05-content-addressed-assets.md) | [#14](https://github.com/parasshah195/second-brain/issues/14) |
| T06 | [Durable ingestion scheduler](tasks/06-durable-ingestion-scheduler.md) | [#15](https://github.com/parasshah195/second-brain/issues/15) |
| T07 | [External reconciliation](tasks/07-external-reconciliation.md) | [#16](https://github.com/parasshah195/second-brain/issues/16) |
| T08 | [Deletion and garbage collection](tasks/08-deletion-and-garbage-collection.md) | [#17](https://github.com/parasshah195/second-brain/issues/17) |
| T09 | [Deterministic extraction](tasks/09-deterministic-extraction.md) | [#18](https://github.com/parasshah195/second-brain/issues/18) |
| T10 | [Rebuildable SQLite index](tasks/10-rebuildable-sqlite-index.md) | [#19](https://github.com/parasshah195/second-brain/issues/19) |
| T11 | [Typed query parser](tasks/11-typed-query-parser.md) | [#20](https://github.com/parasshah195/second-brain/issues/20) |
| T12 | [Ordinary query execution](tasks/12-ordinary-query-execution.md) | [#21](https://github.com/parasshah195/second-brain/issues/21) |
| T13 | [Authored item state](tasks/13-authored-item-state.md) | [#22](https://github.com/parasshah195/second-brain/issues/22) |
| T14 | [Spaces and Smart Spaces](tasks/14-spaces-smart-spaces.md) | [#23](https://github.com/parasshah195/second-brain/issues/23) |
| T15 | [ICS reminders](tasks/15-ics-reminders.md) | [#24](https://github.com/parasshah195/second-brain/issues/24) |
| T16 | [Desktop shell](tasks/16-desktop-shell.md) | [#25](https://github.com/parasshah195/second-brain/issues/25) |
| T17 | [Library interaction UI](tasks/17-library-interaction-ui.md) | [#26](https://github.com/parasshah195/second-brain/issues/26) |
| T18 | [Preview, colour and geometry](tasks/18-preview-colour-geometry.md) | [#27](https://github.com/parasshah195/second-brain/issues/27) |
| T19 | [Optional lossless compression](tasks/19-optional-lossless-compression.md) | [#28](https://github.com/parasshah195/second-brain/issues/28) |
| T20 | [Imported web snapshots](tasks/20-imported-web-snapshots.md) | [#29](https://github.com/parasshah195/second-brain/issues/29) |
| T21 | [Managed browser capture](tasks/21-managed-browser-capture.md) | [#30](https://github.com/parasshah195/second-brain/issues/30) |
| T22 | [Bundled core AI lifecycle](tasks/22-local-model-packs.md) | [#31](https://github.com/parasshah195/second-brain/issues/31) |
| T23 | [Bounded text embeddings](tasks/23-bounded-text-embeddings.md) | [#32](https://github.com/parasshah195/second-brain/issues/32) |
| T24 | [Enter semantic retrieval](tasks/24-enter-semantic-retrieval.md) | [#33](https://github.com/parasshah195/second-brain/issues/33) |
| T25 | [Vision example queries](tasks/25-vision-example-queries.md) | [#34](https://github.com/parasshah195/second-brain/issues/34) |
| T26 | [Offline OCR](tasks/26-offline-ocr.md) | [#35](https://github.com/parasshah195/second-brain/issues/35) |
| T27 | [Automatic tags and prototypes](tasks/27-automatic-tags-prototypes.md) | [#36](https://github.com/parasshah195/second-brain/issues/36) |
| T28 | [Sparse media analysis](tasks/28-sparse-media-analysis.md) | [#37](https://github.com/parasshah195/second-brain/issues/37) |
| T29 | [Offline speech](tasks/29-offline-speech.md) | [#38](https://github.com/parasshah195/second-brain/issues/38) |
| T30 | [Native generative enrichment](tasks/30-native-generative-enrichment.md) | [#39](https://github.com/parasshah195/second-brain/issues/39) |
| T31 | [Explore relationships](tasks/31-explore-relationships.md) | [#40](https://github.com/parasshah195/second-brain/issues/40) |
| T32 | [Portable recovery](tasks/32-portable-recovery.md) | [#41](https://github.com/parasshah195/second-brain/issues/41) |
| T33 | [Quality evidence](tasks/33-quality-evidence.md) | [#42](https://github.com/parasshah195/second-brain/issues/42) |
| T34 | [Desktop packaging](tasks/34-desktop-packaging.md) | [#43](https://github.com/parasshah195/second-brain/issues/43) |
| T35 | [Mobile capability spike](tasks/35-mobile-capability-spike.md) | [#44](https://github.com/parasshah195/second-brain/issues/44) |
| T36 | [iOS offline client](tasks/36-ios-offline-client.md) | [#45](https://github.com/parasshah195/second-brain/issues/45) |
| T37 | [Android offline client](tasks/37-android-offline-client.md) | [#46](https://github.com/parasshah195/second-brain/issues/46) |
| T38 | [Sync protocol design](tasks/38-sync-protocol-design.md) | [#47](https://github.com/parasshah195/second-brain/issues/47) |
| T39 | [Sync adapter integration](tasks/39-sync-adapter-integration.md) | [#48](https://github.com/parasshah195/second-brain/issues/48) |
| T40 | [Release readiness](tasks/40-release-readiness.md) | [#49](https://github.com/parasshah195/second-brain/issues/49) |

## Definition of done

The task's observable outcome works at the interface actually used by the next
task. User-owned state remains in canonical files. Failure and no-model/offline
paths are exercised. Relevant laws and host checks pass, dependency/model rights
are recorded, and the PR explains verification limits. Merely adding an interface,
writing a test plan, displaying mocked results or passing unrelated proofs is
not completion.

No task authorises private-content uploads, secret disclosure, destructive user
vault experiments, weakening laws, force pushes or production publication.
Use synthetic fixtures and the private security-reporting route for vulnerabilities.
