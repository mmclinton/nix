{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ruby
    pkgs.jekyll
    pkgs.bundler
  ];

  shellHook = ''
    fish
  '';
}

