# 05 Style (Uber Section-by-Section)

## Avoid overly long lines

- Keep code readable; treat ~99 chars as a soft line target.

## Be consistent

- Consistency across a package/repo is more important than personal preference.

## Group Similar Declarations

- Group related `import`, `const`, `var`, and `type` blocks.

## Import Group Ordering

- Use two groups: standard library, then everything else.

## Package Names

- Keep package names short, lowercase, singular, and specific.
- Avoid generic names like `util`, `common`, `shared`, `lib`.

## Function Names

- Use MixedCaps.
- Test function names may include underscores for grouping.

## Import Aliasing

- Alias only for name conflicts or mismatched package/import names.

## Function Grouping and Ordering

- Group by receiver.
- Keep rough call-order readability.
- Keep utility helpers toward file end.

## Reduce Nesting

- Handle edge/error paths early and return/continue.

## Unnecessary Else

- Remove `else` when assignment/return is clearer without it.

## Top-level Variable Declarations

- Use `var` at top-level.
- Omit explicit type when inferred type already matches desired type.

## Prefix Unexported Globals with `_`

- Prefix unexported top-level vars/consts with `_`.
- Exception: error names follow `errXxx`/`ErrXxx` guidance.

## Embedding in Structs

- Place embedded fields first and separated by a blank line.
- Embed only when it provides real semantic value.
- Never embed mutexes.

## Local Variable Declarations

- Prefer `:=` for explicit initialization.
- Use `var` when zero-value intent is clearer.

## nil is a valid slice

- Return `nil` for empty slices where possible.
- Check emptiness with `len(s) == 0`.

## Reduce Scope of Variables

- Narrow scope when it improves clarity and doesn’t increase nesting complexity.

## Avoid Naked Parameters

- Add parameter comments for ambiguous bool arguments, or replace bools with typed enums.

## Use Raw String Literals to Avoid Escaping

- Prefer raw strings for readability when escaping becomes noisy.

## Initializing Structs

### Use field names

- Use named fields for struct literals in almost all cases.

### Omit zero values unless meaningful

- Include zero-value fields only when they communicate intent.

### Use `var` for zero-value structs

- Prefer `var s T` when all fields are zero-valued.

### Initialize struct references with `&T{}`

- Prefer `&T{}` over `new(T)` for consistency.

## Initializing Maps

- Prefer `make` for programmatic map construction.
- Prefer literals for fixed map content.

## Format Strings Outside Printf

- Keep reusable format strings in `const` so vet can analyze.

## Naming Printf-style Functions

- Use standard printf-style names where possible.
- Custom printf-like functions should end with `f` (`Wrapf`).

