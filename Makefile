.PHONY: fmt
fmt:
	terraform fmt -recursive

.PHONY: validate
validate:
	terraform fmt -check
	terraform validate

