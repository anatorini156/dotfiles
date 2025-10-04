{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations."ThinkPad-X1" = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        ./hosts/ThinkPad-X1/hardware-configuration.nix
        ./hosts/ThinkPad-X1/configuration.nix
      ];
    };
  };
}
