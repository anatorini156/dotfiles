{
  description = "A minimal flake building a C program";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = derivation {
            name = "main";
            system = system;
            builder = "${pkgs.bash}/bin/bash";
            args = [ ./build.sh ];

            coreutils = pkgs.coreutils;
            gcc = pkgs.gcc;

            src = ./main.c;
          };
        }
      );
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            inputsFrom = [ ];
            packages = with pkgs; [
                gcc
                coreutils
                file
            ];
            shellHook = ''
              export DEV_SHELL="C-flake"
              exec zsh
            '';
          };
        }
      );
    };
}
