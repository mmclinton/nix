{ config, pkgs, ... }:

# If any additional complexities are required for the following services, 
# a standalone file is to be created within the services module. 

{
  security.rtkit.enable = true; # pulseaudio uses this service to acquire realtime priority
  services = {
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
    ivpn.enable = true;
    printing.enable = true;
  };
}