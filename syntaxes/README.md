
# ZOC REXX SYNTAX HIGHLIGHTING

## syntaxes

This folder contains most of the language definition (some more stuff
is in `language-configuration.json` and `package.json`).

There are four files in this folder:

### file: language-configuration.json

Some basic configuration parameters for the language that describe
blocks of code, comments, etc.

### file: rexx.tmLanguageNew.json

JSON version created by the REXX script in the `make-syntaxes` folder.
This  is the one tmLanguage that is *actually* used now for this project/release
(see the `package.json` file).  See the also README file in the `make-syntaxes` 
folder on how to update/create this file.

### file: rexx.tmLanguage

The original XML style language definition from the original upstream project.
It is not used anymore and merely kept for reference.

### file: rexx.tmLanguage.json

JSON version of the original XML file (converted but not edited). 
It is not used anymore and merely kept for reference.

