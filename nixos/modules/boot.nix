{ config, pkgs, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      theme = pkgs.catppuccin-grub;
      fontSize = 16;
    };
    efi.canTouchEfiVariables = true;
  };
}
