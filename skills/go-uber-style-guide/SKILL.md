---
name: go-uber-style-guide
description: Apply the Uber Go Style Guide when writing, reviewing, refactoring, or debugging Go code and tests. Use for Go API design, error handling, concurrency lifecycle, performance-sensitive paths, style consistency, and linting setup based strictly on the Uber guide.
---

# Go Uber Style Guide

## Overview

Apply Uber Go style rules as the single style authority for Go coding decisions in this skill.
Keep guidance concise, enforceable, and production-oriented.

## Source Rule

- Use only the Uber Go Style Guide as the reference for this skill.
- If repository-local rules conflict, follow repository-local rules and call out the difference.
- Do not mix in advice from other Go style guides while this skill is active.

## Detected Go Version

Run:

```bash
scripts/detect_go_version.sh
```

If the output is `unknown`, ask which Go version should be targeted.

## Workflow

1. Identify the task type.
2. Read only the relevant `references/*.md` file(s), not all at once.
3. Apply rules from those references while editing.
4. Run:

```bash
scripts/run_uber_checks.sh ./...
```

5. Report which Uber rules were applied and any deliberate tradeoffs.

## Reference Loading

| Task | Read file |
|---|---|
| Core semantics, interfaces, init/main lifecycle, goroutines | `references/guidelines-core.md` |
| Error creation, wrapping, naming, and handling once | `references/error-handling.md` |
| Hot-path performance conventions | `references/performance.md` |
| Naming, imports, struct/map/slice initialization, local style | `references/style.md` |
| Table tests, parallel tests, functional options | `references/patterns.md` |
| Linter baseline and runner strategy | `references/linting.md` |

Multiple topics may apply in one task.

## Output Expectations

- Return code that follows Uber guidance and keeps behavior clear.
- Prefer small, reviewable changes.
- State unresolved assumptions explicitly.

