{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          ./nixos/modules/boot.nix
          ./nixos/modules/desktop.nix
          ./nixos/modules/fonts.nix
          ./nixos/modules/locale.nix
          ./nixos/modules/system-packages.nix
          ./nixos/modules/dotfiles/fish.nix
          ./nixos/modules/hardware/audio.nix
          ./nixos/modules/hardware/networking.nix
          ./nixos/modules/programs/bash.nix
          ./nixos/modules/programs/neovim.nix
          ./nixos/modules/programs/programs-enable.nix
          ./nixos/modules/services/avahi.nix
          ./nixos/modules/services/pipewire.nix
          ./nixos/modules/services/services-enable.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}

