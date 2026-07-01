set shell := ["bash", "-euo", "pipefail", "-c"]

# Install dependencies and configure local environment (run once after clone)
setup:
    git config core.hooksPath .githooks
    @echo "TODO: implement setup"

# Remove build artifacts and caches
clean:
    @echo "TODO: implement clean"

# Start development servers
dev:
    @echo "TODO: implement dev"

# Build all packages and apps
build:
    @echo "TODO: implement build"

# Run lint and format checks without modifying files
check:
    @echo "TODO: implement check"

# Auto-fix all lint and format issues
fix:
    @echo "TODO: implement fix"

# Run all tests
test:
    @echo "TODO: implement test"

# Run tests in watch mode
test-watch:
    @echo "TODO: implement test-watch"

# Run local CI (mirrors remote CI pipeline)
ci-local: _check-agents-sync
    just check
    just test
    just build

[private]
_check-agents-sync:
    @diff -q CLAUDE.md AGENTS.md >/dev/null || { echo "CLAUDE.md and AGENTS.md are out of sync. Run: cp CLAUDE.md AGENTS.md"; exit 1; }
