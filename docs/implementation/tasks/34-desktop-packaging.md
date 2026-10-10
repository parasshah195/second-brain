# T34 — Prepare desktop packaging, CI, and distribution manifests

## Phase

Desktop release-candidate preparation. Implementation is blocked until the host exists, qualification evidence is available, and distribution scope is approved.

## Depends on

T16, T22, T32, T33. Use their host execution seam, required core AI lifecycle, recovery contract, and tested support matrix.

## Decision gates

Application code licensing is verified MIT; honour its committed copyright/licence notices rather than reopening licence selection. D01 pure-law approval is separate and remains owner-controlled; explaining laws does not approve revisions. D03 approves desktop operating systems; D11 approves actual dependencies, signing, and notices. D09 and weight/codec rights apply to included packs and capabilities. MIT application licensing does not grant third-party dependency, weight or codec rights; unresolved rights block inclusion rather than imply permission.

## Outcome

Reproducible release-candidate artifacts have accurate capability, dependency, license, pack-size, and installation manifests. No production publication occurs through this task.

## Context and constraints

The repository currently has metadata code and proofs, not an application build. The intended shell is Tauri 2 with thin TypeScript and Rust IO; the pure-domain Bend execution seam remains subject to an actual spike. Packaging must follow that accepted result, not assume proofs establish host correctness. Vaults are user-owned open folders, `.local` is disposable, and model packs are app-shared outside vaults. All inference stays on-device.

The normal installer bundles verified required core weights and minimal native runtime. No model-free base release is valid. Add selected optional capability tasks as blocking prerequisites for additions beyond that minimum; unselected extra packs, browser engines or media codecs need not ship.

## Implementation scope

1. Pin the accepted source toolchain and dependency resolution, documenting reproducible build inputs. Add the smallest CI matrix covering supported desktop hosts, domain checks, independent kernel verification, host tests, and artifact generation. Document unavailable runners honestly.
2. Produce an SBOM and notices from actual resolved dependencies. Inspect the exact FFmpeg build flags, codec licensing, bundled native libraries, and each model weight's separate redistribution terms. Application licensing does not grant model or codec rights.
3. Define the normal bundled-core artifact and approved optional extra packs or full air-gap installers beyond the required minimum. Measure actual application/runtime/model compressed download size, installed size, temporary installation space, and shared storage behavior. Record versions, hashes, supported devices, quality evidence, capability gaps, and explicit consent for optional downloads. Verify redistribution rights for every exact payload before inclusion.
4. Configure platform signing and notarization only after owner approval. Owners supply credentials through secure mechanisms outside the repository; fixtures and logs contain no secrets. Unsigned candidates must be labeled and must not masquerade as production builds.
5. Implement install, upgrade, rollback where supported, and uninstall behavior consistent with recovery contracts. Preserve vaults and user backups. Shared packs still used by another installation or vault must not be removed blindly.
6. Keep artifact creation separate from upload, release publication, and production promotion. Produce a reviewable release-candidate manifest that links qualification evidence and unresolved legal or platform gates.

## Acceptance criteria

- [ ] Each supported host produces an installable candidate from pinned source inputs.
- [ ] CI distinguishes proof/kernel results from host, installer, and security tests.
- [ ] Notices and SBOM cover actual binaries, build flags, codecs, and weight packs.
- [ ] Normal installation works with bundled verified core weights/runtime without accounts or network, including meaningful automatic organisation and native CPU fallback.
- [ ] Air-gap installation includes required core AI and reports actual package/model sizes, rights and measured quality; optional additions are separate from the required minimum.
- [ ] Upgrade and uninstall preserve authoritative vault state and referenced shared packs.
- [ ] Signing status and every blocked distribution right are explicit; verified MIT application notices are retained.
- [ ] Installed imports preserve exact original-file/source bytes by default; optional lossless compression is disabled by default and preserves all metadata, decoded content and familiar formats. Core AI quality gates pass on default original content and actual optional losslessly stored content. Unsupported, unverifiable, non-saving and signed inputs retain exact input bytes; no canonical lossy compression is approved and upgrades/settings changes never retroactively recompress existing vault assets.

## Validation

Run `just check`, `just verdict`, and `git diff --check`, recording exact outcomes and tool availability. On clean supported machines, install normal bundled-core and air-gap candidates, deny network, open a restored synthetic vault, upgrade, and uninstall. Test interrupted pack installation and insufficient disk space. Inspect packaged dependencies and signing status rather than trusting configuration alone. Retain sanitized CI logs, artifact hashes, installer evidence, and measured sizes; no nonexistent application command is assumed here.

## Out of scope

Automatic credential provisioning, package publication, production promotion, unsupported OS promises, and choosing unapproved codec or weight licenses.

## Handoff

Deliver candidate artifacts and manifests to T40 with legal approvals, signing gaps, tested installer limitations, and owner actions required before distribution.
