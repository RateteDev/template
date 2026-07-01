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
just ci-local   # Run local CI
just be-dev     # Start backend dev server
just be-check   # Backend lint + format check
just be-fix     # Backend auto-fix
just be-test    # Backend tests
just fe-dev     # Start frontend dev server
just fe-check   # Frontend lint + format check
just fe-fix     # Frontend auto-fix
just fe-test    # Frontend tests
```

## Conventions

- All development commands are defined in `justfile`.
- Shared code belongs in `packages/`, application code in `apps/`.
- TDD by default: write tests before implementation.
- No inline fallback values for missing config — fail early.
- Comments only for non-obvious "why", never for "what".
