# Linter Rule Specification Baseline

## Status

Accepted baseline for Milestone 7.

## Purpose

This specification defines the expected behavior of a future Engineering Compiler linter at the rule-family, severity, configuration, remediation, and conformance-test level. It uses the accepted DSL semantic model and compiler pass baseline while remaining independent of implementation language, parser, package format, framework, runtime, editor integration, or command-line design.

## Scope

This baseline covers:

- Linter inputs and evaluated artifact scope.
- Rule families and normative rule identifiers.
- Severity semantics and configuration boundaries.
- Diagnostic and remediation guidance requirements.
- Interaction with compiler passes and generated artifact contracts.
- Conformance-test expectations for future implementations.

## Facts

- The DSL specification baseline defines artifact identity, lifecycle status, typed relationships, deterministic interpretation, phase boundaries, validation rules, and compatibility policy.
- The compiler pass specification baseline defines semantic validation, relationship resolution, phase-gate validation, traceability analysis, diagnostics, failure modes, and generated artifact contracts.
- No concrete linter implementation, CLI command, editor extension, parser, configuration file format, or reporting format has been selected.
- This document is normative for future linter, reviewer, CLI, and generator specifications, but does not implement any of them.

## Non-goals

- Selecting linter implementation technology, parser tooling, schema languages, output formats, editor integrations, package formats, or build systems.
- Defining a concrete command-line interface, service API, watch mode, cache model, or runtime execution model.
- Replacing compiler semantic validation, governance review, decision authority, or human acceptance of artifacts.
- Creating style preferences that cannot be traced to accepted requirements, DSL semantics, compiler contracts, or governance obligations.
- Automatically rewriting governed artifacts without a future accepted remediation specification.

## Traceability

| Linter ID | Related requirement | Requirement summary | Satisfied by |
| --- | --- | --- | --- |
| ENGC-LNT-001 | ENGC-AUT-002 | Linter behavior must be specification driven. | Rule families, severity semantics, configuration boundaries, and conformance tests. |
| ENGC-LNT-002 | ENGC-TRC-001 | The ecosystem must support traceability checking. | Traceability, relationship, orphan, and coverage rules. |
| ENGC-LNT-003 | ENGC-TRC-002 | Artifacts must maintain traceability. | Diagnostics tied to artifact IDs, relationship IDs, and governing sources. |
| ENGC-LNT-004 | ENGC-ART-009 | Specification artifacts must precede automation. | This linter specification before linter implementation. |
| ENGC-LNT-005 | ENGC-GRN-001 | Green Computing must be considered in engineering decisions. | Sustainability metadata and dependency-impact rules. |
| ENGC-LNT-006 | ENGC-FND-002 | Architecture and implementation must follow requirements. | Phase-ordering and acceptance-gate rules. |

## Linter inputs

A conforming linter specification must define inputs as semantic artifacts rather than technology-specific files. The minimum input set is:

| Input | Required semantics | Notes |
| --- | --- | --- |
| Workspace model | DSL version, artifact inventory, validation profile, and workspace identity. | May originate from any future concrete syntax if it produces the accepted DSL semantic model. |
| Artifact graph | Artifacts with stable IDs, lifecycle status, kinds, ownership or stewardship, and typed relationships. | Relationship endpoints must be resolvable for relationship and traceability rules. |
| Rule profile | Enabled rule families, severity policy, scope, and explicitly accepted waivers. | Profiles may tune permitted severities but must not redefine rule meaning. |
| Compiler outputs | Normalized semantic model, diagnostics, traceability coverage map, generated artifact contracts, source map, and manifest when available. | Linter rules may consume compiler outputs but must not contradict compiler semantics. |
| Governance context | Accepted requirements, decisions, milestone status, and review evidence relevant to the linted scope. | Used to evaluate phase boundaries, accepted authority, and waiver validity. |

## Linter outputs

A conforming linter must produce structured outputs that can be reviewed without requiring linter internals.

