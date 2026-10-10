# T09 — Extract supported metadata and searchable text locally

## Phase
Deterministic content understanding.

## Depends on
T02, T05, T06.

## Decision gates
D03 supported formats/languages and D11 actual adapter/build redistribution.
OCR and speech selection belong to later model tasks.

## Outcome
Produce useful provenance, file facts and searchable text before neural inference,
with explicit unsupported/partial/failed states instead of fabricated facts.

## Context and constraints
Keep source bytes and user Markdown unchanged. Timestamps, GPS, capture device,
mentioned location and visually inferred place are distinct evidence fields.
qpdf is structural tooling, not a text renderer/extractor. No cloud fallback
is available for difficult documents.

## Implementation scope
1. Implement approved text/Markdown/HTML extraction, source title/domain/author
   metadata and MIME detection independent of an untrusted extension.
2. Extract image dimensions/orientation/EXIF/XMP/ICC, media metadata and supported
   document structure/page counts through audited local adapters. Keep raw
   evidence, normalized values, source revision and engine identity.
3. Choose and test a local PDF text/render adapter for ordinary, encrypted,
   malformed, signed and scanned documents. Scans can be marked OCR pending;
   they are not silently indexed as empty successful content.
4. Separate saved/captured/published/modified dates and absent values. Preserve
   timezone/source uncertainty and device-shown versus device-used semantics.
5. Store extracted text as bounded rebuildable derivatives with offsets/coverage.
   Author-edited transcripts or excerpts use authored storage instead.
6. Register progress and invalidate stale revisions through T06. Bound decoder
   inputs/pages/pixels/time and isolate unsafe codecs/parser work where needed.
   Emit simple deterministic automatic tags through the T03 generated-layer contract for
   known approved metadata labels, separate from user tags.

## Acceptance criteria
- [ ] Supported source facts/text index without installed neural packs or network.
- [ ] User text, user-authored metadata/assertions and original asset bytes/hashes remain unchanged; generated evidence and processing state update only at the current revision.
- [ ] Unsupported/encrypted/scanned/partial input has honest status and coverage.
- [ ] Facts retain correct source/revision/date/device distinctions.
- [ ] Generated labels cannot mutate custom tags.

## Validation
Use synthetic rich and missing-metadata images, Unicode documents, HTML with
scripts/URLs, ordinary/scanned/encrypted/signed/malformed PDFs and huge input
limits. Verify extracted offsets against originals, cancellation and revision
changes. Run network-blocked and no-model workflows. Record adapter/license
manifests and real host failures; preserve existing proof checks.

## Out of scope
Vision guesses, OCR implementation, transcription, page browsing, canonical
recompression or claiming qpdf alone supplies readable PDF content.

## Handoff
Give T10/T18/T20/T23/T26/T28/T29 source-typed facts, searchable text/offsets,
coverage contracts and representative fixtures.
