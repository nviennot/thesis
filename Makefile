PAPER = proposal
TEX = $(wildcard *.tex)
FIGS = $(wildcard figures/*/*)
BIB = proposal.bib

.PHONY: clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) Makefile
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.toc *.aux *.bbl *.blg *.log *.out $(PAPER).pdf $(PAPER).dvi
