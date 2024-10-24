{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    python312Packages.ipykernel 
    python312Packages.ipython
    python312Packages.jupyter-core 
    python312Packages.pip
    virtualenv 
  ];

  shellHook = ''
    fish
  '';
}

