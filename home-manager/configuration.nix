{
  pkgs,
  python_pkgs,
  username,
  system,
  host,
  ...
}:
let
  common = import ./packages/common.nix { inherit pkgs; };
  languages = import ./packages/languages.nix { inherit pkgs python_pkgs; };
  inherit pkgs;
in
{
  imports = [
    ./tools/default.nix
  ];
  nixpkgs.config.allowUnfree = true;

  home.username = username;
  home.file."debug".text = "
  ${builtins.getEnv "HOST"}
  ${builtins.getEnv "HOSTNAME"}
  ${builtins.currentSystem }
  ";

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.stateVersion = "25.05";

  home.packages = [
  ]
  ++ common
  ++ languages;

  home.sessionVariables = {
    VIRTUAL_ENV_DISABLE_PROMPT = 1;
  };
}
