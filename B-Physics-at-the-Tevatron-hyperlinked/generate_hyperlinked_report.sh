#!/bin/bash

mkdir src
tar -xf 0201071.tar -C src
cd src

# Add hyperlinks to the index manually, as they aren't generated correctly
sed -i -E 's/([0-9]*--[0-9]*)/\\hyperpage{\1}/' report.ind
sed -i -E 's/, ([0-9]+)/, \\hyperpage{\1}/g' report.ind
# Remove the non-existent(?) float placement option
sed -i 's/\[tbf\]/[tb]/' ch2.tex
# Add the the hyperref package with linktocpage option which allows the list of figures and tables to wrap
# Also redefine the \d command as it is in 'newcommands.tex' as hyperref overwrites the definition when loaded
sed -i 's/\\begin{document}/\\usepackage[linktocpage]{hyperref}\n\\renewcommand{\\d}{{\\rm d}}\n\n\\begin{document}/' report.tex
# Add a phantomsection so the index gets hyperlinked correctly
sed -i 's/\\addcontentsline{toc}{chapter}{Index}/\\phantomsection\n\\addcontentsline{toc}{chapter}{Index}/' report.tex

latex report.tex
latex report.tex
latex report.tex
dvipdf report.dvi
cp report.pdf ..
