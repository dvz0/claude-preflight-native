# Claude native preflight (demo)

Same job as `agentic-local-preflight-reviwer`, but only Claude Code primitives:

- **Skills** — orchestrate `/preflight-audit`, `/preflight-fix`, `/preflight-report`
- **Subagents** — security / quality / testing in parallel
- **Tools** — shell `git`, Read/Grep/Glob (MCP optional)
- **No** Streamlit, LangGraph, Ollama, LanceDB, or app-managed API keys

Auth is whatever Claude Code already uses (`claude login`). This pack is instructions + tools.

## Try it

From the **repo you want to audit**:

```bash
cd /path/to/your/app
claude --add-dir /mnt/d/_code/PRstuff/claude-native-preflight
```

Then:

| Command | Role |
| --- | --- |
| `/preflight-audit` | Full pipeline (3 agents → consolidate → report) |
| `/preflight-report` | Paste-ready markdown only |
| `/preflight-fix` | Plan fixes → wait for approval → edit |

Or copy `.claude/` (+ optional `CLAUDE.md`) into the target repo.

## Layout

```text
claude-native-preflight/
├── CLAUDE.md                 # short review policy
├── .mcp.json                 # optional; not required for audit
├── .claude/
│   ├── agents/
│   │   ├── security-reviewer.md
│   │   ├── quality-reviewer.md
│   │   └── testing-reviewer.md
│   └── skills/
│       ├── preflight-audit/     # orchestrator (= LangGraph graph)
│       ├── preflight-report/    # consolidator-style output
│       └── preflight-fix/      # HITL apply (= Approve Fixes)
└── .claude-plugin/              # optional packaging as a plugin later
```

## Optional MCP

`.mcp.json` wires `git` / `fetch` / `memory`. Local preflight works with shell `git` alone.
