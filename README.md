# Engineering Compiler (engc)

Engineering Compiler is a Specification-Driven Development ecosystem for transforming an idea into governed, measurable, reviewable engineering artifacts and, eventually, verified implementations.

The source of truth starts with [`MASTER_PROMPT.md`](MASTER_PROMPT.md). The repository is bootstrapped incrementally and must preserve the immutable principles in that document.

## Repository maturity

**Current maturity:** Compiler Pass Specification Baseline / Milestone 6.

Facts:

- The repository contains the immutable master prompt.
- Milestone 0 established governance and documentation structure.
- Milestone 1 defined a technology-neutral product vision, requirements baseline, and traceability matrix.
- Milestone 2 defines a technology-neutral architecture baseline and decision-record requirements.
- Milestone 3 defines technology-selection criteria and reusable artifact templates.
- Milestone 4 defines detailed artifact catalog requirements and specification-family requirements.
- Milestone 5 defines the first technology-neutral DSL specification baseline.
- Milestone 6 defines technology-neutral compiler pass specifications, generated artifact contracts, diagnostics, failure modes, and conformance-test expectations.
- No compiler, CLI, linter, DSL runtime, project generator implementation, or implementation technology stack exists yet.

Constraints:

- Requirements must precede architecture.
- Architecture must precede technology selection.
- Technology selection must precede implementation.

## Next milestone

The next milestone will define linter rule specifications using the accepted DSL and compiler pass baselines while continuing to avoid implementation technology choices.

## Validation

Run:

```sh
make validate
```
