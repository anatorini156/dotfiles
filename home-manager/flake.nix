{
  description = "Home Manager configuration of mxszym";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      zen-browser,
      ...
    }:
    let
      settings = import ./host.nix;
      pkgs = nixpkgs.legacyPackages.${settings.system};
    in
    {
      homeConfigurations."${settings.username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./common.nix
          ./accounts/${settings.username}.nix
        ];
        extraSpecialArgs = {
          settings = settings;
          zen = zen-browser;
        };
      };
    };
}
