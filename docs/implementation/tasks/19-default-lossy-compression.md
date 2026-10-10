# T19 — Apply default lossy compression while preserving all metadata

## Phase
Required storage policy and settings.

## Depends on
T04, T05, T06, T08, T18.

## Decision gates
D04's default lossy-on, all-metadata preservation and disable setting are settled.
Eligible formats/encoders/quality profiles still need D04/D10 evidence and D11
redistribution review. Unsupported or unverifiable cases retain input.

## Outcome
Apply useful lossy compression by default to safely supported new imports,
preserving all metadata and user state, with a persistent setting to disable it.

## Context and constraints
Lossy media is not byte-exact or pixel/stream-lossless. Preserving all metadata
means embedded EXIF/XMP/GPS, dates, camera/device, orientation, ICC, copyright,
custom/unknown blocks and canonical provenance, not just copying a few parsed
fields into JSON. Fail closed when that guarantee cannot be established.

Blobs remain immutable. Each import records its effective setting/profile and
original/stored hashes. A settings change does not silently recompress existing
vault assets; disabling cannot restore information already discarded. Do not
retain hidden full originals by default and misrepresent actual storage savings.

## Implementation scope
1. Add a persisted settings toggle, initially enabled. Snapshot its effective
   policy for each import/job. Disabled new imports retain source bytes.
2. Evaluate metadata-faithful lossy encoding for the approved supported formats,
   starting with measured image candidates as appropriate. Keep format/geometry
   consistent; protect signatures and formats whose metadata cannot be preserved.
   Encoder selection, codec profiles and quality values are evidence-driven,
   not invented here. Lossless-only tools do not implement the lossy requirement.
3. Compare all input metadata fields/raw blocks with the candidate, including
   unknown data and colour/orientation semantics. Validate decodability, quality,
   meaningful byte savings and bounded CPU/memory. Retain input on failure.
4. Publish validated output at a new hash and recoverably update eligible
   references. Never rewrite an existing hash path or migrate a reference whose
   recorded policy disables lossy compression. Recheck revisions/shared ownership.
5. Invalidate/rebuild derived analysis at the new stored-source revision.
   Core AI quality must pass on the actual default-compressed representation,
   not only pristine input. Preserve custom tags, corrections and provenance.
6. Show physical canonical/cache/shared-model usage, actual savings, temporary
   workspace and skipped/failed compression. Old blobs are collected only when
   safely unreferenced. No undeclared history pruning or retroactive bulk work.

## Acceptance criteria
- [ ] Default-on eligible imports produce validated lossy stored content with all metadata preserved.
- [ ] Disabling persists across restart and preserves subsequent source bytes.
- [ ] Unsupported, corrupt or metadata-unverifiable candidates retain input.
- [ ] New hashes, policy/provenance and derived source revisions are correct.
- [ ] Settings changes never silently rewrite existing assets or recover lost detail.
- [ ] Shared/off-policy references survive interruption and output publication.
- [ ] High-quality organisation remains useful on stored compressed content.

## Validation
Use synthetic metadata-rich files, unknown/raw blocks, orientation/ICC/GPS,
already-compressed and signed/unsupported inputs. Independently compare embedded
metadata and decodability; quantify quality and actual savings. Exercise on/off
settings, queued preference changes, restart, cancellation, disk exhaustion,
stale jobs and shared references. Run held-out AI checks on both compressed and
disabled-setting inputs, plus `just check`, `just verdict` and `git diff --check`;
report missing tools rather than claiming preservation from flags alone.

## Out of scope
Silent format conversion, metadata stripping, in-place hash mutation, unapproved
retroactive recompression, signature invalidation or automatic history expiry.

## Handoff
Give T27/T33/T34/T40 settings, policy, metadata-comparison and source-revision
contracts; provide encoder/licence manifests and measured quality/resource evidence.
