# Milestone 9 Review: CLI Specifications

## Status

Accepted.

## Scope reviewed

Milestone 9 defines the technology-neutral CLI specification baseline. The review covered command behavior, invocation boundaries, input and output contracts, exit semantics, compiler/linter/reviewer orchestration, failure modes, determinism, compatibility, and conformance-test expectations.

## Evidence

- CLI specification baseline: `docs/specifications/cli-specification.md`.
- Accepted DSL specification baseline: `docs/specifications/dsl-specification-baseline.md`.
- Accepted compiler pass specification baseline: `docs/specifications/compiler-pass-specification.md`.
- Accepted linter rule specification baseline: `docs/specifications/linter-rule-specification.md`.
- Accepted reviewer specification baseline: `docs/specifications/reviewer-specification.md`.
- Requirements traceability matrix: `docs/traceability/requirements-traceability.md`.
- Roadmap: `docs/roadmap/ROADMAP.md`.

## Findings

| Finding ID | Severity | Finding | Disposition |
| --- | --- | --- | --- |
| M9-F001 | Advisory | Concrete command names and numeric exit codes remain intentionally unspecified. | Accepted because this milestone defines semantic CLI behavior before implementation technology selection. |
| M9-F002 | Advisory | Project generator invocation boundaries are referenced but generator behavior is not yet defined. | Accepted as future milestone scope. |
| M9-F003 | Risk | CLI defaults could hide skipped evidence or implicit environment effects in a future implementation. | Mitigated by explicit output contracts, configuration requirements, manifests, and conformance tests. |

## Decision

Milestone 9 is accepted. The repository now has a CLI specification baseline that can guide future implementation proposals without selecting a technology stack.

## Follow-up

- Define project generator specifications in a later milestone.
- Continue to preserve technology neutrality until implementation-specific decisions are proposed and accepted.
- Require future CLI implementations to satisfy the conformance tests before acceptance.
