# Makefile for docker - https://gitlab.com/martisak/latex-pipeline/-/blob/master/Makefile
# alternative maikefile for sublime - https://github.com/Amet13/bachelor-diploma/blob/master/Makefile

SOURCES=main.tex
PAPER_DIR=paper/
OUT_DIR=latexmk/
PDF_OBJECTS=$(SOURCES:.tex=.pdf)

LATEXMK=latexmk
LATEXMK_PDF=-output-format=pdf -pdf -pdflatex="pdflatex -interaction=nonstopmode"
LATEXMK_OPTIONS=-r .latexmk -cd $(PAPER_DIR)$(SOURCES) -outdir=$(OUT_DIR) -bibtex $(LATEXMK_PDF)

DOCKER=docker
DOCKER_COMMAND=run --rm -w /data/ -u $(shell id -u):$(shell id -g) --env LATEXMK_OPTIONS_EXTRA=$(LATEXMK_OPTIONS_EXTRA)
DOCKER_MOUNT=-v "$(shell pwd)":/data

all: render

pdf: $(PAPER_DIR)$(PDF_OBJECTS)

%.pdf: %.tex
	@echo Input file: $<
	$(LATEXMK) $(LATEXMK_OPTIONS_EXTRA) $(LATEXMK_OPTIONS) $<

render:
	$(DOCKER) $(DOCKER_COMMAND) $(DOCKER_MOUNT) texlive/texlive:latest make pdf

check:

	@- $(foreach FILE, $(PAPER_DIR)$(OUT_DIR)$(PDF_OBJECTS), \
		test -e $(FILE) ; \
	)

	rspec spec/pdf_spec.rb

figures:
	$(DOCKER) $(DOCKER_COMMAND) $(DOCKER_MOUNT) python:latest make -C /data/$(PAPER_DIR)figures

clean:
	$(DOCKER) $(DOCKER_COMMAND) $(DOCKER_MOUNT) texlive/texlive:latest make local-clean

local-clean:
	-$(LATEXMK) -r .latexmk -cd $(PAPER_DIR)$(SOURCES) -outdir=$(OUT_DIR) -bibtex -C 
	-rm -d $(PAPER_DIR)$(OUT_DIR) ### only delete empty dir
	-make -C figures clean

dist-clean: clean
	-rm $(FILENAME).tar.gz

debug:
	$(DOCKER) $(DOCKER_COMMAND) -it $(DOCKER_MOUNT) texlive/texlive:latest bash

debug-figures:
	$(DOCKER) $(DOCKER_COMMAND) -it $(DOCKER_MOUNT) python:latest bash

check_docker:
	$(DOCKER) $(DOCKER_COMMAND) -it $(DOCKER_MOUNT) ruby:2.7.1 bundle update --bundler; make check

.PHONY: figures