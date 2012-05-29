DOCS=summary.pdf technical.pdf reb-bio.pdf lva-bio.pdf data.pdf project.pdf references.pdf

all: $(DOCS)

summary.pdf: summary.tex
	pdflatex summary

data.pdf: data.tex
	pdflatex data

technical.pdf: technical.tex refs.bib squeeze.sty \
		schedule.pdf screenshot-grading.pdf list_verifications.pdf
	pdflatex technical
	bibtex technical
	pdflatex technical
	pdflatex technical

technical.ps: technical.pdf
	pdf2ps technical.pdf

references.pdf: technical.pdf
	gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
		-dFirstPage=16 -dLastPage=17 \
		-sOutputFile=references.pdf technical.pdf

project.pdf: technical.pdf
	gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
		-dFirstPage=1 -dLastPage=15 \
		-sOutputFile=project.pdf technical.pdf

reb-bio.pdf: reb-bio.tex
	pdflatex reb-bio

lva-bio.pdf: lva-bio.tex
	pdflatex lva-bio

clean:
	rm -f *~ *.dvi *.bak *.aux *.log *.bbl *.blg *.ps
	rm -f summary.pdf technical.pdf references.pdf project.pdf
