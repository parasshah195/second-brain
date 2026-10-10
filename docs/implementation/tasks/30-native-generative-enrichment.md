# T30 — Add optional native on-device generative enrichment

## Phase
Optional platform-specific enrichment.

## Depends on
T01, T06, T22, T23.

## Decision gates
D03 approves deployment scope and actual SDK/toolchain compatibility; D09 selects enrichment capabilities; D11 resolves platform and distribution terms. D02's execution readiness is inherited through prerequisites. Any pure-law change remains owner-controlled.

## Outcome
Offer explicitly enabled native on-device summaries, snippets, and suggested titles without changing authored content, requiring cloud service access, or weakening host command boundaries.

## Context and constraints
Apple Foundation Models is an OS 26 on-device capability with availability gates, not bundled weights or universal device support. CoreAI on OS 27 is a later optional path requiring actual toolchain tests before claims of support. Private Cloud Compute and all other cloud inference are excluded. SDK presence alone does not establish usable model availability.

Specialised native generation is optional unless selected launch scope requires it; the required bundled core organisation runtime remains independent. OS-native model availability alone cannot supply core AI, and no large general-purpose LLM ships by default. A native generative model is not a compatible substitute for selected text/vision embedding encoders. Stored assets and user Markdown remain authoritative and unchanged by generation. Generated snippets, summaries, and suggested titles must not override author titles, user titles, or notes.

## Implementation scope
1. Check OS, device, model availability, language support, enablement, and context limits at the actual host boundary. Explain unavailable, disabled, downloading/not-ready, and failed states without a cloud fallback. Proposed `native_enrichment` host code does not yet exist.
2. Offer bounded explicit enrichment requests and approved queued behavior through T22 lifecycle controls. Define source selection, truncation/coverage, token/context budgets, cancellation, and zero idle model work.
3. Treat extracted documents, captured HTML, captions, and metadata as untrusted prompt input. Keep host command capabilities narrowly allowlisted; content instructions cannot invoke arbitrary commands, files, network requests, or tools.
4. Validate structured outputs against a bounded schema before persistence. Mark generated fields as inference with origin, model/platform version, source revision, generation time, coverage, and available uncertainty information.
5. Separate acceptance of a suggested title or edited summary into an explicit user-owned assertion/correction operation. Regeneration affects inference only; preserve custom tags, titles, notes, and corrections.
6. Keep unsupported platforms functional without this adapter. Gate any OS 27 CoreAI implementation separately with deployment-toolchain evidence rather than promising future compatibility from documentation alone.

## Acceptance criteria
- [ ] Availability and user enablement gates prevent unsupported execution.
- [ ] Network-blocked enrichment uses only verified on-device paths or reports unavailable.
- [ ] Generated records remain distinguishable from user-authored fields and never replace them automatically.
- [ ] Malformed outputs fail validation without corrupting portable metadata.
- [ ] Prompt-injected source content cannot issue arbitrary host commands or trigger cloud work.
- [ ] Disabled/unavailable generation leaves core and compatible embedding workflows intact.

## Validation
Test supported and unsupported OS/device/language combinations on real available toolchains. Include long documents, context overflow, cancellation, stale revisions, malicious instructions, malformed structured responses, and retries after user edits. Verify enabled/disabled and model-not-ready states while blocking networking, including helper processes. Inspect authored files before/after refresh and measure actual RAM/latency/quality. Run `just check` and `just verdict`; proofs do not verify native IO, model accuracy, or platform availability.

## Out of scope
PCC, cloud generation, bundled native weights, mandatory summaries, arbitrary content-driven tools, and replacing embedding models with a generative API.

## Handoff
Publish a tested availability matrix, SDK evidence, output schema, command allowlist, injection fixtures, and unresolved platform gates. Mark untested OS 27 paths as deferred.