| Output | Required content | Review purpose |
| --- | --- | --- |
| Diagnostics report | Stable rule ID, severity, subject, message, remediation, governing source, and waiver status where applicable. | Allows humans and automation to understand findings and next actions. |
| Rule evaluation summary | Enabled rules, skipped rules, evaluation scope, rule profile, and result counts by severity. | Demonstrates what was and was not checked. |
| Traceability findings | Missing, weak, orphaned, stale, or conflicting links, including source and target artifact IDs. | Supports impact analysis and governance review. |
| Remediation guidance | Human-actionable fixes, candidate upstream artifacts, and constraints on automated changes. | Keeps correction reviewable and avoids unsafe rewrites. |
| Sustainability findings | Missing, insufficient, or stale sustainability metadata for automation, dependency, build, or operational impacts. | Preserves Green Computing review evidence. |
| Lint manifest | Linter specification version, DSL version, rule profile, input summary, evaluated rule list, and result status. | Supports reproducibility and conformance testing. |

## Severity semantics

Linter severities must be stable and reviewable.

| Severity | Meaning | Expected handling |
| --- | --- | --- |
| `error` | A rule violation blocks acceptance, generation, implementation readiness, or deterministic interpretation for the evaluated scope. | Must be remediated or covered by an accepted waiver before the affected artifact can advance. |
| `warning` | A rule violation indicates missing, weak, stale, or risky evidence that does not block deterministic interpretation. | Should be remediated or explicitly accepted as risk during review. |
| `info` | A non-blocking observation, improvement opportunity, or advisory finding. | May guide cleanup but must not block acceptance. |

A rule profile may raise a warning to an error for a stricter gate, or lower an error only when an accepted governance waiver explicitly identifies the rule, subject, rationale, expiry condition, and reviewer authority. Profiles must not disable phase-ordering, identity uniqueness, relationship resolution, or deterministic-semantics rules for artifacts seeking accepted status.

## Rule families

### ENGC-LNT-F001: Identity and lifecycle rules

| Rule ID | Default severity | Rule | Remediation |
| --- | --- | --- | --- |
| ENGC-LNT-R001 | error | Every linted artifact must have a stable ID unique within the workspace. | Add or correct the artifact ID before review. |
| ENGC-LNT-R002 | error | Every normative artifact must declare a lifecycle status from the accepted DSL vocabulary. | Add a valid lifecycle status or map an alias deterministically. |
| ENGC-LNT-R003 | warning | Accepted artifacts should identify an owner, steward, or accountable role. | Add stewardship metadata or link to an accepted governance exception. |
| ENGC-LNT-R004 | warning | Deprecated, superseded, or removed artifacts should identify replacement, migration, or retirement rationale. | Add supersession, migration, or retirement relationships. |

### ENGC-LNT-F002: Relationship and traceability rules

| Rule ID | Default severity | Rule | Remediation |
| --- | --- | --- | --- |
| ENGC-LNT-R010 | error | Relationship endpoints must reference existing artifacts in the evaluated workspace or declared external authority. | Correct the endpoint or add the missing referenced artifact. |
| ENGC-LNT-R011 | error | Artifacts seeking accepted status must trace to their governing requirement, specification, decision, or review authority. | Add a typed relationship to an accepted governing artifact. |
| ENGC-LNT-R012 | warning | Artifacts with no inbound or outbound traceability should be reported as orphans unless explicitly classified as roots. | Add traceability links or classify the artifact as an accepted root. |
| ENGC-LNT-R013 | warning | Relationship rationale should be present when the link implies satisfaction, constraint, verification, dependency, or generation. | Add rationale explaining the link. |
| ENGC-LNT-R014 | error | A relationship must not claim satisfaction when its relationship type does not carry satisfaction semantics. | Change the relationship type or separate the supporting rationale. |

### ENGC-LNT-F003: Phase-gate and acceptance rules

