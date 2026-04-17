# 02 Guidelines (Uber Section-by-Section)

## Pointers to Interfaces

- Avoid `*InterfaceType`; pass interfaces by value.
- Use pointers for underlying concrete data when mutation is needed.

## Verify Interface Compliance

- Add compile-time checks where contracts matter:
- `var _ Interface = (*Type)(nil)` (or zero value form for value receivers).

## Receivers and Interfaces

- Value receiver methods can be called on values and pointers.
- Pointer receiver methods require pointers/addressable values.
- Choose receiver type intentionally around mutation and interface satisfaction.

## Zero-value Mutexes are Valid

- Use `sync.Mutex`/`sync.RWMutex` as value fields, not pointer fields.
- Do not embed mutexes in structs.

## Copy Slices and Maps at Boundaries

- Copy incoming slices/maps before storing.
- Return copies to avoid exposing internal mutable state.

## Defer to Clean Up

- Prefer `defer` for unlock/close cleanup.
- Skip `defer` only in proven nanosecond-scale hot paths.

## Channel Size is One or None

- Default to unbuffered or buffer size 1.
- Larger buffers require explicit reasoning about load behavior and blocking.

## Start Enums at One

- Start enum `iota` at non-zero when zero should mean invalid/unset.
- Keep zero as default only when it is semantically desirable.

## Use `time` to Handle Time

- Use `time.Time` for instants.
- Use `time.Duration` for periods.
- Use `AddDate` for calendar intent, `Add` for exact-duration intent.
- Include units in field names when encoding durations as numeric values.

## Handle Type Assertion Failures

- Prefer comma-ok assertions:
- `v, ok := x.(T)` and handle `!ok`.

## Don't Panic

- Do not panic in production control flow.
- Return errors and let caller decide failure behavior.
- In tests, use `t.Fatal`/`t.FailNow` over panics.

## Use `go.uber.org/atomic`

- Prefer typed atomic wrappers to reduce raw `sync/atomic` misuse.

## Avoid Mutable Globals

- Avoid global mutable state/function pointers.
- Prefer dependency injection (struct fields/constructors).

## Avoid Embedding Types in Public Structs

- Avoid embedding that leaks implementation details and freezes API evolution.
- Prefer explicit composition and delegated methods.

## Avoid Using Built-In Names

- Do not shadow `error`, `string`, or other predeclared identifiers.
- Use unambiguous alternatives (`err`, `msg`, `str`, etc).

## Avoid `init()`

- Avoid `init()` where possible.
- If unavoidable, keep deterministic and side-effect-light.
- Avoid environment coupling, filesystem/network I/O, and hidden ordering dependencies.

## Exit in Main

- Call `os.Exit`/`log.Fatal` only in `main`.
- Return errors from lower layers.

## Exit Once

- Prefer single process-exit point in `main` (often via `run()` pattern).

## Use Field Tags in Marshaled Structs

- Add explicit tags (`json`, `yaml`, etc.) for serialized fields.
- Keep wire contract stable even when field names are refactored.

## Don't Fire-and-Forget Goroutines

- Every goroutine must have a bounded lifecycle or stop signal.
- Provide a wait path for completion.

## Wait for Goroutines to Exit

- Use `sync.WaitGroup` for multiple workers.
- Use `done chan struct{}` for single-worker lifecycle signaling.

## No Goroutines in `init()`

- Never spawn background workers in `init()`.
- Expose lifecycle-managed workers with `Stop/Shutdown/Close`.

