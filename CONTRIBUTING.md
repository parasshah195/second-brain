# Contributing

Second Brain is in early development and has no production release.
Contributions are accepted under the project's [MIT License](LICENSE).
Submit only code you have the right to contribute under those terms.

## Proposing work

Use [GitHub Issues](https://github.com/parasshah195/second-brain/issues) and the
[execution plan](docs/implementation/README.md) to agree on a ready slice before
implementing a large change. Check its prerequisites and decision gates, then
record scope, blockers and actual verification in the issue and pull request.
Public discussions must stand alone without access to private maintainer tools
or documents. Report security vulnerabilities through the private process in
`SECURITY.md`, not a public issue.

## Development

1. Branch from `develop` using [Conventional Branch](https://conventionalbranch.org/):
   `feature/<description>`, `bugfix/<description>`, `hotfix/<description>`,
   `release/<version>`, or `chore/<description>`. Use lowercase hyphenated names.
2. Read [AGENTS.md](AGENTS.md) and the concern-specific instructions it routes to.
3. Use Bend 2.0.36 and just 1.58.0. Run `bend guide` before modifying Bend code.
4. Keep changes focused. Preserve validation, security, accessibility, and
   data-loss protection. Obtain maintainer approval before changing existing laws.
5. Run `just check`, `just verdict` with Lean 4.34.0, and `git diff --check`.
   Report unavailable checks honestly; CI must pass before integration.
6. Open a pull request against `develop` describing the problem, change,
   verification, and any remaining limits.

Commit messages describe the work and contain no LLM credits or AI co-author
trailers. Never commit tokens, private vaults, personal metadata, or downloaded
toolchains. Use synthetic examples for checks.

`main` is production-only; production promotion requires explicit maintainer
approval. Do not create releases or publish packages as part of ordinary work.

## Conduct

Be respectful and specific in review. Critique code, not people. Harassment,
discrimination, and disclosure of private information are not acceptable.
Contact the maintainer privately through their GitHub profile for conduct
concerns; they may moderate or remove contributions that violate these rules.
