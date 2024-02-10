
# ZOC REXX SYNTAX HIGHLIGHTING

## make-syntaxes

This is a small REXX file that produces the `rexx.tmLanguageNew.json` 
from input files that contain the keywords and a template for the json
(rexx.tmLangugeTemplate).

The rationale is that the json (or xml) files are not very human friendy
so this version is easier to maintain and build.

## How to build

* run `rexx make-syntax.rex`
* verify (view) the output file `rexx.tmLanguageNew.json` and 
copy it to the `syntaxes` folder.

Alternately, run it through the makefile: `nmake all`


