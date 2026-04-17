# 04 Performance (Uber)

Apply these mainly on measured hot paths.

## Prefer `strconv` over `fmt`

- Use `strconv` for primitive string conversion when performance matters.

## Avoid Repeated String-to-Byte Conversions

- Convert constant strings to `[]byte` once, then reuse.

## Prefer Specifying Container Capacity

### Map capacity hints

- Use `make(map[K]V, hint)` when approximate size is known.

### Slice capacity

- Use `make([]T, 0, cap)` before repeated append paths.

### Map literals for fixed sets

- Use map literals for known fixed key/value initialization.

