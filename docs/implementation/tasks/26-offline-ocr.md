# T26 — Extract offline text from images and scanned documents

## Phase
Optional document extraction.

## Depends on
T09, T18, T22.

## Decision gates
D03 approves supported languages and scope; D09 selects the OCR engine and language packs; D11 approves redistribution and installation terms. Budget values must come from approved resource policy, not an undocumented engine default.

## Outcome
Project useful local OCR into the existing FTS pipeline while keeping original files, user corrections, provenance, and rebuild behavior independent of disposable engine output.

## Context and constraints
OCR is specialised background extraction, optional unless accepted launch content requires it to meet organisation quality/coverage gates; in that case its required payload is bundled. It never blocks saving an image or scanned PDF. Existing selectable PDF text should remain usable without an OCR model. Stored source assets remain unchanged by OCR, though T19 may have compressed them under the recorded policy; user Markdown is never overwritten. Missing, pending, or failed OCR means unknown evidence, not that an image contains no text.

Language packs are application-shared outside vaults. Required launch payloads install with the app; optional additional languages require explicit download consent. All decoding and recognition happen locally, with no cloud fallback or hidden downloader. SQLite/FTS and extracted caches are device-local projections; corrected OCR is user-owned portable data stored separately from generated output. Native processing is not covered by the current metadata proof.

## Implementation scope
1. Add a local adapter for supported images and scanned PDF pages using T18's safe decoding boundary and T22's verified pack lifecycle. Proposed host module `ocr` is not existing code.
2. Distinguish selectable embedded text, generated OCR, and explicit corrections. Define page/region offsets, ordering, language, engine fingerprint, source revision, and extraction coverage.
3. Deduplicate embedded-text/OCR overlap deterministically without discarding unique scanned text. Preserve provenance so users can identify which projection produced a searchable phrase.
4. Bound decoded pixels, pages, CPU time, concurrent jobs, and intermediate storage. Stop or defer at approved limits with visible partial coverage; cancellation must release decoder and engine resources.
5. Fail closed for malformed, password-protected, unsupported, or oversized input. Treat parser output as untrusted data and expose actionable failure states without executing embedded content.
6. Route results through the same T09/T10 FTS projection and rebuild process. Source revisions invalidate generated OCR only; corrections retain their ownership and explicit applicability rather than being silently replaced by a retry.

## Acceptance criteria
- [ ] Mixed selectable/scanned documents expose correct page and region provenance without duplicate searchable passages.
- [ ] Required launch languages are bundled; optional language installation uses verified manifests and works from approved air-gap bundles.
- [ ] Corrected OCR survives refresh, pack removal, cache loss, and rebuild.
- [ ] Pixel/page/CPU limits produce bounded work and honest partial coverage.
- [ ] Password or malformed input produces a closed failure state, not a cloud request.
- [ ] Save, browse, and available FTS remain usable when every OCR pack is absent.

## Validation
Use synthetic scans in each approved language, rotated pages, tiny text, blank pages, mixed text/image PDFs, duplicate selectable text, damaged files, passwords, and decompression-heavy images. Verify correction precedence, source edits, interruption, retry, deletion of extraction caches, and rebuilding the same FTS results. Run with networking blocked and inspect helpers for attempted downloads; repeat model-off workflows. Record accuracy, language coverage, RAM, decoded pixels, and elapsed CPU against chosen limits. Run `just check` and `just verdict`; neither proves OCR accuracy or decoder safety.

## Out of scope
Cloud recognition, handwriting guarantees, arbitrary language support, rewriting originals, and integrating a second independent search engine.

## Handoff
Publish engine/language decisions, offset and correction schemas, deduplication fixtures, bounded-failure examples, and measured recognition gaps for search and tagging consumers.
