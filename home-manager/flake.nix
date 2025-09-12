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
    nixpkgs-python.url = "github:cachix/nixpkgs-python";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-python,
      home-manager,
      zen-browser,
      ...
    }:
    {
      homeConfigurations = {
        anatorini =
          let
            username = "anatorini";
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
          in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./configuration.nix
              ./systems/${system}.nix
              ./accounts/${username}.nix
              ./hosts/nixos.nix
            ];
            extraSpecialArgs = {
              python_pkgs = nixpkgs-python;
              zen = zen-browser;
              inherit username;
            };
          };
        mxszym =
          let
            username = "mxszym";
            system = "aarch64-darwin";
            pkgs = import nixpkgs { inherit system; };
          in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./configuration.nix
              ./systems/${system}.nix
              ./accounts/${username}.nix
              ./hosts/WRO-MXSZYM-MB03.nix
            ];
            extraSpecialArgs = {
              python_pkgs = nixpkgs-python;
              zen = zen-browser;
              pkgs = nixpkgs;
              inherit username;
            };
          };
      };
    };
}
