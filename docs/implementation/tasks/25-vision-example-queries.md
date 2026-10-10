# T25 — Retrieve visual items with text and example images

## Phase
Visual projection for core organisation; example-image retrieval as selected scope.

## Depends on
T18, T22, T24.

## Decision gates
D09 selects the matching image/text model and runtime; D10 approves image, vector, and quality budgets; D11 resolves code and weights terms. MobileCLIP code uses MIT terms while model weights use Apple terms; neither implies unrestricted redistribution of the other.

## Outcome
Add an independent compatible vision retrieval branch supporting free-text and private example-image queries, with uncertainty and provenance rather than fabricated factual metadata.

## Context and constraints
Image and text encoders must share the intended model space and preprocessing contract. T23 and T25 may use compatible projections/encoders of one chosen compact core model; two interface branches do not mandate separate weights. Visual organisation must meet T27 requirements for accepted launch content; additional visual retrieval features follow selected scope. Free-text querying needs the text encoder at runtime; an image-only runtime plus cached ontology strings cannot satisfy that feature. Account for both encoders, without double-counting shared weights, in installation and memory measurements.

Visual similarity can suggest object, material, texture, scene, or style relationships. Cosine similarity is not calibrated confidence. GPS, capture device, and other unsupported facts must not be guessed from appearances. Retain original assets unchanged; preview images and embeddings are device-local disposable caches. OCR belongs to T26. No image, query, or example is sent to a cloud service.

## Implementation scope
1. Consume T18 safe image decoding and source revisions. Specify matching resize/crop/color/normalization policy and image/text fingerprints. Proposed `vision_vectors` host code is a future implementation location.
2. Generate bounded image vectors and track processed coverage, unavailable evidence, and failed jobs. Recompute on source or preprocessing changes; never compare older incompatible vectors as current evidence.
3. Encode submitted free text with the matching text encoder. Cache ontology text embeddings by complete fingerprint, including the ontology revision, without replacing arbitrary text encoding.
4. Accept a user-selected exemplar through a constrained local file boundary. Keep temporary decoding and query vectors local, clear them according to the approved lifecycle, and require explicit save before making the exemplar a library item.
5. Integrate vision ranks into T24's independent-branch RRF. Enforce the same typed hard filters, exact lexical eligibility, one-vote-per-item collapse, query-revision cancellation, and Enter-only retrieval.
6. Surface similarity scores and uncertainty honestly. Threshold-based display or generated evidence requires evaluated criteria; automatic visual labels are assigned through T27 rather than directly mutating custom tags.

## Acceptance criteria
- [ ] Text-to-image and image-to-image queries use compatible fingerprints and matching preprocessing.
- [ ] Runtime size and peak memory include both encoders.
- [ ] Ontology caches invalidate after model, preprocessing, or ontology changes.
- [ ] Exemplar queries do not create canonical items or transmit bytes without explicit user action.
- [ ] Visual results respect hard filters and contribute at most one item rank per branch.
- [ ] Unsupported facts remain unknown; scores are never presented as calibrated confidence without calibration evidence.

## Validation
Absent/corrupt core model tests below verify visibly degraded recovery and actionable repair, in addition to healthy bundled-core organisation and selected visual-query workflows.

Use synthetic/licensed object, texture, material, scene, and style examples, confusing near matches, unusual aspect ratios, transparent images, corrupted inputs, and edits that change source revisions. Test exemplar cancellation, cache removal, encoder mismatch, cold load, and pack uninstall. Compare retrieval against a documented labeled corpus and report uncertainty/coverage. Block networking and repeat with packs absent; model-free FTS and browsing must still work. Run `just check` and `just verdict`, and separate model-quality evidence from pure-rule proofs.

## Out of scope
OCR, face identification, invented EXIF facts, cloud image APIs, semantic/vision work during typing, and automatic modification of custom tags.

## Handoff
Deliver preprocessing/fingerprint fixtures, encoder footprint measurements, quality results, exemplar lifecycle policy, and branch integration evidence to T27, T28, and T31.
