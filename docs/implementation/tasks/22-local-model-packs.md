# T22 — Manage bundled core AI and shared local runtime lifecycle

## Phase
Required native local intelligence foundation.

## Depends on
T01, T06, T16.

## Decision gates
D02 must approve the tested Bend/native execution seam; D09 must select supported packs and runtimes; D11 must resolve weights redistribution, signing, and installer trust. Runtime licensing alone does not license weights. Any pure-law change needs owner approval.

## Outcome
Provide application-owned core weights and a minimal native runtime installed with the application, shared across vaults, with predictable offline operation. This brief specifies future work; only the pure metadata rule currently exists.

## Context and constraints
The intended shell is Tauri 2 with a thin TypeScript WebView and Rust host. Host execution readiness remains a prerequisite, not a consequence of the existing Bend proof. Packs live outside portable vault content. User-owned Markdown, JSON, originals, HTML snapshots and resource manifests, collection JSON, and iCalendar remain authoritative; SQLite, vectors, previews, and extraction caches are device-local and disposable.

AI is innate to the shipped application: bundle the smallest/fastest meaningful local model/runtime meeting measured high-precision, high-quality automatic organisation for accepted launch content. Prefer one compact model; additional core models require evidence that one cannot meet requirements and owner approval for each. Exact models, thresholds, languages, supported devices, limits, and redistribution remain benchmark/approval gates. No large general-purpose LLM is included by default; OS-native model availability alone cannot supply core AI.

Saving never waits for AI; bounded local enrichment automatically runs after save, independently of Enter-only query retrieval. Saving, browsing, FTS, and filters without core weights are recovery behavior or an incomplete development milestone, not a finished product tier. Missing, corrupt, disabled, or removed core AI must show an unhealthy/degraded state and actionable repair. No content or queries leave the device. A runtime must not silently fetch missing components, perform remote inference, or load weights merely at startup. Background work is bounded, cancellable, and performs zero model work when idle with no queued work.

## Implementation scope
1. Define a manifest containing pack version, engine compatibility, tokenizer identity, preprocessing identity, dimensions, modality, weights identity, checksums, and signature/trust metadata. Keep compatibility fingerprints available to downstream caches.
2. Implement bundled core installation, staged verification before activation, interrupted-install recovery, repair, uninstall, and a status view. Use application-shared storage without copying weights into each vault. Core removal or disablement marks the application degraded, not complete. Proposed host module `model_packs` is a planning name, not existing code.
3. Install required core payloads with the normal application, including air-gap installation; reject tampered, incomplete, incompatible, or untrusted bundles before execution. Only optional additions or explicit repair downloads require network-download consent showing size and intended source. No download of a pack is needed to make the normal application AI-powered.
4. Load lazily for an explicit request or automatically queued ingestion job. Report unavailable accelerators and provide a tested minimal native-runtime CPU fallback on all supported hardware; unsupported hardware must be explicitly excluded from the support matrix.
5. Bound resident models, concurrent jobs, and unloading behavior through T16. Cancel consumers safely during removal and invalidate only fingerprint-dependent disposable projections.

## Acceptance criteria
- [ ] Two vaults use one verified installation; neither contains weights.
- [ ] Startup without queued work and idle traces show no model loading or inference; post-save organisation runs automatically without Enter.
- [ ] Installation cannot activate corrupt or unsigned/untrusted payloads under the approved trust policy.
- [ ] Pack removal leaves notes, custom tags, corrections, rejections, and promotions unchanged.
- [ ] The normal offline installation includes verified core weights/runtime and passes meaningful organisation benchmarks with CPU fallback.
- [ ] Missing/corrupt/disabled core weights and denied repair downloads preserve save, browse, FTS, and filters while visibly reporting degraded health and repair.
- [ ] Runtime activity under blocked networking produces no downloader leakage or content/query transmission.

## Validation
Exercise install, interruption, retry, air-gap import, lazy load, CPU fallback, cancellation, concurrent vault use, and uninstall with synthetic content. Block networking at the process boundary, including runtime helper processes, and inspect attempted connections. Repeat with every pack absent and with corrupted manifests, traversal entries, incompatible engines, and exhausted storage. Record actual hardware, RAM, disk, and latency; targets are not measured promises. Run `just check` and `just verdict`; report checker/toolchain availability and keep proof claims limited to pure Bend rules.

## Out of scope
Cloud fallback, runtime-selected downloads, vault synchronization, automatic startup warmup, and new model-specific retrieval behavior.

## Handoff
Publish approved manifest examples, installation-state transitions, runtime capability results, trust-policy decisions, and measured resource limits. T23–T30 consume fingerprints and lifecycle states. Flag unresolved D02/D09/D11 choices rather than choosing silently.
