lint: .ylint .alint

.alint:
	ansible-lint --config .config/ansible-lint.yml
	@touch $@

.ylint:
	yamllint --config-file .config/yamllint .
	@touch $@

push: lint
	@mkdir -p /mnt/hgfs/shared/ansible-role-app-nginx
	rsync -a .config .gitignore [A-z]* /mnt/hgfs/shared/ansible-role-app-nginx

# --------------------------------

.PHONY: clean
clean:
	@/bin/rm -f .alint .ylint
