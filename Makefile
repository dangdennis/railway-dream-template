start:
	dune exec app

dev:
	dune exec app --watch

install:
	opam install . --deps-only