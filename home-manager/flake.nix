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
    let
      username = "anatorini";
      system = "x86_64-linux";
      host = "nixos";
      # username = builtins.getEnv "HOST";
      # system = builtins.currentSystem;
      # host = builtins.getEnv "HOSTNAME";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."anatorini" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./configuration.nix
          ./systems/${system}.nix
          ./accounts/${username}.nix
          ./hosts/${host}.nix
        ];
        extraSpecialArgs = {
          python_pkgs = nixpkgs-python;
          zen = zen-browser;
          username = username;
          system = system;
          host = host;
        };
      };
    };
}
