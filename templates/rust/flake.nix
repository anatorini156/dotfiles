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
          default = pkgs.stdenv.mkDerivation {
            pname = "main";
            version = "0.1.0";
            src = ./.;

            nativeBuildInputs = [
              pkgs.rustc
              pkgs.cargo
            ];

            buildPhase = ''
              cargo build -r
            '';

            installPhase = ''
              mkdir -p $out/bin
              cp -r target/release/* $out/bin
            '';
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
              cargo
              rustc
              coreutils
              file
              rust-analyzer
              rustfmt
              gcc
            ];
            shellHook = ''
              export DEV_SHELL="Rust"
              exec zsh
            '';
          };
        }
      );
    };
}
