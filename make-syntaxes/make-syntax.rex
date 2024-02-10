
/* REXX */

debug= 0

template_file= 'rexx.tmLangugeTemplate.json'
output_file= 'rexx.tmLanguageNew.json'

keywords_file= 'language-keywords.txt'
keywords_placeholder='${keyword.rexx}'

supportfnct_file= 'built-in-functions.txt'
supportfnct_placeholder= '${support.function.rexx}'

files.0= 2
files.1= supportfnct_file
files.2= keywords_file

placeholders.0= 2
placeholders.1= supportfnct_placeholder
placeholders.2= keywords_placeholder

values.0= 2
values.1= ''
values.2= ''


--
-- read placeholder values from placeholder files
--

DO i=1 TO files.0
    SAY 'make-syntax.rex: Reading' files.i
    DO FOREVER
        line= LINEIN(files.i)
        IF STREAM(files.i, 'S')\='READY' THEN LEAVE
        line= STRIP(line, 'B')

        -- allow unix or rexx style comments in the keyword files
        IF LEFT(line,2)='# ' THEN ITERATE
        IF LEFT(line,3)='-- ' THEN ITERATE
        IF LINE=='' THEN ITERATE

        values.i= values.i||line||'|'
    END
    CALL STREAM files.i, 'C', 'CLOSE'
    values.i= STRIP(values.i, 'T', '|')

    IF debug THEN SAY 'make-syntax.rex: file' files.i '->' values.i
END


--
-- replace placeholders from placeholder files in json file
--
SAY 'make-syntax.rex: Writing' output_file
DO FOREVER
    line= LINEIN(template_file)
    IF STREAM(template_file, 'S')\='READY' THEN LEAVE

    -- allow unix or rexx style comments in the json file
    sline= STRIP(line, 'L')
    IF LEFT(sline,2)='# ' THEN ITERATE
    IF LEFT(sline,3)='-- ' THEN ITERATE

    DO i=1 TO placeholders.0
        p= POS(placeholders.i, line)
        IF (p>0) THEN DO
            IF debug THEN SAY 'make-syntax.rex: replace in ' line
            lline= LEFT(line, p)
            rline= SUBSTR(line, p+LENGTH(placeholders.i))
            line= lline||values.i||rline
            IF debug THEN SAY 'make-syntax.rex: replaced in ' line
        END
    END
    CALL LINEOUT output_file, line
END
CALL STREAM template_file, 'C', 'CLOSE'
CALL STREAM output_file, 'C', 'CLOSE'

SAY 'make-syntax.rex: conversion done'
SAY ''

SAY 'make-syntax.rex: Now review the' output_file ' and copy it to ..\syntaxes\rexx.tmLanguageNew.json'
SAY 'make-syntax.rex: (see package.json for the exact filename)'
SAY ''