{ nixpkgs ? import <nixpkgs> {}, ... }: with nixpkgs;
stdenv.mkDerivation {
  name = "thesauron-shell";
  buildInputs = [ (callPackage ./default.nix {}) ];
}
