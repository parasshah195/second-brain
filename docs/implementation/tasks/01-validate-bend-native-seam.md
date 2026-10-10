# T01 — Validate a callable Bend and native execution seam

## Phase
Bounded technical investigation.

## Depends on
None beyond merging the planning documents. This spike investigates D02 rather
than requiring an untested D02 adoption decision beforehand.

## Decision gates
D02 for adoption. D01 governs behavioral-rule changes; honour the committed MIT
license and separate third-party rights. Measurements do not approve law revisions.

## Outcome
Demonstrate how a native host actually invokes proved pure domain code, or report
why no acceptable supported route exists before the application depends on it.

## Context and constraints
`src/metadata.bend`, `LAWS.bend` and `PROOF.bend` are the current implementation.
Use Bend 2.0.36 and its current `bend guide`, not older language syntax.
Rust is intended for IO and Tauri integration, but no host crate exists yet.
A proof of Bend code does not prove a translated Rust function.

## Implementation scope
1. Inspect supported Bend execution/compilation/export mechanisms using official
   documentation and installed help. Prefer the smallest demonstrably supported
   callable route; do not assume an FFI, native library or browser runtime.
2. Build one reproducible native-to-domain experiment with explicit user value,
   absent user value and empty-string assertion. Include Unicode and malformed
   request handling at the host seam.
3. Define serialization/versioning, bounded input/output, errors and process/
   library lifecycle for that actual route. Measure startup and repeated calls,
   including missing runtime, failure and cancellation where applicable.
4. Keep domain behavior sourced from the actual proved implementation. If an
   alternative duplicates it, explicitly identify the proof gap and supply a
   conformance corpus rather than claiming mathematical coverage of host code.
5. Record toolchain/platform evidence, packaging requirements and alternatives.
   Ask the owner to adopt the tested direction before a production scaffold.

## Acceptance criteria
- [ ] A documented command runs the real cross-language experiment.
- [ ] Calls preserve absent versus explicit-empty assertions and Unicode values.
- [ ] Failures are bounded and visible, not silent host fallbacks.
- [ ] Cold/warm overhead and distribution requirements are recorded.
- [ ] Owner adoption or an explicit blocking finding is recorded for D02.

## Validation
Run `bend guide`, `just check`, and `just verdict` with the documented independent
kernel prerequisite. Report an unavailable kernel separately. Exercise the
actual integration command, not a duplicate pure model, and retain synthetic
inputs and output evidence. Keep existing verification CI green if modified.

## Out of scope
Building the desktop application, inventing a generic language bridge, loading
models, changing law semantics or declaring Rust/IO verified by Bend.

## Handoff
Provide T02/T03/T04/T16/T22 the adopted small interface, tested execution route,
error contract and proof/conformance limitations.
