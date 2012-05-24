DOCS=summary.pdf technical.pdf reb-bio.pdf data.pdf

all: $(DOCS)

summary.pdf: summary.tex
	pdflatex summary

data.pdf: data.tex
	pdflatex data

technical.pdf: technical.tex refs.bib
	pdflatex technical
	bibtex technical
	pdflatex technical
	pdflatex technical

reb-bio.pdf: reb-bio.tex
	pdflatex reb-bio

lva-bio.pdf: lva-bio.tex
	pdflatex lva-bio

clean:
	rm -f *~ *.dvi *.bak 
	rm -f summary.pdf technical.pdf *.aux *.log *.bbl *.blg
