
#
# makefile to build a new languagedefinition from templates (see README.md and make-syntaxes.rex)
#

OUTFILE=rexx.tmLanguageNew.json
OUTDIR=..\syntaxes

all: clean syntaxes
	@echo makefile: $@ done

clean:
    del $(OUTFILE)
    del $(OUTDIR)\$(OUTFILE)
	@echo makefile: $@ done

syntaxes: ..\syntaxes\$(OUTFILE)
	@echo makefile: $@ done

$(OUTFILE): language-keywords.txt built-in-functions.txt \
			rexx.tmLangugeTemplate.json make-syntax.rex makefile
	rexx make-syntax.rex
	@echo makefile: $@ done

$(OUTDIR)\$(OUTFILE): $(OUTFILE)
	copy $** $@
	@echo makefile: $@ done
