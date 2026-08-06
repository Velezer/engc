# Compiler Pass Specification Baseline

## Status

Accepted baseline for Milestone 6.

## Purpose

This specification defines the expected behavior of a future Engineering Compiler at the pass and artifact-contract level. It uses the accepted DSL semantic model as input while remaining independent of implementation language, parser, package format, framework, or runtime.

## Scope

This baseline covers:

- Compiler inputs and workspace assumptions.
- Compiler outputs and generated artifact contracts.
- Deterministic pass ordering and pass responsibilities.
- Diagnostic, failure-mode, and partial-output behavior.
- Conformance-test expectations for future implementations.
- Traceability obligations from source DSL artifacts to generated artifacts.

## Facts

- The DSL specification baseline defines artifact identity, lifecycle status, typed relationships, deterministic interpretation, phase boundaries, validation rules, and compatibility policy.
- No concrete DSL syntax, parser, implementation language, CLI command, storage backend, or generator runtime has been selected.
- This document is normative for future compiler, CLI, linter, reviewer, and generator specifications, but does not implement any of them.

## Non-goals

- Selecting compiler implementation technology, parser tooling, schemas, package formats, or build systems.
- Defining a concrete command-line interface, service API, or runtime execution model.
- Generating application source code or executable product behavior.
- Replacing governance review, decision authority, or human acceptance of generated artifacts.
- Defining linter-only style rules that do not affect compiler semantics.

## Traceability

| Compiler ID | Related requirement | Requirement summary | Satisfied by |
| --- | --- | --- | --- |
| ENGC-CMP-001 | ENGC-AUT-001 | Automation must be specification driven. | Pass contracts, deterministic stages, and conformance tests. |
| ENGC-CMP-002 | ENGC-TRC-002 | Artifacts must maintain traceability. | Source map, coverage map, and generated artifact lineage requirements. |
| ENGC-CMP-003 | ENGC-ART-009 | Specification artifacts must precede automation. | This compiler specification before compiler implementation. |
| ENGC-CMP-004 | ENGC-GRN-001 | Green Computing must be considered in engineering decisions. | Sustainability metadata pass and generated impact summaries. |
| ENGC-CMP-005 | ENGC-FND-002 | Architecture and implementation must follow requirements. | Phase-gate validation before generated implementation-oriented contracts. |

## Compiler inputs

A conforming compiler specification must define inputs as semantic artifacts rather than technology-specific files. The minimum input set is:

| Input | Required semantics | Notes |
| --- | --- | --- |
| Workspace model | DSL version, artifact inventory, validation profile, and workspace identity. | May originate from any future concrete syntax if it produces the accepted DSL semantic model. |
| Artifact graph | Artifacts with stable IDs, lifecycle status, kind, ownership or stewardship, and typed relationships. | Relationship endpoints must be resolvable before transformation passes run. |
| Validation profile | Severity policy, compatibility mode, and optional strictness settings. | Profiles must not change normative semantics; they may only select permitted diagnostics thresholds. |
| Generation request | Requested artifact families, target milestone or scope, and output contract identifiers. | Requests must not bypass phase boundaries or accepted upstream artifacts. |
| Prior outputs | Previously generated contracts and source maps when incremental comparison is requested. | Prior outputs are inputs to drift detection, not hidden sources of truth. |

## Compiler outputs

A conforming compiler must produce structured outputs that can be reviewed without requiring compiler internals.

