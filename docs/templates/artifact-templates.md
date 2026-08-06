# Artifact Templates

## Status

Accepted baseline for Milestone 3.

## Purpose

This artifact defines reusable templates for governed Engineering Compiler artifacts. Templates make classifications, traceability, Green Computing review, and decision evidence consistent before detailed DSL, compiler, linter, reviewer, CLI, or generator specifications are written.

## Requirements addressed

- `ENGC-FND-002`: Preserve required engineering order.
- `ENGC-FND-004`: Update documentation, roadmap, changelog, and review notes at each milestone.
- `ENGC-ART-004`: Define templates.
- `ENGC-ART-007`: Define governance and decision framework artifacts.
- `ENGC-GRN-001`: Evaluate resource and operational cost.
- `ENGC-GRN-002`: Justify dependencies before adoption.
- `ENGC-GRN-003`: Prefer eliminating unnecessary work.
- `ENGC-TRC-002`: Link artifacts to requirement IDs.
- `ENGC-TRC-003`: Distinguish facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs.

## General artifact template

Use this template for non-trivial requirements, architecture, specification, plan, standard, checklist, playbook, metric, and review artifacts.

```md
# <Artifact Title>

## Status

<Draft | Proposed | Accepted | Superseded> for <milestone or scope>.

## Purpose

<Why this artifact exists and what decision or review it enables.>

## Facts

- <Known information verified by accepted artifacts or observations.>

## Requirements addressed

- `<Requirement ID>`: <Requirement summary>.

## Assumptions

- <Assumption that must be reviewed or later verified.>

## Constraints

- <Constraint that limits acceptable solutions.>

## Recommendations

- <Recommended action or direction.>

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| <Risk> | <Impact> | <Mitigation> |

## Tradeoffs

- <Tradeoff and rationale.>

## Traceability

| Source requirement | Satisfying section or artifact | Verification |
| --- | --- | --- |
| `<Requirement ID>` | <Section or artifact> | <Review or validation method> |
```

## Technology decision record template

Use this template before selecting a language, framework, tool, runtime, storage mechanism, package manager, deployment platform, or non-trivial dependency.

```md
# Technology Decision: <Decision Title>

## Status

<Draft | Proposed | Accepted | Superseded>.

## Date

<YYYY-MM-DD>

## Context

<Problem, accepted requirements, and architecture drivers that create the need.>

## Requirement IDs affected

- `<Requirement ID>`

## Facts

- <Verified fact.>

## Requirements

- <Requirement that the decision must satisfy.>

## Assumptions

- <Assumption requiring review.>

## Constraints

- <Constraint from constitution, requirements, architecture, or accepted decisions.>

## Options considered

| Option | Summary | Criteria results |
| --- | --- | --- |
| No new technology | <Baseline impact> | <Scores against technology-selection criteria> |
| Minimal acceptable option | <Summary> | <Scores against technology-selection criteria> |
| Alternative option | <Summary> | <Scores against technology-selection criteria> |

## Decision

<Selected option and rationale.>

## Consequences

- <Positive, negative, and neutral consequences.>

## Green Computing assessment

| Factor | Assessment | Evidence or not-applicable reason |
| --- | --- | --- |
| CPU cost | <Assessment> | <Evidence> |
| Memory cost | <Assessment> | <Evidence> |
| Network cost | <Assessment> | <Evidence> |
| Storage cost | <Assessment> | <Evidence> |
| Binary or artifact size | <Assessment> | <Evidence> |
| Build or generation time | <Assessment> | <Evidence> |
| Dependency count | <Assessment> | <Evidence> |
| Operational complexity | <Assessment> | <Evidence> |
| Unnecessary work eliminated | <Assessment> | <Evidence> |

## Dependency assessment

<Required when dependencies are introduced or changed. Document capability, timing need, alternatives, lifecycle cost, Green Computing impact, and acceptance criteria.>

## Traceability updates

<Traceability matrix entries that must be added or changed.>

## Review notes

<Reviewer findings, accepted risks, and follow-up actions.>
```

## Milestone review template

Use this template to accept or reject each milestone.

```md
# Milestone <N> Review

## Status

<Accepted | Rejected | Accepted with follow-up>.

## Scope reviewed

- <Artifact or change reviewed.>

## Requirement coverage

| Requirement ID | Evidence reviewed | Result |
| --- | --- | --- |
| `<Requirement ID>` | <Artifact or section> | <Covered | Gap | Not applicable> |

## Findings

- <Finding.>

## Risks accepted

- <Accepted risk and rationale.>

## Follow-up actions

- <Action, owner, and target milestone if known.>

## Next milestone

<Expected next milestone scope.>
```

## Constraints

- Templates are starting points, not permission to omit required evidence.
- More specific accepted templates may add required sections but must not remove required classification or traceability expectations unless a decision record justifies the exception.
- Templates must not introduce implementation details before the relevant specification and technology decision milestones.
