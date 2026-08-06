# Reviewer Specification Baseline

## Status

Accepted baseline for Milestone 8.

## Purpose

This specification defines the expected behavior of a future Engineering Compiler reviewer. The reviewer evaluates governed artifacts, evidence, diagnostics, traceability, and milestone readiness so that acceptance recommendations are explicit, reproducible, and reviewable. It uses the accepted DSL semantic model, compiler pass baseline, and linter rule baseline while remaining independent of implementation language, parser, package format, runtime, user interface, service API, or command-line design.

## Scope

This baseline covers:

- Reviewer inputs and evidence model.
- Review criteria evaluation and finding semantics.
- Governance evidence, acceptance recommendations, and decision boundaries.
- Interaction with compiler outputs and linter findings.
- Failure modes and conformance-test expectations for future implementations.

## Facts

- The DSL specification baseline defines stable artifact identity, lifecycle status, typed relationships, deterministic interpretation, phase boundaries, validation rules, and compatibility policy.
- The compiler pass specification baseline defines normalized semantic outputs, diagnostics, traceability coverage, source maps, generated artifact contracts, manifests, failure modes, and conformance-test expectations.
- The linter rule specification baseline defines rule families, severities, configuration boundaries, remediation guidance, waiver requirements, and conformance-test expectations.
- No concrete reviewer implementation, CLI command, workflow service, reporting format, user interface, policy engine, or technology stack has been selected.
- This document is normative for future reviewer, CLI, generator, governance, and automation specifications, but does not implement any of them.

## Non-goals

- Selecting implementation technology, policy languages, workflow engines, storage formats, reporting formats, identity providers, notification systems, or user interfaces.
- Replacing accountable human decision makers, governance bodies, or accepted decision records.
- Automatically accepting, rejecting, merging, publishing, or rewriting governed artifacts.
- Redefining compiler semantic validation or linter rule meaning.
- Defining concrete CLI commands, service endpoints, pull-request templates, or repository hosting integrations.

## Traceability

| Reviewer ID | Related requirement | Requirement summary | Satisfied by |
| --- | --- | --- | --- |
| ENGC-REV-001 | ENGC-AUT-003 | Reviewer behavior must be specification driven. | Reviewer inputs, criteria evaluation, recommendations, and conformance tests. |
| ENGC-REV-002 | ENGC-TRC-001 | The ecosystem must support traceability checking. | Evidence model, traceability coverage checks, and review finding requirements. |
| ENGC-REV-003 | ENGC-TRC-002 | Artifacts must maintain traceability. | Recommendations require cited artifacts, diagnostics, waivers, and governing sources. |
| ENGC-REV-004 | ENGC-ART-009 | Specification artifacts must precede automation. | This reviewer specification before reviewer implementation. |
| ENGC-REV-005 | ENGC-FND-002 | Architecture and implementation must follow requirements. | Phase readiness, acceptance boundary, and upstream authority checks. |
| ENGC-REV-006 | ENGC-GRN-001 | Green Computing must be considered in engineering decisions. | Sustainability evidence review and risk treatment criteria. |

## Reviewer inputs

A conforming reviewer specification must define inputs as semantic evidence, not technology-specific files. The minimum input set is:

| Input | Required semantics | Notes |
| --- | --- | --- |
| Review request | Scope, requested decision, target lifecycle transition, submitter, reviewer authority, and milestone or artifact boundary. | The request may originate from any future workflow, but must map to a reviewable semantic model. |
| Artifact graph | Artifact IDs, kinds, lifecycle status, stewardship, relationships, and governing sources. | Used to evaluate scope, ownership, traceability, and phase ordering. |
| Compiler evidence | Normalized model, diagnostics, coverage map, source map, generated artifact contracts, and compiler manifest when available. | Compiler errors are authoritative for semantic invalidity. |
| Linter evidence | Diagnostics, rule evaluation summary, waiver status, remediation guidance, and lint manifest when available. | Linter errors and waived errors must be visible to the reviewer. |
| Governance context | Accepted requirements, accepted decisions, milestone history, waivers, prior review decisions, and applicable acceptance criteria. | Used to determine whether the requested decision is permitted. |
| Sustainability evidence | Expected resource impact, dependency impact, mitigation, measurement points, and stale-evidence indicators for automation-impacting artifacts. | Required when artifacts introduce automation, dependencies, generated output, build work, operational workflows, or runtime behavior. |

