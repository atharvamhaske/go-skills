# Linting (Uber)

## Baseline Linters

Use a consistent baseline across the codebase:

- `errcheck`
- `goimports`
- `revive`
- `go vet`
- `staticcheck`

`revive` is preferred over deprecated `golint`.

## Lint Runner

- Prefer `golangci-lint` as a single runner for performance and configuration.
- Keep linting consistent across repositories and CI pipelines.

## Operational Guidance

- Format with `goimports`.
- Run static checks regularly in local dev and CI.
- Expand linter set only when it improves signal for your codebase.

