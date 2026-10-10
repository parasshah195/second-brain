# T20 — Import portable offline web snapshots and provide an inert viewer

## Phase
Deferred future captured-content work. Not being implemented in the current
scope; snapshot import, resource manifests and viewer do not gate release.

## Depends on
T04, T05, T06, T09, T16.

## Decision gates
D06 records owner deferral. Implement only after explicit later scheduling and
approval of fidelity/limits; current URL bookmarks do not fetch/archive pages.

## Outcome
Users import HTML/resource snapshots into one portable vault layout, read offline safely, and retain provenance for incomplete snapshots.

## Context and constraints
Captures stores per-item HTML and a resource manifest linking shared hash-addressed Assets. Items Markdown owns notes and user text; Metadata JSON owns provenance, asset references, and state. Readable extracted text and `.local` search/viewer projections are derived, not replacements for authored Markdown. These describe required contracts, not existing application modules.

Only the Bend metadata rule and proofs exist today. Imported snapshots are untrusted, inert, unprivileged, network-denied, and isolated from Tauri host commands. No extension or headless browser is required.

When later implemented, resource ingestion preserves exact source bytes by default.
Optional lossless compression is disabled by default and preserves all metadata,
decoded content and familiar formats. Unsupported, unverifiable, non-saving and
signed inputs retain exact input bytes; no retroactive recompression.
Shared resource blobs survive while referenced. Durable recovery applies.

## Implementation scope
1. Define a public supported import contract for HTML plus available resources, including externally exported dumps with incomplete or unexpected layout. Map all supported inputs into the same per-item Captures HTML/manifest structure rather than format-specific vault trees.
2. Record source URL, final URL, capture/import time, method, status, and missing resources. Distinguish imported provenance from app-observed network facts; unknown redirect or capture time stays unknown. Retain a useful source URL even when the snapshot is partial.
3. Store resource bytes as shared hashed assets and map original references to local resource identities. Validate manifest paths, archive extraction, symlinks, traversal, and URL schemes before filesystem access. Do not fetch missing resources automatically.
4. Produce a readable-text derivative for lexical retrieval while preserving Markdown notes. Mark missing text or failed extraction honestly; importing a visual snapshot does not imply complete searchable content.
5. Implement an isolated inert viewer with no scripts, privileged IPC, remote loads, forms submitting to the network, or navigation that silently escapes the sandbox. Make intentional source opening a separate explicit user action under the shell's approved policy.
6. Preserve readable and visual best-effort rendering and actionable missing-resource status. Ensure ordinary tools can inspect HTML, manifest, resources, and provenance without the app; document any rendering limitations.

## Acceptance criteria
- [ ] Complete and partial imports use one documented vault layout and remain inspectable with the app absent.
- [ ] Provenance records observed versus unknown facts, plus specific missing-resource status.
- [ ] HTML/resource references resolve locally; repeated resources deduplicate without unsafe deletion.
- [ ] Scripts, remote images/fonts/styles, privileged messages, and network submissions cannot execute or load.
- [ ] Traversal, symlink escape, malicious archive entries, and unsupported URL schemes are rejected safely.
- [ ] Notes, custom tags, corrections and all metadata survive; stored bytes follow the recorded compression-on/off policy without unrelated reprocessing changes.
- [ ] Offline lexical access remains useful when visual fidelity is incomplete.
- [ ] Interrupted imports recover without claiming partial persistence as complete.

## Validation
Import synthetic complete dumps, missing styles/images, broken relative links, redirect-unknown exports, Unicode paths, and corrupt manifests. Include hostile scripts, inline event handlers, remote CSS imports, forms, iframe content, IPC attempts, traversal, and symlink fixtures. Verify denied network requests and host access in the real desktop viewer, not only by inspecting sanitization output.

Test degraded-model/offline startup, app-absent inspection, deleted `.local`, duplicate resources, crash boundaries, and live external edits when this deferred feature is scheduled. Run existing `just check` and `just verdict` as applicable; neither proves viewer isolation. Record actual native workflow checks and fidelity gaps without inventing current Cargo/npm commands.

## Out of scope
Live browser capture from T21, authenticated sessions, automatic resource repair, functional server replicas, and required browser extensions.

## Handoff
Provide the snapshot/manifest contract, import limits and D06 decisions, isolation evidence, portability instructions, partial-status examples, and the reusable canonical import path for T21.
