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
    blender = {
      url = "github:nixos/nixpkgs/nixos-25.05/459104f841356362bfb9ce1c788c1d42846b2454";
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
      blender,
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
                  unstable = import nixpkgs-unstable { inherit system; };
                })
              ];
            };
            blender = import blender { inherit system; };
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
              blender = blender;
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
