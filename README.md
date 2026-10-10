# Second Brain

[![Verification](https://github.com/parasshah195/second-brain/actions/workflows/verify.yml/badge.svg?branch=develop)](https://github.com/parasshah195/second-brain/actions/workflows/verify.yml)

Save anything you want to come back to.

Second Brain is a personal, private vault for ideas, inspiration, bookmarks,
and files. It's designed to be an extension of your memory: save something
because it interests you, without deciding where it belongs. Local AI helps
you find it again and discover connections between things you've saved.

**Status: early development. There is no installable application or production
release yet.** The experience below describes the product we're building,
not capabilities you can use today.

## Keep what catches your attention

A link worth revisiting. A photograph that gives you an idea. A PDF you might
need later. A note you don't want to forget.

The goal is a bookmarking system that goes beyond links, a place for any file
you want to keep. No folder decisions or manual tagging required. Support for
storing a file does not mean the AI can understand every format.

URL bookmarks will save the address and your title or notes. Archiving entire
web pages for offline reading is deferred.

## Find connections, not just files

You shouldn't have to remember a filename or the folder you chose months ago.
Second Brain is being built to help you search what you've saved, rediscover
related material, and notice connections that could inspire your next idea.

Imagine saving a photograph, a design reference, and a note at different times,
then finding them together when you return to a project. That's the intended
experience, without having to build an organization system first.

AI organization will run in the background, separately from your original files.
Your corrections will take priority. AI will not rename, move, rewrite, or
delete your originals without permission.

## Private to you, owned by you

Your vault will live in a local folder you control. The core app and its AI
are designed to work on your device, without an account or a required cloud
service. Any future feature that sends your content elsewhere will require
your explicit consent.

Files and organization data will use documented, open formats rather than a
proprietary database you need the app to read. You'll be able to move or back
up the folder, open supported files with other apps, and keep your library
even if you stop using Second Brain. Other apps may not interpret all of its
organization data.

A local folder is not a guarantee of encryption or a substitute for backups.

## Keep your originals

The product commitment is to leave imported files uncompressed and unchanged
by default, in their original formats. Previews, extracted text, and search
indexes will be separate, rebuildable data.

An additional setting will allow lossless compression to replace originals.
It will be optional, not the default. This is a preservation requirement for
the planned app, not a claim that storage durability has already been verified.

## What's here today

A small Bend domain module resolves metadata: an explicit user assertion wins
over background inference, including an empty-string assertion. If no assertion
exists, inference is the fallback. Two universal laws are checked against that
implementation. The initial laws await maintainer approval.

Vault persistence, search, desktop UI, and model integration are not implemented.
See [architecture](docs/architecture.md) for the intended system and boundaries.

`develop` is the default development branch; `main` is reserved for production
releases.

## System wiki and execution plan

- [How the system works](docs/wiki/README.md): plain-English workflows and
  technical contracts.
- [Ordered implementation tasks](docs/implementation/README.md): GitHub issues,
  prerequisites, acceptance criteria and handoffs.
- [Pending decisions and recommendations](docs/implementation/DECISIONS.md):
  owner approvals required before gated work.

The task system describes planned work, not delivered capabilities. Implement
ready slices from `develop`; keep optional future features out of earlier tasks.

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
Proofs cover the stated pure metadata laws, not disk durability, model accuracy,
host integration, or an entire application.

Set `BEND_NO_TELEMETRY=1` to disable Bend's upstream version checks. This is a
toolchain setting, not a claim about a finished application's privacy.

## Contributing and security

Read [CONTRIBUTING.md](CONTRIBUTING.md) before proposing a change and
[SECURITY.md](SECURITY.md) to report a vulnerability privately.
Discuss substantial proposals with the maintainer before opening a pull request.
Keep public reviews self-contained and free of private planning information.

## License

Licensed under the [MIT License](LICENSE). Third-party model weights, codecs and runtimes
retain their separate distribution requirements.
