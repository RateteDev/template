set shell := ["bash", "-euo", "pipefail", "-c"]

# ─── Setup & Clean ───

# Install dependencies and configure local environment (run once after clone)
[group('Setup & Clean')]
setup:
    git config core.hooksPath .githooks
    git config core.quotepath false
    @echo "TODO: implement setup"

# Remove build artifacts and caches
[group('Setup & Clean')]
clean:
    @echo "TODO: implement clean"

# ─── Backend ───

# Start backend development server
[group('Backend')]
back-dev:
    @echo "TODO: implement back-dev"

# Build backend
[group('Backend')]
back-build:
    @echo "TODO: implement back-build"

# Run backend lint and format checks without modifying files
[group('Backend')]
back-check:
    @echo "TODO: implement back-check"

# Auto-fix backend lint and format issues
[group('Backend')]
back-fix:
    @echo "TODO: implement back-fix"

# Run backend tests
[group('Backend')]
back-test:
    @echo "TODO: implement back-test"

# Run backend CI (check → test → build)
[group('Backend')]
back-ci:
    just back-check
    just back-test
    just back-build

# ─── Frontend ───

# Start frontend development server
[group('Frontend')]
front-dev:
    @echo "TODO: implement front-dev"

# Build frontend
[group('Frontend')]
front-build:
    @echo "TODO: implement front-build"

# Run frontend lint and format checks without modifying files
[group('Frontend')]
front-check:
    @echo "TODO: implement front-check"

# Auto-fix frontend lint and format issues
[group('Frontend')]
front-fix:
    @echo "TODO: implement front-fix"

# Run frontend tests
[group('Frontend')]
front-test:
    @echo "TODO: implement front-test"

# Run frontend CI (check → test → build)
[group('Frontend')]
front-ci:
    just front-check
    just front-test
    just front-build

# ─── CI ───

# Run local CI (mirrors remote CI pipeline)
ci-local:
    just _check-agents-sync
    just back-ci & just front-ci & wait

[private]
_check-agents-sync:
    @diff -q CLAUDE.md AGENTS.md >/dev/null || { echo "CLAUDE.md and AGENTS.md are out of sync. Run: cp CLAUDE.md AGENTS.md"; exit 1; }

# ─── Claude Code ───

[private]
_session-start:
    @echo '=== just --list ==='
    @echo '$ just --list'
    @just --list
    @echo ''
    @echo '=== docs ==='
    @echo '$ find docs -type f'
    @find docs -type f | sort | awk -F/ '{d=$0; sub(/[^/]+$/,"",d); if (d!=p) {print d; p=d}; f=$0; sub(/^.*\//,"",f); print "  " f}'
