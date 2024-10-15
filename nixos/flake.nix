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
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        ./modules/boot.nix
        ./modules/desktop.nix
        ./modules/fonts.nix
        ./modules/locale.nix
        ./modules/system-packages.nix
        ./modules/hardware/audio.nix
        ./modules/hardware/networking.nix
        ./modules/programs/bash.nix
        ./modules/programs/fish.nix
        ./modules/programs/neovim.nix
        ./modules/programs/programs-enable.nix
        ./modules/services/avahi.nix
        ./modules/services/pipewire.nix
        ./modules/services/services-enable.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
