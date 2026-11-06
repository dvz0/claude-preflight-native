---
name: preflight-fix
description: >-
  Interactive remediation after a preflight audit: plan fixes first, wait for
  explicit user approval, then apply minimal edits and re-check. Human-in-the-loop
  equivalent of Approve Fixes.
disable-model-invocation: false
allowed-tools: Read, Grep, Glob, Bash, Edit, Write, Agent
---

# Preflight fix (HITL)

Plan first. **Edit only after the user approves the plan.**

## Steps

1. Inspect modified files and any prior `/preflight-audit` findings the user cares about.
2. State root cause in a few sentences.
3. Show a step-by-step plan and the minimal patch set (paths + intent). Do not edit yet.
4. Wait for explicit approval ("yes", "approve", "go", etc.).
5. After approval, apply the minimal changes only.
6. Re-run relevant tests or linters when safe; report outcomes.
7. If something still fails, propose the next change and wait again before editing.

## Rules

- Prefer the smallest correct fix.
- Prefer deleting hardcoded secrets over renaming them.
- Do not invent new files unless the approved plan requires them.
- Do not commit or push unless the user asks.
