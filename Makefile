.PHONY: help try tree

help:
	@echo "Claude native preflight demo"
	@echo "  make try   — print how to attach this pack to another repo"
	@echo "  make tree  — show layout"

try:
	@echo "From the repo under audit:"
	@echo "  claude --add-dir $$(cd "$(CURDIR)" && pwd)"
	@echo "Then run: /preflight-audit"

tree:
	@find . -type f ! -path './.git/*' | sort