| Output | Required content | Review purpose |
| --- | --- | --- |
| Normalized semantic model | Canonical artifact graph after validation-safe normalization. | Allows deterministic comparison across conforming implementations. |
| Diagnostics report | Structured diagnostics with rule ID, severity, subject, message, remediation, and governing source. | Allows humans and automation to understand blocking and non-blocking findings. |
| Traceability coverage map | Upstream-to-downstream relationship coverage, missing links, orphan artifacts, and satisfaction evidence. | Demonstrates whether generated artifacts remain connected to requirements and decisions. |
| Generated artifact contracts | Technology-neutral descriptions of generated artifacts, required sections, provenance, and review obligations. | Defines what a future generator may materialize without choosing an implementation stack. |
| Source map | Mapping from generated contract elements back to DSL artifact IDs and relationship IDs. | Enables review, audit, and impact analysis. |
| Sustainability summary | Declared automation impact, expected generated-work volume, dependency implications if known, and measurement points. | Preserves Green Computing review evidence. |
| Compilation manifest | Compiler specification version, DSL version, input summary, pass list, output identifiers, and result status. | Supports reproducibility and governance review. |

## Pass model

Compiler passes must be deterministic, ordered, and independently describable. A pass may read outputs from earlier passes but must not reinterpret source artifacts in a way that conflicts with the DSL semantic model.

| Pass | Responsibility | Required inputs | Required outputs | Blocking conditions |
| --- | --- | --- | --- | --- |
| ENGC-CMP-P001: Intake | Accept the workspace model and generation request as declared inputs. | Workspace model, generation request. | Input inventory and declared compilation scope. | Missing workspace identity, missing DSL version, or empty requested scope. |
| ENGC-CMP-P002: Version compatibility | Determine whether the workspace DSL version is supported by the requested compiler specification version. | Input inventory, DSL version policy. | Compatibility result and migration diagnostics. | Unsupported breaking version without an accepted migration path. |
| ENGC-CMP-P003: Semantic validation | Apply DSL validation rules required before transformation. | Artifact graph, validation profile. | Validated semantic model and diagnostics. | Any error-severity DSL diagnostic in the requested scope. |
| ENGC-CMP-P004: Relationship resolution | Resolve typed relationships and calculate graph reachability. | Validated semantic model. | Resolved artifact graph and unresolved-reference diagnostics. | Missing endpoint for a required relationship. |
| ENGC-CMP-P005: Phase-gate validation | Enforce accepted phase boundaries for requested generated contracts. | Resolved artifact graph, generation request. | Phase readiness result. | Requested output lacks accepted upstream requirements, architecture, or specification authority. |
| ENGC-CMP-P006: Traceability analysis | Compute satisfaction, verification, dependency, and orphan coverage. | Resolved artifact graph. | Traceability coverage map. | Missing traceability required for a generated contract. |
| ENGC-CMP-P007: Contract planning | Select the generated artifact contracts permitted by scope and traceability. | Generation request, phase readiness result, coverage map. | Contract plan with contract IDs and source obligations. | Requested contract has no governing specification or accepted source. |
| ENGC-CMP-P008: Contract synthesis | Produce technology-neutral generated artifact contracts from the plan. | Contract plan, source artifacts. | Generated artifact contracts and source map entries. | Ambiguous source semantics or conflicting obligations. |
| ENGC-CMP-P009: Sustainability assessment | Summarize generated-work volume, automation impact, and measurement points. | Contract plan, generated contracts, source metadata. | Sustainability summary and warnings. | Missing required Green Computing metadata for automation-impacting contracts when configured as error. |
| ENGC-CMP-P010: Manifest finalization | Produce a reproducible manifest and final result status. | All prior pass outputs. | Compilation manifest and final diagnostics report. | Inconsistent pass results or missing required output identifiers. |

## Generated artifact contract requirements

Every generated artifact contract must include:

- Stable generated contract ID.
- Contract kind and intended artifact family.
- Source artifact IDs and relationship IDs used to justify the contract.
- Required sections or fields the generated artifact must contain.
- Lifecycle status expectation for generated material.
- Review criteria and acceptance evidence expected before use.
- Regeneration policy, including how drift is detected and reported.
- Compatibility expectations with the DSL and compiler specification versions.
- Sustainability considerations when the contract introduces automation, dependencies, build work, operational workflows, or measurable runtime behavior.

Generated contracts must not claim acceptance of the generated artifact. Acceptance remains a governance outcome represented by review and decision artifacts.

