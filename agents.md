# Working rules

Build the smallest working slice of the agreed specification. Reuse existing
code and standard libraries before adding dependencies or abstractions. Preserve
validation, accessibility, security, and data-loss protection. Leave a runnable
check for non-trivial logic.

- Before Git operations or landing work, read `docs/agents/git.md`.
- Before maintainer work, load the `second-brain-local` skill if installed on this
  machine. It contains machine-local context; never copy its contents into Git,
  branch names, public reviews, or logs. Contributors do not need that skill.
- Before changing Bend code, laws, proofs, or verification, read `docs/agents/bend.md`.
- Before changing storage, search, ingestion, AI, or UI architecture, read
  `docs/architecture.md`.
- Before public contributions or security reports, read `CONTRIBUTING.md` and
  `SECURITY.md`. Read `agents.md` explicitly; lowercase filenames are not
  automatically discovered by every agent tool.

Keep private maintainer workflow and project identifiers outside this repository.
Report actual checks and their limits; a proof covers its stated law, not the
whole application.
