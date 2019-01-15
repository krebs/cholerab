{ nixpkgs ? import <nixpkgs> {}, ... }: with nixpkgs;
stdenv.mkDerivation {
  name = "cholerab";
  src = ./.;
  phases = [ "buildPhase" ];
  buildPhase = ''
    mkdir -p $out/share/man/man1 $out/share/doc
    ${asciidoctor}/bin/asciidoctor $src/thesauron.adoc -o $out/share/doc/thesauron.html
    ${asciidoctor}/bin/asciidoctor $src/enterprise-patterns.adoc -o $out/share/doc/enterprise-patterns.html
    ${asciidoctor}/bin/asciidoctor -b manpage $src/thesauron.adoc -o $out/share/man/man1/thesauron.1
    ${asciidoctor}/bin/asciidoctor -b manpage $src/enterprise-patterns.adoc -o $out/share/man/man1/enterprise-patterns.1
  '';
}
