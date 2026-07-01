# Project: {project-name}

> {One-line description of the project.}

## Architecture

Monorepo structure:

- `apps/` — Application entry points
- `packages/` — Shared libraries and internal packages

## Tech Stack

- Language: {language}
- Runtime: {runtime}
- Package Manager: {package-manager}

## Commands

All commands go through `just`. Run `just --list` to list available recipes.

```sh
just setup      # Install dependencies
just dev        # Start dev servers
just build      # Build everything
just test       # Run tests
just lint       # Lint
just format     # Format
just ci-local   # Run local CI
```

## Conventions

- All development commands are defined in `justfile`.
- Shared code belongs in `packages/`, application code in `apps/`.
- TDD by default: write tests before implementation.
- No inline fallback values for missing config — fail early.
- Comments only for non-obvious "why", never for "what".
