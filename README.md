# Go Guidelines for Code Agents

An open-source skill pack that teaches AI code agents to apply **Uber Go Style Guide** conventions.

Drop it into Cursor, Claude Code, or any custom harness and enforce section-by-section Go rules consistently.

## Motivation

Agents often produce Go code that is inconsistent or operationally risky:

1. **Style drift:** same codebase, different prompts, different conventions.
2. **Lifecycle mistakes:** uncontrolled goroutines, poor shutdown flow, misuse of `init()`.
3. **Weak error strategy:** mixed wrapping/matching rules and duplicated error handling.
4. **Performance misses:** no capacity hints, unnecessary conversion overhead in hot paths.
5. **No validation loop:** lint/vet/race checks skipped after changes.

This repo addresses these with a folder-wise Uber-based rule system.

## What the Agent Learns

| | |
|---|---|
| **Introduction** | How and why to apply style conventions as maintainability contracts |
| **Guidelines** | Interfaces, receivers, mutexes, boundaries, defer, channels, enums, time, init, exits, goroutine lifecycle |
| **Errors** | Error type strategy, `%w` wrapping, naming, handle-once principle |
| **Performance** | `strconv` over `fmt`, conversion reuse, map/slice capacity planning |
| **Style** | Import grouping, naming, declaration organization, initialization rules, scoping and readability |
| **Patterns** | Table tests, parallel subtest safety, functional options |
| **Linting** | Baseline linter set and `golangci-lint` runner guidance |
| **Post-Change** | `run_uber_checks.sh` for lint/vet + race test flow |

## File Structure

```text
go-skills/
├── .claude-plugin/
│   └── marketplace.json
├── claude/
│   └── go-guidelines/
│       ├── .claude-plugin/
│       │   └── plugin.json
│       └── skills/
│           └── go-guidelines/
│               ├── SKILL.md
│               ├── references/
│               │   ├── 01-introduction.md
│               │   ├── 02-guidelines.md
│               │   ├── 03-errors.md
│               │   ├── 04-performance.md
│               │   ├── 05-style.md
│               │   ├── 06-patterns.md
│               │   └── 07-linting.md
│               └── scripts/
│                   ├── detect_go_version.sh
│                   └── run_uber_checks.sh
├── AGENTS.md
├── skills.md
└── CONTRIBUTING.md
```

Only `SKILL.md` is the entrypoint. Reference files are loaded on-demand by topic.

## Installation

### Cursor

```bash
cp -r claude/go-guidelines/skills/go-guidelines <your-project>/.cursor/skills/go-guidelines
```

### Claude Code / Codex local skills

```bash
cp -r claude/go-guidelines/skills/go-guidelines "${CODEX_HOME:-$HOME/.codex}/skills/go-guidelines"
```

### Any custom harness

Use this as the canonical entrypoint:

- `claude/go-guidelines/skills/go-guidelines/SKILL.md`

## Source Attribution

Built on top of the Uber guide:

- https://github.com/uber-go/guide/blob/master/style.md

## Contributing

PRs are welcome. For custom rules and harness integrations, open a PR with focused changes.
