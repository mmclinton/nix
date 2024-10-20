#------------------------------------------------------------------------------#
#                                                                              #
#                  My system configuration for NixOS devices                   #
#                                                                              #
#------------------------------------------------------------------------------#


#------------------------------- Nix Settings ---------------------------------#

{ config, pkgs, inputs, ... }: {

  imports = [ 
    ./hardware-configuration.nix 
    inputs.home-manager.nixosModules.default
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "mailspring-1.12.0" ];
  };

  system.stateVersion = "23.11";

#----------------------------- User Configuration -----------------------------#

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "mc" = import ./home.nix;
    };
  };

  users.users.mc = {
    isNormalUser = true;
    description = "mc";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    home = "/home/mc";
    createHome = true;
    shell = pkgs.fish;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      temp-browser = "nix-shell -p chromium";
      l = "ls -alh";
      la = "ls -A";
      ll = "ls -l";
      ls = "ls --color=tty";
      miller = "mlr --csv --opprint --barred head -n 5";
      nv = "nvim";
      quick-python = "nix-shell -p python311Packages.{ipython, polars}";
    };
    shellInit = ''
      if status --is-interactive
        set -U fish_greeting ""
        set -x PATH $PATH ~/go/bin/
      end
    '';
  };
}
