# T29 — Transcribe speech locally with bounded source coverage

## Phase
Optional audio and video extraction.

## Depends on
T09, T22, T28.

## Decision gates
D03 approves supported languages and scope; D09 selects the optional speech model; D10 approves decoding, chunk, time, and memory budgets; D11 resolves runtime, weights, and codec distribution terms.

## Outcome
Create searchable local transcripts with timestamps and honest coverage while preserving original streams, independent captions, and user-owned corrections.

## Context and constraints
Speech packs are specialised application-shared installations outside vaults, optional unless selected launch scope requires them to meet core organisation quality/coverage gates; required launch payloads then install with the app. Source stream extraction and temporary resampling are analysis operations, not canonical transcoding. Stored source assets remain unchanged by analysis; ingestion preserves exact original-file/source bytes by default. Optional lossless compression is disabled by default and preserves all metadata, decoded content and familiar formats; unsupported, unverifiable, non-saving and signed inputs retain exact input bytes. No canonical lossy compression or retroactive recompression is approved. User Markdown and corrected transcripts are never overwritten by regeneration.

All inference is local, with no cloud fallback. Saving, browsing, existing FTS, and filters work without models as visibly degraded recovery; accounts are not required. Missing, failed, unsupported, silent, and partially processed audio are distinct states; absence of a transcript is not proof of no speech. Current Bend proofs cover the pure metadata rule, not speech accuracy, timing, or native decoding.

## Implementation scope
1. Consume T28's safe stream selection/decoding boundary and T09 source identities. Specify chosen channels/streams, bounded decoding/resampling, sample format, and temporary-data lifecycle. Proposed host module `speech_transcription` is future work.
2. Chunk under the selected model's context and approved overlap/budget limits. Record chunk timestamps, language choice or detection uncertainty, engine fingerprint, source revision, and processed/unprocessed coverage.
3. Make jobs cancellable and resumable with stable checkpoints. Resume only compatible source revisions and fingerprints; discard stale generated checkpoints without changing canonical corrections.
4. Index transcript text through the same FTS projection as other extracted text. Keep caption tracks distinct from generated speech and corrections, with provenance visible in snippets and item detail.
5. Store explicit corrections as user-owned portable data with segment/source applicability. Regeneration may update generated output but cannot overwrite corrections or silently attach them to unrelated revised audio.
6. Handle unsupported languages, silence, music, low-quality input, and model unavailability as uncertain or failed evidence. Do not manufacture transcript text for silence merely to return a successful result. Bound concurrency, CPU, resident memory, and queued work through T22/T28.

## Acceptance criteria
- [ ] Transcripts show source stream, timestamps, language, fingerprint, revision, and coverage.
- [ ] Originals are byte-unchanged; temporary resampling is not saved as canonical media.
- [ ] Cancellation/resume avoids duplicate segments and incompatible checkpoints.
- [ ] Corrections survive retries, pack removal, cache loss, and FTS rebuild.
- [ ] Captions and generated speech remain distinguishable in retrieval.
- [ ] Silence and unsupported input do not produce falsely confident fabricated text.
- [ ] Pack absence leaves model-free library workflows available.

## Validation
Use synthetic or licensed speech for every approved language, mixed-language segments, overlapping speakers, music, silence, noisy clips, long recordings, multiple streams, and corrupt media. Compare segment timing, coverage, word errors, and silence hallucinations against known references. Interrupt decoding and inference, resume, revise the source, apply corrections, remove the pack, and rebuild projections. Block networking and inspect helper-process attempts; repeat save/browse/FTS with models disabled. Report actual hardware and resource/quality measurements rather than target compliance without evidence. Run `just check` and `just verdict` and report independent-toolchain blockers honestly.

## Out of scope
Cloud transcription, guaranteed diarization, unlimited language coverage, canonical audio conversion, replacement of caption tracks, and mandatory speech analysis during save.

## Handoff
Provide language/model decisions, timestamp and correction schemas, checkpoint compatibility tests, decoder limits, and measured accuracy/coverage gaps to indexing and automatic-tag consumers.
