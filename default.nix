{ nixpkgs ? import <nixpkgs> {}, ... }: with nixpkgs;
stdenv.mkDerivation {
  name = "cholerab";
  src = ./.;
  phases = [ "buildPhase" ];
  buildPhase = ''
    mkdir -p $out/share/man/man1
    ${pandoc}/bin/pandoc -s -t man $src/thesauron.md -o $out/share/man/man1/thesauron.1
    ${pandoc}/bin/pandoc -s -t man $src/enterprise-patterns.md -o $out/share/man/man1/enterprise-patterns.1
  '';
}
