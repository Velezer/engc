# Roadmap

## Milestone 0: Foundation documentation

Status: complete.

Scope:

- Preserve the master prompt as the initial source of truth.
- Establish repository maturity and governance structure.
- Define the Engineering Constitution.
- Add a minimal validation command that keeps the repository checkable.

## Milestone 1: Product requirements baseline

Status: complete.

Scope:

- Define stakeholder-independent product vision.
- Define ecosystem requirements for constitution, handbook, standards, templates, checklists, playbooks, governance, decision framework, metrics, DSL, compiler, linter, reviewer, CLI, and generators.
- Define traceability identifiers before architecture.

## Milestone 2: Architecture baseline

Status: complete.

Scope:

- Define architecture drivers from accepted requirements.
- Define system boundaries without selecting implementation technology.
- Define initial quality attribute scenarios, including Green Computing.
- Define architecture decision record requirements.

## Milestone 3: Technology-selection criteria and artifact templates

Status: complete.

Scope:

- Define technology-selection criteria without selecting technologies prematurely.
- Define artifact templates that support required classifications and traceability.
- Define decision-record templates for technology and dependency proposals.

## Milestone 4: Artifact catalog and specification-family requirements

Status: complete.

Scope:

- Define detailed catalog requirements for handbook, standards, templates, checklists, playbooks, governance, and metrics.
- Define specification-family requirements for DSL, compiler, linter, reviewer, CLI, and project generators.
- Preserve technology neutrality until specific technology decisions are accepted.

## Milestone 5: DSL specification baseline

Status: complete.

Scope:

- Define DSL domain concepts, semantic model, examples, non-examples, validation rules, and versioning policy.
- Preserve technology neutrality and avoid compiler implementation details until compiler specifications are accepted.

## Milestone 6: Compiler pass specifications

Status: complete.

Scope:

- Define compiler inputs, outputs, stages, diagnostics, failure modes, conformance tests, and generated artifact contracts.
- Use the accepted DSL semantic model as input while preserving technology neutrality.

## Milestone 7: Linter rule specifications

Status: next.

Scope:

- Define linter rule families, severities, configuration boundaries, remediation guidance, and conformance tests.
- Use the accepted DSL and compiler pass baselines while preserving technology neutrality.

## Later milestones
- Reviewer specifications.
- Project generator specifications.
- Minimal implementation after specifications are accepted.
