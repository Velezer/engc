# Requirements Baseline

## Status

Accepted baseline for Milestone 1.

## Identifier scheme

- `ENGC-FND-*`: foundation and governance requirements.
- `ENGC-ART-*`: required artifact requirements.
- `ENGC-GRN-*`: Green Computing requirements.
- `ENGC-TRC-*`: traceability requirements.
- `ENGC-AUT-*`: future automation requirements.

## Facts

- The required repository scope includes constitution, handbook, standards, templates, checklists, playbooks, governance, decision framework, engineering metrics, project generators, compiler, linter, reviewer, CLI, DSL.
- No implementation architecture or technology stack has been accepted yet.

## Foundation requirements

| ID | Requirement | Rationale | Verification |
| --- | --- | --- | --- |
| ENGC-FND-001 | The repository must preserve the master prompt as the initial source of truth. | Maintains one source of truth. | Confirm `MASTER_PROMPT.md` exists and is referenced by governance artifacts. |
| ENGC-FND-002 | Work must proceed in the required engineering order. | Prevents implementation before requirements, architecture, and specifications. | Review roadmap, plans, and pull requests for stage compliance. |
| ENGC-FND-003 | Every milestone must document repository maturity and the next milestone. | Keeps evolution incremental and reviewable. | Check README, roadmap, and milestone review. |
| ENGC-FND-004 | Every milestone must update documentation, roadmap, changelog, and review notes. | Ensures continuity and traceability. | Check changed files in each milestone. |

## Artifact requirements

| ID | Requirement | Rationale | Verification |
| --- | --- | --- | --- |
| ENGC-ART-001 | The ecosystem must define a constitution. | Establishes governing principles. | Constitution artifact exists and is reviewed. |
| ENGC-ART-002 | The ecosystem must define a handbook. | Explains day-to-day usage. | Handbook requirements and later handbook artifact exist. |
| ENGC-ART-003 | The ecosystem must define standards. | Makes engineering expectations reviewable. | Standards requirements and later standards artifacts exist. |
| ENGC-ART-004 | The ecosystem must define templates. | Makes required artifacts repeatable. | Templates requirements and later template artifacts exist. |
| ENGC-ART-005 | The ecosystem must define checklists. | Makes reviews consistent. | Checklist requirements and later checklist artifacts exist. |
| ENGC-ART-006 | The ecosystem must define playbooks. | Makes operational workflows repeatable. | Playbook requirements and later playbook artifacts exist. |
| ENGC-ART-007 | The ecosystem must define governance and decision framework artifacts. | Controls change and dependency decisions. | Governance and decision artifacts exist. |
| ENGC-ART-008 | The ecosystem must define engineering metrics. | Makes quality and cost of change measurable. | Metrics catalog exists. |
| ENGC-ART-009 | The ecosystem must define DSL, compiler, linter, reviewer, CLI, and project generator specifications before implementation. | Preserves architecture-before-technology and technology-before-implementation. | Specifications exist before source implementation. |

## Green Computing requirements

| ID | Requirement | Rationale | Verification |
| --- | --- | --- | --- |
| ENGC-GRN-001 | Significant decisions must evaluate CPU, memory, network, storage, binary size, build time, dependency count, and operational complexity. | Treats Green Computing as first-class. | Decision records include a Green Computing section. |
| ENGC-GRN-002 | Dependencies must be justified with measurable benefit and lifecycle cost. | Reduces operational and environmental cost. | Dependency decision records exist before adoption. |
| ENGC-GRN-003 | Automation should prefer eliminating unnecessary work over optimizing unnecessary work. | Aligns sustainability with simplicity. | Reviews identify eliminated work where applicable. |

## Traceability requirements

| ID | Requirement | Rationale | Verification |
| --- | --- | --- | --- |
| ENGC-TRC-001 | Requirements must have stable identifiers. | Enables traceability from requirement to verification. | Requirements baseline contains IDs. |
| ENGC-TRC-002 | Architecture, specifications, implementation plans, tests, and reviews must reference requirement IDs when they satisfy or change requirements. | Keeps changes reviewable. | Traceability matrix links downstream artifacts. |
| ENGC-TRC-003 | Non-trivial artifacts must distinguish facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs. | Prevents invented requirements and hidden assumptions. | Artifact review checks required sections. |

## Future automation requirements

| ID | Requirement | Rationale | Verification |
| --- | --- | --- | --- |
| ENGC-AUT-001 | The compiler must transform accepted specifications into deterministic engineering outputs. | Makes Specification-Driven Development executable. | Compiler specification and conformance tests exist before implementation. |
| ENGC-AUT-002 | The linter must detect violations of the constitution, standards, traceability, and required artifact structure. | Makes governance enforceable. | Linter rule specifications and tests exist before implementation. |
| ENGC-AUT-003 | The reviewer must produce structured review findings tied to requirement IDs. | Keeps review output traceable. | Reviewer specification and sample findings exist before implementation. |
| ENGC-AUT-004 | The CLI must expose documented workflows for validation, review, generation, and reporting. | Makes the ecosystem usable. | CLI specification and usage examples exist before implementation. |
| ENGC-AUT-005 | Project generators must create minimal, governed project skeletons without unnecessary dependencies. | Reduces startup cost while preserving governance. | Generator specifications define output and dependency policy. |

## Out of scope for this milestone

- Architecture decisions.
- Technology selection.
- DSL grammar design.
- Compiler, linter, reviewer, CLI, or generator implementation.
