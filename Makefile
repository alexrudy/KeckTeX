#
#  Makefile
#  KeckTeX
#
#  Created by Alexander Rudy on 2015-01-11.
#  Copyright 2015 Alexander Rudy. All rights reserved.
#

TEXMFPATH := $(shell kpsewhich --var-value TEXMFHOME)
KECKTEX = $(TEXMFPATH)/tex/latex/keck
KECKBIB = $(TEXMFPATH)/bibtex/bst/keck
PWD = $(shell pwd)

.PHONY: info install dirs develop uninstall files

files :: $(wildcard $(PWD)/latex/*.cls) $(wildcard $(PWD)/bibtex/*.bst)

info:
	@echo "Installing KeckTeX class and bibliography styles."
	@echo 'Install directory: TEXMFPATH="'$(TEXMFPATH)'"'

install: info dirs files
	@echo "Installing..."
	cp -r $(PWD)/latex/ $(KECKTEX)/
	cp -r $(PWD)/bibtex/ $(KECKBIB)/
	
dirs:
	@echo "Creating directories..."
	mkdir -p $(KECKTEX)
	mkdir -p $(KECKBIB)
	
develop: info files
	@echo "Linking directories..."
	@mkdir -p "$(TEXMFPATH)/tex/latex/"
	@mkdir -p "$(TEXMFPATH)/bibtex/bst/"
	@if [[ ! -d "$(KECKTEX)" ]]; then ln -s "$(PWD)/latex" "$(KECKTEX)"; fi
	@echo 'ln -s "$(PWD)/latex" "$(KECKTEX)"'
	@if [[ ! -d "$(KECKBIB)" ]]; then ln -s "$(PWD)/bibtex" "$(KECKBIB)"; fi
	@echo 'ln -s "$(PWD)/bibtex" "$(KECKBIB)"'

uninstall:
	@echo "Removing KeckTeX class and bibliography styles."
	rm -r $(KECKTEX)
	rm -r $(KECKBIB)
	
