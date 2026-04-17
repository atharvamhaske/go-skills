# Performance (Uber)

Apply this guidance mainly on measured hot paths.

## String/Number Conversion

- Prefer `strconv` over `fmt` for primitive string conversions.

## Byte Conversion

- Avoid repeatedly converting the same string to `[]byte` inside loops.
- Convert once and reuse the byte slice.

## Capacity Planning

- Provide map capacity hints with `make(map[K]V, hint)` when size is known.
- Provide slice capacity with `make([]T, 0, cap)` before repeated `append`.
- Use map literals when initializing a fixed set of key/value pairs.

