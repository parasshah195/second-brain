# Product boundaries

Source: https://app.basecamp.com/5660851/buckets/49131676/documents/10391481403

Second Brain is a desktop-first, local-first library, not a chatbot.
This repository is a verified domain foundation, not yet a desktop application.

## Ownership

The user-owned vault is authoritative: `Items/` holds Markdown and captured HTML,
`Assets/` original-format media, `Metadata/` versioned JSON, and `Reminders/`
iCalendar. `.local/` contains disposable, rebuildable indexes and derivatives.
Model packs are application-owned and shared across vaults.

Persist notes, tags, corrections, Spaces, Smart Space definitions, reminder links,
and provenance in open files. Preserve user Markdown during enrichment.
User assertions outrank inference; guesses retain source, confidence,
engine/version, and generation time. Never silently apply suggested tags.

Deduplicate exact bytes by SHA-256; near duplicates are relationships, not
replacements. Shared assets survive deletion of one referencing item.
Validate paths and use recoverable writes before reporting durable success.
External file changes must reconcile into the index.

## Retrieval and resources

Saving, browsing, and lexical search work offline without accounts or models.
SQLite/FTS5 is a rebuildable projection with phrase/snippet support.
Deterministic parsing produces typed filters, residual text, and spans.
Unqualified relative dates mean saved time; ambiguity remains user-editable.
V4 requests explicit query submission and RRF fusion of lexical and optional
semantic rankings; hard filters remain constraints.

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

The main recommendation preserves pixels, metadata, formats, and media streams;
the V4 appendix also suggests near-lossless compression, pngquant, and re-encoding.
These conflict. Preserve original bytes during the foundation; obtain owner
approval before implementing optimization policy. Full offline web capture needs
a security policy: captured scripts/resources are untrusted, not privileged UI.

Deliver stages in Basecamp: vault foundation; deterministic retrieval and Spaces;
resource discipline; natural queries; optional semantic/visual/media intelligence;
mobile and sync later. Measure latency, RAM, disk usage, and model quality.
The source's SLOs are targets, not verified promises.
