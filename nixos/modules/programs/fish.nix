{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      temp-browser = "nix-shell -p chromium";
      l = "ls -alh";
      la = "ls -A";
      ll = "ls -l";
      ls = "ls --color=tty";
      miller = "mlr --csv --opprint --barred head -n 5";
      neofetch = "neofetch";
      nv = "nvim";
      quick-python = "nix-shell -p python311Packages.{ipython, polars}";
    }; 
  };
}
