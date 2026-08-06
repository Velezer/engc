# DSL Specification Baseline

## Status

Accepted baseline for Milestone 5.

## Purpose

This specification defines the initial Engineering Compiler DSL at the concept and semantic level so later compiler, linter, reviewer, CLI, and generator specifications can be written without relying on unstated behavior.

## Scope

This baseline covers:

- DSL domain concepts and artifact boundaries.
- Semantic model for governed engineering artifacts.
- Minimal structural expectations for future syntax or serialization decisions.
- Examples and non-examples of valid DSL intent.
- Validation rules and diagnostics expectations.
- Versioning, compatibility, and migration policy.

## Facts

- The repository has accepted requirements, architecture, technology-selection criteria, artifact templates, and artifact catalog requirements.
- No concrete grammar, parser, compiler, linter, reviewer, CLI, generator, package format, or runtime technology has been selected.
- This DSL baseline is normative for future specifications but intentionally avoids implementation-level syntax choices.

## Non-goals

- Selecting a concrete file format, grammar notation, parser generator, programming language, storage layer, or runtime.
- Defining compiler passes, generated artifacts, CLI commands, or linter rule implementations.
- Replacing human engineering judgment, review authority, or accepted governance processes.
- Encoding executable product logic or application runtime behavior.

## Traceability

| DSL ID | Related requirement | Requirement summary | Satisfied by |
| --- | --- | --- | --- |
| ENGC-DSL-001 | ENGC-AUT-001 | Automation must be specification driven. | Domain model and deterministic interpretation rules. |
| ENGC-DSL-002 | ENGC-TRC-002 | Artifacts must maintain traceability. | Identity, relationship, and coverage semantics. |
| ENGC-DSL-003 | ENGC-ART-009 | Specification artifacts must precede automation. | This baseline before compiler, linter, reviewer, CLI, and generator specifications. |
| ENGC-DSL-004 | ENGC-GRN-001 | Green Computing must be considered in engineering decisions. | Sustainability annotations and validation expectations. |
| ENGC-DSL-005 | ENGC-FND-002 | Architecture and implementation must follow requirements. | Phase boundaries and readiness gates. |

## Domain concepts

| Concept | Meaning | Required properties |
| --- | --- | --- |
| Workspace | A governed collection of DSL-defined engineering artifacts. | Stable identity, DSL version, artifact inventory, validation profile. |
| Artifact | A documented engineering work product such as a requirement, decision, specification, checklist, playbook, metric, review, or generated-output contract. | Stable ID, kind, title, status, owner or steward, lifecycle timestamps, traceability links. |
| Requirement | A normative need, constraint, or quality expectation. | Requirement ID, source, statement, rationale, acceptance evidence, downstream links. |
| Specification | A normative description of expected behavior for DSL, compiler, linter, reviewer, CLI, generator, or other automation. | Scope, deterministic semantics, examples, non-examples, validation rules, failure modes. |
| Decision | A governed choice that constrains future work. | Context, options, decision, status, rationale, consequences, reversibility, dependency and Green Computing assessment. |
| Review | Evidence that an artifact or milestone has been assessed. | Review subject, criteria, findings, outcome, reviewer identity or role, date. |
| Relationship | A typed edge connecting artifacts. | Source artifact, target artifact, relationship type, rationale, cardinality expectation where applicable. |
| Diagnostic | A structured validation result. | Rule ID, severity, location or subject, message, remediation guidance, traceability to governing rule. |
| Version | A declared DSL compatibility boundary. | Version identifier, compatibility status, migration notes, deprecation information. |

## Semantic model

### Identity

Every DSL artifact must have a stable identifier that is unique within its workspace. Identifiers must remain stable across edits unless the artifact is intentionally superseded, split, or merged.

### Artifact lifecycle

Artifacts must use an explicit status vocabulary. The minimum lifecycle states are:

- `draft` for proposed content that is not yet binding.
- `review` for content under formal assessment.
- `accepted` for binding content.
- `superseded` for content replaced by a newer artifact.
- `deprecated` for accepted content that remains available but should not be used for new work.
- `removed` for content intentionally retired from the active model.

Future specifications may add status aliases only if they map deterministically to these lifecycle states.

### Relationship semantics

Relationships must be typed so traceability can be validated. The baseline relationship types are:

- `derives_from` for content originating from a source artifact.
- `satisfies` for content that fulfills a requirement or specification obligation.
- `constrains` for decisions or requirements that limit future choices.
- `verifies` for reviews, tests, or checks that provide evidence.
- `supersedes` for replacement lineage.
- `depends_on` for prerequisite artifacts or decisions.
- `generates` for future compiler or generator output contracts.

