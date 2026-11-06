# Local preflight policy

Advisory review of **local git diffs** before push. Not a CI gate and not remote GitHub PR review.

## Role

Act as a careful staff engineer: prioritize correctness, security, and maintainability. Prefer concrete findings with `path:line` over general advice.

## Pipeline (prefer skills)

1. `/preflight-audit` — extract diff → delegate security / quality / testing agents in parallel → consolidate
2. `/preflight-report` — structured markdown only (paste into a PR)
3. `/preflight-fix` — remediation with plan-first HITL; do not edit until the user approves

## Diff rules

- Prefer staged changes when both staged and unstaged exist.
- Else unstaged (`git diff`).
- Else branch vs `main`/`master` if diverged.
- Read surrounding call sites before proposing a patch.

## Severity

Use **High (blocking)** / **Medium** / **Low**. Put `None` under a section when empty.

## Fix rules

- Suggest minimal patches; do not invent files.
- Prefer removing hardcoded secrets over renaming them or adding tests for them.
- Never apply edits during audit/report; only during `/preflight-fix` after explicit approval.
