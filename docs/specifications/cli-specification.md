# CLI Specification Baseline

## Status

Accepted baseline for Milestone 9.

## Purpose

This specification defines the expected behavior of a future Engineering Compiler command-line interface. The CLI provides a deterministic, scriptable boundary for invoking specification-driven validation, compilation, linting, review, artifact inspection, and evidence reporting. It uses the accepted DSL, compiler pass, linter rule, and reviewer baselines while remaining independent of implementation language, packaging system, shell, operating system, terminal framework, storage format, service API, or distribution channel.

## Scope

This baseline covers:

- Command responsibilities and invocation boundaries.
- Input discovery, profile selection, and output contracts.
- Exit semantics, diagnostics, and automation behavior.
- Interactions with compiler, linter, and reviewer specifications.
- Failure modes and conformance-test expectations for future implementations.

## Facts

- The DSL specification baseline defines stable artifact identity, lifecycle status, typed relationships, validation rules, deterministic interpretation, phase boundaries, and compatibility policy.
- The compiler pass specification baseline defines normalized semantic outputs, diagnostics, traceability coverage, source maps, generated artifact contracts, manifests, failure modes, and conformance-test expectations.
- The linter rule specification baseline defines rule families, severities, configuration boundaries, remediation guidance, waiver requirements, and conformance-test expectations.
- The reviewer specification baseline defines reviewer inputs, evidence model, criteria evaluation, recommendation states, acceptance boundaries, failure modes, and conformance-test expectations.
- No concrete CLI implementation, command parser, executable name, package format, terminal UI, configuration format, service transport, or technology stack has been selected.
- This document is normative for future CLI, generator, automation, and implementation specifications, but does not implement any of them.

## Non-goals

- Selecting implementation technology, shell syntax extensions, command parser libraries, package managers, output serialization formats, color libraries, terminal UI frameworks, or hosting integrations.
- Redefining DSL semantics, compiler passes, linter rules, reviewer criteria, or governance authority.
- Defining project generator behavior beyond CLI invocation boundaries that future generator specifications may use.
- Requiring a network service, daemon, repository host, or interactive workflow.
- Automatically accepting, rejecting, merging, publishing, or rewriting governed artifacts without explicit command scope and governed authority.

## Traceability

| CLI ID | Related requirement | Requirement summary | Satisfied by |
| --- | --- | --- | --- |
| ENGC-CLI-001 | ENGC-AUT-004 | The ecosystem must define CLI behavior before implementation. | Command responsibilities, invocation boundaries, output contracts, and conformance tests. |
| ENGC-CLI-002 | ENGC-TRC-001 | The ecosystem must support traceability checking. | `trace` behavior, evidence manifests, and diagnostic output contracts. |
| ENGC-CLI-003 | ENGC-TRC-002 | Artifacts must maintain traceability. | Input discovery, artifact graph inspection, and compiler/reviewer evidence routing. |
| ENGC-CLI-004 | ENGC-ART-009 | Specification artifacts must precede automation. | This CLI specification before CLI implementation. |
| ENGC-CLI-005 | ENGC-FND-002 | Architecture and implementation must follow requirements. | Phase gates, dry-run behavior, and implementation-neutral boundaries. |
| ENGC-CLI-006 | ENGC-GRN-001 | Green Computing must be considered in engineering decisions. | Automation cost visibility, no-op detection, and sustainability evidence routing. |

## Command model

A conforming CLI must expose command behavior as semantic operations, even if a future executable chooses different concrete command names. The minimum command families are:

| Command family | Required behavior | Primary evidence |
| --- | --- | --- |
| `init` | Establish a governed workspace boundary without selecting implementation-specific project structure beyond accepted templates and configuration semantics. | Workspace manifest and initialized artifact references. |
| `validate` | Parse and validate DSL artifacts against accepted DSL semantics and compatibility rules. | DSL diagnostics and validation summary. |
| `compile` | Invoke accepted compiler pass behavior and produce normalized model, generated artifact contracts, source maps, traceability coverage, and compiler manifest. | Compiler outputs and manifest. |
| `lint` | Invoke accepted linter rule behavior with explicit profile and waiver handling. | Linter diagnostics, waiver summary, rule summary, and lint manifest. |
| `review` | Invoke accepted reviewer behavior for a declared request, scope, and target lifecycle transition. | Review report, criteria matrix, recommendation, evidence manifest, and follow-up register. |
| `trace` | Inspect traceability coverage, missing links, stale links, and governing-source relationships. | Traceability report and related diagnostics. |
| `explain` | Provide deterministic explanation of diagnostics, rules, criteria, command effects, and remediation guidance. | Explanation output citing stable IDs and governing sources. |
| `version` | Report CLI capability, supported specification versions, compatibility profile, and reproducibility metadata. | Version and compatibility report. |

A future implementation may add command families only when they preserve these semantics and do not weaken accepted compiler, linter, reviewer, or governance boundaries.

