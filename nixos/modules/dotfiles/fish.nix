{ config, pkgs, ... }:

{
  programs.fish = {
    shellAliases = {
      temp-browser = "nix-shell -p chromium";
      l = "ls -alh";
      la = "ls -A";
      ll = "ls -l";
      ls = "ls --color=tty";
      miller = "mlr --csv --opprint --barred head -n 5";
      nv = "nvim";
      quick-python = "nix-shell -p python311Packages.{ipython, polars}";
    }; # <-- Closing brace for shellAliases

    shellInit = ''
      if status is-interactive

        set -U fish_greeting "
                             █████ ███ █████  ██████    █████████  █████████ █████ ████ ████████  ████████ 
                            ░░███ ░███░░███  ░░░░░███  ░█░░░░███  ░█░░░░███ ░░███ ░███ ░░███░░███░░███░░███
                             ░███ ░███ ░███   ███████  ░   ███░   ░   ███░   ░███ ░███  ░███ ░███ ░███ ░███
                             ░░███████████   ███░░███    ███░   █   ███░   █ ░███ ░███  ░███ ░███ ░███ ░███
                             ░░████░████   ░░████████  █████████  █████████ ░░████████ ░███████  ░███████ 
                               ░░░░ ░░░░     ░░░░░░░░  ░░░░░░░░░  ░░░░░░░░░   ░░░░░░░░  ░███░░░   ░███░░░  
                                                                                      ░███      ░███     
                                                                                      █████     █████    
                                                                                     ░░░░░     ░░░░░     
        "

        export PATH="/nix/store/vxxlsbznhhkw1sb7qi5wki03d2sihpha-go-1.21.8/share/go:$PATH"
        set -x PATH $PATH ~/go/bin/

      end
    '';
  };
}

