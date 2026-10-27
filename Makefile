lint: .ylint .alint

.alint:
	uv run ansible-lint --config .config/ansible-lint.yml
	@touch $@

.ylint:
	uv run yamllint --config-file .config/yamllint .
	@touch $@

# --------------------------------

.PHONY: clean
clean:
	@/bin/rm -f .alint .ylint

# --------------------------------

init-uv:
	uv python install 3.14
	uv init
	uv python pin python3.14
	uv add -r    requirements.raw
	uv export -o requirements.txt > /dev/null

update-uv:
	uv add -r    requirements.raw
	uv export -o requirements.txt > /dev/null
