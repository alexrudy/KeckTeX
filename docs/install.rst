Installation
============

Use the included make file. If you want to copy the style files to your TeX support directory, use::

    $ make install

If you want to symlink the files, so that you can change them and contribute those changes to this GitHub repository, use::

    $ make develop


To uninstall this class and bibliography styles (which, like all latex classes and bibliography styles should have no effect on documents where they aren't in use), use::

    $ make uninstall


What gets installed
-------------------

The class file, ``Keck.cls``, gets installed to ``TEXMFHOME/tex/latex/keck/``. To find out where ``TEXMFHOME`` is for your TeX installation, you can use::
    
    $ kpsewhich --var-value TEXMFHOME
    

The bibliography files are installed to ``TEXMFHOME/bibtex/bst/keck/``.