## Invocation boundaries

- Every command must declare whether it reads artifacts, writes artifacts, writes generated outputs, or produces report-only evidence.
- Commands that may write files must support a report-only or dry-run mode that shows intended changes without modifying governed artifacts.
- Commands must not perform network access, dependency installation, repository mutation, publication, merge, or acceptance decisions unless a future accepted specification explicitly authorizes that behavior.
- Commands must accept an explicit workspace or scope boundary so automation can avoid accidental traversal outside the governed context.
- Commands must support non-interactive execution. Interactive assistance may be added later, but all required behavior must be available without prompts.
- Commands must be deterministic for equivalent inputs, profiles, and specification versions.

## Input contracts

A conforming CLI must define inputs by semantics, not by implementation-specific file formats.

| Input | Required semantics | Applies to |
| --- | --- | --- |
| Workspace boundary | Root, included artifacts, excluded paths or artifact IDs, and governing configuration scope. | All commands except standalone `version`. |
| Artifact selection | Artifact IDs, kinds, lifecycle statuses, relationship filters, or changed artifact set. | `validate`, `compile`, `lint`, `review`, `trace`, `explain`. |
| Profile selection | Specification version, rule profile, review profile, output detail level, and compatibility mode. | `compile`, `lint`, `review`, `trace`, `explain`. |
| Review request | Scope, requested decision, target lifecycle transition, reviewer authority, and milestone or artifact boundary. | `review`. |
| Waiver and governance context | Accepted decisions, waivers, prior reviews, milestone status, sustainability evidence, and governing requirements. | `lint`, `review`, `trace`. |
| Output destination | Report destination, generated-output destination, overwrite policy, and reproducibility metadata policy. | Commands that produce evidence or generated output. |

Missing required input must produce structured diagnostics and a non-success exit state rather than implicit guesses.

## Output contracts

CLI output must be suitable for both humans and automation.

| Output class | Required content | Constraints |
| --- | --- | --- |
| Human summary | Command, scope, high-level result, counts by severity or state, and next action when applicable. | Must not be the only available evidence for automation-significant commands. |
| Structured report | Stable schema identifier, command metadata, inputs, outputs, diagnostics, result state, and reproducibility metadata. | Must be deterministic for equivalent inputs and profiles. |
| Diagnostics | Stable diagnostic ID, severity, subject, location or artifact reference when available, message, remediation, and governing source. | Must preserve compiler, linter, and reviewer diagnostic identities. |
| Manifest | Produced artifact references, specification versions, profile identifiers, skipped work, warnings, and checksums or equivalent integrity metadata when specified by future implementation decisions. | Must support reproducibility and review evidence. |
| Generated outputs | Generated artifacts and contracts as defined by the compiler baseline. | Must not silently overwrite governed source artifacts. |

## Exit semantics

A conforming CLI must provide stable exit categories. Concrete numeric exit codes may be selected later, but the categories are normative.

| Exit category | Meaning | Examples |
| --- | --- | --- |
| `success` | Command completed and no blocking diagnostic or failed recommendation applies to the requested operation. | Clean validation, lint with only accepted warnings, review recommendation `accept`. |
| `completed-with-findings` | Command completed but produced non-blocking warnings, risks, advisory findings, or `accept-with-conditions`. | Lint warnings, reviewer conditions, traceability advisories. |
| `validation-failed` | DSL semantic validation or compiler input validation failed. | Invalid artifact identity, incompatible DSL version, compiler blocker diagnostic. |
| `policy-failed` | Linter or reviewer blocking policy failed. | Unwaived linter error, reviewer recommendation `revise` or `reject`. |
| `not-reviewable` | Required evidence is missing, contradictory, unsupported, or insufficient for the requested review. | Missing lifecycle transition, contradictory governance authority. |
| `usage-error` | Invocation is malformed or required command input is absent. | Unknown option, missing workspace, unsupported profile name. |
| `internal-error` | The CLI detects an implementation inconsistency or unexpected failure. | Inconsistent manifest, uncaught execution failure, nondeterministic result detection. |

Automation must be able to distinguish successful completion with non-blocking findings from blocking failure.

## Configuration and profiles

- Configuration must be explicit, inspectable, and scoped to a governed workspace or command invocation.
- Defaults must be documented and must not hide diagnostics, waivers, skipped inputs, or generated-output effects.
- Rule profiles and review profiles must not weaken baseline blocking behavior unless an accepted governance waiver or future specification permits the change.
- Environment-derived configuration must be reported in the evidence manifest when it can affect outputs.
- Profile resolution must be deterministic and explainable through `explain` or equivalent behavior.

## Interaction with compiler, linter, and reviewer behavior

