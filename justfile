set shell := ["bash", "-euo", "pipefail", "-c"]

# ─── Setup ───

# Install dependencies and configure local environment (run once after clone)
[group('Setup')]
setup:
    git config core.hooksPath .githooks
    @echo "TODO: implement setup"

# Remove build artifacts and caches
[group('Setup')]
clean:
    @echo "TODO: implement clean"

# ─── Development ───

# Start development servers
[group('Development')]
dev:
    @echo "TODO: implement dev"

# Build all packages and apps
[group('Development')]
build:
    @echo "TODO: implement build"

# Run linters
[group('Development')]
lint:
    @echo "TODO: implement lint"

# Format code
[group('Development')]
format:
    @echo "TODO: implement fmt"

# ─── Test ───

# Run all tests
[group('Test')]
test:
    @echo "TODO: implement test"

# Run tests in watch mode
[group('Test')]
test-watch:
    @echo "TODO: implement test-watch"

# ─── CI ───

# Run local CI (mirrors remote CI pipeline)
[group('CI')]
ci-local: check-agents-sync
    just lint
    just test
    just build

# Check that AGENTS.md is in sync with CLAUDE.md
[group('CI')]
check-agents-sync:
    @diff -q CLAUDE.md AGENTS.md >/dev/null || { echo "CLAUDE.md and AGENTS.md are out of sync. Run: cp CLAUDE.md AGENTS.md"; exit 1; }
