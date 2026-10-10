# T17 — Implement search, editing, Spaces, and reminder interactions

## Phase
Deterministic library.

## Depends on
T11, T12, T13, T14, T15, T16.

## Decision gates
Dependency approvals remain binding; UI convenience cannot change membership, dates, or delivery policy.

## Outcome
Users search, inspect, annotate, organise, and schedule items through an accessible real desktop interface, while expensive retrieval remains explicitly submitted and unavailable capabilities remain honest.

## Context and constraints
Use a thin TypeScript system-WebView and typed least-privilege host contracts. Only the Bend metadata rule exists initially; dependencies supply real application behavior. Component paths are proposed, not pre-existing.

Items Markdown owns user notes and text. Metadata JSON separately records `user.tags`, `inference.tags`, corrections, provenance, and asset/state references. The system does automatically create tags, but never overwrites or removes custom tags or corrections; promotion and rejection persist. Collections JSON and Reminders ICS remain canonical. UI state and `.local` projections cannot become alternate authorities.

## Implementation scope
1. Build a virtualized library, detail view, and editor using the simplest approach adequate for the real shell. Preserve keyboard navigation, focus restoration, accessible names, selection, and announcements despite virtualization.
2. Parse queries and update chips, inexpensive lexical matches, and hard-filter results live. Show ambiguity for correction. Support chip removal/suppression without immediately recreating a dismissed interpretation from unchanged text; retain source spans and explain what remains literal.
3. Submit semantic/vision retrieval only on Enter, never typing, debounce or idle.
Until T24 supplies the required core backend, show an honest development
placeholder rather than fabricated results; it is not release-ready behavior.
Retain live lexical results in visibly degraded cold/fault repair states.
4. Associate every request and rendered result set with a query version. Cancel obsolete work and reject late results for older text, chips, filters, or sort choices. Render a coherent current state rather than mixing generations.
5. Connect real note edits, custom tags, automatic-origin display, correction, promotion, and rejection through dependency contracts. Handle external edits and save conflicts without silently replacing Markdown or user assertions.
6. Implement static Space membership, bulk selection, Smart Space inspection, and reminder confirmation/status using T14/T15. An arbitrary drop into a Smart Space must explain membership rules, not create an invisible override.
7. Use safe previews and honest loading, missing-asset, queued, and error states. Relationship UI may be an explicitly labelled stub; it must not imply implemented relationship detection or persistence.

## Acceptance criteria
- [ ] Typing updates lexical/filter results and chips without starting semantic or vision work.
- [ ] Enter is the sole semantic submission trigger; unavailable T24 capability is explicit.
- [ ] Delayed old results cannot replace current-query results after editing or changing filters.
- [ ] Hard filters remain enforced across eligible branches; future RRF consumes independent branch ranks without post-top-k filtering.
- [ ] Notes, custom tags, promoted assertions, and rejections survive restart and automatic enrichment.
- [ ] Reminder creation requires a separate explicit confirmation showing resolved schedule and limits.
- [ ] Keyboard-only and assistive-technology workflows reach library items, editor, chips, bulk actions, and errors.
- [ ] Current untrusted media previews cannot gain privileged IPC or unexpected network access. A captured-content viewer is deferred to T20; its script/network isolation applies only when that future capability is scheduled.

## Validation
Exercise no-model/offline search and browsing in the real T16 shell. Instrument request dispatch to prove absence of semantic work while typing, debouncing, or idle. Inject reordered responses and cancellation races; inspect query-version behavior. Test ambiguous dates, suppressed chips, large virtualized libraries, save conflicts, deleted items, and external file edits.

Run keyboard and accessibility checks on approved targets, including focus after virtualized rows disappear. Inspect canonical files after tag and reminder actions. Run existing `just check` and `just verdict` as relevant; these do not validate UI or host behavior. Use actual introduced UI checks, not invented current npm commands.

## Out of scope
T24 semantic implementation, relationship implementation, redesign of canonical contracts, cloud accounts, and policy changes hidden in interaction defaults.

## Handoff
Provide interaction/state contracts, submission and stale-result evidence, accessibility findings, and labelled downstream placeholders.
