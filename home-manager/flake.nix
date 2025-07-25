{
  description = "Home Manager configuration of anatorini";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."anatorini" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./common.nix ./machines/personal.nix ];
          extraSpecialArgs = {
            system = system;
            username = "anatorini";
          };
        };
      homeConfigurations."mxszym" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./common.nix ./machines/work.nix ];
        extraSpecialArgs = {
          system = system;
          username = "mxszym";
        };
      };
    };
}
