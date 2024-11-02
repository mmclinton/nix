{ config, pkgs, ... }:

{
  programs.bash = {
    shellAliases = {
      temp-browser = "nix-shell -p chromium";
      l = "ls -alh";
      la = "ls -A";
      ll = "ls -l";
      ls = "ls --color=tty";
      miller = "mlr --csv --opprint --barred head -n 5";
      neofetch = "neofetch";
      nv = "nvim";
      python-shell = "nix-shell ~/nix/shells/python/shell.nix";
      go-shell = "nix-shell ~/nix/shells/go/shell.nix";
      ruby-shell = "nix-shell ~/nix/shells/ruby/ruby.nix";
      rust-shell = "nix-shell ~/nix/shells/rust/shell.nix";
    }; 
  };
}
