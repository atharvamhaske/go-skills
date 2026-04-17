# 06 Patterns (Uber)

## Test Tables

- Prefer table-driven tests for repetitive input/output behavior.
- Use `tests` for table name and `tt` for case variable.
- Prefer `give`/`want` naming.

## Avoid Unnecessary Complexity in Table Tests

- Avoid branching-heavy table rows with conditional mock wiring.
- Split complex cases into focused tests or separate tables.

## Parallel Tests

- Rebind loop variable in subtests when using `t.Parallel()`.

## Functional Options

- Use for constructors/public APIs with optional arguments and future growth.
- Prefer options struct + option application pattern over positional booleans.

