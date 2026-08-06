# Engineering Compiler (engc)

Engineering Compiler is a Specification-Driven Development ecosystem for transforming an idea into governed, measurable, reviewable engineering artifacts and, eventually, verified implementations.

The source of truth starts with [`MASTER_PROMPT.md`](MASTER_PROMPT.md). The repository is bootstrapped incrementally and must preserve the immutable principles in that document.

## Repository maturity

**Current maturity:** Requirements Baseline / Milestone 1.

Facts:

- The repository now contains the immutable master prompt.
- Milestone 0 established governance and documentation structure.
- Milestone 1 defines a technology-neutral product vision, requirements baseline, and traceability matrix.
- No compiler, CLI, linter, DSL runtime, or project generator implementation exists yet.

Constraints:

- Requirements must precede architecture.
- Architecture must precede technology selection.
- Technology selection must precede implementation.

## Next milestone

Milestone 2 will define the architecture baseline for the accepted requirements before any technology selection or production implementation begins.

## Validation

Run:

```sh
make validate
```
