{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";

      # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      hyprland,
      Hyprspace,
      ...
    }@inputs:
    {
      nixosConfigurations."ThinkPad-X1" = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ./hosts/ThinkPad-X1/hardware-configuration.nix
          ./hosts/ThinkPad-X1/configuration.nix
        ];
      };
    };
}
