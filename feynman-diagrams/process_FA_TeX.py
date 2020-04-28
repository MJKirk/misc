#!/usr/bin/env python3
import sys

template_begin = r"""\documentclass[varwidth,margin={25 0 25 0}]{standalone}
\usepackage{feynarts_MJKirk}

\begin{document}

\unitlength=1bp
\newlength{\gap}
\setlength{\gap}{3em}
"""

picture_delimeter = "%\n\hspace{\gap}\n%"

template_end = r"\end{document}"


if len(sys.argv) != 2:
    print("Need file to process")
    exit(1)
with open(sys.argv[1]) as f:
    lines = f.readlines()

FAdiags, diag = [], []
for l in lines:
    if l == "\\begin{feynartspicture}(432,504)(1,1.3)\n":
        diag = []
    elif l == "\\end{feynartspicture}\n":
        FAdiags.append(diag)
    else:
        diag.append(l)


print(template_begin)

for diag in FAdiags:
    print("\\begin{feynartspicture}(100,100)(1,1)")
    for l in diag:
        if not (l.startswith("\\FALabel") or l.startswith("\\FAVert") or l.startswith("%") or l == "\n"):
            print(l, end="")
    print("\\end{feynartspicture}")
    print(picture_delimeter)

print(template_end)
