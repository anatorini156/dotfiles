{
  description = "Home Manager configuration of mxszym";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-python = {
      url = "github:cachix/nixpkgs-python";
    };
    claude-desktop = {
      url = "github:anatorini156/claude-desktop-nix";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";

      # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      inputs.hyprland.follows = "hyprland";
    };
    blender-pkgs = {
      url = "github:nixos/nixpkgs?rev=07518c851b0f12351d7709274bbbd4ecc1f089c7";
    };
    spotify-pkgs = {
      url = "github:nixos/nixpkgs?rev=336eda0d07dc5e2be1f923990ad9fdb6bc8e28e3";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-python,
      home-manager,
      zen-browser,
      claude-desktop,
      Hyprspace,
      blender-pkgs,
      spotify-pkgs,
      ...
    }:
    {
      homeConfigurations = {
        "anatorini@ThinkPad-X1" =
          let
            username = "anatorini";
            system = "x86_64-linux";
            host = "ThinkPad-X1";
            pkgs = import nixpkgs {
              inherit system;
              overlays = [
                (final: prev: {
                  unstable = import nixpkgs-unstable {
                    inherit system;
                    config.allowUnfree = true;
                  };
                })
              ];
            };
            blender = import blender-pkgs { inherit system; };
            spotify = import spotify-pkgs {
              inherit system;
              config.allowUnfree = true;
            };
          in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./configuration.nix
              ./systems/${system}.nix
              ./accounts/${username}.nix
              ./hosts/${host}.nix
            ];
            extraSpecialArgs = {
              blender-pkgs = blender;
              spotify-pkgs = spotify;
              python_pkgs = nixpkgs-python;
              claude = claude-desktop;
              zen = zen-browser;
              hyprspace = Hyprspace;
              inherit username host system;
            };
          };
        "anatorini@nixos" =
          let
            username = "anatorini";
            system = "x86_64-linux";
            host = "nixos";
            pkgs = import nixpkgs {
              inherit system;
              overlays = [
                (final: prev: {
                  unstable = import nixpkgs-unstable { inherit system; };
                })
              ];
            };
          in
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
              claude = claude-desktop;
              zen = zen-browser;
              inherit username host system;
            };
          };
        "mxszym@WRO-MSZYM-MB-03" =
          let
            username = "mxszym";
            system = "aarch64-darwin";
            host = "WRO-MXSZYM-MB-03";
            pkgs = import nixpkgs {
              inherit system;
              overlays = [
                (final: prev: {
                  unstable = import nixpkgs-unstable { inherit system; };
                })
              ];
            };
          in
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
              inherit username host system;
            };
          };
      };
    };
}
