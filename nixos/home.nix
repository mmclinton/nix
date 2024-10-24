{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "mc";
  home.homeDirectory = "/home/mc";
  home.stateVersion = "24.05"; 
  home.packages = with pkgs; [

    ######## Applications ########
    brave 
    discord
    drawio 
    firefox 
    noisetorch 
    popsicle 
    protonmail-desktop 
    tor-browser 
    ulauncher 
    vscode-fhs 
    zoom-us

    ########## Programs ##########
    fish
    ivpn 
    ivpn-service 
    miller 
    neofetch
    syncthing 
    wmctrl 

    ### Theme-related packages ###
    kora-icon-theme 
    andromeda-gtk-theme
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  gtk = {
    enable = true;
    font.name = "Inter";
    iconTheme.name = "Kora";
    theme.name = "Andromeda-gtk";
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = "floorp.desktop";
    "x-scheme-handler/https" = "floorp.desktop";
    "x-scheme-handler/mailto" = "proton-mail.desktop";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
