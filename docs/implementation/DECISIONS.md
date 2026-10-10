# Decisions needed for execution

The owner has confirmed **innate native local AI bundled with the product**,
**Enter-triggered semantic/visual retrieval**, **automatic tags that never
overwrite or remove custom user tags**, **lossy compression on by default with
all metadata preserved and a disable setting**, and **web capture deferred**.
The project code is licensed under **MIT**, verified on `develop`.
These are settled requirements, not open questions.

The [wiki](../wiki/README.md) explains the system. This register records the
remaining human choices, recommendations and the tasks each choice gates.
**Recommendations are not approvals.** Agents must record an explicit owner
decision here and in the affected issue before implementing a gated behavior.
No assignees, deadlines, licenses, platforms or credentials are invented.

## Starting safely

1. Merge the reviewed planning documentation into `develop`.
2. Resolve T00's startup subset: review of D01's behavioral rules, D03's
   AI-powered first slice, D04's compression details and D05's destructive policy.
3. Run T01's bounded integration spike. D02 approval follows evidence, not an
   assumed Bend FFI.
4. Complete prerequisite issues and resolve each task's listed decision gates.
   A later mobile/sync/model choice does not block unrelated storage work.

If a decision remains unanswered, execute only the ungated investigative or
non-destructive portion explicitly allowed by its issue. An issue is not ready
merely because it has a number.

## Decision register

### D01 — MIT license settled; behavioral-rule review

**Status:** MIT is already chosen and committed. Review of the current draft
behavioral rules remains distinct. **Gates:** T00, T03 and claimed proof contracts.

**Plain English:** “domain laws” means rules the program must always follow,
not legal license terms. The existing Bend code says an explicit user value
beats inference, and inference is used only when a user value is absent. An
explicit empty value also counts as a user choice.

**Recommendation:** retain those human-owned user-authority rules and confirm
their exact semantics before treating draft formal laws as approved. Set-valued
tag protections need their own implementation/proofs; a scalar proof does not
prove the whole AI system. Do not reopen MIT selection.

**Record:** approved rule names/semantics and any requested revision with rationale.
Honour the committed MIT notice. Runtime/model/codec rights remain separate D11
work; the application license does not license unrelated weights.

### D02 — Callable Bend/native seam

**Status:** pending spike evidence and owner adoption. **Gates:** T01, T03, T04,
T16, T22 and mobile runtime reuse.

**Plain English:** having proofs in Bend does not establish how the desktop app
will call that code or how fast and reliably those calls will run.

**Recommendation:** retain Bend for suitable pure rules and Rust/native code for
IO, using the smallest supported integration verified by T01. Investigate an
actual supported compiled/library or bounded executable route; choose after
testing, not before. Do not silently duplicate the rules in Rust and claim the
Bend proofs apply. If no acceptable route exists, bring alternatives and their
conformance/proof limits to the owner before building the shell.

**Record:** runnable integration, pinned tools, wire contract, failure behavior,
cold/warm overhead, conformance corpus and precisely what is proved.

### D03 — First release, platforms and languages

**Status:** pending. **Gates:** T00, T09, T16, T26, T29, T33, T34, T40.

**Plain English:** the full vision includes much more than should launch at once.
Agents need to know which operating systems and capabilities count as done.

**Recommendation:** first releasable desktop slice covers open vaults, notes/URL
bookmarks/local files, durable imports/deletion, text/metadata and Enter-triggered
semantic search, custom and AI-generated automatic tags, Spaces/Smart Spaces,
previews and the required bundled native core AI.
Use macOS as the first end-to-end reference environment, keep the contracts
portable, then qualify Windows and Linux before calling the product cross-platform.
Start the query grammar in English and preserve Unicode content; document
tokenisation/search limitations. The core model must organise accepted content
with measured high precision and useful recall/coverage. Model-free development
slices/recovery are not complete releases. Web capture is deferred; specialised
media/OCR/generation remain separate scope choices.

**Record:** included task IDs/features, supported OS versions/architectures,
reference hardware, UI/query/content languages and explicit deferred features.
The task DAG covers the full vision; it is not a promise all tasks ship together.

### D04 — Default lossy compression; remaining quality/format details

**Status:** lossy compression on by default, preservation of all metadata and a
disable setting are confirmed. **Gates:** T19's profile/format details and T40 evidence.

