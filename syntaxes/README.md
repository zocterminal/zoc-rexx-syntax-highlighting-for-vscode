
# ZOC REXX SYNTAX HIGHLIGHTING

## syntaxes

This folder contains most of the language definition (some more stuff
is in `language-configuration.json` and `package.json`).

There are three files in this folder:

### file: rexx.tmLanguage

The original XML style language definition from the original project.

### file: rexx.tmLanguage.json

JSON version of the original XML file (converted but not edited).

### file: rexx.tmLanguageNew.json

JSON version created by the REXX script in the `make-syntaxes` folder.
This file is the one that is actually referenced in the `package.json`
for this project/release.  See the readme file in that folder.

