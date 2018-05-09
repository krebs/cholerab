{ nixpkgs ? import <nixpkgs> {}, ... }: with nixpkgs;
stdenv.mkDerivation {
  name = "thesauron";
  src = ./thesauron.md;
  phases = [ "buildPhase" ];
  buildPhase = ''
    mkdir -p $out/share/man/man1
    ${pandoc}/bin/pandoc -s -t man $src -o $out/share/man/man1/thesauron.1
  '';
}
