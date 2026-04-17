# Go Guidelines for Code Agents

An open-source skill pack that teaches AI code agents to apply **Uber Go Style Guide** conventions and **Go Best Practices (mhmtszr)**.

Drop it into Cursor, Claude Code, or any custom harness and enforce section-by-section Go rules consistently.

## Motivation

Agents often produce Go code that is inconsistent or operationally risky:

1. **Style drift:** same codebase, different prompts, different conventions.
2. **Lifecycle mistakes:** uncontrolled goroutines, poor shutdown flow, misuse of `init()`.
3. **Weak error strategy:** mixed wrapping/matching rules and duplicated error handling.
4. **Performance misses:** no capacity hints, unnecessary conversion overhead in hot paths.
5. **No validation loop:** lint/vet/race checks skipped after changes.

This repo addresses these with a folder-wise rule system covering both Uber's style and broader modern Go best practices.

## Included Skills

### 1. `go-uber-style-guide`

Built on top of the canonical [Uber Go Style Guide](https://github.com/uber-go/guide/blob/master/style.md).

| | |
|---|---|
| **Introduction** | How and why to apply style conventions as maintainability contracts |
| **Guidelines** | Interfaces, receivers, mutexes, boundaries, defer, channels, enums, time, init, exits, goroutine lifecycle |
| **Errors** | Error type strategy, `%w` wrapping, naming, handle-once principle |
| **Performance** | `strconv` over `fmt`, conversion reuse, map/slice capacity planning |
| **Style** | Import grouping, naming, declaration organization, initialization rules, scoping and readability |
| **Patterns** | Table tests, parallel subtest safety, functional options |
| **Linting** | Baseline linter set and `golangci-lint` runner guidance |

### 2. `mhmtszr-go-guidelines`

Built on top of [mhmtszr's Go Guidelines](https://github.com/mhmtszr/go-guidelines).

| | |
|---|---|
| **Modern Syntax** | Version-specific Go syntax and idioms |
| **Performance** | Struct layout, escape analysis, and optimization |
| **Concurrency** | Goroutines, channels, sync, select, avoiding false sharing |
| **Patterns** | HTTP servers, graceful shutdown, middleware, interfaces |
| **Testing** | Mocks, benchmarks, fuzz tests |
| **Error Handling** | Wrapping, custom error types, proper logging |
| **Slices & Maps** | Memory leaks, capacity, append behavior |
| **Context** | Values, cancellation, timeouts |
| **Generics** | Type parameters, constraints |
| **Pitfalls** | Nil traps, shadowing, sync copying, defer, time bugs |

## File Structure

```text
go-skills/
├── skills/
│   ├── go-uber-style-guide/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── 01-introduction.md
│   │   │   ├── 02-guidelines.md
│   │   │   ├── 03-errors.md
│   │   │   ├── 04-performance.md
│   │   │   ├── 05-style.md
│   │   │   ├── 06-patterns.md
│   │   │   └── 07-linting.md
│   │   └── scripts/
│   │       ├── detect_go_version.sh
│   │       └── run_uber_checks.sh
│   └── mhmtszr-go-guidelines/
│       ├── SKILL.md
│       ├── references/
│       │   ├── concurrency.md
│       │   ├── context-patterns.md
│       │   ├── error-handling.md
│       │   ├── generics.md
│       │   ├── modern-syntax.md
│       │   ├── patterns.md
│       │   ├── performance.md
│       │   ├── pitfalls.md
│       │   ├── slices-and-maps.md
│       │   └── testing.md
│       └── scripts/
│           ├── detect_go_version.sh
│           └── run_checks.sh
├── AGENTS.md
├── skills.md
└── CONTRIBUTING.md
```

Only `SKILL.md` is the entrypoint for each skill. Reference files are loaded on-demand by topic to reduce context clutter.

## Installation

### Cursor

To install the Uber style guide:
```bash
cp -r skills/go-uber-style-guide <your-project>/.cursor/skills/go-uber-style-guide
```

To install the mhmtszr guidelines:
```bash
cp -r skills/mhmtszr-go-guidelines <your-project>/.cursor/skills/mhmtszr-go-guidelines
```

### Codex / Claude Code local skills

```bash
cp -r skills/* "${CODEX_HOME:-$HOME/.codex}/skills/"
```

### Any custom harness

Use these as the canonical entrypoints:
- `skills/go-uber-style-guide/SKILL.md`
- `skills/mhmtszr-go-guidelines/SKILL.md`

## Contributing

PRs are welcome. For custom rules and harness integrations, open a PR with focused changes.
