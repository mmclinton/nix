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
    packages = with pkgs; [
      brave 
      discord
      drawio 
      fish
      firefox 
      go 
      gopls 
      ivpn 
      ivpn-service 
      kora-icon-theme 
      miller 
      neofetch
      noisetorch 
      popsicle 
      protonmail-desktop 
      python3
      python311Packages.ipykernel 
      python311Packages.jupyter-core 
      python311Packages.ipython
      syncthing 
      tor-browser 
      ulauncher 
      virtualenv 
      vscode-fhs 
      wmctrl 
      zoom-us
    ];
  };
}
