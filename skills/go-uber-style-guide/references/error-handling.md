# Error Handling (Uber)

## Error Construction

Pick error strategy by matching needs:

- No matching + static message: `errors.New`.
- No matching + dynamic message: `fmt.Errorf`.
- Matching + static message: exported or internal `Err...` variable.
- Matching + dynamic message: custom `...Error` type.

## Wrapping

- Return original error directly when extra context adds no value.
- Use `fmt.Errorf("context: %w", err)` when callers should match the wrapped cause.
- Use `%v` if you intentionally avoid exposing underlying causes.
- Keep context concise and avoid repetitive "failed to" chains.

## Naming

- Error variables: `ErrXxx` (exported) and `errXxx` (unexported).
- Custom error types: `XxxError`.

## Handle Errors Once

- Do not log and then return the same error path by default.
- Either:
  - wrap and return, or
  - log and degrade gracefully, or
  - match known errors and branch.

