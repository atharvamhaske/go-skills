# go-skills

Open-source maintained Go skill packs for AI agents.

Plug these skills into any harness/runtime that supports `SKILL.md`, `skills.md`, or `AGENTS.md`.

This repo currently includes one skill package:

- `skills/go-uber-style-guide`

## Purpose

Use these files to make AI agents follow consistent Go conventions for code generation, refactoring, and review.

## Included formats

- `SKILL.md` for skill-based runtimes
- `agents.md` for agents that read AGENTS-style instructions
- `skills.md` as a lowercase compatibility entrypoint

## Source policy

The `go-uber-style-guide` skill is intentionally based only on Uber's guide.
This repo is built on top of the Uber Go Style Guide:

- https://github.com/uber-go/guide/blob/master/style.md

## Contributing Custom Rules

Custom rule submissions are welcome.
If you have specific rules, new skills, or improvements, please open a Pull Request.
