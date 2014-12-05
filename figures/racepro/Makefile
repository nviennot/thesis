
GNUPLOT := `which gnuplot`
EPS2PDF := `which epstopdf`

FIGURES = $(wildcard *.gp)

PDFFILES = $(FIGURES:%.gp=%.pdf)
EPSFILES = $(FIGURES:%.gp=%.eps)

all: $(PDFFILES) Makefile

%.pdf: %.eps
	$(EPS2PDF) $*.eps

%.eps: %.gp %.dat
	$(GNUPLOT) $*.gp > $*.eps

clean:
	@rm -f $(EPSFILES)

cleanall:
	@rm -f $(PDFFILES)
