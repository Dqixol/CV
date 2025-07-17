CONTAINER := $(shell command -v container)
DOCKER := $(shell command -v docker)
PODMAN := $(shell command -v podman)

ifdef DOCKER
CONTAINERRUNTIME := docker
else ifdef PODMAN
CONTAINERRUNTIME := podman
else ifdef CONTAINER
CONTAINERRUNTIME := container
endif

ifndef CONTAINERRUNTIME
LATEXMK := latexmk
else
LATEXMK := $(CONTAINERRUNTIME) run -it --rm -v $(PWD):/workdir texlive/texlive latexmk
endif

all: 
	@$(LATEXMK) -cd -pdf cv_academic.tex -jobname=cv_academic -auxdir=.aux 

clean:
	@rm -rf .aux
