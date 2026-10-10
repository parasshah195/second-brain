# T32 — Deliver portable export, backup, restore, and repair

## Phase

Desktop resilience, after authoritative vault storage exists. This brief specifies future work, not an available backup feature.

## Depends on

T04, T07, T08, T13, T14, T15. Begin implementation only after their schemas, durable-write protocol, reference rules, and rebuild contracts are accepted.

## Decision gates

D05 must approve deletion and backup retention; D13 must approve privacy and recovery boundaries. Unresolved retention or disclosure choices block the affected operation.

## Outcome

A user can take a consistent, portable open-folder snapshot, restore it to a moved folder or another supported device, and inspect recoverable damage without silent data loss.

## Context and constraints

Only metadata domain code and pure-law proofs exist today. Backup/restore preserves exact stored bytes and all metadata. T19 ingestion uses default-enabled lossy compression preserving all metadata; its off setting preserves input bytes, and failures retain input. Backup/restore does not spontaneously recompress existing vault assets. Authoritative content includes Items Markdown notes, Metadata JSON assertions, provenance and generated evidence, hash-addressed Assets, future selected Captures HTML and resource manifests, Collections Space/query JSON, and Reminders ICS. Device-local `.local` caches are disposable; app-shared model packs live outside the vault. Backup must neither require a cloud account nor depend on inference.

## Implementation scope

Web-page snapshots/viewers are deferred; ordinary URL bookmarks preserve URL, user-provided title and notes without page fetching or archiving. Capture/resource inventories, backup/security tests and T20/T21 prerequisites below apply only when that future capability is selected. Keep future capture records portable without implementing capture to close the current release. Restoring without core models rebuilds deterministic recovery projections with visible degraded health and repair; it is not a complete launch workflow.

1. Specify a versioned snapshot manifest with file checksums, schema compatibility, reference inventory, and explicit completeness status. Define supported reader/writer versions and reject unsupported versions safely.
2. Coordinate snapshot creation with the single-writer journal. Select a durable transaction boundary, settle or recover pending writes, and freeze or consistently enumerate authoritative files. External edits during copying must produce a retry or explicit incomplete result, not a falsely successful snapshot.
3. Copy immutable blobs once while preserving all shared references. Include custom tags, automatic tag provenance, corrections, rejections, promotions, notes, reminder identities, and collection definitions. Exclude cache databases, transient derivatives, locks, and device-specific handles; include durable journal recovery material only according to its accepted contract.
4. Restore into a user-selected destination with staged verification and recoverable publication. Rebuild deterministic recovery projections offline without models or network, visibly flag missing core AI and guide repair; normal installed-core operation resumes automatic local organisation. Avoid overwriting an existing vault without an explicit reviewed conflict plan.
5. Provide inspection and repair for duplicate item IDs, missing blobs, broken capture references, checksum mismatches, and incomplete journals. Preserve conflicting originals and expose proposed actions before destructive repair.
6. Explain backup coverage and retention. Plain snapshots are not encrypted backups; state that plainly and distinguish integrity checks from confidentiality.

## Acceptance criteria

- [ ] A snapshot represents one committed point in time despite simultaneous save attempts.
- [ ] Moving and restoring a folder preserves every user assertion and reference.
- [ ] Shared blobs remain readable after one referencing item is deleted.
- [ ] Corruption and duplicate IDs produce actionable reports without silent replacement.
- [ ] Unsupported manifest versions and insufficient space fail without destroying source or destination.
- [ ] A model-free, network-blocked restore rebuilds browsing and lexical/filter retrieval as visibly degraded recovery with actionable core AI repair.

## Validation

Use synthetic vaults with shared media, custom and automatic tags, rejected inference, collections, notes, future selected captures, and ICS. On actual supported hosts, interrupt snapshot and restore at each durable boundary, fill the destination disk, edit source files externally, and repeat recovery. Restore on another supported device and compare manifest checksums and logical references. Record version, filesystem, recovery actions, and remaining limitations. Run `just check`, `just verdict`, and `git diff --check`; report unavailable independent-kernel checking explicitly. These checks do not establish host durability.

## Out of scope

Cloud backup services, sync transport, mandatory encrypted archive formats, canonical media transcoding, and automatic deletion-policy selection.

## Handoff

Provide the manifest and compatibility contract, recovery walkthrough, synthetic fault evidence, and unresolved D05/D13 decisions to T33 and release packaging. Implementation completion requires usable restore evidence, not merely successful export.
