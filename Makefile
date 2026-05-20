all: once

mktex:
	emacs -nl --script scripts/org2tex.el curriculum-vitae/literate_cv.org

once: mktex
	cd curriculum-vitae && latexmk -halt-on-error literate_cv.tex > /dev/null && cp -f literate_cv.pdf ../Ruhi_Latest-cv.pdf

alert: mktex
	cd curriculum-vitae && latexmk -halt-on-error literate_cv.tex

clean: 
	cd curriculum-vitae && rm -f *.log *.nlo *.idx *.synctex* *.aux *.toc *.out ./misc/*.aux *.bbl *.bcf *.xml *.blg *.fdb* *.fls

clobber: 
	cd curriculum-vitae && rm -f *.log *.nlo *.idx *.synctex* *.aux *.toc *.out ./misc/*.aux *.bbl *.bcf *.xml *.blg *.fdb* *.fls *.pdf

continous: mktex
	cd curriculum-vitae && latexmk -pvc -view=none literate_cv.tex
#
#biber: (used when xelatex was used instead of latexmk)
#	make once
#	biber cv
#	make once
#	make once
#