## Reviewer outputs

A conforming reviewer must produce structured outputs that can be audited without reviewer internals.

| Output | Required content | Review purpose |
| --- | --- | --- |
| Review report | Request identifier, scope, evaluated artifacts, criteria, findings, recommendation, reviewer authority, and timestamp or logical review version. | Provides the primary review evidence. |
| Criteria evaluation matrix | Criterion ID, outcome, evidence references, blocking status, and rationale. | Shows why the recommendation was made. |
| Finding list | Stable finding ID, severity, subject, evidence, recommended action, related diagnostics, and waiver or risk treatment where applicable. | Enables remediation and follow-up tracking. |
| Acceptance recommendation | One of the normative recommendation states, with rationale and required conditions. | Separates automated recommendation from human decision. |
| Evidence manifest | Input summaries, compiler manifest references, lint manifest references, applicable profiles, skipped evidence, and reproducibility metadata. | Supports deterministic re-review and conformance testing. |
| Follow-up register | Required remediation, deferred risks, owners or accountable roles when known, and expiry or revisit conditions. | Keeps post-review obligations reviewable. |

## Recommendation states

Reviewer recommendations must use stable states.

| State | Meaning | Expected handling |
| --- | --- | --- |
| `accept` | Evidence satisfies all blocking criteria for the requested scope and lifecycle transition. | A human or governance authority may accept the artifact or milestone. |
| `accept-with-conditions` | Blocking concerns are absent or waived, but explicit follow-up work, risks, or time-bounded conditions must be tracked. | Acceptance may proceed only if conditions are captured as governed follow-up evidence. |
| `revise` | The request is reviewable, but blocking findings require remediation before acceptance. | The submitter should address findings and request re-review. |
| `reject` | The request conflicts with accepted governance, phase ordering, or immutable constraints. | The request should be withdrawn or replaced with a compliant proposal. |
| `not-reviewable` | Required evidence is missing, inconsistent, unsupported, or internally contradictory. | No acceptance decision should be made until review evidence is complete. |

A reviewer must not convert a recommendation into an accepted lifecycle status by itself. Acceptance remains a governed decision represented by accepted artifacts, decision records, or milestone reviews.

## Review criteria families

### ENGC-REV-C001: Scope and authority criteria

| Criterion ID | Default blocking status | Criterion | Required evidence |
| --- | --- | --- | --- |
| ENGC-REV-R001 | Blocking | The review request must identify scope, requested decision, and target lifecycle transition. | Review request metadata. |
| ENGC-REV-R002 | Blocking | The requested decision must be within the declared reviewer or governance authority. | Governance context or accepted decision authority. |
| ENGC-REV-R003 | Non-blocking | Review scope should identify excluded artifacts and rationale. | Scope notes or follow-up register. |

### ENGC-REV-C002: Semantic and diagnostic criteria

| Criterion ID | Default blocking status | Criterion | Required evidence |
| --- | --- | --- | --- |
| ENGC-REV-R010 | Blocking | Compiler errors affecting the review scope must be remediated or make the request not reviewable. | Compiler diagnostics and manifest. |
| ENGC-REV-R011 | Blocking | Linter error findings affecting acceptance must be remediated or covered by accepted waivers. | Linter diagnostics, waiver metadata, and rule summary. |
| ENGC-REV-R012 | Non-blocking | Linter warnings should be dispositioned as remediated, accepted risk, deferred follow-up, or not applicable. | Finding list and follow-up register. |