Relationships must not imply satisfaction unless their type explicitly carries satisfaction semantics.

### Deterministic interpretation

A conforming DSL consumer must interpret the same valid workspace into the same semantic model. Ambiguity must be treated as a validation problem, not as implementation-defined behavior.

### Phase boundaries

The DSL must preserve the repository phase order:

1. Requirements before architecture.
2. Architecture before technology selection.
3. Technology selection before implementation.
4. Specifications before automation implementation.

Artifacts that cross a phase boundary must reference the accepted upstream artifact that authorizes the transition.

### Green Computing semantics

Artifacts that introduce automation, dependencies, generated output, build work, operational workflows, or measurable runtime behavior must include sustainability considerations proportionate to their impact. The DSL must represent these considerations as reviewable metadata rather than informal prose only.

## Structural expectations for future concrete syntax

A future syntax or serialization specification must support:

- Human-readable artifact identity and status.
- Machine-readable relationships and requirement IDs.
- Comments or rationale without affecting semantics.
- Deterministic ordering where ordering changes semantic meaning.
- Lossless round-tripping of normative fields.
- Extensible metadata with explicit compatibility rules.
- Clear locations for diagnostics.

## Validation rules

| Rule ID | Severity | Rule | Remediation |
| --- | --- | --- | --- |
| ENGC-DSL-R001 | error | Every artifact must have a unique stable ID. | Add or correct the artifact ID. |
| ENGC-DSL-R002 | error | Every normative artifact must declare status. | Add a lifecycle status from the accepted vocabulary. |
| ENGC-DSL-R003 | error | Relationship endpoints must reference existing artifacts. | Correct the referenced ID or add the missing artifact. |
| ENGC-DSL-R004 | error | Implementation-oriented artifacts must trace to accepted requirements and architecture. | Add required upstream traceability links or change the artifact status. |
| ENGC-DSL-R005 | error | Automation specifications must define deterministic behavior and failure modes. | Add semantic rules and explicit failure handling. |
| ENGC-DSL-R006 | warning | Accepted artifacts should have review evidence. | Link an accepted review artifact or explain the exception. |
| ENGC-DSL-R007 | warning | Artifacts introducing automation or dependencies should include Green Computing assessment metadata. | Add sustainability impact, mitigation, and measurement notes. |
| ENGC-DSL-R008 | warning | Deprecated or superseded artifacts should identify their replacement or migration path. | Add a `supersedes`, `superseded_by`, or migration relationship. |

## Examples

### Valid intent: requirement traced to specification

A workspace may define a requirement for deterministic compiler behavior, a compiler specification that satisfies it, and a review artifact that verifies the specification. The requirement, specification, and review must be separate artifacts linked by typed relationships.

### Valid intent: technology-neutral DSL artifact

A DSL specification artifact may describe semantic concepts, required fields, validation rules, examples, non-examples, and versioning policy without selecting a parser, schema language, or implementation language.

### Valid intent: sustainability metadata

A generator specification that proposes additional build steps may include Green Computing metadata describing expected build cost, dependency impact, mitigation options, and measurement points.

## Non-examples

- A DSL artifact that says a compiler should behave "reasonably" without deterministic semantics.
- A technology decision that selects a parser library before technology-selection criteria and decision records are accepted.
- A requirement with no stable ID or no source.
- A review finding that cannot identify the artifact, rule, or evidence it refers to.
- A generated-output contract that has no upstream specification or traceability link.

## Versioning policy

- DSL versions must use explicit version identifiers.
- A version must state whether changes are compatible, deprecated, or breaking.
- Compatible changes may add optional fields, new artifact kinds, or new relationship types when existing semantics remain unchanged.
- Breaking changes include changes that alter the meaning of existing fields, remove accepted lifecycle states, or reinterpret relationship semantics.
- Deprecations must identify a migration path and a planned removal boundary before removal is allowed.
- Future compiler and CLI specifications must define how version mismatches are reported before implementation begins.

## Compatibility policy

A valid workspace for a prior accepted DSL version must remain interpretable by later compatible versions. If compatibility cannot be preserved, the new version must provide migration rules and diagnostics before it can be accepted.

## Risks

- Defining concepts too broadly may make future compiler and linter specifications harder to test.
- Defining syntax too early could bias technology selection, so this baseline intentionally remains syntax-neutral.
- Relationship types may require refinement when compiler pass specifications define generated artifacts in detail.

## Review notes

- This baseline is complete when future work can write compiler, linter, reviewer, CLI, and generator specifications against a shared semantic model.
- Any future concrete syntax proposal must be reviewed as a technology or specification decision, not inferred from this document.
