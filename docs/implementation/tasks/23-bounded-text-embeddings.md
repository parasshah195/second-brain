# T23 — Build bounded text embeddings and a flat semantic index

## Phase
Required core text projection and retrieval.

## Depends on
T09, T10, T22.

## Decision gates
D09 selects the text model, runtime, tokenizer, and compatible query/document prompts. D10 approves chunk, overlap, vector, memory, and coverage budgets. MiniLM is a baseline candidate, not a finalized model choice. Obtain owner approval before changing pure laws.

## Outcome
Create a rebuildable device-local flat vector projection with explicit source coverage, compatible fingerprints, and useful long-document retrieval without silently truncating whole documents.

## Context and constraints
The MiniLM baseline typically admits 256 wordpieces, including tokenizer special-token overhead. Embedding a whole long document would truncate it; character counts or whitespace words are not a safe token budget. Full source text remains in FTS regardless of semantic coverage. User Markdown and retained originals are never rewritten to fit a model.

Model packs are application-shared outside vaults; vectors and extraction projections are disposable. The text backend may be a compatible projection/encoder of the single chosen core model; a separate interface does not require separate weights. Basic save, browse, FTS, and filters remain available without models as visibly degraded recovery, not a complete launch product. Accounts are not required. All inference is local. This is proposed implementation work: the existing proof covers only the pure metadata rule, not tokenizer behavior, native execution, or retrieval quality.

## Implementation scope
1. Consume T09 extraction and T10 revision identities. Split token-aware sections using the selected tokenizer, special-token overhead, approved overlap, and bounded vectors per item. Retain section/page identifiers and source offsets; state partial coverage explicitly.
2. Define the complete fingerprint: weights, model version, tokenizer, preprocessing, dimensions, normalization, and prompt policy. Bind vectors and personal prototypes to it. Proposed host module `text_vectors` is not an existing path.
3. Store vectors in a flat index first. Track item, chunk, source revision, offsets, coverage, and job state separately from user-owned metadata. Prevent old-revision vectors from appearing as current evidence.
4. Make ingestion bounded, cancellable, and resumable through existing planned job controls. Rebuild from authoritative content after cache loss. Keep index activation atomic enough to avoid partially mixed revisions.
5. Handle migration with separate spaces and explicit replacement/retirement state. Query only compatible spaces; never compare vectors across model versions or text versus vision spaces.
6. Measure vector payload, metadata, allocator overhead, working buffers, and resident runtime memory. Quantization is optional and requires an owner-approved retrieval-quality gate, not just a smaller file.

## Acceptance criteria
- [ ] Long synthetic documents expose indexed and omitted regions, with accurate offsets.
- [ ] Every chunk fits the actual tokenizer limit including special overhead.
- [ ] Full FTS still finds text outside semantic coverage.
- [ ] Revision changes and model migrations cannot return incompatible or stale vectors as current results.
- [ ] Cancellation and rebuild preserve user notes, tags, corrections, and originals.
- [ ] Flat-index memory and retrieval quality are reported for the approved corpus and budget.

## Validation
Use short notes, sectioned long documents, dense Unicode, repeated headings, unusually long tokens, and text at exact tokenizer boundaries. Query evidence near the beginning, middle, end, overlap boundaries, and deliberately uncovered regions. Interrupt jobs, edit sources, remove a pack, wipe disposable projections, and rebuild. Repeat save/browse/FTS workflows with models disabled and networking blocked. Report CPU/RAM/disk and coverage rather than promising targets. Run `just check` and `just verdict`; native/tokenizer and model evidence require separate workflow tests.

## Out of scope
ANN without measured need, generation, vision vectors, automatic tagging, mandatory quantization, and whole-document truncation disguised as complete indexing.

## Handoff
Supply fingerprint schema, chunk/offset examples, coverage metrics, migration behavior, and measured flat-index overhead to T24 and T27. Record unresolved model or budget decisions explicitly.
