all:
	pdflatex cv.tex
	pdflatex cv_academic.tex
clean:
	rm *.log cv.pdf 