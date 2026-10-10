# T19 — Preserve original files by default with optional lossless compression

## Phase
Required storage policy and settings.

## Depends on
T04, T05, T06, T08, T18.

## Decision gates
D04 confirms exact original-file/source-byte preservation by default and optional
lossless compression disabled by default. No canonical lossy compression is
approved. Eligible formats/lossless profiles still need D04/D10 evidence and D11
redistribution review. Unsupported, unverifiable, non-saving or signed inputs
retain exact input bytes.

## Outcome
Preserve exact original files by default. Provide a persistent optional lossless
compression setting, initially disabled, for safely supported subsequent imports,
preserving all metadata, decoded content, familiar formats and user state.

## Context and constraints
Enabled lossless optimisation may change encoded bytes, never decoded content.
It is not a promise of source-byte identity when enabled. Preserving all metadata
means embedded EXIF/XMP/GPS, dates, camera/device, orientation, ICC, copyright,
custom/unknown blocks and canonical provenance, not just copying a few parsed
fields into JSON. Fail closed when that guarantee cannot be established.

Blobs remain immutable. Each import records its effective setting/profile and
original/stored hashes. Default/disabled imports retain exact source bytes.
Settings changes and upgrades never retroactively recompress existing vault assets.
Do not retain hidden duplicate originals and misrepresent actual storage savings.

## Implementation scope
1. Add a persisted optional lossless settings toggle, initially disabled. Snapshot
   its effective policy for each import/job. Default/disabled imports retain exact
   source bytes; enabling affects subsequent imports only.
2. Evaluate metadata-faithful lossless optimisation for approved supported formats,
   starting with measured image candidates as appropriate. Keep format/geometry
   consistent; protect signatures and formats whose metadata cannot be preserved.
   Signed inputs retain exact input bytes. Encoder selection and lossless
   profiles are evidence-driven, not invented here. No lossy canonical output.
3. Compare all input metadata fields/raw blocks with the candidate, including
   unknown data and colour/orientation semantics. Independently verify decoded
   content equality, decodability, unchanged familiar format, meaningful byte
   savings and bounded CPU/memory. Retain exact input if unsupported, unverifiable,
   non-saving, signed or failed.
4. Publish validated output at a new hash and recoverably update eligible
   references. Never rewrite an existing hash path or migrate a reference whose
   recorded policy disables lossless compression. Recheck revisions/shared ownership.
5. Invalidate/rebuild derived analysis at the new stored-source revision.
   Core AI quality must pass on default original content and actual optional
   losslessly stored content. Preserve custom tags, corrections and provenance.
6. Show physical canonical/cache/shared-model usage, actual savings, temporary
   workspace and skipped/failed compression. Old blobs are collected only when
   safely unreferenced. No undeclared history pruning or retroactive bulk work.

## Acceptance criteria
- [ ] Default/disabled imports preserve exact original-file/source bytes.
- [ ] Optional lossless enablement persists across restart and affects subsequent imports only.
- [ ] Enabled eligible imports preserve all metadata, decoded content and familiar formats with verified savings.
- [ ] Unsupported, corrupt, unverifiable, non-saving and signed inputs retain exact input bytes.
- [ ] New hashes, policy/provenance and derived source revisions are correct.
- [ ] Settings changes and upgrades never retroactively recompress existing assets.
- [ ] Shared/off-policy references survive interruption and output publication.
- [ ] High-quality organisation remains useful on default original content and optional losslessly stored content.

## Validation
Use synthetic metadata-rich files, unknown/raw blocks, orientation/ICC/GPS,
already-compressed, non-saving and signed/unsupported inputs. Independently compare
all embedded metadata and decoded content; verify familiar formats, exact default/
fallback bytes and actual savings. Exercise on/off settings, queued preference
changes, restart, cancellation, disk exhaustion,
stale jobs and shared references. Run held-out AI checks on default original
content and optional losslessly stored content, plus `just check`, `just verdict`
and `git diff --check`; report missing tools rather than claiming preservation
from flags alone.

## Out of scope
Canonical lossy compression, silent format conversion, metadata/content loss,
in-place hash mutation, retroactive recompression, signature invalidation or
automatic history expiry.

## Handoff
Give T27/T33/T34/T40 settings, policy, metadata/decoded-content comparison and
source-revision contracts; provide encoder/licence manifests and measured
quality/resource evidence.
