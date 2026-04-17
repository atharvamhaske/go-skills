# 03 Errors (Uber)

## Error Types Decision Matrix

Choose strategy by matching and message needs:

- No matching, static message: `errors.New`.
- No matching, dynamic message: `fmt.Errorf`.
- Matching, static message: package-level `Err...` variable.
- Matching, dynamic message: custom `...Error` type.

## Error Wrapping

- Return original error when no useful context exists.
- Use `%w` when callers should match/extract underlying cause.
- Use `%v` when underlying cause should remain hidden.
- Keep context concise; avoid repetitive "failed to" chains.

## Error Naming

- Exported sentinel errors: `ErrXxx`.
- Unexported sentinel errors: `errXxx`.
- Error types: `XxxError`.

## Handle Errors Once

- Do not log and return the same error by default.
- Do one of:
- wrap and return,
- log and degrade gracefully,
- match known errors and branch.

