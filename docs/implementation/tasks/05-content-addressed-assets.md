# T05 — Import immutable assets with exact-byte deduplication

## Phase
Asset foundation.

## Depends on
T04.

## Decision gates
D04 records original-file/source-byte preservation by default and optional
lossless compression disabled by default, preserving all metadata, decoded
content and familiar formats. This task stores verified source bytes; T19
applies that effective policy. No canonical lossy compression is approved.

## Outcome
Stream selected source files into verified shared blobs without blocking item
registration or merging distinct logical references.

## Context and constraints
A hash identifies actual stored bytes, not a filename or a perceptual resemblance.
Multiple saved items may reference one blob but keep their own source provenance,
notes and tags. The selected source file is not modified; canonical stored bytes
remain exact original bytes by default. Explicitly enabled T19 lossless optimisation
applies only to subsequent imports, never retroactive recompression.
Publishing a blob is separate from intent.

## Implementation scope
1. Stream source bytes into confined staging and calculate SHA-256 in that pass.
   Bound buffers and report progress/cancellation for large files.
2. Verify completion and publish one immutable path per full hash, with a stable
   suffix chosen independently of each imported source filename.
3. Reuse existing bytes only after verifying their identity. Handle duplicate
   concurrent imports, existing corruption and a source changing while read.
4. Record asset roles, source filename, MIME, size and original/stored hash
   provenance in canonical references through T04 transactions.
5. Keep logical item IDs separate even if assets or URLs match. A format change,
   similar picture or perceptual hash is not an exact duplicate.
6. Define cancellation/failure cleanup that cannot delete an already shared blob
   or make a partial file appear complete. Refcounts/index caches accelerate
   accounting but never become the only reference source.

## Acceptance criteria
- [ ] Byte-identical imports with different filenames share one physical blob.
- [ ] Logical items retain independent notes, sources and IDs.
- [ ] Large imports use bounded memory and remain visibly incomplete until safe.
- [ ] Interrupted, cancelled and changing-source imports never publish partial bytes.
- [ ] Corruption/hash mismatch is surfaced rather than silently reused.

## Validation
Use equal-byte/different-name fixtures, equal-looking/different-byte images,
different formats and multiple referencing items. Inject process interruption
and disk failure during streaming, publication and reference updates. Reopen
the vault, clear indexes and confirm shared identity from canonical files.
Check selected source bytes before/after; record actual memory and IO behavior.
Verify default/disabled imports retain exact source bytes; optional T19 lossless
output may change encoded bytes but must preserve all metadata, decoded content
and familiar formats. Unsupported, unverifiable, non-saving and signed inputs
retain exact input bytes.
Preserve existing proof checks without claiming they cover hash implementation
or filesystem integrity.

## Out of scope
Lossy compression, canonical transcoding, near-duplicate merges, remote
downloads or automatic deletion of currently referenced assets.

## Handoff
Provide T06/T08/T09/T18–T21/T28/T32 verified asset lookup/reference contracts,
deduplication fixtures and original-byte preservation evidence.
