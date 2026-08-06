# Engineering Compiler (engc)

Engineering Compiler is a Specification-Driven Development ecosystem for transforming an idea into governed, measurable, reviewable engineering artifacts and, eventually, verified implementations.

The source of truth starts with [`MASTER_PROMPT.md`](MASTER_PROMPT.md). The repository is bootstrapped incrementally and must preserve the immutable principles in that document.

## Repository maturity

**Current maturity:** CLI Specification Baseline / Milestone 9.

Facts:

- The repository contains the immutable master prompt.
- Milestone 0 established governance and documentation structure.
- Milestone 1 defined a technology-neutral product vision, requirements baseline, and traceability matrix.
- Milestone 2 defines a technology-neutral architecture baseline and decision-record requirements.
- Milestone 3 defines technology-selection criteria and reusable artifact templates.
- Milestone 4 defines detailed artifact catalog requirements and specification-family requirements.
- Milestone 5 defines the first technology-neutral DSL specification baseline.
- Milestone 6 defines technology-neutral compiler pass specifications, generated artifact contracts, diagnostics, failure modes, and conformance-test expectations.
- Milestone 7 defines technology-neutral linter rule specifications, severities, configuration boundaries, remediation guidance, and conformance-test expectations.
- Milestone 8 defines technology-neutral reviewer specifications, criteria evaluation, governance evidence, acceptance recommendations, and conformance-test expectations.
- Milestone 9 defines technology-neutral CLI specifications, command behavior, invocation boundaries, input and output contracts, exit semantics, and conformance-test expectations.
- No compiler, CLI, linter, reviewer, DSL runtime, project generator implementation, or implementation technology stack exists yet.

Constraints:

- Requirements must precede architecture.
- Architecture must precede technology selection.
- Technology selection must precede implementation.

## Next milestone

The next milestone will define project generator specifications using the accepted DSL, compiler pass, linter rule, reviewer, and CLI baselines while continuing to avoid implementation technology choices.

## Validation

Run:

```sh
make validate
```