| Rule ID | Default severity | Rule | Remediation |
| --- | --- | --- | --- |
| ENGC-LNT-R020 | error | Architecture artifacts must not seek acceptance before accepted upstream requirements exist. | Add accepted requirement traceability or keep the artifact in draft or review. |
| ENGC-LNT-R021 | error | Technology-selection artifacts must not seek acceptance before accepted architecture constraints exist. | Add accepted architecture traceability or defer acceptance. |
| ENGC-LNT-R022 | error | Implementation-oriented artifacts must not seek acceptance before accepted requirements, architecture, and technology-selection authority exist. | Add upstream accepted authority or change the artifact scope or status. |
| ENGC-LNT-R023 | error | Automation implementations must not seek acceptance before their governing specification is accepted. | Add accepted specification traceability or defer implementation acceptance. |
| ENGC-LNT-R024 | warning | Milestone review artifacts should enumerate reviewed artifacts, criteria, findings, decision, and follow-up work. | Complete the review evidence before closing the milestone. |

### ENGC-LNT-F004: Specification completeness rules

| Rule ID | Default severity | Rule | Remediation |
| --- | --- | --- | --- |
| ENGC-LNT-R030 | error | Automation specifications must define deterministic behavior, diagnostics, failure modes, and conformance-test expectations. | Add the missing normative sections. |
| ENGC-LNT-R031 | warning | Specification baselines should include examples, non-examples, or explicit rationale when examples are deferred. | Add examples, non-examples, or a documented deferral. |
| ENGC-LNT-R032 | error | Generated artifact contracts must identify source artifacts, required sections, review obligations, and regeneration or drift policy. | Add the missing contract metadata. |
| ENGC-LNT-R033 | warning | Compatibility or versioning policy should be present for DSL, compiler, linter, reviewer, CLI, and generator specifications. | Add versioning and compatibility guidance. |

### ENGC-LNT-F005: Governance and decision rules

| Rule ID | Default severity | Rule | Remediation |
| --- | --- | --- | --- |
| ENGC-LNT-R040 | error | Accepted decisions must include context, considered options, decision, rationale, consequences, and status. | Complete the decision record before acceptance. |
| ENGC-LNT-R041 | warning | Decisions involving dependencies or technology choices should include reversibility and exit criteria. | Add migration, replacement, or rollback guidance. |
| ENGC-LNT-R042 | warning | Waivers must include rule ID, subject, rationale, approving role, expiry condition, and review date. | Complete waiver metadata or remove the waiver. |
| ENGC-LNT-R043 | warning | Accepted artifacts should link to review evidence that verifies the acceptance decision. | Add a review relationship or document the governance exception. |

### ENGC-LNT-F006: Sustainability and dependency rules

| Rule ID | Default severity | Rule | Remediation |
| --- | --- | --- | --- |
| ENGC-LNT-R050 | warning | Artifacts introducing automation, dependencies, generated output, build work, operational workflows, or measurable runtime behavior should include sustainability impact metadata. | Add expected impact, mitigation, and measurement points. |
| ENGC-LNT-R051 | warning | Dependency-related decisions should identify resource cost, maintenance burden, supply-chain risk, and removal strategy. | Add dependency and Green Computing assessment evidence. |
| ENGC-LNT-R052 | info | Repeated generation or validation workflows should identify opportunities to avoid unnecessary work. | Add caching, scoping, or measurement considerations where appropriate. |
| ENGC-LNT-R053 | warning | Sustainability metadata should be refreshed when source obligations, generated contracts, or dependency decisions materially change. | Update impact notes and review evidence. |

## Configuration boundaries

A conforming linter may support configurable rule profiles, but configuration must be explicit and reviewable.

- Profiles may enable optional rules, restrict evaluation scope, raise severities, define accepted roots, or include accepted waivers.
- Profiles must not change rule IDs, diagnostic subjects, governing sources, or deterministic interpretation semantics.
- Profiles must not hide errors for accepted-status artifacts unless an accepted waiver is present.
- Waivers must be represented as governed artifacts or governance metadata, not as untraceable local suppression comments.
- Any skipped rule must appear in the rule evaluation summary with the reason it was skipped.

## Remediation guidance

Each diagnostic must include remediation guidance that is specific enough for a human to act on. Remediation guidance may propose candidate artifact IDs, missing relationship types, missing sections, or status changes. Guidance must not claim that a proposed fix is accepted; acceptance remains a governance outcome represented by review and decision artifacts.

Future automated fixes are allowed only after an accepted remediation specification defines safe transformations, review expectations, source-map updates, and rollback behavior.

## Interaction with compiler behavior

