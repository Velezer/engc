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
