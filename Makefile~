DOCS=summary.pdf technical.pdf

all: $(DOCS)

summary.pdf: summary.tex
	pdflatex summary

technical.pdf: technical.tex refs.bib
	latex technical
	bibtex technical
	latex technical
	pdflatex technical


outline.pdf: outline.tex refs.bib
	latex outline
	bibtex outline
	latex outline
	pdflatex outline


clean:
	rm -f *~ *.dvi *.pdf *.bak 
