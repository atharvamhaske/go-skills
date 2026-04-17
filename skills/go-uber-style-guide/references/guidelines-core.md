# Core Guidelines (Uber)

## Interfaces and Receivers

- Avoid pointers to interfaces; pass interfaces by value.
- Add compile-time interface checks where interface compliance is part of the contract.
- Choose receivers deliberately: pointer receivers for mutation, value receivers when copies are fine.

## Mutexes and Shared State

- Use zero-value `sync.Mutex` and `sync.RWMutex`; avoid pointer mutex fields.
- Prefer named mutex fields (for example `mu sync.Mutex`) instead of embedding mutex types.

## Slices and Maps at Boundaries

- Copy incoming slices/maps when storing them internally.
- Return copies of internal slices/maps to avoid exposing mutable internal state.

## Cleanup and Control Flow

- Prefer `defer` for cleanup of locks/files/resources unless proven hot enough to justify otherwise.
- Prefer channel sizes of zero or one unless a larger buffer has a clear, measured rationale.
- Start enums at non-zero by default when zero means "unset/invalid".

## Time Handling

- Use `time.Time` for instants.
- Use `time.Duration` for elapsed intervals and delays.
- Use `AddDate` for calendar intent and `Add` for exact duration intent.

## Safety and Reliability

- Use comma-ok type assertions to avoid assertion panics.
- Avoid panics in production paths; return errors and let callers decide.
- Prefer `go.uber.org/atomic` wrappers for atomic state.

## Globals, Embedding, and Initialization

- Avoid mutable globals; use dependency injection.
- Avoid embedding types in public structs when it leaks implementation details.
- Avoid names that shadow Go built-ins.
- Avoid `init()` unless deterministic and clearly justified.

## Process Lifecycle

- Keep process exits (`os.Exit`, `log.Fatal`) in `main` only.
- Prefer a single exit point in `main` and move work into `run()`-style helpers.
- Add field tags for marshaled structs (`json`, `yaml`, etc.) to keep serialization contracts explicit.

## Goroutine Lifecycle

- Do not fire-and-forget goroutines.
- Provide explicit stop signals and waiting mechanisms (`WaitGroup` or done channel).
- Do not start background goroutines from `init()`.

