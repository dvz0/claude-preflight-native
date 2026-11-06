---
name: preflight-audit
description: >-
  Run the full local preflight pipeline on git working-tree changes: extract
  diff, launch security/quality/testing subagents in parallel, consolidate into
  one report. Use before push or when the user asks for a local PR audit.
disable-model-invocation: false
allowed-tools: Read, Grep, Glob, Bash, Agent
---

# Preflight audit (orchestrator)

Replicate the agentic-local graph using Claude Code only. **Do not edit files.**

## 1. Extract diff

```bash
git diff --staged
git diff
git status --short
```

Prefer staged when non-empty; else unstaged; else `git diff main...HEAD` or `master...HEAD` if the branch diverged. Summarize which source you used.

## 2. Parallel specialist agents

Launch **three** subagents in parallel with the same diff summary + key file paths:

| Agent | Focus |
| --- | --- |
| `security-reviewer` | secrets, injection, unsafe APIs |
| `quality-reviewer` | clarity, typing, smells, style |
| `testing-reviewer` | coverage gaps, regressions |

Pass enough context for each to work independently. They must not edit files.

## 3. Consolidate

Merge the three reports:

1. Drop duplicates / near-duplicates.
2. Rank by severity: High (blocking) > Medium > Low.
3. Keep at most one proposed patch per issue/lines.
4. Prefer removing secrets over renaming or testing them.

## 4. Final user report

Use this structure (no emojis):

```markdown
# Preflight audit report

## Diff source
[staged | unstaged | branch vs main]

## Summary
[2-3 sentences]

## Findings

### High (blocking)
- None

### Medium
- None

### Low
- None

## Proposed patches
[unified diffs for the most important fixes, or omit]

## Next
Say that `/preflight-fix` will remediate after explicit approval.
```

If there are no High/Medium findings, say the change looks acceptable against `CLAUDE.md` and list only Low or `None`.
