# Go Guidelines for Code Agents

An open-source maintained Go skill pack that teaches AI code agents how to write **production-grade Go**.

This repository is built on top of the **Uber Go Style Guide** and is designed to plug into any harness/runtime that supports `SKILL.md`, `skills.md`, or `AGENTS.md`.

## Motivation

Most coding agents still generate outdated or risky Go patterns in real projects. Common issues:

1. **Inconsistent style decisions.** Different prompts produce different naming, initialization, and error patterns.
2. **Weak operational safety.** Goroutine lifecycle, `init()` usage, and shutdown behavior are often mishandled.
3. **Low performance hygiene.** Agents skip capacity planning, overuse slower conversion patterns, or allocate unnecessarily in hot paths.
4. **No lifecycle guardrails.** Fire-and-forget goroutines and hidden mutable globals frequently slip in.
5. **Missing post-change validation.** Agents often skip lint and vet checks after code changes.

This skill pack fixes that by giving agents an explicit Uber-aligned reference workflow with focused rule files and reusable check scripts.

## What the Agent Learns

| | |
|---|---|
| **Core Guidelines** | Interfaces, receivers, mutex usage, slice/map boundaries, `init()` rules, goroutine lifecycle, process exit discipline |
| **Error Handling** | Error construction strategy, wrapping with `%w`, naming, and handle-once principles |
| **Performance** | `strconv` over `fmt` in hot paths, conversion reuse, map/slice capacity planning |
| **Style** | Import grouping, naming, initialization conventions, scope reduction, readability consistency |
| **Patterns** | Table-driven tests, parallel subtest safety, functional options for public APIs |
| **Linting** | Baseline linter set and `golangci-lint`-first workflow |
| **Post-Change** | Scripted checks via `scripts/run_uber_checks.sh` with `go vet` fallback flow |

## File Structure

```text
go-skills/
├── AGENTS.md
├── skills.md
├── CONTRIBUTING.md
└── skills/
    └── go-uber-style-guide/
        ├── SKILL.md
        ├── agents.md
        ├── skills.md
        ├── agents/
        │   └── openai.yaml
        ├── references/
        │   ├── guidelines-core.md
        │   ├── error-handling.md
        │   ├── performance.md
        │   ├── style.md
        │   ├── patterns.md
        │   └── linting.md
        └── scripts/
            ├── detect_go_version.sh
            └── run_uber_checks.sh
```

`SKILL.md` is the entrypoint, and references are loaded by topic so agents can stay context-efficient.

## Installation

### Cursor (project local)

```bash
cp -r skills/go-uber-style-guide <your-project>/.cursor/skills/go-uber-style-guide
```

### Codex / Claude Code style local skills

```bash
cp -r skills/go-uber-style-guide "${CODEX_HOME:-$HOME/.codex}/skills/go-uber-style-guide"
```

### Any custom harness

Load one of these files as the entrypoint based on your runtime:

- `skills/go-uber-style-guide/SKILL.md`
- `skills/go-uber-style-guide/skills.md`
- `skills/go-uber-style-guide/agents.md`

## Source Attribution

This repository is built on top of the Uber guide:

- https://github.com/uber-go/guide/blob/master/style.md

## Contributing

PRs are welcome.

If you have custom rules, harness-specific integrations, or new skill packs, open a Pull Request.

For updates to `go-uber-style-guide`, keep guidance aligned with the Uber Go Style Guide policy in `CONTRIBUTING.md`.
