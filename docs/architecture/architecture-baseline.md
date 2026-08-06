# Architecture Baseline

## Status

Accepted baseline for Milestone 2.

## Purpose

This artifact defines the initial technology-neutral architecture for the Engineering Compiler ecosystem. It establishes boundaries, drivers, quality attributes, and decision-record expectations before technology selection or implementation.

## Facts

- Requirements are accepted in `docs/requirements/requirements-baseline.md`.
- No implementation technology stack has been accepted.
- No DSL grammar, compiler pass design, linter rule design, reviewer behavior, CLI command surface, or project generator implementation has been accepted.

## Requirements addressed

- `ENGC-FND-002`: Preserve the required engineering order.
- `ENGC-ART-009`: Specify DSL, compiler, linter, reviewer, CLI, and generators before implementation.
- `ENGC-GRN-001`: Evaluate resource and operational cost in significant decisions.
- `ENGC-GRN-002`: Justify dependencies before adoption.
- `ENGC-GRN-003`: Prefer eliminating unnecessary work.
- `ENGC-TRC-002`: Link architecture artifacts to requirement IDs.
- `ENGC-TRC-003`: Distinguish facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs.

## Architecture drivers

| Driver ID | Requirement IDs | Driver | Architectural impact |
| --- | --- | --- | --- |
| ARCH-DRV-001 | `ENGC-FND-002`, `ENGC-ART-009` | Governance must prevent implementation before architecture, specification, and technology-selection artifacts are accepted. | System boundaries must separate accepted artifacts from generated or implemented artifacts. |
| ARCH-DRV-002 | `ENGC-TRC-001`, `ENGC-TRC-002` | Every downstream artifact must be traceable to stable requirement IDs. | Core model must represent identifiers, relationships, and verification links explicitly. |
| ARCH-DRV-003 | `ENGC-TRC-003` | Non-trivial artifacts must classify facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs. | Artifact schemas must support required sections and validation rules. |
| ARCH-DRV-004 | `ENGC-GRN-001`, `ENGC-GRN-002`, `ENGC-GRN-003` | Resource use, dependency count, and operational complexity must be reviewed as first-class concerns. | Decision records and future automation must expose measurable cost and unnecessary-work checks. |
| ARCH-DRV-005 | `ENGC-AUT-001` through `ENGC-AUT-005` | Future automation must be deterministic, reviewable, and minimal. | Automation components must use explicit inputs and produce reproducible outputs. |

## System context

The Engineering Compiler ecosystem is a governance and automation system that transforms accepted engineering artifacts into reviewable downstream artifacts. Humans remain the authority for accepting requirements, architecture, specifications, and decisions. Future automation assists by validating structure, generating deterministic outputs, and reporting findings tied to requirement IDs.

## System boundaries

### In scope for the architecture

- Canonical artifact model for governed engineering documents.
- Traceability model that links requirements to architecture, specifications, plans, tests, reviews, and generated outputs.
- Validation model for constitution, required sections, identifiers, and stage ordering.
- Decision model for technology and dependency choices.
- Future automation boundaries for DSL, compiler, linter, reviewer, CLI, and project generators.

### Out of scope for the architecture baseline

- Programming language, framework, package manager, database, or deployment platform selection.
- DSL grammar syntax.
- Compiler pass algorithms.
- CLI command names and flags.
- Runtime implementation source code.

## Logical components

