.PHONY: validate

validate:
	@test -f MASTER_PROMPT.md
	@test -f README.md
	@test -f CHANGELOG.md
	@test -f docs/constitution/engineering-constitution.md
	@test -f docs/roadmap/ROADMAP.md
