---
name: preflight-report
description: >-
  Produce a paste-ready markdown PR audit report from the current branch or
  staged changes. Use when the user wants a consolidator-style summary without
  applying fixes.
disable-model-invocation: false
allowed-tools: Read, Grep, Glob, Bash, Agent
---

# Preflight report

Compare the current branch to `main` (or `master`). If there is no divergence, review staged changes (else unstaged).

You may reuse the three specialist agents (`security-reviewer`, `quality-reviewer`, `testing-reviewer`) in parallel, then consolidate — or run a careful single-pass if the diff is tiny.

**Do not edit files.**

Produce exactly:

```markdown
# PR audit report

## Summary
[2-3 sentences: intent and technical impact]

## Findings

### High (blocking)
- None

### Medium
- None

### Low
- None

## Proposed patches

[unified diff fence for the most important fix, or omit the section body]
```

Keep it short, like a real PR review.
