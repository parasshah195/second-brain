# Basecamp

Use the globally authenticated `basecamp` CLI without changing identity.
Project: https://app.basecamp.com/5660851/projects/49131676
Specification: https://app.basecamp.com/5660851/buckets/49131676/documents/10391481403

Use explicit account `5660851` and project `49131676` scopes. Parse supplied
Basecamp URLs with `basecamp url parse "<url>" --json` before extracting IDs.
Inspect the relevant leaf command's `--agent --help` before unfamiliar arguments.
Use non-interactive `--json` or `--agent` output. Never read credentials or print
tokens; use auth status/doctor for login problems.

Read the current specification and relevant discussion before implementation.
Reuse broad lists: Foundations, Product, and Quality & Delivery. Each task has
observable acceptance criteria. Add progress, decisions, blockers, commit
references, and actual verification results to its recording's comments.
Use the Message Board for milestone announcements and cross-cutting decisions.
Check existing tools/lists/items before creating duplicates. Enable tools only
when existing ones cannot serve the work. Do not invent assignees or dates.

Resolve contradictory requirements with the owner before destructive behavior.
Inspect spec attachments. Keep user vault contents and secrets out of messages
and repository fixtures.
