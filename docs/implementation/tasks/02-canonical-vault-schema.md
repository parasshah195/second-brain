# T02 — Define and validate the canonical vault format

## Phase
Portable data contract.

## Depends on
T00, T01.

## Decision gates
D02 execution adoption, D03 first-slice support and D05 recovery representation.
Record exact approved values; recommendations do not fill required schema fields.

## Outcome
Publish versioned schemas and synthetic examples that every writer, reader,
indexer, backup and future platform uses as one ownership contract.

## Context and constraints
Markdown owns user text; JSON owns source/asset references, authored structured
state and separated generated evidence. Collections define Spaces/queries;
iCalendar owns reminder schedules. Shared assets are immutable content-hashed
bytes. `.local/` has no unique user information and model packs are outside vaults.

## Implementation scope
1. Define a stable vault identity, item/asset/collection/reminder identities,
   supported versions, relative-path rules and the intended folder layout.
   Bind filename changes to IDs instead of treating paths as identity.
2. Publish current JSON schemas for item metadata, collection definitions and
   recoverable operations. Defer capture/resource schemas to T20. Define required fields,
   meaningful unknown fields, limits and validation errors.
3. Define `user.tags`, `inference.tags`, user corrections/rejections/promotions,
   custom fields, Space IDs, favourites/read/archive/pinned/last-viewed state,
   provenance, original/stored hashes, effective compression policy/profile,
   metadata-preservation evidence, asset roles and processing revisions.
   Generated scores and calibrated confidence remain distinct.
4. Specify minimal Markdown front matter, user title/body ownership, source
   title fallback, reminder UID links and source capture versus saved timestamps.
   Avoid authoritative duplicates between Markdown, JSON and ICS.
5. Define Smart Space query text/AST/grammar version/relative dates/sort,
   explicit relationship storage and approved Trash/restore representation.
6. Implement validation and a conservative migration contract with recoverable
   originals and unknown-field preservation. Unsupported future versions are
   explicit errors, not destructive downgraded writes.

## Acceptance criteria
- [ ] Synthetic fixtures cover every current canonical family and user/generated layer; future capture implementation is not scaffolded.
- [ ] Renaming an item does not change its identity or break shared references.
- [ ] A reader can reconstruct authored state without SQLite or installed models.
- [ ] Unknown fields survive a read/write round trip; invalid data is explained.
- [ ] Migration failure leaves the recoverable source intact.

## Validation
Validate valid and invalid fixtures, Unicode titles, multiple assets, absent
source dates, rejected automatic labels, saved relative queries, multiple reminder
UIDs and approved recovery records. Test full round trips and migration interruption
with only synthetic content. Preserve existing proof checks; schema validation
does not prove filesystem durability.

## Out of scope
Creating indexes, syncing files, choosing model weights, silently adding
unapproved encrypted storage or declaring illustrative wiki JSON final.

## Handoff
Give T03–T15/T20/T22/T32 validated formats, revision rules and migration examples.
