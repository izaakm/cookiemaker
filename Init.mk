SHELL := /bin/bash

.PHONY: init
init: | .git
	@echo "Creating new project ..."
	@$(MAKE) -f Init.mk .gitignore
	@$(MAKE) -f Init.mk README.md
	@$(MAKE) -f Init.mk clean

README.md: | .git
	@read -p "Enter project title (human readable): " title; \
	echo "% $$title" > README.md; \
	echo "Project \"$$title\" created."
	@git add README.md
	@git commit -m "Initialize README.md"

.gitignore: | .git
	@echo '# Ignore dotfiles' >> $@
	@echo '.*' >> $@
	@echo '# But not .gitignore' >> $@
	@echo '!.gitignore' >> $@
	@git add .gitignore
	@git commit -m "Add .gitignore file"

.git:
	@git init .
	@git commit --allow-empty -m "Initialize repository"

clean:
	rm -i Init.mk 
