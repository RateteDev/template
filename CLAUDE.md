# Project: {project-name}

> {One-line description of the project.}

## Architecture

Monorepo structure:

- `app/` — Application entry point
- `packages/` — Shared libraries and internal packages

## Tech Stack

- Language: {language}
- Runtime: {runtime}
- Package Manager: {package-manager}

## Commands

All commands go through `make`. Run `make help` to list available targets.

```sh
make setup   # Install dependencies
make dev     # Start dev servers
make build   # Build everything
make test    # Run tests
make lint    # Lint
make fmt     # Format
```

## Conventions

- All development commands are defined in `Makefile`.
- Shared code belongs in `packages/`, application code in `app/`.
- TDD by default: write tests before implementation.
- No inline fallback values for missing config — fail early.
- Comments only for non-obvious "why", never for "what".
