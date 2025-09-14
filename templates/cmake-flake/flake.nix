{
  description = "A simple C program built with CMake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "main";
          version = "1.0.0";
          
          src = ./.;
          
          nativeBuildInputs = with pkgs; [
            cmake
            gcc
          ];
          
          buildInputs = with pkgs; [
            # Add any runtime dependencies here if needed
          ];
          
          configurePhase = ''
            runHook preConfigure
            cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
            runHook postConfigure
          '';
          
          buildPhase = ''
            runHook preBuild
            cmake --build build
            runHook postBuild
          '';
          
          installPhase = ''
            runHook preInstall
            mkdir -p $out/bin
            cp build/main $out/bin/main
            runHook postInstall
          '';
          
          meta = with pkgs.lib; {
            description = "A simple C program";
            license = licenses.mit;
            maintainers = [ ];
            platforms = platforms.all;
          };
        };

        # Development shell for working on the project
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cmake
            gcc
            gdb
            valgrind
          ];
          
          shellHook = ''
            echo "Development environment ready!"
            echo "Run 'nix build' to build the project"
            echo "Run 'nix run' to build and run the program"
          '';
        };
      });
}
