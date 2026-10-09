# Git workflow

Follow https://conventionalbranch.org/ (v1.1.0).
Use purpose branches: `feature/<description>`, `bugfix/<description>`,
`hotfix/<description>`, `release/<version>`, or `chore/<description>`.
Descriptions use lowercase words separated by single hyphens; release versions
may contain dots. Include the Basecamp to-do ID where useful.

`develop` is the primary integration branch. Start task branches there.
`main` is production only; promote a reviewed release explicitly, not each task.
Commit messages describe the change, with no LLM credits, generated-by trailers,
or AI co-author attribution.

Before committing: run `make check`, inspect the diff, and check for secrets.
Before landing: ensure acceptance checks pass, review the diff, and ensure no
concurrent work would be overwritten. Merge good completed slices into `develop`
regularly with `git merge --no-ff <task-branch>`. Log the commit and checks on the
Basecamp task; complete it only when acceptance criteria hold.

Inspect remotes before publishing. Delta's `local` remote is the user's checkout,
not a hosting service. Do not force-push or rewrite shared history. If the primary
checkout has `develop` checked out, coordinate its update rather than bypassing
Git's checked-out-branch protection. State whether a merge landed in Delta only
or was also published to the primary checkout.

Public hosting: `origin` is https://github.com/parasshah195/second-brain.git.
Use pull requests targeting `develop` and satisfy the required checks before
merging. Keep security reports private and exclude private planning content,
user data, and credentials from public diffs and descriptions. Keep contributor
commit messages free of LLM attribution. GitHub Issues are disabled so Basecamp
remains the project-management source of truth.
