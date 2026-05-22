# Quality Commands

## Local Entrypoints

The project uses Make targets to keep repeated quality actions visible and repeatable.

```bash
make help
make check
make qa
```

`make check` is the basic smoke check. It verifies tool versions, validates Composer metadata and runs the Laravel test suite.

`make qa` is the quality entrypoint. At this stage it runs `make check`, builds frontend assets and checks the Git diff for whitespace errors. It is intentionally simple now. Later lessons add formatter, static analysis, Rector, coverage and other checks to this same entrypoint.

## Current Contract

```text
make check -> basic local confidence
make qa    -> readiness check before commit or review
```

The important habit is not the exact list of commands on the first day. The important habit is that the project has one named quality command that can grow without forcing every developer to memorize a long sequence.
