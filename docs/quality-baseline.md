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
| `make qa` | Runs the local quality entrypoint | Smoke checks, frontend build and diff check pass | Added in lesson 00-02 |
| `make lint-style` | Checks PHP code style through Laravel Pint | Pint reports no formatting changes needed | Added in lesson 02-01 |
| `make format` | Applies Laravel Pint formatting | PHP files are formatted | Added in lesson 02-01 |
| `make analyse` | Runs PHPStan/Larastan static analysis | Static analysis passes at the configured level | Added in lesson 02-02 |
| `make rector-dry` | Previews Rector automated refactoring | Rector shows an empty or reviewable diff | Added in lesson 02-03 |
| `make rector` | Applies Rector automated refactoring | Only reviewed mechanical changes are applied | Added in lesson 02-03 |
| `make deploy-smoke` | Runs cheap runtime smoke checks | Runtime endpoints respond | Optional runtime check |

## Existing Safety Net

- Laravel feature tests cover product publication through the HTTP adapter.
- Unit tests cover the product publication application service and domain rules.
- Runtime tests cover local diagnostic endpoints from the Octane course.
- `composer validate --strict` is part of the existing `make check`.
- `git diff --check` is available through `make qa`.
- Frontend build exists through `npm run build` and `make build`.
- `make qa` now combines the existing backend checks, frontend build and whitespace diff check.
- Laravel Pint is now the explicit formatter for PHP code style.
- PHPStan/Larastan is now configured at a starter level so the project can grow strictness deliberately.
- Rector is now configured for controlled automated refactoring through dry-run and apply targets.

## Known Gaps Before This Course

- `make qa` is intentionally small at the start of the course and will grow as the project gains quality gates.
- Formatting is now explicit through `make format` and `make lint-style`.
- Static analysis is configured at a starter level and should become stricter over time.
- Rector is configured, but each diff still requires human review before commit.
- Coverage reporting is not part of the workflow yet.
- Parallel tests are not documented as a normal feedback loop yet.
- CI workflow is not present in this repository yet.
- Pre-commit checks are not documented yet.
- Structured logging rules are not documented yet.
- Health/readiness checks are not part of the quality workflow yet.
- Architecture guards are not configured yet.

## Baseline Decision

The project starts this course from a working runtime-focused state. The next changes should not hide behind new tools. Each added check must explain which risk it closes, how it is run locally, and whether CI repeats it.
