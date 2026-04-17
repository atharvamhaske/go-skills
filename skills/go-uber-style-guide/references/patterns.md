# Patterns (Uber)

## Table-Driven Tests

- Use table tests for repetitive logic over multiple input/output cases.
- Prefer naming conventions like `tests` and `tt`.
- Prefer descriptive fields such as `give` and `want`.

## Keep Table Tests Simple

- Avoid complex branching and per-row behavioral wiring inside one table loop.
- Split complex scenarios into multiple tests or multiple focused tables.
- Keep each test case shallow and easy to debug.

## Parallel Subtests

- In loops with `t.Parallel()`, rebind the loop variable for each iteration scope.

## Functional Options

Use functional options for public constructors/APIs with many optional arguments.

- Prefer an opaque `Option` interface over positional booleans/config args.
- Record option state into an internal `options` struct.
- Favor option types over closure-based options when comparison/testability matters.

