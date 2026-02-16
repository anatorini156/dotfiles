{
  pkgs,
  python_pkgs,
  username,
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

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.stateVersion = "25.05";

  services.swayosd = {
    enable = true;
  };

  home.packages = [
  ]
  ++ common
  ++ languages;

  home.sessionVariables = {
    VIRTUAL_ENV_DISABLE_PROMPT = 1;
  };
}
