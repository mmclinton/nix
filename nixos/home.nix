{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "mc";
  home.homeDirectory = "/home/mc";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
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
    rustup
    syncthing 
    tor-browser 
    ulauncher 
    virtualenv 
    vscode-fhs 
    wmctrl 
    zoom-us
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mc/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
