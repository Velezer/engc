# Engineering Compiler (engc)

Engineering Compiler is a Specification-Driven Development ecosystem for transforming an idea into governed, measurable, reviewable engineering artifacts and, eventually, verified implementations.

The source of truth starts with [`MASTER_PROMPT.md`](MASTER_PROMPT.md). The repository is bootstrapped incrementally and must preserve the immutable principles in that document.

## Repository maturity

**Current maturity:** Architecture Baseline / Milestone 2.

Facts:

- The repository contains the immutable master prompt.
- Milestone 0 established governance and documentation structure.
- Milestone 1 defined a technology-neutral product vision, requirements baseline, and traceability matrix.
- Milestone 2 defines a technology-neutral architecture baseline and decision-record requirements.
- No compiler, CLI, linter, DSL runtime, or project generator implementation exists yet.

Constraints:

- Requirements must precede architecture.
- Architecture must precede technology selection.
- Technology selection must precede implementation.

## Next milestone

Milestone 3 will define technology-selection criteria and artifact templates before detailed DSL, compiler, linter, reviewer, CLI, or generator specifications begin.

## Validation

Run:

```sh
make validate
```
