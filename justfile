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

# ─── Backend ───

# Start backend development server
[group('Backend')]
be-dev:
    @echo "TODO: implement be-dev"

# Build backend
[group('Backend')]
be-build:
    @echo "TODO: implement be-build"

# Run backend lint and format checks without modifying files
[group('Backend')]
be-check:
    @echo "TODO: implement be-check"

# Auto-fix backend lint and format issues
[group('Backend')]
be-fix:
    @echo "TODO: implement be-fix"

# Run backend tests
[group('Backend')]
be-test:
    @echo "TODO: implement be-test"

# ─── Frontend ───

# Start frontend development server
[group('Frontend')]
fe-dev:
    @echo "TODO: implement fe-dev"

# Build frontend
[group('Frontend')]
fe-build:
    @echo "TODO: implement fe-build"

# Run frontend lint and format checks without modifying files
[group('Frontend')]
fe-check:
    @echo "TODO: implement fe-check"

# Auto-fix frontend lint and format issues
[group('Frontend')]
fe-fix:
    @echo "TODO: implement fe-fix"

# Run frontend tests
[group('Frontend')]
fe-test:
    @echo "TODO: implement fe-test"

# ─── CI ───

# Run local CI (mirrors remote CI pipeline)
ci-local: _check-agents-sync
    just be-check
    just be-test
    just be-build
    just fe-check
    just fe-test
    just fe-build

[private]
_check-agents-sync:
    @diff -q CLAUDE.md AGENTS.md >/dev/null || { echo "CLAUDE.md and AGENTS.md are out of sync. Run: cp CLAUDE.md AGENTS.md"; exit 1; }
