(lang dune 3.13)

(name app)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name app)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
  ocaml
  dune
  dream
  (dream-html
   (>= 2.0.0)))
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
