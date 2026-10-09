# Second Brain

A local-first library whose user-owned vault remains usable without the app,
cloud accounts, or generative models.

[Product specification](https://app.basecamp.com/5660851/buckets/49131676/documents/10391481403)
· [Basecamp project](https://app.basecamp.com/5660851/projects/49131676)
· [Architecture boundaries](docs/architecture.md)

## Current scope

Repository workflow, progressively disclosed agent instructions, and a small
Bend domain rule: explicit user metadata wins over background inference.
Two universal laws prove precedence and fallback against the implementation.
There is no vault IO, search engine, desktop shell, or model integration yet.
The initial laws are drafts awaiting owner review.

## Verify

Install Bend using the official instructions at https://bend-lang.com/.
Read `bend guide`, then run:

```sh
make check
```

This runs `bend PROOF.bend`. For the independent kernel check, run `make verdict`
with Lean v4.34.0 (`elan toolchain leanprover/lean4:v4.34.0`) or a built kernel
provided via `BENDTT`. Require `ALL PROOFS CHECK` from each.
The standard checker passed during setup; the independent check was blocked
because Lean was absent. These cover the pure metadata rule, not filesystem
persistence or application integration.

Read [agents.md](agents.md) before contributing. Work integrates into `develop`;
`main` is production only. Tasks and announcements live in Basecamp.
A license and public release destination require owner selection.