**Plain English:** storage can discard some media information, but must preserve
all embedded metadata and user/source provenance. Disabling lossy compression
protects subsequent imports; it cannot recover information already discarded.

**Recommendation:** record the setting/profile on each import; do not automatically
rewrite existing assets after a preference change. Validate every metadata block
and field, including GPS/times/orientation/ICC/custom or unknown fields, before
committing a new hashed candidate. If fidelity or integrity cannot be established,
keep the input. Do not invalidate signed documents or silently convert formats.

**Record:** eligible types, encoder/quality profiles, metadata/integrity comparison,
savings/CPU limits and source-to-stored provenance. Benchmark AI precision/coverage
on the default-compressed representation as well as source fixtures.

### D05 — Delete, undo, Trash and retained versions

**Status:** pending before destructive behavior. **Gates:** T00, T08, T19, T32, T38.

**Plain English:** “delete” needs one clear meaning, especially when several items
share a file and a user expects undo.

**Recommendation:** app-managed Trash with restore and confirmed manual purge;
no automatic expiry initially. Shared blobs remain while any live, trashed,
captured or retained record references them. Retained Trash is canonical recovery
data, not a reclaimable cache. Add history expiry only after an explicit policy.

**Record:** Trash representation, restore collisions, purge confirmation,
retention/history limits, reminder cancellation/restoration and external-delete
behavior. No approval means no automatic permanent deletion or orphan purge.

### D06 — Web capture fidelity, authentication and limits

**Status:** implementation deferred by owner. **Gates:** T20/T21 only when later scheduled.

**Plain English:** readable offline copies are feasible; arbitrary live websites
cannot become fully functional offline just by saving HTML.

**Current scope:** URL bookmarks store the URL and user-provided title/notes
without downloading/archiving pages. Imported offline snapshots, resource
manifests, their viewer and app-managed browser capture are all later work.
They do not gate current backup, quality, packaging or mobile-client readiness.

**Future recommendation:** inert best-effort reading/rendering, no mandatory
extension, authenticated capture or embedded streaming-media download initially.
Choose fidelity/limits only when scheduling the feature.

**Record:** fidelity definition, allowed URL/resource schemes, page/resource/size/
time limits, authentication/cookie policy, media inclusion and recapture/history.

### D07 — Smart Space membership

**Status:** pending approval of the initial membership rule. **Gates:** T14.

**Plain English:** “all items matching this collection” differs from “the closest
20 items a model found”.

**Recommendation:** complete-library deterministic/lexical membership, including
explicit custom/recorded automatic-tag predicates. Semantic scores can order
members. A semantic-only saved collection is a later capability requiring an
explicit threshold, partial-coverage and model-upgrade policy. Manual drops go
only into static Spaces; Smart Spaces offer criteria editing.

**Record:** supported saved-query predicates, unsupported-query UX, model-free
membership behavior and any later semantic membership policy.

### D08 — Time interpretation and reminder guarantees

**Status:** pending. **Gates:** T11, T15, T36, T37.

**Plain English:** “next Tuesday”, “last week” and closed-app reminders depend on
timezone, locale, permissions and operating-system limits.

**Recommendation:** use the user's system timezone with an explicit override;
ask/expose week-start preference rather than hide it. Display actual resolved
intervals; store instants with UTC/offset and preserve date-only semantics.
Start with one-shot reminders. Add recurrence only after a supported rule subset
is defined. Guarantee delivery only for platform states actually tested; missing
permissions and missed reminders get visible states.

**Record:** timezone/week-start defaults, date boundaries, ambiguous-command UX,
recurrence subset, DST behavior and per-OS running/closed/reboot delivery matrix.

### D09 — Models, languages, install packs and quality

**Status:** core AI and bundling confirmed; exact model/runtime/quality selection
pending evidence. **Gates:** T22–T30 as applicable, T33–T37 and T40.

**Plain English:** small local models differ in languages, licenses, accuracy,
token limits and memory costs. “Use local AI” is not a sufficient selection.

**Recommendation:** prefer one compact local model that meets accepted content
organisation requirements; benchmark small text/multimodal candidates before
selection. MiniLM is a candidate, not proof of adequate organisation. Add another
core model only for measured necessary coverage, with owner approval. Bundle
required weights/runtime in the normal offline installer, shared outside vaults;
no extra download is required to become AI-powered.