## Diagnostics

Diagnostics must be stable enough for tests and downstream tooling. Each diagnostic must include:

- Rule or pass ID.
- Severity of `error`, `warning`, or `info`.
- Artifact, relationship, pass, or output subject.
- Human-readable message.
- Remediation guidance.
- Governing requirement, DSL rule, compiler rule, or decision reference.

A compiler must stop before contract synthesis when an error invalidates semantic interpretation, relationship resolution, or phase readiness. A compiler may continue after warnings only when output contracts can still be interpreted deterministically.

## Failure modes

| Failure mode | Expected behavior |
| --- | --- |
| Invalid input model | Emit diagnostics and no generated artifact contracts. |
| Unsupported DSL version | Emit compatibility diagnostics and no generated artifact contracts unless an accepted migration path is selected. |
| Unresolved relationship | Emit relationship diagnostics and block affected generated contracts. |
| Phase-gate violation | Emit phase diagnostics and block implementation-oriented or automation-oriented generated contracts. |
| Conflicting source obligations | Emit conflict diagnostics and block ambiguous contracts. |
| Missing sustainability metadata | Emit warning or error according to the validation profile and block only when configured as error. |
| Internal compiler inconsistency | Emit a manifest-level error and mark all outputs not reviewable. |

## Conformance tests

A future compiler implementation must provide conformance tests before it can be accepted. The minimum conformance suite is:

| Test ID | Scenario | Expected result |
| --- | --- | --- |
| ENGC-CMP-T001 | Valid workspace with accepted requirements, architecture, DSL specification, and compiler generation request. | All passes complete and produce manifest, source map, coverage map, diagnostics report, sustainability summary, and generated contracts. |
| ENGC-CMP-T002 | Duplicate artifact IDs. | Semantic validation emits an error and no contracts are synthesized. |
| ENGC-CMP-T003 | Relationship endpoint references a missing artifact. | Relationship resolution emits an error and affected contracts are blocked. |
| ENGC-CMP-T004 | Implementation-oriented contract requested without accepted upstream architecture. | Phase-gate validation emits an error and blocks the requested contract. |
| ENGC-CMP-T005 | Workspace uses unsupported breaking DSL version. | Version compatibility emits an error unless an accepted migration path is selected. |
| ENGC-CMP-T006 | Automation-impacting contract lacks sustainability metadata. | Sustainability assessment emits the configured warning or error. |
| ENGC-CMP-T007 | Same valid workspace compiled twice with identical request. | Normalized model, generated contract IDs, source map, coverage map, and manifest are equivalent. |
| ENGC-CMP-T008 | Prior generated output no longer matches source artifact relationships. | Drift diagnostics identify changed source obligations and affected contract IDs. |

## Determinism and reproducibility

A conforming compiler must produce equivalent normalized models, diagnostics, source maps, coverage maps, generated contract IDs, and manifests for equivalent inputs. If ordering is visible in outputs, the ordering rule must be specified and cannot depend on implementation-specific traversal behavior.

## Versioning and compatibility

Compiler specifications must declare their compatibility with accepted DSL versions. Compatible compiler specification changes may add optional outputs, warnings, or contract metadata when existing output meaning is preserved. Breaking changes include reinterpreting pass semantics, removing required outputs, changing generated contract identity rules, or weakening phase-gate requirements.

## Risks

- Overly broad generated contracts could obscure review accountability.
- Too many pass responsibilities in one implementation unit could make conformance difficult to prove.
- Future concrete syntax decisions may reveal additional source-map needs.
- Incremental compilation may introduce hidden state if prior outputs are not treated as explicit inputs.

## Review notes

- This baseline is complete when a future compiler implementation can be evaluated against pass responsibilities, output contracts, diagnostics, failure modes, and conformance tests.
- CLI behavior, concrete syntax parsing, linter rules, and project generator behavior remain future specifications.
