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
      system = builtins.currentSystem;
      pkgs = nixpkgs.legacyPackages.${system};
      host = pkgs.lib.strings.trim (builtins.readFile "/etc/hostname");
    in
    {
      homeConfigurations =
        let
          mkHomeConfig =
            username: extraArgs:
            home-manager.lib.homeManagerConfiguration {
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
                inherit username system host;
              }
              // extraArgs;
            };
        in
        {
          "anatorini" = mkHomeConfig "anatorini@nixos" { };
          "mxszym" = mkHomeConfig "mxszym@WRO-MXSZYM-MB03" { };
        };
    };
}