### ENGC-REV-C003: Traceability and phase-readiness criteria

| Criterion ID | Default blocking status | Criterion | Required evidence |
| --- | --- | --- | --- |
| ENGC-REV-R020 | Blocking | Artifacts seeking acceptance must trace to accepted governing requirements, specifications, decisions, or review authority. | Artifact graph and traceability coverage map. |
| ENGC-REV-R021 | Blocking | Requested lifecycle transitions must respect accepted phase ordering. | Governance context and artifact relationships. |
| ENGC-REV-R022 | Non-blocking | Weak, stale, or indirect traceability should be identified with remediation guidance. | Traceability findings and rationale. |

### ENGC-REV-C004: Governance evidence criteria

| Criterion ID | Default blocking status | Criterion | Required evidence |
| --- | --- | --- | --- |
| ENGC-REV-R030 | Blocking | Accepted decisions used as authority must include context, options, decision, rationale, consequences, and status. | Decision records or governance artifacts. |
| ENGC-REV-R031 | Blocking | Waivers used to satisfy blocking criteria must identify subject, rule or criterion, rationale, approver authority, expiry condition, and review date. | Waiver artifact or governance metadata. |
| ENGC-REV-R032 | Non-blocking | Follow-up work should include accountable roles when known and revisit conditions. | Follow-up register. |

### ENGC-REV-C005: Sustainability criteria

| Criterion ID | Default blocking status | Criterion | Required evidence |
| --- | --- | --- | --- |
| ENGC-REV-R040 | Blocking | Automation-impacting artifacts must include sufficient sustainability evidence before acceptance. | Sustainability evidence or accepted waiver. |
| ENGC-REV-R041 | Non-blocking | Resource-cost, dependency-burden, and measurement risks should be explicitly dispositioned. | Sustainability findings and risk treatment. |
| ENGC-REV-R042 | Non-blocking | Stale sustainability evidence should trigger follow-up or re-measurement conditions. | Evidence manifest and follow-up register. |

## Finding severities

Reviewer findings must use stable severities.

| Severity | Meaning | Expected handling |
| --- | --- | --- |
| `blocker` | Prevents an accept or accept-with-conditions recommendation unless remediated or governed by an accepted waiver. | Produces `revise`, `reject`, or `not-reviewable` depending on the failure. |
| `risk` | Does not block acceptance when explicitly dispositioned, but must be visible to governance. | May produce `accept-with-conditions` or follow-up work. |
| `advisory` | Improvement opportunity or non-blocking observation. | May be tracked but must not block acceptance. |

## Acceptance boundaries

- Reviewers recommend; they do not accept by themselves.
- A reviewer must not override compiler errors, redefine linter rule meaning, or hide waived diagnostics.
- A reviewer may recommend `accept-with-conditions` only when conditions are explicit, traceable, and assigned to governed follow-up evidence.
- A reviewer must recommend `not-reviewable` when required evidence is missing or contradictory enough to prevent criteria evaluation.
- A reviewer must recommend `reject` when the request conflicts with immutable principles, accepted phase ordering, or accepted governance authority rather than merely needing ordinary remediation.

## Interaction with compiler and linter behavior

- Compiler diagnostics remain authoritative for semantic validity.
- Linter diagnostics remain authoritative for rule-family findings and waiver handling.
- Reviewer criteria may aggregate, disposition, and contextualize diagnostics, but must cite source diagnostic IDs when doing so.
- Reviewer outputs must reference compiler and linter manifests whenever recommendations depend on those results.
- If compiler or linter evidence is unavailable, the reviewer must state which criteria were skipped or downgraded and whether the request remains reviewable.

## Failure modes

