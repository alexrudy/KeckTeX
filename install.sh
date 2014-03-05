#!/usr/bin/env bash
# 
#  makefile
#  kecktex
#  
#  Created by Alexander Rudy on 2014-03-05.
#  Copyright 2014 University of California. All rights reserved.
# 

# Install the Keck tools.
# Get the TEXMF path first!

echo "Installing KeckTeX class and bibliography styles."
TEXMFPATH=${TEXMFHOME}
if [[ -z $TEXMFPATH ]]; then
    TEXMFPATH=`kpsewhich --var-value TEXMFHOME`
fi

echo "Using the user path from TEXMFHOME:"
echo "$TEXMFPATH"

KECKTEXROOT="$TEXMFPATH/tex/latex"
KECKTEX="$KECKTEXROOT/keck"

KECKBIBROOT="$TEXMFPATH/bibtex/bst"
KECKBIB="$KECKBIBROOT/keck"

mkdir -p $KECKTEXROOT
mkdir -p $KECKBIBROOT

if [[ -z $1 ]]; then
    echo "Copying .cls and .bst files to destination."
    mkdir -p $KECKTEX
    cp -r $PWD/latex/ "$KECKTEX/"
    mkdir -p $KECKBIB
    cp -r $PWD/bibtex/ "$KECKBIB/"
else
    echo "Installing in development mode (symbolic links)."
    if [[ ! -d $KECKTEX ]]; then
        echo "Linking $PWD to $KECKTEX"
        ln -s "$PWD/latex" "$KECKTEX"
    else
        echo "Skipping $KECKTEX, already exists."
    fi
    if [[ ! -d $KECKBIB ]]; then
        echo "Linking $PWD to $KECKBIB"
        ln -s "$PWD/bibtex" "$KECKBIB"
    else
        echo "Skipping $KECKBIB, already exists."
    fi

fi