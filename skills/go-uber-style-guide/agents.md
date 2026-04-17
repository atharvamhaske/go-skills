# go-uber-style-guide

Use this instruction set when working on Go code.

## Rules

- Treat Uber's Go Style Guide as the primary style source.
- Avoid mixing additional style authorities while applying this pack.
- When project conventions conflict, follow project conventions and mention the delta.

## Operating Steps

1. Detect the Go version with `scripts/detect_go_version.sh`.
2. Read only the needed file(s) from `references/`.
3. Apply the selected rules while implementing changes.
4. Run `scripts/run_uber_checks.sh <package-pattern>` before finalizing.

## Reference Map

- Core: `references/guidelines-core.md`
- Errors: `references/error-handling.md`
- Performance: `references/performance.md`
- Style: `references/style.md`
- Patterns: `references/patterns.md`
- Linting: `references/linting.md`

