# Second Brain

[![Verification](https://github.com/parasshah195/second-brain/actions/workflows/verify.yml/badge.svg?branch=develop)](https://github.com/parasshah195/second-brain/actions/workflows/verify.yml)

A desktop-first information library designed around a user-owned folder:
portable notes, original media, and local search. The goal is to keep your
library useful without cloud accounts, generative models, or the application.

**Status: early development. There is no installable application or production
release yet.** `develop` is the default development branch; `main` is reserved
for production releases.

## What's here today

A small Bend domain module resolves metadata: an explicit user assertion wins
over background inference, including an empty-string assertion. If no assertion
exists, inference is the fallback. Two universal laws are checked against that
implementation. The initial laws await maintainer approval.

Vault persistence, search, desktop UI, and model integration are not implemented.
See [architecture](docs/architecture.md) for the intended system and boundaries.

## Verify

Prerequisites: **Bend 2.0.36**, **just 1.58.0**, and Linux, macOS, or WSL.
Install just from [its official release](https://github.com/casey/just/releases/tag/1.58.0)
and confirm `just --version` matches.
Install Bend from [its official distribution](https://bend-lang.com/) and confirm
`bend version` matches. Read `bend guide`, then run:

```sh
git clone https://github.com/parasshah195/second-brain.git
cd second-brain
just check
```

`just check` runs `bend PROOF.bend`. For independent kernel verification, install
[Lean 4.34.0](https://github.com/leanprover/lean4/releases/tag/v4.34.0) on your PATH
(or supply a prebuilt kernel through `BENDTT`) and run `just verdict`.
Both checks must report `ALL PROOFS CHECK`. CI runs both with pinned toolchains.
Proofs cover the stated pure metadata laws—not disk durability, model accuracy,
host integration, or an entire application.

Set `BEND_NO_TELEMETRY=1` to disable Bend's upstream version checks. This is a
toolchain setting, not a claim about a finished application's privacy.

## Contributing and security

Read [CONTRIBUTING.md](CONTRIBUTING.md) before proposing a change and
[SECURITY.md](SECURITY.md) to report a vulnerability privately.
Discuss substantial proposals with the maintainer before opening a pull request.
Keep public reviews self-contained and free of private planning information.

## License

A software license has not yet been selected. Public visibility does not grant
permission to redistribute or reuse the code. This is not an open-source release
until the maintainer approves and adds a license.
