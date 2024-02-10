
#
# makefile to build a new languagedefinition from templates (see README.md and make-syntaxes.rex)
#

OUTFILE=rexx.tmLanguageNew.json
OUTDIR=..\syntaxes
# INSTALLDIR=
INSTALLDIR=C:\Users\mschmidt\.vscode\extensions\zocterminal.zoc-rexx-syntax-highlighting-1.0.4

all: clean syntaxes
	@echo makefile: $@ done

deploy: syntaxes
!if "$(INSTALLDIR)"==""
	echo makefile: You need to set your install dir in the makefile
!else
	-mkdir $(INSTALLDIR)
	-mkdir $(INSTALLDIR)/syntaxes
	echo makefile: deploy
	copy ..\README.md $(INSTALLDIR)
	copy ..\package.json $(INSTALLDIR)
	copy ..\package-icon.png $(INSTALLDIR)
	copy ..\language-configuration.json $(INSTALLDIR)
	copy ..\LICENSE.txt $(INSTALLDIR)
	copy ..\CHANGELOG.md $(INSTALLDIR)
	copy ..\syntaxes\rexx.tmLanguageNew.json $(INSTALLDIR)\syntaxes
!endif

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
