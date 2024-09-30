# What? [![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)  [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0) [![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-blue.svg)](http://creativecommons.org/licenses/by-nc-sa/4.0/) [![Donation](https://img.shields.io/badge/Donate-%3F-lightgrey.svg)](https://www.instamojo.com/@HaoZeke/)

This is my personal CV based off ModernCV. May be used as a template (follow the
license!). Compiles with `latexmk`. Derived from 
[this CV repo](https://github.com/HaoZeke/CV) and [this one](https://github.com/amritagos/cv).

## How?

- Clone
- Edit `cv.tex` (in curriculum-vitae)
- Ensure `latexmk` is installed.
- Run make (Check `Makefile` for other options)
- Profit

### ARM MacOS

`conda-forge` only has a broken `texlive-core` distribution shipped. To work around this, `tectonic` can be used, however `biber` needs to be built from source or grabbed from `tinytex` which can correctly setup `tlmgr`, ergo the environment needs `python` and `perl` within the conda based environment. Much easier to actually install `texlive` but for a weird work-around consider using `TinyTex` and `texliveonfly`

```bash
pixi shell
Rscript -e "tinytex::install_tinytex()"
# The command above can fail, nevermind
export PATH="$PATH:$HOME/Library/TinyTeX/bin/universal-darwin"
tlmgr install texliveonfly # needs python
texliveonfly -c xelatex cv.tex
# next time
latexmk -pvc -pdfxe -f cv.tex
```

## License

The [MIT license](https://choosealicense.com/licenses/mit/) seems appropriate for the template. Content is my own, so please
do not use that, under a [creative commons BY-NC-SA license](http://creativecommons.org/licenses/by-nc-sa/4.0/).
