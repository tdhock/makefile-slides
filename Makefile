HOCKING-makefiles.pdf: HOCKING-makefiles.tex
	pdflatex HOCKING-makefiles
figure-custom-capture.pdf: figure-custom-capture.R
	R --no-save < $<