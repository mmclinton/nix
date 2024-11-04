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
    bat
    fish
    fzf
    ivpn 
    ivpn-service 
    miller 
    neofetch
    syncthing 
    wmctrl 

    ### Theme-related packages ###
    andromeda-gtk-theme
    kora-icon-theme 
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  home.file = {
    ".config/kitty/kitty.conf".text = import ./modules/dotfiles/kitty/kitty-config.nix;
    ".config/kitty/onedark-pro.conf".text = import ./modules/dotfiles/kitty/themes/onedark-pro.nix;
    ".config/kitty/github-dark.conf".text = import ./modules/dotfiles/kitty/themes/github-dark.nix;
  };

  gtk = {
    enable = true;
    font.name = "Inter Regular";
    iconTheme.name= "kora-pgrey";
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
