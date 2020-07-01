# Misc
A collection of miscellaneous things that (currently) don't live anywhere else.

## Feynman diagram generation
In [feynman-diagrams](feynman-diagrams) there are Mathematica and Python scripts to generate Feynman diagram topologies using [FeynArts](http://feynarts.de) to do all the placement automatically.
I have modified the LaTeX style file FeynArts provides slightly to match my personal preferences.

The general workflow goes like:
1) Adjust `generate_diagram.m` to give you the right diagrams, and let it export the TeX.
1) Run `process_FA_TeX.py` on the Mathemaica output to produce a viable LaTeX document - it outputs to stdout so you need to redirect it to a file.
1) (Optional) Adjust the output of the Python script to arrange the diagrams - the default output just gives you all the diagrams in a row. Just replace the 
    ```
    %
    \hspace{\gap}
    %
    ```
    with at least one blank line to get a new line.
1) Use `latexmk -pdfdvi` to create the PDF file of your diagrams for including in your paper / talk / other thing.
1) Use pdfcrop to crop the edges - by default there is a large gap on the sides to add external particle labels, and above and below from the FeynArts default behaviour.


## Mathematica
In [Mathematica](Mathematica) there is some useful Mathematica code I have written / collected from various places.

## B Physics at the Tevatron (hyperlinked version)
In [B-Physics-at-the-Tevatron-hyperlinked](B-physics-at-the-Tevatron-hyperlinked) there is a script to regenerate the ['B Physics at the Tevatron'](https://arxiv.org/abs/hep-ph/0201071) report but with hyperlinks.

