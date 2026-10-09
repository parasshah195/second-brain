# Bend and verification

Official references: https://bend-lang.com/ and the installed `bend guide`.
Run `bend guide` before writing Bend; use `bend base <name>` for library APIs.
Use the current laws/proofs language, not the older HVM Bend syntax.

Use Bend for pure, typed domain rules and transformations: metadata precedence,
filter semantics, ranking invariants, and state transitions. Keep important
rules in root `LAWS.bend`; implementation in `src/`, evidence in `PROOF.bend`.
Proofs import and discharge laws against actual code, not a duplicate model.

The initial laws are setup drafts requiring owner review. After approval,
treat laws as the human-owned contract: ask before weakening, deleting, or
changing one to make code pass. Add proofs and fix implementations instead.
Open claims, unsafe dependencies, foreign assumptions, and `?TODO` are not proof.

Run exactly `bend PROOF.bend` before every commit and require ALL PROOFS CHECK.
Also run `bend PROOF.bend --verdict` for the independent BendTT kernel check;
`make verdict` requires Lean v4.34.0 or a built kernel via `BENDTT`. If unavailable,
report the blocked independent check; never claim mathematical kernel validity.
`make check` runs the standard checker. Parallelize balanced computations where
useful, not tiny metadata operations.

Proofs cover total pure Bend functions, not disk durability, SQLite/FTS, network
capture, host/foreign code, model accuracy, or WebView rendering. Test those at
real boundaries: interrupted writes, traversal/symlinks, shared-asset deletion,
index rebuilds, and no-model/no-network operation.
If Rust duplicates a Bend rule, proofs do not prove Rust: use shared execution
or cross-language conformance checks and document the remaining gap.
