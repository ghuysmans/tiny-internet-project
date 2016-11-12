SOURCE=policy.cli.m4 topo.cli.m4 shortcuts.m4
all: tiny-internet-42.tar.gz
tip.cli: ${SOURCE}
	m4 policy.cli.m4 >$@
tiny-internet-42.tar.gz: ${SOURCE} tip.cli tip.pdf
	tar -cf $(basename $@) $^
	rm $@
	gzip $(basename $@)
tip.png: tip.cli topo.ml
	ocaml topo.ml <$< |dot -Tpng >$@
