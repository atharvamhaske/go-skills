---
name: go-guidelines
description: Apply the Uber Go Style Guide section-by-section when writing, reviewing, refactoring, or debugging Go code. Use for interfaces, receivers, error handling, goroutine lifecycle, performance rules, style consistency, testing patterns, and linting.
---

# Go Guidelines (Uber-Based)

## Detected Go Version

Run this first:

```bash
scripts/detect_go_version.sh
```

If version is detected:
- Say: "This project is using Go X.XX. I will apply Uber Go style guidance compatible with this version."

If version is `unknown`:
- Say: "Could not detect Go version in this repository."
- Ask for a target Go version.

## Source Policy

- Use only Uber's Go Style Guide as the style source for this skill.
- If repository-local conventions conflict with Uber style, follow repository-local conventions and call out the conflict.

Primary source:
- https://github.com/uber-go/guide/blob/master/style.md

## How to Apply This Skill

1. Detect Go version.
2. Load only the reference file(s) relevant to the task.
3. Apply rules from those files directly in code changes.
4. Run checks:

```bash
scripts/run_uber_checks.sh ./...
```

5. Report which Uber sections were applied.

## Reference Routing

| When you are... | Read this reference |
|---|---|
| Understanding guide intent and non-goals | [references/01-introduction.md](references/01-introduction.md) |
| Applying guideline rules from the "Guidelines" section | [references/02-guidelines.md](references/02-guidelines.md) |
| Implementing error strategy details | [references/03-errors.md](references/03-errors.md) |
| Optimizing measured hot paths | [references/04-performance.md](references/04-performance.md) |
| Enforcing local style and initialization conventions | [references/05-style.md](references/05-style.md) |
| Writing tests with table/pattern conventions | [references/06-patterns.md](references/06-patterns.md) |
| Choosing linters and runner defaults | [references/07-linting.md](references/07-linting.md) |

Multiple references may apply.

