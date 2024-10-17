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
}
