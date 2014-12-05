
GNUPLOT := `which gnuplot`
EPS2PDF := `which epstopdf`

#GNUPLOT := /opt/local/bin/gnuplot
#EPS2PDF := /sw/bin/epstopdf

FIGS = overhead storage totals syncpts syncpts2 delays delays2 stats

PDFFILES = $(FIGS:=.pdf)
EPSFILES = $(FIGS:=.pdf)

%EPSFILES = $(patsubst %.pdf,%.eps,$(PDFFILES))

all: $(PDFFILES) Makefile

%.pdf: %.eps
	$(EPS2PDF) $*.eps

%.eps: %.plot %.dat
	$(GNUPLOT) $*.plot

syncpts2.eps: syncpts.eps
delays2.eps: delays.eps

clean:
	@rm -f $(PDFFILES) $(EPSFILES)
