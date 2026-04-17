# Style (Uber)

## Readability and Consistency

- Target readable line lengths (soft limit around 99 chars).
- Be consistent across a package instead of mixing styles.

## Declarations and Imports

- Group related declarations (`import`, `const`, `var`, `type`).
- Keep two import groups: standard library, then everything else.
- Prefer short, lowercase package names; avoid generic names like `util`.
- Use import aliases only for path/name mismatch or direct conflicts.

## Function and File Organization

- Use MixedCaps for function names.
- Group functions by receiver and rough call order.
- Place constructors near the type; utility functions near file end.

## Control Flow and Scope

- Reduce nesting with early returns/continues.
- Remove unnecessary `else` blocks where direct assignment is clearer.
- Limit variable scope when it improves clarity.

## Globals and Embedding

- Top-level vars: use `var` without repeating obvious types.
- Prefix unexported top-level vars/consts with `_` (except `err...` errors).
- Place embedded fields first and separate from normal fields.
- Avoid embedding when it changes API semantics or harms zero-value usability.

## Locals, Slices, and Initialization

- Prefer `:=` for explicit local initialization.
- Use `var` for zero-value slices/structs when that intent is clearer.
- Treat `nil` as a valid empty slice and check emptiness with `len(s) == 0`.
- Initialize structs with field names in most cases.
- Omit zero-value struct fields unless they add context.
- Prefer `&T{}` over `new(T)` for struct pointers.
- Prefer `make` for programmatic map creation; literals for fixed map contents.

## Formatting Helpers

- Keep reusable printf format strings as `const` so vet can analyze them.
- Name printf-like helpers with `...f` suffix when custom naming is required.

