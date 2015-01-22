PAPER = thesis
TEX = $(wildcard *.tex)
FIGS = $(wildcard figures/*/*)
BIB = main.bib

.PHONY: clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) Makefile
	echo | pdflatex $(PAPER)
	echo | bibtex $(PAPER)
	echo | pdflatex $(PAPER)
	echo | pdflatex $(PAPER)

clean:
	rm -f *.lof *.lot *.toc *.aux *.bbl *.blg *.log *.out $(PAPER).pdf $(PAPER).dvi
