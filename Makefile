.PHONY: validate

validate:
	@test -f MASTER_PROMPT.md
	@test -f README.md
	@test -f CHANGELOG.md
	@test -f docs/constitution/engineering-constitution.md
	@test -f docs/roadmap/ROADMAP.md
	@test -f docs/requirements/product-vision.md
	@test -f docs/requirements/requirements-baseline.md
	@test -f docs/traceability/requirements-traceability.md
	@test -f docs/architecture/architecture-baseline.md
	@test -f docs/architecture/decision-record-requirements.md
	@test -f docs/technology/technology-selection-criteria.md
	@test -f docs/templates/artifact-templates.md
	@test -f docs/reviews/milestone-2-review.md
	@test -f docs/reviews/milestone-3-review.md
