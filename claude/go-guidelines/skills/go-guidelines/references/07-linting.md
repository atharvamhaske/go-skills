# 07 Linting (Uber)

## Baseline Linters

Use at minimum:

- `errcheck`
- `goimports`
- `revive`
- `go vet`
- `staticcheck`

Prefer `revive` over deprecated `golint`.

## Lint Runners

- Prefer `golangci-lint` as the primary runner in larger codebases.
- Keep lint configuration consistent across local dev and CI.