- Linter rules may run before a compiler to catch authoring issues, after compiler passes to evaluate normalized outputs, or against generated artifact contracts.
- Linter findings must not reinterpret DSL semantics differently from the compiler baseline.
- Compiler error diagnostics remain authoritative for semantic invalidity; linter rules may add governance, completeness, maintainability, and sustainability findings around those errors.
- Linter outputs must reference compiler manifest, source map, coverage map, or generated contract identifiers when the finding depends on compiler output.

## Failure modes

| Failure mode | Expected behavior |
| --- | --- |
| Invalid input model | Emit diagnostics and mark rule families that could not be evaluated. |
| Unsupported DSL version | Emit compatibility diagnostics and evaluate only version-independent rules when safe. |
| Missing rule profile | Use the accepted default profile and report the default profile in the manifest. |
| Invalid waiver metadata | Ignore the waiver for gating purposes and emit a waiver diagnostic. |
| Unresolved relationship | Emit relationship diagnostics and skip dependent traceability rules for affected subjects. |
| Missing compiler outputs | Evaluate source-level rules and mark compiler-output-dependent rules as skipped. |
| Internal linter inconsistency | Emit a manifest-level error and mark results not reviewable. |

## Conformance tests

A future linter implementation must provide conformance tests before it can be accepted. The minimum conformance suite is:

| Test ID | Scenario | Expected result |
| --- | --- | --- |
| ENGC-LNT-T001 | Valid workspace with accepted requirements, architecture, DSL specification, compiler specification, and linter rule profile. | No error findings; manifest, diagnostics report, and rule evaluation summary are produced. |
| ENGC-LNT-T002 | Duplicate artifact IDs in linted scope. | ENGC-LNT-R001 emits an error. |
| ENGC-LNT-T003 | Accepted artifact lacks governing traceability. | ENGC-LNT-R011 emits an error. |
| ENGC-LNT-T004 | Implementation-oriented artifact seeks acceptance before accepted technology authority. | ENGC-LNT-R022 emits an error. |
| ENGC-LNT-T005 | Automation implementation seeks acceptance without accepted governing specification. | ENGC-LNT-R023 emits an error. |
| ENGC-LNT-T006 | Automation-impacting artifact lacks sustainability metadata. | ENGC-LNT-R050 emits the configured warning or stricter severity. |
| ENGC-LNT-T007 | Warning is raised to error by strict profile. | Diagnostic rule ID and subject remain stable while severity follows the profile. |
| ENGC-LNT-T008 | Error is waived without accepted waiver metadata. | Waiver is ignored for gating and waiver diagnostic is emitted. |
| ENGC-LNT-T009 | Same valid workspace linted twice with identical profile. | Diagnostics, summaries, and manifest identifiers are equivalent. |
| ENGC-LNT-T010 | Compiler outputs are unavailable. | Source-level rules run and compiler-output-dependent rules are reported as skipped. |

## Determinism and reproducibility

A conforming linter must produce equivalent diagnostics, rule summaries, waiver handling, skipped-rule records, and manifests for equivalent inputs and profiles. If ordering is visible in outputs, the ordering rule must be specified and cannot depend on implementation-specific traversal behavior.

## Versioning and compatibility

Linter specifications must declare compatibility with accepted DSL and compiler specification versions. Compatible changes may add optional rules, info diagnostics, remediation metadata, or stricter opt-in profiles when existing rule meaning is preserved. Breaking changes include reinterpreting rule semantics, changing default severity for an error rule without governance approval, removing required diagnostics, weakening phase-gate rules, or changing waiver requirements.

## Risks

- Excessive linting could create process friction if warnings are treated as unreviewable blockers.
- Local suppressions could undermine governance if waivers are not represented as reviewable artifacts.
- Linter and compiler diagnostics could diverge if future implementations do not share the accepted semantic model.
- Sustainability findings may become stale if dependency or generated-output changes are not re-linted.

## Review notes

- This baseline is complete when a future linter implementation can be evaluated against rule families, severity semantics, configuration boundaries, remediation guidance, failure modes, and conformance tests.
- Reviewer behavior, CLI behavior, project generator behavior, and automated remediation remain future specifications.
