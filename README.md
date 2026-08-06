# Engineering Compiler (engc)

Engineering Compiler is a Specification-Driven Development ecosystem for transforming an idea into governed, measurable, reviewable engineering artifacts and, eventually, verified implementations.

The source of truth starts with [`MASTER_PROMPT.md`](MASTER_PROMPT.md). The repository is bootstrapped incrementally and must preserve the immutable principles in that document.

## Repository maturity

**Current maturity:** Foundation / Milestone 0.

Facts:

- The repository now contains the immutable master prompt.
- The first milestone establishes governance and documentation structure only.
- No compiler, CLI, linter, DSL runtime, or project generator implementation exists yet.

Constraints:

- Requirements must precede architecture.
- Architecture must precede technology selection.
- Technology selection must precede implementation.

## Next milestone

Milestone 1 will define the minimum product requirements for the Engineering Compiler ecosystem before any production implementation begins.

## Validation

Run:

```sh
make validate
```
