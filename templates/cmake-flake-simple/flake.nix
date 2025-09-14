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
        packages.default = derivation {
          name = "main";
          system = system;
          builder = "${pkgs.bash}/bin/bash";
          args = [ "-c" ''
            export PATH="${pkgs.cmake}/bin:${pkgs.gcc}/bin:${pkgs.coreutils}/bin:${pkgs.findutils}/bin:${pkgs.gnumake}/bin"
            
            # Copy source to build directory
            cp -r $src/* .
            chmod -R u+w .
            
            # Configure with CMake
            cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
            
            # Build
            cmake --build build
            
            # Install
            mkdir -p $out/bin
            cp build/main $out/bin/main
          '' ];
          src = ./.;
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
