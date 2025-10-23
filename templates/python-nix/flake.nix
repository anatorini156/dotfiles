{
  description = "Dev shell for python";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      name = "python-nix";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {

      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [
          zsh
          python312
          pythonManylinuxPackages.manylinux2014Package

          (python312.withPackages (
            python-pkgs: with python-pkgs; [
              pip
            ]
          ))
        ];
        env = {
          VIRTUAL_ENV = "${name}";
          SHELL = "${pkgs.zsh}/bin/zsh";
          EDITOR = "nvim";
        };
        shellHook = ''
          if [ -z "$ZSH_VERSION" ]; then
            exec zsh
          fi
        '';
      };

    };
}
