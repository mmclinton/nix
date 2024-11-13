{ config, pkgs, ... }:

{
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
    chafa
    figlet
    fish
    fzf
    miller 
    neofetch
    syncthing 
    wmctrl 

    ### Theme-related packages ###
    andromeda-gtk-theme
    kora-icon-theme 
  ];
}
