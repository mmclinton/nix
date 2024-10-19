{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    coreutils 
    cups           # printing 
    curl 
    floorp         # epiphany replacement 
    gcc 
    git 
    gnome-screenshot 
    gnome-tweaks
    zenity 
    gnumake 
    kitty          # gnome-terminal replacement 
    mailspring     # geary replacement
    mc             # gnome files replacement
    neovim         # nano replacement
    pkg-config     # for rust program
    onlyoffice-bin # libre office replacement
    ripgrep
    unzip 
    wget 
    wl-clipboard

    # Gnome Extensions (not enabled by default)
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.color-picker
    gnomeExtensions.just-perfection
    gnomeExtensions.astra-monitor
    gnomeExtensions.caffeine
    gnomeExtensions.quick-settings-audio-devices-hider
    gnomeExtensions.quick-settings-audio-devices-renamer
    gnomeExtensions.top-bar-organizer
    gnomeExtensions.user-themes
  ];

  environment.gnome.excludePackages = (with pkgs; [gnome-tour]) 
    ++ (with pkgs; [
    gnome-terminal # terminal
    epiphany       # web browser
    geary          # email reader
    tali           # poker game
    iagno          # go game
    hitori         # sudoku game
    atomix         # puzzle game
  ]);
}
