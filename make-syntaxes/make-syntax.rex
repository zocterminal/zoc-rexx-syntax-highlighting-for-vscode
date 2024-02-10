
/* REXX */

debug= 0

template_file= 'rexx.tmLangugeTemplate.json'
output_file= 'rexx.tmLanguageNew.json'

keywords_file= 'language-keywords.txt'
keywords_placeholder='${keyword.rexx}'

supportfnctrexx_file= 'built-in-functions.txt'
supportfnctrexx_placeholder= '${support.function.rexx.rexx}'

supportfnctzoc_file= 'built-in-zoc-functions.txt'
supportfnctzoc_placeholder= '${support.function.zoc.rexx}'

files.0= 3
files.1= supportfnctrexx_file
files.2= supportfnctzoc_file
files.3= keywords_file

placeholders.0= 3
placeholders.1= supportfnctrexx_placeholder
placeholders.2= supportfnctzoc_placeholder
placeholders.3= keywords_placeholder

values.0= 3
values.1= ''
values.2= ''
values.3= ''

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
ADDRESS CMD "DEL "||output_file
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
            lline= LEFT(line, p-1)
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

EXIT

-- -----------------------------------------------------------------------
--  dummy function with just a few names to test this
-- -----------------------------------------------------------------------
TEST:
    CALL ZocAsk "Test"
    n= ZocGetInfo("ONLINE")
    RETURN
