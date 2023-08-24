start:
	dune exec bin/main.exe

dev:
	dune exec bin/main.exe --watch

install:
	opam install . --deps-only