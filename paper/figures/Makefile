# This file runs code to make figures used in the report.
SOURCES=$(wildcard *.py)
TMPVAR := $(SOURCES)
SOURCES = $(filter-out utils.py, $(TMPVAR))

TEX_OBJECTS=$(SOURCES:.py=.tex)

BOUNDINGBOX=path
BBLOWERLEFT=(-1.2cm,-1.1cm)
BBUPPERRIGHT=(7.1cm, 3.6cm)

all: $(TEX_OBJECTS)

before_pgf:
	pip install -r requirements.txt

%.tex: %.py before_pgf
	python $<
	sed -i -e '3i \\\$(BOUNDINGBOX) $(BBLOWERLEFT) rectangle $(BBUPPERRIGHT);' $@

clean:
	-rm $(TEX_OBJECTS)
