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
just setup       # Install dependencies
just ci-local    # Run local CI
just back-dev    # Start backend dev server
just back-check  # Backend lint + format check
just back-fix    # Backend auto-fix
just back-test   # Backend tests
just back-ci     # Backend CI (check → test → build)
just front-dev   # Start frontend dev server
just front-check # Frontend lint + format check
just front-fix   # Frontend auto-fix
just front-test  # Frontend tests
just front-ci    # Frontend CI (check → test → build)
```

## Conventions

- All development commands are defined in `justfile`.
- Shared code belongs in `packages/`, application code in `apps/`.
- TDD by default: write tests before implementation.
- No inline fallback values for missing config — fail early.
- Comments only for non-obvious "why", never for "what".
