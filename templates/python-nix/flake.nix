{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {

      devShells.default = pkgs.mkShell {
          name = "python-nix";
          packages = with pkgs; [
            zsh
        ];
        env = {
            SHELL = "${pkgs.zsh}/bin/zsh";
        };
      };

    };
}
