DOCS=summary.pdf technical.pdf

all: $(DOCS)

summary.pdf: summary.tex
	pdflatex summary

technical.pdf: technical.tex refs.bib
	pdflatex technical
	bibtex technical
	pdflatex technical
	pdflatex technical

clean:
	rm -f *~ *.dvi *.bak 
	rm -f summary.pdf technical.pdf *.aux *.log *.bbl *.blg
