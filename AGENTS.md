# go-skills

Repository-level AGENTS entrypoint.

## Canonical Go Skill

- Name: `go-guidelines`
- Entry file: `claude/go-guidelines/skills/go-guidelines/SKILL.md`

## Execution Guidance

1. Detect Go version via `scripts/detect_go_version.sh`.
2. Load only relevant references for the current task.
3. Apply Uber section rules directly.
4. Run `scripts/run_uber_checks.sh <package-pattern>`.

## Source

- Uber Go Style Guide: https://github.com/uber-go/guide/blob/master/style.md
