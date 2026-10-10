# Git workflow

Follow https://conventionalbranch.org/ (v1.1.0).
Use purpose branches: `feature/<description>`, `bugfix/<description>`,
`hotfix/<description>`, `release/<version>`, or `chore/<description>`.
Descriptions use lowercase words separated by single hyphens; release versions
may contain dots. Use descriptive names without private project or task IDs.

`develop` is the primary integration branch. Start task branches there.
`main` is production only; promote a reviewed release explicitly, not each task.
Commit messages describe the change, with no LLM credits, generated-by trailers,
or AI co-author attribution.

## New AI thread startup

1. Honor an explicit branch or resume request. Otherwise, use current
   `origin/develop` as the base, regardless of the inherited checkout branch.
2. Check `git status --short --branch` and `git remote -v`. Pause before switching
   if there are uncommitted changes or in-progress work; preserve them.
3. Verify `origin` points to this project's GitHub repository. If absent, add
   `https://github.com/parasshah195/second-brain.git` as `origin` in the attached
   worktree only. If it points elsewhere, ask rather than replacing it.
4. Run `git fetch origin develop`, then create the task branch with
   `git switch -c <type>/<description> origin/develop` before editing. Do not use
   an empty `main` or a stale local `develop` as a substitute. If fetching fails,
   report the blocker instead of silently using stale history.
5. Read `AGENTS.md` and the applicable instructions from that base. If the
   starting checkout is empty, retrieve `origin/develop:AGENTS.md` with `git show`
   before concluding that instructions are missing. Never initialize a separate
   root history to work around an empty checkout.

## Integration

Before committing: run `just check`, inspect the diff, and check for secrets.
Before landing: ensure acceptance checks pass, review the diff, and ensure no
concurrent work would be overwritten. Land completed slices regularly through
GitHub pull requests into `develop`, using merge commits after required checks
pass. Then fetch and fast-forward the Delta and primary-checkout branches to
the accepted GitHub merge. Local trial merges are disposable checks, not accepted
integration; never push them to bypass the pull request process.
Report the accepted commit and checks; mark work complete only when acceptance
criteria hold. Keep private tracking information out of GitHub.

Inspect remotes before publishing. Delta's `local` remote is the user's checkout,
not a hosting service. Do not force-push or rewrite shared history. If the primary
checkout has `develop` checked out, coordinate its update rather than bypassing
Git's checked-out-branch protection. State whether a merge landed in Delta only
or was also published to the primary checkout.

Public hosting: `origin` is https://github.com/parasshah195/second-brain.git.
Use pull requests targeting `develop` and satisfy the required checks before
merging. Keep security reports private and exclude private planning content,
user data, and credentials from public diffs and descriptions. Keep contributor
commit messages free of LLM attribution. GitHub Issues track the agreed execution
plan; read `docs/implementation/README.md`, check the issue's dependencies and
decision gates, and keep scope and verification evidence with its public issue.

Both branches require up-to-date proof checks, resolved review conversations, and
pull requests; force pushes and deletion are blocked, including for administrators.
`develop` permits maintainer integration without a separate GitHub approval.
`main` requires one approving reviewer: arrange an eligible second reviewer before
a production release, rather than bypassing protection.
