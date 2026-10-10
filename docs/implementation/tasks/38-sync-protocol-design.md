# T38 — Design optional sync conflict and security contracts

## Phase

Optional post-foundation design. A bounded synthetic design investigation can start after predecessor contracts exist and its scope is authorised; final protocol adoption follows its findings. Sync is not a desktop or mobile usability prerequisite.

## Depends on

T02, T07, T08, T13, T14, T15, T32. Use accepted portable schemas, reference and journal rules, assertion precedence and backup recovery.

## Decision gates

D13 authorises the bounded design investigation first. Its final threat model, transport, encryption, identity, conflicts and retention choices are outputs needing owner adoption before T39 production implementation. Investigation does not require its own final answers to be pre-approved.

## Outcome

A reviewable protocol specifies canonical changes, conflict preservation, deletion safety, security assurances, and recovery for an optional user-controlled transport.

## Context and constraints

Only metadata code and pure-law proofs are currently implemented. Local operation begins with a single-writer baseline; sync introduces multiple disconnected writers and cannot borrow its safety claims without evidence. Authoritative state is open vault content, not cache databases. Immutable assets use content hashes; device-local indexes, handles, derivatives, and model packs are excluded. Accounts and cloud storage are never mandatory.

Add T35 as a blocker only when the approved topology includes mobile providers.
A desktop-only protocol investigation does not require phone or model-pack work.
Simulator evidence and owner adoption are distinct from a deployed adapter.

## Implementation scope

1. Define stable vault and item identities, mutation identity, canonical serialization, version compatibility, and integrity checks. Preserve notes, custom tags, automatic provenance, explicit corrections/rejections/promotions, Collections Space/query JSON, capture manifests, and ICS identities.
2. Specify how multi-file durable transactions map onto eventual folder delivery. Receivers must distinguish complete committed changes from partial arrival; transport atomicity cannot be assumed. Define staging, validation, idempotence, retry, and recoverable publication.
3. Define concurrent edit behavior for notes, user assertions, inference evidence, collections, and reminders. Preserve both conflicting versions where safe automatic merge is unavailable; no silent last-write loss. Explain user-visible conflict resolution and how resolved decisions persist.
4. Define tombstones and shared-blob reference safety under disconnected devices, delayed messages, and retention expiry. Identify acknowledgments or manual recovery needed to prevent resurrection and premature blob deletion. Obtain retention approval rather than choosing a convenient default.
5. Compare the narrowly plausible user-controlled transport options and their limitations. Document encryption threat model, key ownership and recovery, metadata leakage, authentication, integrity, and plaintext exposure. Separate transport encryption from end-to-end encryption and local backup confidentiality.
6. Build only the smallest synthetic protocol simulator needed to exercise accepted invariants. Property/fault tests should cover unavailable mobile providers, concurrent offline edits, partial transactions, duplicate delivery, reordering, and long-disconnected replicas.

## Acceptance criteria

- [ ] Canonical authoritative files and excluded device state are enumerated.
- [ ] Every concurrent user-edit class has a loss-preserving resolution rule.
- [ ] Deletion and retention scenarios cannot silently resurrect items or remove shared live blobs.
- [ ] Partial arrival and repeated delivery have deterministic recovery outcomes.
- [ ] Encryption assurances and remaining trust assumptions are explicitly approved.
- [ ] One initial adapter scope is accepted before T39 implementation.

## Validation

Run synthetic multi-replica simulations with property checks and injected interruption, reordering, duplication, retention expiry, and corruption. Prove suitable pure invariants against actual domain implementations where available; distinguish simulator assumptions from host guarantees. Run `just check`, `just verdict`, and `git diff --check`, reporting independent-kernel availability. Retain scenario traces and unresolved counterexamples; no transport is declared safe solely because a model passes.

## Out of scope

Syncing SQLite WAL files, generic CRDT frameworks, provider implementation, mandatory cloud accounts, production credentials, and silently choosing encryption or retention policy.

## Handoff

Give T39 the approved protocol, initial adapter selection, threat model, compatibility rules, simulator evidence, and explicit blocking D13 decisions.
