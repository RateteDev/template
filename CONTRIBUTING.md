# Contributing

## Getting Started

```sh
git clone {repo-url}
cd {project-name}
make setup
```

## Development Workflow

1. Create a branch from `main`.
2. Write tests first (TDD).
3. Implement the feature or fix.
4. Run `make lint && make test` to verify.
5. Commit with a concise message describing **why**, not what.

## Commit Messages

- Use imperative mood: "Add feature", not "Added feature".
- Keep the subject line under 72 characters.
- Reference related context in the body if needed.

## Project Structure

```
app/        — Application code
packages/   — Shared internal packages
```

## Code Style

- Follow the conventions documented in `CLAUDE.md`.
- No inline comments explaining "what" — only "why" when non-obvious.
- No inline fallback values for missing config.
- All commands go through `Makefile`.
