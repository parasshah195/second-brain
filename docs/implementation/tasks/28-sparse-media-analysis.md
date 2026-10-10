# T28 — Analyze video and media with bounded representative frames

## Phase
Optional media intelligence.

## Depends on
T09, T18, T22, T25.

## Decision gates
D10 approves frame, time, vector, and decoding budgets; D11 resolves FFmpeg distribution and applicable codec/build terms. Select native decoding or a safe subprocess contract explicitly; do not assume a runtime package settles codec licensing.

## Outcome
Make video discoverable through sparse local evidence while retaining original container/streams and avoiding unbounded frame extraction or inflated retrieval votes.

## Context and constraints
Specialised media analysis remains optional unless selected launch content requires it to meet core organisation quality/coverage gates. Required launch payloads then ship with the app; optional extras do not replace the bundled minimum. Model-off workflows below are additional visibly degraded recovery tests, not evidence for an AI-free launch.

Stored media is canonical and remains byte-unchanged during analysis. Ingestion follows T19: lossy compression is enabled by default with all metadata preserved; disabling it preserves input bytes. Analysis does not independently recompress existing vault assets. Metadata, captions, frame samples, and analysis are separate sidecars or disposable projections according to ownership. Decoding for analysis is not canonical transcoding. Missing or failed analysis is unknown evidence.

T25 supplies compatible visual embeddings; T24 supplies one-item-per-branch fusion. A long video with many frames must not win merely because it produced more vectors. Model packs are shared outside vaults; extracted frames, vectors, and previews are local disposable caches. All analysis stays offline and never blocks basic save, browse, FTS, or filters.

## Implementation scope
1. Read supported container/stream metadata and caption tracks through T09/T18 trust boundaries. Separate embedded captions, later speech transcripts, user corrections, and inferred labels with source revision and origin.
2. Sample scene-representative frames under explicit maximum frame count, decode time, pixel, and intermediate-storage limits. Record timestamps, stream identity, sampling method, coverage, and skipped regions; sparse sampling must not imply full-video understanding.
3. Use T25-compatible preprocessing and fingerprints for bounded frame vectors. Cap per-video cache/vector counts and schedule cancellation/resume through existing planned resource controls. Proposed host module `media_analysis` is not present code.
4. Aggregate generated labels per video with frame/timestamp provenance and approved uncertainty criteria. Expose representative evidence without writing custom tags; T27 owns automatic assignment and feedback.
5. Collapse repeated frame hits to one item rank per retrieval branch before T24 fusion. Preserve matched timestamps for navigation without awarding extra votes.
6. Define safe native/subprocess decoding: constrained inputs and outputs, no shell interpolation, bounded resources, termination on cancellation, and treatment of decoder failures as data errors. Compare near duplicates non-destructively using evidence later consumed by T31.

## Acceptance criteria
- [ ] Original container and streams remain unchanged after analysis.
- [ ] Long videos stay within approved frame, vector, CPU/time, and cache limits.
- [ ] Results show timestamps, source revision, sampling coverage, and evidence origin.
- [ ] Many matching frames contribute only one item rank per branch.
- [ ] Corrupt/unsupported media and cancelled decoders leave safe recoverable states.
- [ ] Near-duplicate evidence never replaces, merges, or deletes originals.

## Validation
Use synthetic short clips, very long files, rapid scene changes, near-static scenes, multiple streams, captions, damaged containers, extreme dimensions, and unsupported codecs. Measure coverage and false negatives from sparse sampling; compare short and long versions to detect frame-count ranking bias. Cancel during decoding/embedding, edit sources, remove packs, wipe caches, and rebuild. Run with networking blocked and packs disabled; original playback support and model-free library operations must retain their prerequisite behavior. Run `just check` and `just verdict`, reporting native decoder and model tests separately.

## Out of scope
Canonical transcoding, exhaustive frame embeddings, speech recognition, physical deduplication, cloud analysis, and guaranteed recognition of every event.

## Handoff
Give T29/T31 decoding constraints, stream/timestamp schemas, sample evidence, licensing decisions, and measured budget/coverage tradeoffs. Escalate unmet codec or frame-quality gates instead of expanding work silently.
