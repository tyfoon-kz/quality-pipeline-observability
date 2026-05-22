# Quality Baseline

## Project Point

- Course stage: quality pipeline baseline.
- Source project state: finished Laravel/Filament catalog after Octane and FrankenPHP runtime work.
- Main goal: record what the project can already check before adding new quality gates.

## Local Commands

| Command | Purpose | Expected Result | Current Status |
| --- | --- | --- | --- |
| `make help` | Shows available project commands | Command list is printed | Pending local run |
| `make check` | Runs smoke checks and tests | PHP, Composer, validation and tests pass | Pending local run |
| `make test` | Runs Laravel test suite | Test suite passes | Pending local run |
| `make build` | Builds frontend assets | Vite build succeeds | Pending local run |
| `make deploy-smoke` | Runs cheap runtime smoke checks | Runtime endpoints respond | Optional runtime check |

## Existing Safety Net

- Laravel feature tests cover product publication through the HTTP adapter.
- Unit tests cover the product publication application service and domain rules.
- Runtime tests cover local diagnostic endpoints from the Octane course.
- `composer validate --strict` is part of the existing `make check`.
- `git diff --check` is available through `make qa` from the imported runtime project.
- Frontend build exists through `npm run build` and `make build`.

## Known Gaps Before This Course

- `make qa` is still too small for a final quality gate.
- Formatting is available through the Pint package, but the workflow is not explicit in Make.
- Static analysis is not configured yet.
- Rector is not configured yet.
- Coverage reporting is not part of the workflow yet.
- Parallel tests are not documented as a normal feedback loop yet.
- CI workflow is not present in this repository yet.
- Pre-commit checks are not documented yet.
- Structured logging rules are not documented yet.
- Health/readiness checks are not part of the quality workflow yet.
- Architecture guards are not configured yet.

## Baseline Decision

The project starts this course from a working runtime-focused state. The next changes should not hide behind new tools. Each added check must explain which risk it closes, how it is run locally, and whether CI repeats it.