| Failure mode | Expected behavior |
| --- | --- |
| Missing review request metadata | Recommend `not-reviewable` and identify missing fields. |
| Unsupported DSL, compiler, or linter evidence version | Recommend `not-reviewable` unless version-independent criteria can safely support a narrower recommendation. |
| Compiler errors in scope | Recommend `revise` or `not-reviewable` depending on whether evidence can still be evaluated. |
| Unwaived linter errors in scope | Recommend `revise` unless the request violates immutable governance, in which case recommend `reject`. |
| Invalid waiver metadata | Ignore the waiver for acceptance purposes and emit a blocker finding. |
| Missing governance authority | Recommend `not-reviewable` or `reject` when the requested decision is outside accepted authority. |
| Contradictory evidence | Recommend `not-reviewable` and identify conflicting sources. |
| Internal reviewer inconsistency | Emit a report-level blocker and recommend `not-reviewable`. |

## Conformance tests

A future reviewer implementation must provide conformance tests before it can be accepted. The minimum conformance suite is:

| Test ID | Scenario | Expected result |
| --- | --- | --- |
| ENGC-REV-T001 | Valid review request with accepted upstream requirements, clean compiler evidence, clean linter evidence, and complete governance context. | Recommendation is `accept`; report, criteria matrix, finding list, and evidence manifest are produced. |
| ENGC-REV-T002 | Review request lacks target lifecycle transition. | Recommendation is `not-reviewable` with ENGC-REV-R001 blocker finding. |
| ENGC-REV-T003 | Compiler error affects requested acceptance scope. | Recommendation is `revise` or `not-reviewable` with cited compiler diagnostic. |
| ENGC-REV-T004 | Linter error lacks accepted waiver metadata. | Recommendation is `revise` with cited linter diagnostic and waiver finding if applicable. |
| ENGC-REV-T005 | Accepted artifact lacks upstream governing traceability. | Recommendation is `revise` with ENGC-REV-R020 blocker finding. |
| ENGC-REV-T006 | Request attempts implementation acceptance before accepted technology authority. | Recommendation is `reject` or `revise` according to governance evidence, with phase-ordering rationale. |
| ENGC-REV-T007 | Warning-level risks are dispositioned with governed follow-up. | Recommendation may be `accept-with-conditions`; follow-up register records conditions. |
| ENGC-REV-T008 | Automation-impacting artifact lacks sustainability evidence. | Recommendation is `revise` unless an accepted waiver is present. |
| ENGC-REV-T009 | Same evidence reviewed twice with equivalent profiles and scope. | Recommendation, criteria outcomes, finding IDs, and evidence manifest are equivalent. |
| ENGC-REV-T010 | Contradictory governance authority is supplied. | Recommendation is `not-reviewable` with conflicting sources identified. |

## Determinism and reproducibility

A conforming reviewer must produce equivalent criteria outcomes, finding severities, recommendation states, evidence manifests, and follow-up obligations for equivalent inputs. If output ordering is visible, the ordering rule must be specified and must not depend on implementation-specific traversal behavior.

## Versioning and compatibility

Reviewer specifications must declare compatibility with accepted DSL, compiler, and linter specification versions. Compatible changes may add optional advisory criteria, additional evidence metadata, or stricter opt-in review profiles when existing criteria meaning is preserved. Breaking changes include reinterpreting recommendation states, weakening blocking criteria, hiding diagnostics, changing waiver requirements, or allowing acceptance without governed authority.

## Risks

- Automated recommendations may be mistaken for governance decisions if acceptance boundaries are not explicit.
- Review friction may increase if non-blocking risks are treated as hidden blockers rather than tracked follow-up.
- Reviewer outputs may diverge from compiler or linter evidence if future implementations do not preserve diagnostic references.
- Sustainability evidence may become formulaic unless reviewers require measurable impact, mitigation, and revisit conditions.

## Review notes

- This baseline is complete when a future reviewer implementation can be evaluated against reviewer inputs, evidence handling, criteria evaluation, recommendation states, acceptance boundaries, failure modes, and conformance tests.
- CLI behavior, project generator behavior, concrete review workflow integrations, and automated remediation remain future specifications.
