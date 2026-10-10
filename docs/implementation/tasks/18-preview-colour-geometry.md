# T18 — Derive bounded previews, colour, and geometry evidence

## Phase
Resource discipline and deterministic media evidence.

## Depends on
T05, T06, T09.

## Decision gates
D10 approves cache and worker budgets, including eviction and pressure behavior. Proposed limits and benchmark results are evidence for approval, not approved defaults.

## Outcome
The library displays useful previews and queryable colour/geometry evidence from retained originals, with bounded disposable work and explicit unknown or unsupported states.

## Context and constraints
Original asset bytes remain canonical and hash-addressed in shared Assets. Items Markdown and Metadata JSON keep their existing ownership. Previews and derivative evidence are reproducible projections in device-local `.local`; they may be deleted without losing user data. App-shared model storage is separate and outside vaults.

Use cheap downsample-based palette extraction, not AI or model downloads. Decode untrusted media through the dependency security and resource contracts. Only the Bend metadata rule and proofs currently exist; preview workers and decoder integrations are new work, not covered by those proofs.

Evidence must distinguish coverage from confidence. A dominant colour from a small sampled area is not proof of an entire asset's appearance. Unsupported files, missing originals, decode failures, or insufficient evidence remain unknown rather than receiving invented dimensions or colour matches.

## Implementation scope
1. Define derivative identity from original hash, transformation/version, and relevant options so a changed original or algorithm invalidates stale evidence. Rebuild from retained originals; never write preview transformations back into canonical assets.
2. Generate useful thumbnails with explicit orientation handling and geometry derived from the displayed content. Handle embedded colour profiles, transparency, and alpha compositing consistently; document the comparison space and background assumptions.
3. Extract small deterministic palettes from bounded downsampled data. Record source, method/version, sample coverage, and applicable confidence or limitation fields separately. Make colour and geometry predicates obey the existing hard-filter/unknown contracts.
4. Implement cancellable bounded decode/extraction workers, queue priorities, pressure handling, and cache accounting under D10. Prevent a decompression bomb or malformed header from turning nominally small input into unbounded allocations.
5. Evict only disposable derivatives. Avoid duplicate concurrent work for the same derivative identity; handle cancellation and interrupted cache writes without treating partial output as valid.
6. Surface ready, pending, unsupported, unknown, and failed states to consumers. Keep ordinary import/save independent of preview completion and useful browsing possible when cache generation is disabled.

## Acceptance criteria
- [ ] Originals and their hashes remain unchanged after all preview and extraction workflows.
- [ ] Rotated, profiled, transparent, very small, and unusual-aspect images produce documented display and evidence behavior.
- [ ] Missing or invalid evidence is unknown and cannot falsely satisfy a hard colour/geometry filter.
- [ ] Coverage and confidence are independently represented rather than conflated.
- [ ] Deleting `.local` regenerates equivalent derivatives without changing canonical records or notes.
- [ ] Worker count, memory, queue, and disk use obey the approved D10 limits under adversarial inputs.
- [ ] Cancellation and crash recovery leave no valid-looking partial derivatives.
- [ ] Eviction never removes a referenced shared original or app-shared model pack.

## Validation
Use synthetic images with known palettes, embedded orientation and colour profiles, alpha gradients, odd dimensions, and deliberately corrupt headers. Compare displayed orientation and dimensions with an independent decoder where possible. Exercise cache deletion, disk-full writes, interrupted jobs, repeated requests, missing originals, and high-pressure queues.

Measure actual memory, latency, and disk usage on approved platforms; publish methodology and observed values without claiming unmeasured targets. Run existing `just check` and `just verdict` as applicable, plus the actual derivative/workflow checks introduced by implementation. Proof results do not establish decoder safety or resource bounds.

## Out of scope
AI colour classification, video-frame extraction reserved for T28, canonical compression, unapproved budget constants, and hidden model installation.

## Handoff
Provide derivative/evidence schemas, unknown semantics, colour-management assumptions, cache lifecycle contracts, D10 decisions, and measured failure/resource evidence for T19 and UI consumers.
