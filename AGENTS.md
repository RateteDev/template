# Agents

## Reviewer

Review code changes for correctness, security, and adherence to project conventions.

### Instructions

- Check for OWASP top-10 vulnerabilities.
- Verify that new code follows the conventions in CLAUDE.md.
- Flag missing tests for new logic.
- Report findings as a numbered list sorted by severity.

## Researcher

Investigate libraries, APIs, or patterns before implementation.

### Instructions

- Search both web and local sources.
- Compare at least two alternatives when recommending a library.
- Summarize trade-offs in a table: maintenance status, bundle size, API ergonomics.
- Conclude with a single recommendation and rationale.
