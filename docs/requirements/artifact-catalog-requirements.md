# Artifact Catalog and Specification-Family Requirements

## Status

Accepted baseline for Milestone 4.

## Purpose

This catalog defines the required documentation families and future specification families before DSL design or automation implementation begins.

## Facts

- The repository currently contains governance, requirements, architecture, technology-selection criteria, artifact templates, milestone reviews, and traceability artifacts.
- No DSL grammar, compiler, linter, reviewer, CLI, generator, or implementation technology has been accepted.
- The catalog is requirements-level guidance and does not select tools, frameworks, programming languages, storage formats, or runtime platforms.

## Constraints

- Requirements must remain traceable to stable identifiers from the requirements baseline.
- Catalog entries must distinguish required content from optional examples.
- Specification families must be defined before any implementation work that depends on them.
- New dependencies, formats, or execution environments require accepted decision records before adoption.

## Documentation artifact catalog requirements

| Catalog ID | Related requirement | Artifact family | Required content | Verification |
| --- | --- | --- | --- | --- |
| ENGC-CAT-001 | ENGC-ART-002 | Handbook | User journeys, role-based workflows, glossary, repository orientation, contribution workflow, and links to standards and playbooks. | Handbook review confirms every workflow links to governing requirements or standards. |
| ENGC-CAT-002 | ENGC-ART-003 | Standards | Normative rules for requirements, architecture, technology selection, specifications, implementation readiness, tests, reviews, traceability, and Green Computing. | Standards review confirms each rule has rationale, severity, and verification guidance. |
| ENGC-CAT-003 | ENGC-ART-004 | Templates | Reusable structures for requirements, specifications, decision records, reviews, checklists, playbooks, metric definitions, and release notes. | Template review confirms required classification, traceability, review, and Green Computing sections are present where applicable. |
| ENGC-CAT-004 | ENGC-ART-005 | Checklists | Repeatable review gates for milestone readiness, requirements quality, architecture quality, technology decisions, specification completeness, implementation readiness, release readiness, and dependency review. | Checklist review confirms each item is objective, answerable, and tied to an artifact or requirement. |
| ENGC-CAT-005 | ENGC-ART-006 | Playbooks | Step-by-step operational workflows for proposing changes, reviewing milestones, evaluating technologies, adding specifications, validating releases, managing dependencies, and handling exceptions. | Playbook review confirms preconditions, steps, outputs, rollback or escalation paths, and owners are documented. |
| ENGC-CAT-006 | ENGC-ART-007 | Governance and decision framework | Change control, decision lifecycle, review authorities, exception handling, dependency policy, deprecation policy, and acceptance criteria. | Governance review confirms decisions are auditable, reversible where feasible, and tied to review evidence. |
| ENGC-CAT-007 | ENGC-ART-008 | Metrics | Metric definitions for quality, traceability coverage, review latency, defect escape, build and validation cost, dependency count, artifact freshness, and Green Computing indicators. | Metrics review confirms each metric defines intent, formula, collection point, interpretation, and misuse risks. |

## Specification-family requirements

| Specification ID | Related requirement | Specification family | Required scope | Verification |
| --- | --- | --- | --- | --- |
| ENGC-SPEC-001 | ENGC-AUT-001 | DSL specification | Domain concepts, syntax or structure, semantic model, validation rules, versioning, examples, compatibility policy, and non-goals. | DSL specification review confirms deterministic interpretation and traceability to requirements. |
| ENGC-SPEC-002 | ENGC-AUT-001 | Compiler specification | Inputs, outputs, compilation stages, determinism rules, diagnostics, incremental behavior, failure modes, conformance tests, and artifact generation contracts. | Compiler specification review confirms implementation can be tested without unstated behavior. |
| ENGC-SPEC-003 | ENGC-AUT-002 | Linter rule specification | Rule identifiers, severity model, detection logic, remediation guidance, suppressions, configuration boundaries, and test fixtures. | Linter specification review confirms each rule is objective and traceable to a governing requirement or standard. |
| ENGC-SPEC-004 | ENGC-AUT-003 | Reviewer specification | Finding schema, review inputs, evidence requirements, risk classification, output format, false-positive handling, and human review boundaries. | Reviewer specification review confirms findings are structured, auditable, and tied to requirement IDs. |
| ENGC-SPEC-005 | ENGC-AUT-004 | CLI specification | Commands, arguments, exit codes, input and output contracts, workflow examples, error handling, configuration discovery, and backwards compatibility. | CLI specification review confirms workflows can be validated without selecting an implementation technology. |
| ENGC-SPEC-006 | ENGC-AUT-005 | Project generator specification | Generated file sets, minimal dependency policy, configuration prompts, idempotency behavior, update strategy, validation hooks, and examples. | Generator specification review confirms generated projects are governed, minimal, and reproducible. |

## Cross-cutting requirements

- Every catalog artifact and specification must include status, scope, traceability, risks, and review notes.
- Every specification must define examples and non-examples before implementation begins.
- Every automation-oriented specification must define deterministic behavior and failure modes.
- Green Computing assessment must be included where artifacts introduce automation, dependencies, generated output, build work, or operational workflows.
- Metrics must be interpreted as decision support, not as a substitute for engineering judgment.

## Risks

- Catalog requirements may become too broad unless later milestones split large artifact families into smaller specifications.
- Metrics can incentivize undesirable behavior if formulas and misuse risks are not documented.
- Specification-family requirements may need refinement once initial DSL and compiler specifications expose concrete edge cases.

## Out of scope

- Selecting implementation languages, frameworks, package managers, or data formats.
- Defining concrete DSL grammar.
- Implementing compiler, linter, reviewer, CLI, or generator behavior.
