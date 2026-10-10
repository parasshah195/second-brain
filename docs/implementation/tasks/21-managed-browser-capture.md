# T21 — Add optional bounded app-managed browser capture

## Phase
Deferred future richer capture adapter. Not being implemented now and not a
current release prerequisite; ordinary URL bookmarks do not download pages.

## Depends on
T20, T06, T09.

## Decision gates
D06 approves authenticated capture, media scope, fidelity, origin/resource access, and limits. D11 approves adapter/engine licensing and redistribution. Obtain owner approval before introducing any browser dependency; a recommendation or successful spike is not approval.

## Outcome
An optional adapter captures best-effort snapshots through T20's portable contract; imported snapshots remain supported without it.

## Context and constraints
Imported offline HTML/resources remains the baseline. A headless engine is optional; do not assume the Tauri system-WebView is a capture engine. No extension is required. Adapter absence cannot block save, browse, lexical search, or snapshot import.

Only the Bend metadata rule and proofs exist initially. Browser processing and isolation need independent evidence. Viewing remains inert, unprivileged, and network-denied. Only explicit capture allows approved origins/resources network access.

Future Captures holds HTML/manifests referencing shared Assets; Metadata JSON
records provenance/state and Items Markdown retains user text. Resource ingestion
follows recorded original-byte preservation by default or explicitly enabled
optional lossless compression preserving all metadata, decoded content and familiar
formats. Unsupported, unverifiable, non-saving and signed inputs retain exact
input bytes; no retroactive recompression. `.local` is disposable; required core
weights remain app-shared.

## Implementation scope
1. Compare a minimal approved browser adapter with continued imported snapshots. Record capability, licence, security, packaging, and resource-cost evidence for owner review. Add the dependency only after approval; document unavailable-adapter behavior.
2. Define explicit capture intent, origin/resource policy, redirect handling, and user-visible consent. Validate requested URLs and cross-origin requests through the dependency threat model, including local/private network destinations. Approval of one page is not unrestricted network permission.
3. Run browser processing in an appropriately isolated, bounded process. Apply D06/D10-derived approved process, memory, download, duration, and cancellation limits through the dependency contracts. Terminate abandoned work and clean only safe temporary data.
4. Handle cookies and authenticated sessions explicitly. Do not silently copy a user's browser profile, cookies, tokens, or logged-in session. Any supported authenticated flow requires approved consent, storage, expiry, and cleanup policy. Do not bypass access restrictions.
5. Export captured HTML/resources into T20's canonical import path with source/final URLs, time, method, missing resources, and complete/partial/failed/cancelled status. Readable and visual output is best effort, not a working server-side replica.
6. Make recapture an explicit recoverable operation. Preserve notes, custom tags, corrections, rejection/promotion state, and required archival references. Coordinate new resource references durably; never delete a shared blob that another item or retained capture references.

## Acceptance criteria
- [ ] The app works without the adapter and still supports T20 imported snapshots.
- [ ] Browser dependency and network/auth/media policies have recorded owner approvals.
- [ ] Only explicit capture starts network activity; redirects and resource requests obey the approved scope.
- [ ] Cancellation, timeout, memory/download pressure, and process crash produce honest recoverable states.
- [ ] Cookies and credentials are not silently imported or exposed in public fixtures/logs.
- [ ] Output uses the same portable manifest/layout and inert viewer as T20.
- [ ] Partial capture identifies missing resources; blocked content is not represented as complete.
- [ ] Recapture preserves user-authored content and referenced shared resources.

## Validation
Use controlled synthetic sites for delayed resources, redirects, cross-origin requests, endless loading, large downloads, process crashes, denied media, and authentication boundaries. Observe actual network destinations and process resources. Test cancellation at download and canonical-commit boundaries, restart recovery, and adapter absence. Re-open results offline in the inert viewer and inspect them without the app.

Run existing `just check` and `just verdict` as applicable; proofs do not validate browser isolation or authentication behavior. Record real adapter commands only after later approved implementation, licence/version evidence, and observed fidelity/resource limits. Do not claim guaranteed rendering or unmeasured targets.

## Out of scope
Required extensions, hidden browser dependencies, silent session copying, bypassing access controls, guaranteed dynamic-site replication, and cloud capture services.

## Handoff
Provide approved adapter and policy decisions, capture lifecycle/network contracts, licensing inventory, synthetic security/resource evidence, and explicit supported/unsupported fidelity cases. Keep the T20 import path independently usable.
