MAIN = diploma
LOG  = build.log
TMP  = build.tmp

all:
	@latexmk -pdf $(MAIN).tex -silent >> $(TMP) 2>&1 || true
	@grep -iE "warning|error|Overfull|Underfull" $(TMP) \
		| grep -v "WARN - Unknown field" \
		> $(LOG) || true

check:
	@if [ -s $(LOG) ]; then \
		echo "There are warnings/errors:"; \
		cat build.log; \
	else \
		echo "✓ Build successful. No warnings or errors."; \
	fi

clean:
	@rm -f *.tmp *.aux *.bcf *.blg *.fdb_latexmk *.fls *.out *.run.xml *.toc $(MAIN).log

diploma: all check clean