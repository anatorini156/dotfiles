let
  pkgs = import <nixpkgs> { };
in
derivation {
  name = "main";
  system = builtins.currentSystem;
  builder = "${pkgs.bash}/bin/bash";
  args = [ ./build.sh ];

  inherit (pkgs) gcc coreutils findutils;

  src = ./src;
}
