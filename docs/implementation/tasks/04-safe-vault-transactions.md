# T04 — Build confined vault IO and recoverable transactions

## Phase
Storage foundation.

## Depends on
T02, T03.

## Decision gates
D02 adopted native seam and D03 initial host/platform contract.

## Outcome
Make canonical writes safe, confined and recoverable without claiming that one
atomic rename makes a multi-file mutation durable.

## Context and constraints
The vault is authoritative and user-editable. `.local/` is disposable, so neither
the only pending original nor the only recovery manifest belongs there.
The initial implementation permits one coordinated local writer. External
changes and interrupted writes must preserve user data.

## Implementation scope
1. Implement vault creation/open/identity and validated relative-path resolution.
   Bound input sizes and reject traversal, absolute resource escapes and symlink/
   reparse-point escape paths at real host IO seams.
2. Establish a process/writer coordination contract and safe behavior for a
   second instance, read-only vault, revoked permissions and network/provider
   storage outside the supported local baseline.
3. Stage, flush and publish complete files with platform-appropriate durability.
   Use version/revision checks for edits racing user changes.
4. Journal multi-file operations under canonical recoverable transaction state.
   Define ordering and idempotent startup roll-forward/rollback behavior. Protect
   original files until the operation's durable commit point is established.
5. Provide the smallest shared storage operations for imports, edits, membership,
   reminders and deletion. Keep mechanism local rather than a generic framework.
6. Coordinate cache clearing with workers; rebuild projections without discarding
   staged canonical originals or active transactions.

## Acceptance criteria
- [ ] Escaping paths cannot read/write outside the approved vault operation.
- [ ] Second writers and unsupported storage modes fail visibly and safely.
- [ ] Every injected interruption leaves a consistent or recoverable operation.
- [ ] Disk-full/permission failures preserve prior canonical content.
- [ ] Clearing `.local/` never removes unique user data or active recovery state.

## Validation
Use temporary synthetic vaults and real file operations. Interrupt every write/
manifest/reference-publication phase, restart and reconcile repeatedly.
Exercise traversal, symlinks, collisions, permission loss, read-only folders,
disk-full simulation and concurrent external edits. Verify bytes and record
identities after recovery. Run pure proofs separately; they do not establish
platform flush or rename guarantees.

## Out of scope
Multi-device writers, transport sync, unapproved permanent deletion, database
ownership or a reusable transaction engine beyond vault needs.

## Handoff
Give T05–T08/T13–T21/T32 canonical mutation, conflict, durability and recovery
interfaces with runnable fault fixtures.
