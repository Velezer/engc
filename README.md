# Engineering Compiler (engc)

Engineering Compiler is a Specification-Driven Development ecosystem for transforming an idea into governed, measurable, reviewable engineering artifacts and, eventually, verified implementations.

The source of truth starts with [`MASTER_PROMPT.md`](MASTER_PROMPT.md). The repository is bootstrapped incrementally and must preserve the immutable principles in that document.

## Repository maturity

**Current maturity:** Artifact Catalog and Specification-Family Requirements / Milestone 4.

Facts:

- The repository contains the immutable master prompt.
- Milestone 0 established governance and documentation structure.
- Milestone 1 defined a technology-neutral product vision, requirements baseline, and traceability matrix.
- Milestone 2 defines a technology-neutral architecture baseline and decision-record requirements.
- Milestone 3 defines technology-selection criteria and reusable artifact templates.
- Milestone 4 defines detailed artifact catalog requirements and specification-family requirements.
- No compiler, CLI, linter, DSL runtime, project generator implementation, or implementation technology stack exists yet.

Constraints:

- Requirements must precede architecture.
- Architecture must precede technology selection.
- Technology selection must precede implementation.

## Next milestone

Milestone 5 will define the first DSL specification baseline, including domain concepts, semantic model, examples, validation rules, and versioning policy before compiler specifications begin.

## Validation

Run:

```sh
make validate
```
