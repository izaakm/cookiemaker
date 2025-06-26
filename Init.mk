SHELL := /bin/bash

TRACKING := .gitignore README.md Makefile

.PHONY: init
init: | .git
	@echo "Creating new project ..."
	$(MAKE) -f Init.mk .gitignore
	$(MAKE) -f Init.mk README.md

README.md: | .git
	@read -p "Enter project title (human readable): " title; \
	echo "% $$title" > README.md; \
	git add README.md; \
	git commit -m "Initialize README.md"; \
	echo "Project \"$$title\" created."

.gitignore: | .git
	@echo "*" >> $@
	@echo ".*" >> $@
	@for file in $(TRACKING); do \
		echo "!$$file" >> $@; \
	done
	git add .gitignore
	git commit -m "Add .gitignore file"

.git:
	git init .
	git commit --allow-empty -m "Initialize repository"

clean:
	rm -i Init.mk 
