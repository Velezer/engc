# Architecture Decision Record Requirements

## Status

Accepted baseline for Milestone 2.

## Purpose

This artifact defines the minimum required content for future decision records before technology selection, dependency adoption, or significant architecture change.

## Requirements addressed

- `ENGC-FND-002`: Preserve required engineering order.
- `ENGC-GRN-001`: Evaluate resource and operational cost.
- `ENGC-GRN-002`: Justify dependencies before adoption.
- `ENGC-GRN-003`: Prefer eliminating unnecessary work.
- `ENGC-TRC-002`: Link decisions to requirement IDs.
- `ENGC-TRC-003`: Classify facts, requirements, assumptions, constraints, recommendations, risks, and tradeoffs.

## Required sections

Each non-trivial decision record must include:

1. Title.
2. Status.
3. Date.
4. Context.
5. Requirement IDs affected.
6. Facts.
7. Requirements.
8. Assumptions.
9. Constraints.
10. Options considered.
11. Decision.
12. Consequences.
13. Green Computing assessment.
14. Dependency assessment, when dependencies are introduced or changed.
15. Traceability updates.
16. Review notes.

## Green Computing assessment

Significant decisions must evaluate:

- CPU cost.
- Memory cost.
- Network cost.
- Storage cost.
- Binary or artifact size.
- Build or generation time.
- Dependency count.
- Operational complexity.
- Unnecessary work eliminated, deferred, or simplified.

A decision may mark a factor as not applicable only when it explains why.

## Dependency assessment

Any dependency proposal must document:

- The capability provided.
- Why the capability is required now.
- Alternatives considered, including no new dependency.
- Lifecycle cost, including maintenance, security updates, compatibility, and removal cost.
- Green Computing impact.
- Review and acceptance criteria.

## Constraints

- Decision records must not be used to bypass the required engineering order.
- Technology decision records must not be accepted before architecture requirements and technology-selection criteria exist.
- Dependency decision records must be accepted before dependency introduction.
