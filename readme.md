# KeckTeX

This is an XeLaTeX class, pair of bibliography styles, and template for writing UC-system Keck Proposals in XeLaTeX.

## Installation

Use the included make file. If you want to copy the style files to your TeX support directory, use:
    
    $ make install
    
If you want to symlink the files, so that you can change them and contribute those changes to this GitHub repository, use:
    
    $ make develop
    

To uninstall this class and bibliography styles (which, like all latex classes and bibliography styles should have no effect on documents where they aren't in use), use
    
    $ make uninstall
    

## Using the template

Copy the file ``proposal-template.tex``, and modify it for your proposal.

This template must be compiled with the `xelatex` program, which allows LaTeX to use fonts from your computer in the typesetting process. I also recommend `latexmk.pl`, a pearl script which automates LaTeX builds. You can run `xelatex` using `latexmk.pl -xelatex`.

## Current Status

I'm using this template full time for my Keck proposals, but that doesn't make it right. I'm adding features as I need them. Some things I'm missing, but would like to add soon:

- Proper support for highlighting Keck/Lick publications.
- Support for highlighting PI/Collaborators in reference lists.
- More bibliography styles.

