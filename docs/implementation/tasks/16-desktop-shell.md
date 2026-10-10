# T16 — Build the minimal desktop vault, import, and library slice

## Phase
Desktop integration.

## Depends on
T01, T04, T06, T10, T12.

## Decision gates
D02 approves the tested Bend/native execution seam. D03 approves target platforms and language scope. Complete the spike and record owner decisions before presenting a native implementation as the accepted architecture.

## Outcome
A foundation Tauri 2 development slice opens a vault, imports durably and browses
offline using a real backend. It is not a completed AI-powered release until
required bundled core AI and original-byte/optional-lossless storage are
integrated and qualified.

## Context and constraints
Use a thin TypeScript system-WebView interface and Rust host IO. Choose the simplest adequate UI approach rather than introducing a framework for anticipated future screens. No application shell or Rust host is currently implemented: only the Bend pure metadata rule and its proofs exist. Proofs cover those laws, not commands, filesystem operations, or a native bridge.

The current vault contains user Markdown, Metadata JSON, shared Assets,
Collections and Reminders. Captures HTML/resource manifests are deferred with
T20 and are not created/implemented by this shell. `.local` is device-local and
disposable; required core weights belong outside vaults and are app-shared.

The foundation stores exact original-file/source bytes by default; T19 offers
optional lossless compression, disabled by default, preserving all metadata,
decoded content and familiar formats. Save/browse/lexical work survives
core-AI cold/fault recovery, not as a complete model-free release tier.

## Implementation scope
1. Complete the approved D02 integration experiment and retain evidence for its real calling convention, failure propagation, and proof boundary. Implement only the approved seam; keep host IO outside pure rules.
2. Add the smallest desktop entry flow for choosing, opening, and validating an existing vault using approved native platform capabilities. Give readable errors for unsupported schema, unavailable location, permission denial, and writer contention.
3. Define typed least-privilege host commands for this slice. Validate inputs and vault-relative paths in Rust; do not expose arbitrary filesystem, shell, or network access to WebView content.
4. Connect actual T04/T06 import and recovery contracts. Distinguish selected, registered, persisted, queued, failed, and cancelled work as applicable. “Saved” means bytes and canonical references are durable, not merely an accepted request.
5. Display a paged or virtualized library backed by the real local projection.
Expose basic item identity and honest processing/core-AI health state. Startup
recovers interrupted writes and reconciles edits; core cold/fault recovery
does not block browsing. Required AI integration follows T22–T27 before release.
6. Make models absent a supported startup condition. Keep imports responsive with bounded cancellable background work and explicit progress; capture content never gains shell privileges.

## Acceptance criteria
- [ ] The app opens a synthetic existing vault with network disabled and no model packs installed.
- [ ] Import stages verified source bytes and canonical records, then obeys T19's recorded policy; reopening shows the same item and honest processing state.
- [ ] Failed or interrupted imports never appear as durably saved.
- [ ] Writer contention is handled visibly without allowing conflicting local writers.
- [ ] Startup recovery and live external edits converge to the authoritative files.
- [ ] Invalid command inputs and path escapes are rejected at the host boundary.
- [ ] The UI distinguishes unsupported features and queued work from implemented success.
- [ ] Basic keyboard operation, readable focus, and accessible status/error announcements work.

## Validation
Run the real packaged or development desktop workflow on every D03-approved target. Exercise permission denial, inaccessible vault, corrupt metadata, cancelled import, crash during save, restart, and missing `.local`; then inspect durable files independently. Verify host permissions and absence of unexpected network requests.

Run existing `just check` and `just verdict` as applicable. Once tooling is introduced, document and run its actual commands; there are no current Cargo/npm commands to invent. Report native checks separately from Bend proofs and disclose platforms not exercised. Record timings and resource usage as measurements, not attainment of unmeasured targets.

## Out of scope
Full interaction UI from T17, semantic retrieval, model installation, mobile, sync, mock-backed completion claims, and unapproved native dependencies.

## Handoff
Provide startup/import workflow evidence, command and capability contracts, D02/D03 outcomes, build/run instructions reflecting actual tooling, and known platform limits for T17.
