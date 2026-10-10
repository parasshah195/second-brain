# Product boundaries

This is the short architecture summary. The [system wiki](wiki/README.md)
explains the full behavior; the [execution plan](implementation/README.md)
provides task dependencies and the [decision register](implementation/DECISIONS.md)
records approval gates.

Second Brain is a desktop-first, local-first, AI-powered self-organising library,
not a chatbot. Native core AI is required and bundled, not an optional add-on.
Only the metadata domain rule is implemented and checked today. The sections
below describe intended behavior, not available application features.

## Ownership

The user-owned vault is authoritative: `Items/` holds user Markdown, `Assets/`
supported-format hash-addressed media, future `Captures/` HTML/resource manifests,
`Metadata/` versioned JSON and recoverable transactions, `Collections/` view
definitions, and `Reminders/` iCalendar. `.local/` contains device-local,
disposable projections excluded from sync. Model packs are application-owned
and shared across vaults. Required core weights/runtime ship with the normal
installer; extra models need demonstrated scope and quality justification.

Persist notes, tags, corrections, Spaces, Smart Space definitions, reminder links,
and provenance in open files. Preserve user Markdown during enrichment.
The system creates automatic tags in a generated layer without per-tag approval.
Custom user tags remain separate and authoritative: background processing never
overwrites or removes them. Explicit corrections/rejections persist; promotion
to a custom tag is a user action. Guesses retain source, score/calibrated
confidence, engine/version, generation time and source revision.

Deduplicate exact bytes by SHA-256; near duplicates are relationships, not
replacements. Shared assets survive deletion of one referencing item.
Validate paths and use recoverable writes before reporting durable success.
External file changes must reconcile into the index.

## Retrieval and resources

Saving, browsing, and lexical search work offline without accounts and remain
safe while AI loads or is repaired. Model-free operation is degraded recovery
or an incomplete development milestone, not a valid full release.
SQLite/FTS5 is a rebuildable projection with phrase/snippet support.
Deterministic parsing produces typed filters, residual text, and spans.
Unqualified relative dates mean saved time; ambiguity remains user-editable.
Parsing, chips and inexpensive lexical/filter results update live. Semantic and
visual retrieval run only on Enter, never typing/debounce/idle timers. RRF fuses
independent available branch ranks; hard filters constrain each branch before
top-k, or require over-fetch/refill. Models never gate ordinary search.

Start with flat embeddings; add ANN only after benchmarks justify it.
Bound/cancel background work and cache size. Defer extraction, optimization,
OCR, embeddings, and transcription from the save critical path. Import states
distinguish registered work from bytes safely persisted.

## Technology and unresolved decisions

The source recommends Tauri 2, a thin TypeScript WebView, and Rust host integration.
The owner additionally requests Bend. Start pure domain logic in Bend and prove
it directly; decide the tested Bend/native boundary before building a shell.
Do not claim Bend proofs verify Rust or host IO. No shell/model dependencies
are included merely for future use.

Lossy compression is enabled by default and preserves all metadata. A setting
disables it for subsequent imports. Supported profiles require integrity,
metadata and compressed-content AI-quality validation; unsupported/unverifiable
candidates retain input. Preference changes do not silently rewrite the vault or
restore discarded information. Hash-addressed blobs are immutable;
publish a new blob and recoverably update references before garbage collection.
Web capture, imported snapshots and their viewer are deferred. Current URL
bookmarks store URL/user-provided title/notes without page acquisition.
The future capture viewer must be inert, network-denied and unprivileged.
Deletion recovery/retention, launch scope, runtime integration and distribution
remain explicit decision gates.

Deliver development slices in dependency order, but require bundled native AI,
automatic organisation and validated default compression before release.
Specialised media/generation, web capture, mobile and sync have later scoped work.
Measure organisation precision/recall/coverage, latency, RAM and disk use.
The source's SLOs are targets, not verified promises.
