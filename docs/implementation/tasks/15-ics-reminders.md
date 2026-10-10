# T15 — Persist ICS reminders and integrate native desktop scheduling

## Phase
Local scheduling and desktop integration.

## Depends on
T02, T04, T06, T11, T13.

## Decision gates
D08 approves date interpretation, reminder delivery policy, supported recurrence, and platform-specific limitations. Use only approved target platforms; record missing platform approval rather than choosing one implicitly.

## Outcome
Users explicitly create and manage portable reminders whose canonical schedule survives application restart and whose desktop delivery limitations are visible.

## Context and constraints
Reminders ICS is the schedule authority in the user-owned vault. Metadata JSON owns item links and state; Items Markdown owns user text. Device-local scheduler registrations and `.local` projections are rebuildable derivatives. No account, cloud scheduler, model, or network is required.

Only the Bend metadata rule and proofs are implemented today. Native scheduling and its adapters are proposed work, not proved functionality. Route file writes through the single coordinated local writer with durable recovery, and reconcile external ICS edits at startup and live.

Search typing is not a command. Live parsing may recognise a date or reminder intent, but creation requires a distinct, explicit create-command confirmation. A search submission also cannot silently schedule a notification.

## Implementation scope
1. Define and implement the canonical ICS subset using stable UID identity, VTODO records, and VALARM delivery intent. Preserve linkage through rename and edits. Specify updates, completion, cancellation, recurrence exceptions, and unknown-field handling in the public contract.
2. Apply D08-approved timezone, floating-time, all-day, daylight-saving transition, and relative-date rules. Display the resolved time and zone before confirmation. Surface ambiguous and nonexistent local times for correction instead of silently selecting an offset.
3. Implement create, reschedule, complete, reopen, and delete through recoverable canonical writes. Register native delivery only after durable persistence. Reconcile registrations idempotently using stable identity and the approved scheduler capabilities.
4. Handle permission denial, permission changes, sleep, missed deadlines, app restart, clock changes, and closed-app behavior explicitly. Document capability differences by approved platform and delivery mechanism; distinguish scheduled intent from proven delivery.
5. Cancel pending registrations after reminder or linked-item deletion according to dependency contracts. Keep enough recoverable state to repair a crash between canonical cancellation and native deregistration.
6. Expose permission, scheduling, completion, and delivery-status contracts to T17. Keep any retry or missed-reminder policy behind D08 approval.

## Acceptance criteria
- [ ] Confirmed reminders have stable ICS UIDs and can be read without the app.
- [ ] Typing, editing chips, and submitting a search create no reminders.
- [ ] Confirmation shows the resolved date, time, timezone, recurrence, and known delivery limits.
- [ ] DST transitions, recurrence exceptions, and completion follow documented approved rules.
- [ ] Deletion cancels pending delivery; restart repairs an interrupted cancellation.
- [ ] Permission denial and unsupported closed-app delivery produce actionable status, not a success guarantee.
- [ ] External ICS changes update local registrations without duplicating alarms or overwriting unrelated user text.
- [ ] Offline, no-model operation supports all approved reminder actions.

## Validation
Exercise real scheduling on each approved native platform, including denied/revoked notification permission, sleep/wake, app exit, restart after the due time, timezone changes, and clock adjustment. Use short synthetic schedules for delivery tests and fixed-clock fixtures for DST, recurring completion, and exception logic. Inspect exported ICS with an independent reader where feasible, documenting interoperability limits.

Inject failures before and after canonical writes and native registration/cancellation. Record observed delivery separately from intended schedules. Run existing `just check` and `just verdict` as relevant; proofs do not establish OS delivery. Report actual platform checks and unavailable environments, without inventing current Cargo/npm commands.

## Out of scope
Guaranteed closed-app delivery, cloud push, mobile scheduling, automatic reminders from typing, and unsupported recurrence implied to work.

## Handoff
Provide the public ICS subset, UID/linkage and cancellation contracts, D08 outcomes, capability matrix, and reproducible failure evidence. T17 receives honest confirmation and status states.
