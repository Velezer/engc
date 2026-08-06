# Technology Selection Criteria

## Status

Accepted baseline for Milestone 3.

## Purpose

This artifact defines technology-selection criteria for future language, framework, tool, runtime, storage, packaging, and deployment decisions. It enables later technology decision records without selecting any technology in this milestone.

## Facts

- Requirements are accepted in `docs/requirements/requirements-baseline.md`.
- Architecture is accepted in `docs/architecture/architecture-baseline.md`.
- Architecture decision-record requirements are accepted in `docs/architecture/decision-record-requirements.md`.
- No implementation technology stack, dependency, DSL grammar, compiler pass design, CLI surface, or generator implementation has been accepted.

## Requirements addressed

- `ENGC-FND-002`: Preserve the required engineering order.
- `ENGC-ART-004`: Define templates.
- `ENGC-ART-007`: Define governance and decision framework artifacts.
- `ENGC-GRN-001`: Evaluate resource and operational cost.
- `ENGC-GRN-002`: Justify dependencies before adoption.
- `ENGC-GRN-003`: Prefer eliminating unnecessary work.
- `ENGC-TRC-002`: Link decisions to requirement IDs.
- `ENGC-TRC-003`: Classify facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs.

## Selection principles

1. Technology choices must satisfy accepted requirements and architecture rather than redefine them.
2. A technology decision must be recorded before the selected technology or dependency is introduced.
3. The simplest acceptable option is preferred over a more capable option when both satisfy the same accepted need.
4. Technologies that reduce unnecessary work are preferred over technologies that only optimize unnecessary work.
5. Reversibility, maintainability, and lifecycle cost must be evaluated before convenience.
6. The default decision is no new technology unless accepted criteria show that a change is required now.

## Evaluation criteria

| Criterion ID | Requirement links | Criterion | Evidence expected |
| --- | --- | --- | --- |
| TECH-CRIT-001 | `ENGC-FND-002`, `ENGC-TRC-002` | The option supports accepted requirements and architecture without bypassing required engineering order. | Requirement IDs, affected architecture components, and stage-gate impact. |
| TECH-CRIT-002 | `ENGC-TRC-003` | The option can be evaluated with explicit facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs. | Completed decision-record classifications. |
| TECH-CRIT-003 | `ENGC-GRN-001` | The option has acceptable CPU, memory, network, storage, binary size, build time, and operational-complexity impact. | Measured data when available; bounded estimates when implementation does not yet exist. |
| TECH-CRIT-004 | `ENGC-GRN-002` | The option minimizes new dependency count and documents lifecycle cost. | Dependency inventory, maintenance expectations, security update path, compatibility risks, and removal plan. |
| TECH-CRIT-005 | `ENGC-GRN-003` | The option eliminates, defers, or simplifies work where possible. | Explanation of work avoided and why remaining work is necessary. |
| TECH-CRIT-006 | `ENGC-AUT-001` through `ENGC-AUT-005` | The option can support deterministic, reviewable future automation. | Determinism considerations, reproducibility controls, and reviewable output expectations. |
| TECH-CRIT-007 | `ENGC-FND-004` | The option can be documented, reviewed, and changed through repository artifacts. | Documentation plan, review owner expectations, and update checklist. |

## Required comparison set

Each technology decision record must compare at least:

- No new technology or dependency.
- One minimal option that satisfies the accepted need.
- One credible alternative, when such an alternative exists.

If a comparison item is not available or not meaningful, the decision record must explain why.

## Required scoring scale

Technology decision records should score each criterion as:

- `satisfies`: The option meets the criterion with acceptable evidence.
- `partially-satisfies`: The option may meet the criterion but has unresolved assumptions, risks, or mitigation work.
- `does-not-satisfy`: The option fails the criterion or lacks required evidence.
- `not-applicable`: The criterion does not apply, with an explicit reason.

Scores are review aids, not automatic approvals. Reviewers may reject a proposal even when most criteria are marked `satisfies` if a critical risk remains unresolved.

## Constraints

- This artifact does not select technologies.
- Future technology decisions must use accepted decision-record requirements and cite these criteria.
- Implementation source code must not be added merely to evaluate a technology unless an accepted spike or prototype plan defines scope, disposal expectations, and review criteria.
- Dependencies must not be introduced before a decision record accepts their lifecycle and Green Computing costs.

## Recommendations

- Prefer standard library, platform, or existing repository capabilities before adding dependencies.
- Prefer stable, well-documented technologies with transparent maintenance and security practices.
- Prefer technologies that can be removed or replaced with bounded effort.
- Keep technology decisions narrow so they can be reviewed and reversed independently.

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| Criteria are applied as a checkbox exercise. | Poor decisions may appear compliant. | Require narrative evidence and reviewer judgment in decision records. |
| Early implementation experiments become de facto decisions. | Violates engineering order. | Require accepted spike scope and disposal expectations before prototype work. |
| Green Computing estimates are imprecise before implementation. | Review may underestimate cost. | Use bounded estimates and require later measurement updates when implementation exists. |

## Tradeoffs

- Criteria add review overhead before implementation, but they reduce unexamined dependency and lifecycle cost.
- Deferring actual technology choices slows coding, but it preserves requirement-led design and keeps decisions reversible.
