{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      inter
      jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      monospace = [ "JetBrains Mono Regular" ];
      sansSerif = [ "Inter Regular" ];
      serif = [ "Inter Regular" ];
    };
  };
}