- `compile` must preserve compiler diagnostic IDs, source maps, traceability coverage, generated artifact contracts, and compiler manifest semantics.
- `lint` must preserve linter rule IDs, severities, waiver handling, remediation guidance, and lint manifest semantics.
- `review` must preserve reviewer criteria IDs, finding severities, recommendation states, acceptance boundaries, evidence manifest, and follow-up register semantics.
- CLI commands may orchestrate compiler, linter, and reviewer behavior, but must not reinterpret their normative outcomes.
- If a command skips an upstream phase, the output must identify the skipped evidence and whether downstream results are complete, partial, or not reviewable.

## Failure modes

| Failure mode | Expected behavior |
| --- | --- |
| Missing workspace boundary | Emit `usage-error` or structured diagnostic and avoid implicit traversal. |
| Unsupported specification version | Emit `validation-failed` or `not-reviewable` according to command context and identify supported versions. |
| Invalid command option or profile | Emit `usage-error` with explanation and no artifact mutation. |
| Compiler errors during `compile` or downstream command | Preserve compiler diagnostics and return `validation-failed` unless downstream review is explicitly evaluating failure evidence. |
| Unwaived linter errors during `lint` or downstream command | Preserve linter diagnostics and return `policy-failed`. |
| Reviewer recommendation `revise` or `reject` | Return `policy-failed` and preserve review report. |
| Reviewer recommendation `not-reviewable` | Return `not-reviewable` and identify missing or contradictory evidence. |
| Attempted write without explicit output destination or overwrite policy | Refuse mutation and return `usage-error` or `policy-failed` according to governance context. |
| Internal inconsistency between summary and structured report | Return `internal-error` and mark produced evidence unreliable. |

## Conformance tests

A future CLI implementation must provide conformance tests before it can be accepted. The minimum conformance suite is:

| Test ID | Scenario | Expected result |
| --- | --- | --- |
| ENGC-CLI-T001 | `version` is invoked in a valid environment. | Reports supported specification versions, compatibility profile, and reproducibility metadata with `success`. |
| ENGC-CLI-T002 | `validate` is invoked against valid DSL artifacts in an explicit workspace. | Produces validation summary and structured report with `success`. |
| ENGC-CLI-T003 | `validate` is invoked against an invalid artifact identity. | Preserves DSL diagnostic and returns `validation-failed`. |
| ENGC-CLI-T004 | `compile` is invoked on valid artifacts. | Produces normalized model, source map, generated artifact contracts, traceability coverage, compiler manifest, and `success`. |
| ENGC-CLI-T005 | `lint` finds an unwaived linter error. | Produces linter diagnostics and returns `policy-failed`. |
| ENGC-CLI-T006 | `review` receives complete evidence with clean compiler and linter results. | Produces review report and recommendation `accept` with `success`. |
| ENGC-CLI-T007 | `review` lacks target lifecycle transition. | Produces reviewer blocker and returns `not-reviewable`. |
| ENGC-CLI-T008 | Command with write capability is run in dry-run mode. | Reports intended outputs without modifying governed artifacts. |
| ENGC-CLI-T009 | Equivalent inputs, profiles, and specification versions are used twice. | Structured reports, diagnostics, manifests, and exit categories are equivalent. |
| ENGC-CLI-T010 | Unknown option or unsupported profile is supplied. | Returns `usage-error` without artifact mutation. |
| ENGC-CLI-T011 | Downstream command skips compiler evidence. | Output identifies skipped evidence and marks downstream result complete, partial, or not reviewable. |
| ENGC-CLI-T012 | Reviewer recommendation is `accept-with-conditions`. | Returns `completed-with-findings` and preserves follow-up register. |

## Determinism and reproducibility

A conforming CLI must produce equivalent result states, structured reports, diagnostics, manifests, generated-output contracts, and exit categories for equivalent inputs, profiles, and specification versions. If output ordering is visible, the ordering rule must be specified and must not depend on implementation-specific filesystem traversal, map iteration, locale, clock precision, or terminal behavior.

## Versioning and compatibility

CLI specifications must declare compatibility with accepted DSL, compiler, linter, and reviewer specification versions. Compatible changes may add optional command families, optional output fields, additional explanation detail, or stricter opt-in profiles when existing command semantics and exit categories are preserved. Breaking changes include weakening blocking failures, hiding diagnostics, reinterpreting reviewer recommendations, changing generated artifact contracts, allowing implicit mutation, or removing non-interactive execution.

## Risks

- Users may confuse CLI orchestration with governance authority if acceptance boundaries are not explicit.
- Human-friendly output may drift from structured evidence unless conformance tests compare both forms.
- Defaults may accidentally hide skipped evidence, stale waivers, or sustainability risks.
- Future implementations may introduce environment-dependent behavior unless configuration and reproducibility metadata are explicit.

## Review notes

- This baseline is complete when a future CLI implementation can be evaluated against command responsibilities, invocation boundaries, input and output contracts, exit semantics, failure modes, and conformance tests.
- Project generator behavior, concrete command names, package distribution, terminal interaction, and implementation technology remain future specifications.