Measure held-out precision, recall, useful coverage/abstention and default-compressed
content quality alongside latency/RAM/installed size. Select a tested native/CPU
fallback on supported hardware, independent of OS-native intelligence availability.
Specialised speech/OCR/generation may be later extras; core AI is not optional.

**Record:** exact model/weight hashes, prompts/tokeniser/preprocessing/dimensions,
languages, limits, approved redistribution, install sizes, runtime/provider matrix,
automatic-tag thresholds and user-visible unknown/stale states.

### D10 — Resource budgets and acceptance targets

**Status:** targets proposed, budgets/reference hardware pending. **Gates:** T06,
T18, T19, T23, T25, T27–T29, T31, T33.

**Plain English:** “fast and small” needs measured limits and a device on which
to measure them.

**Recommendation:** adopt the wiki's parse/filter/lexical/warm-semantic figures
as initial benchmark goals, not marketing promises. Choose a modest 8 GB laptop
as a reference tier, publish its exact CPU/storage/OS, and measure before fixing
numeric cache/worker/model budgets. A conservative first scheduler permits one
heavy inference job at a time and prioritises interactive work; this is a
starting proposal, not an imposed limit for every device.

**Record:** per-tier RAM/cache/disk/worker/vector/page/frame/import limits,
idle/power behavior, measurement method/corpus and quality thresholds. Correct
regressions or explicitly review revised targets instead of silently relaxing them.

### D11 — Distribution, third-party rights and signing

**Status:** pending actual dependency/release manifests. **Gates:** T09, T19,
T21, T22, T25–T30, T34, T40.

**Plain English:** a permissive runtime license does not grant rights to ship every
model, codec or browser dependency. Signed installers require owner credentials.

**Recommendation:** minimal auditable dependency builds, notices and an SBOM;
review FFmpeg build/linking flags, PDF adapters and each weight license separately.
Produce local/CI release candidates first. Enable signing/notarisation only when
the owner supplies credentials through a secure local/CI secret store. No task
implicitly authorises publishing a package or production release.

**Record:** allowed artifacts/platforms, cleared dependency/weight terms,
source/notice obligations, actual codec flags, signing workflow and owner release
approval.

### D12 — Mobile target and capability scope

**Status:** later decision. **Gates:** T35–T37.

**Plain English:** phone document providers, sharing and background execution
do not behave like desktop folders.

**Recommendation:** a measured mobile capability spike first, then one platform
at a time with local/share imports, URL bookmarks, offline retrieval, authored
state and meaningful bundled native core AI on supported devices. Provider-only
experiments are incomplete milestones, not AI-free product tiers. Web capture
remains deferred. Desktop parity, background indexing and closed-app notifications
are not assumed.

**Record:** platform order, minimum OS/devices, approved native/shared-core route,
document-provider constraints and actual feature/delivery matrix.

### D13 — Optional sync, encryption and backup privacy

**Status:** later sync/security approval; local backup safety is required now.
**Gates:** T32's privacy disclosures, T38, T39.

Authorise T38's bounded synthetic investigation before it starts; adopt its
resulting protocol/security/retention choices afterwards, before T39. The design
task does not require its own final conclusions as prior approvals.

**Plain English:** syncing files can cause conflicting edits, resurrect deletions
or expose an unencrypted vault. Open files alone do not solve those problems.

**Recommendation:** local portable backup first. Later specify conflicts and
tombstones before choosing one user-controlled transport. Preserve concurrent
notes, custom tags and rejections visibly rather than silently last-write-winning.
Exclude device caches/models; require no hosted account to use the local library.
Encrypted sync needs an explicit key-management/recovery design, not a vague
privacy label.

**Record:** approved transport/threat model, plaintext/encryption disclosures,
conflict/tombstone/retention policy, multi-device transactions and reminder deduplication.
No generic sync framework or provider is approved by this planning task.

## How to record an approval

Change a decision's status only with an explicit owner response. Include the
selected value, rationale, affected task IDs and tests the decision requires.
If evidence changes a recommendation, update the register and affected issue
briefs together. Keep private conversations, account identifiers and credentials
out of this public register.
