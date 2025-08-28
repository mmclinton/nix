
{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";

    # pkgs used for standalone home-manager builds (same config as NixOS)
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "libsoup-2.74.3" ];
      };
    };

    # Module that applies the nixpkgs config for NixOS evaluation and wires the home user
    nixpkgsConfigModule = {
      nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "libsoup-2.74.3" ];
      };

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

      # NOTE: path points to the home.nix inside the nixos directory
      home-manager.users.mc = import ./nixos/home.nix;
    };
  in {
    nixosConfigurations = {
      nimbus = nixpkgs.lib.nixosSystem {
        inherit system;

        # make flake inputs available to modules, if they reference other flakes
        specialArgs = { inherit inputs; };

        modules = [
          # Home Manager NixOS module must be present for home-manager.users.* above to work
          home-manager.nixosModules.default

          # ensure nixpkgs.config/permittedInsecurePackages is applied for the system eval
          nixpkgsConfigModule

          # main system configuration and local modules
          ./nixos/configuration.nix
          ./nixos/modules/boot.nix
          ./nixos/modules/desktop.nix
          ./nixos/modules/fonts.nix
          ./nixos/modules/locale.nix
          ./nixos/modules/system-packages.nix
          ./nixos/modules/hardware/audio.nix
          ./nixos/modules/hardware/networking.nix
          ./nixos/modules/hardware/opengl.nix
          ./nixos/modules/hardware/video-driver.nix
          ./nixos/modules/programs/bash.nix
          ./nixos/modules/programs/neovim.nix
          ./nixos/modules/programs/programs-enable.nix
          ./nixos/modules/services/avahi.nix
          ./nixos/modules/services/pipewire.nix
          ./nixos/modules/services/services-enable.nix
        ];
      };
    };

    # Standalone home-manager output uses the same pkgs so permittedInsecurePackages applies
    homeConfigurations = {
      mc = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        backupFileExtension = "hm-backup";
        modules = [
          ./nixos/home.nix
        ];
      };
    };
  };
}

