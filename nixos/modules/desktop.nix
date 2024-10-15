{ config, pkgs, ... }:

{
  services = {
    displayManager.defaultSession = "gnome";
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