| Component | Responsibility | Key inputs | Key outputs | Requirement links |
| --- | --- | --- | --- | --- |
| Artifact Repository | Stores accepted source-of-truth artifacts and generated artifacts with review history. | Master prompt, constitution, requirements, architecture, specifications, reviews. | Versioned artifact set. | `ENGC-FND-001`, `ENGC-FND-003`, `ENGC-FND-004` |
| Artifact Model | Defines common sections, identifiers, classifications, and metadata for non-trivial artifacts. | Artifact schemas and templates. | Structured artifact representation. | `ENGC-TRC-001`, `ENGC-TRC-003` |
| Traceability Model | Maintains requirement-to-artifact and artifact-to-verification relationships. | Requirement IDs, architecture links, specification links, review links. | Traceability matrix and coverage reports. | `ENGC-TRC-002` |
| Governance Model | Defines stage gates, review expectations, decision records, and exception handling. | Constitution, roadmap, decision records, reviews. | Accepted or rejected change decisions. | `ENGC-FND-002`, `ENGC-ART-007` |
| Green Computing Model | Captures CPU, memory, network, storage, binary size, build time, dependency count, and operational-complexity considerations. | Significant decisions and dependency proposals. | Green Computing assessments. | `ENGC-GRN-001`, `ENGC-GRN-002`, `ENGC-GRN-003` |
| Automation Interface | Defines how future compiler, linter, reviewer, CLI, and generators consume accepted artifacts and emit deterministic outputs. | Accepted specifications and artifact model. | Validation findings, generated artifacts, reports. | `ENGC-AUT-001` through `ENGC-AUT-005` |

## Dependency direction

Business and governance rules must not depend on infrastructure. Future implementation must preserve this direction:

1. Constitution and requirements constrain architecture.
2. Architecture constrains specifications.
3. Specifications constrain implementation plans.
4. Implementation plans constrain implementation.
5. Infrastructure choices support, but do not define, business and governance rules.

## Quality attribute scenarios

| Scenario ID | Quality attribute | Stimulus | Response | Measure | Requirement links |
| --- | --- | --- | --- | --- | --- |
| QA-001 | Traceability | A reviewer inspects an architecture or specification change. | The artifact identifies requirement IDs it satisfies or changes. | Each non-trivial artifact has at least one explicit traceability section or matrix entry. | `ENGC-TRC-002` |
| QA-002 | Reviewability | A milestone is proposed for acceptance. | Required facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs are visible. | Review can determine whether each required classification is present or intentionally not applicable. | `ENGC-TRC-003` |
| QA-003 | Determinism | Future automation processes the same accepted inputs twice. | Outputs are equivalent unless accepted inputs or tool specifications changed. | Output comparison has no unexplained differences. | `ENGC-AUT-001` |
| QA-004 | Green Computing | A significant decision or dependency proposal is reviewed. | CPU, memory, network, storage, binary size, build time, dependency count, and operational complexity are evaluated. | Decision record contains measurable assessment or a documented not-applicable reason for each factor. | `ENGC-GRN-001`, `ENGC-GRN-002` |
| QA-005 | Simplicity | A new automation capability is proposed. | Review considers whether the work can be eliminated, deferred, or simplified before optimization. | Decision record documents eliminated work or why elimination is not acceptable. | `ENGC-GRN-003` |

## Assumptions

- Text artifacts remain sufficient for the current maturity level.
- Human review remains required for accepting milestone artifacts.
- Future automation can be specified independently from implementation technology.

## Constraints

- Architecture must remain technology-neutral until technology-selection criteria and decisions are accepted.
- Implementation source code must not be added before relevant specifications and implementation plans are accepted.
- Dependencies must not be introduced without decision records that include lifecycle and Green Computing cost.

## Recommendations

- Define architecture decision record requirements before technology selection.
- Define artifact templates before detailed DSL and automation specifications.
- Keep generated outputs separate from accepted source artifacts in future implementation plans.

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| Architecture remains too abstract to guide specifications. | Later specification work may diverge. | Use traceability and quality scenarios to constrain later specifications. |
| Premature technology preference leaks into architecture. | Violates engineering order. | Require decision records for technology and dependency choices. |
| Automation scope expands before artifact models stabilize. | Increases complexity and rework. | Specify artifact and traceability models before compiler or CLI implementation. |

## Tradeoffs

- A technology-neutral baseline is less immediately executable than a stack-specific design, but it preserves the required engineering order.
- Explicit traceability and classification sections add documentation overhead, but they make future validation and review automation feasible.
- Deferring DSL grammar design slows implementation, but prevents syntax decisions from shaping requirements or architecture prematurely.
