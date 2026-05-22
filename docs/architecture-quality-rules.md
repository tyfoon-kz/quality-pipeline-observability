# Architecture Quality Rules

## Rule 1: Presentation Does Not Reach Into Catalog Infrastructure

Controllers and Filament resources should talk to application services, requests, resources and framework adapters.

They should not directly depend on `App\Catalog\Infrastructure`.

Why: direct infrastructure usage from presentation code hides business flow wiring and makes DDD-lite boundaries easier to bypass.

How it is checked:

```bash
make test-architecture
```

## Current Scope

The first architecture guard is intentionally small. It protects one visible risk instead of pretending that the whole architecture can be proven automatically.
