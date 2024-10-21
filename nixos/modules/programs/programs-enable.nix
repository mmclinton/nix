{ config, pkgs, ... }:

{
  programs = {
    noisetorch.enable = true;
    steam.enable = true;
    gamemode.enable = true; # in a steam game type "gamemoderun %command%"
  };
}
