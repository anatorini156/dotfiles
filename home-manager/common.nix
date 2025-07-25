{ username, pkgs, system, ... }:

{
  imports = [
    ./tools/default.nix

  ] ++ (if system == "Darwin" then [ ./platforms/darwin.nix ] else [ ])
    ++ (if system == "x86_64-linux" then [ ./platforms/linux.nix ] else [ ]);

  home.username = username;

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.delta
    pkgs.bat
    pkgs.zoxide
    pkgs.pyenv
    pkgs.dua
    pkgs.dust
    pkgs.flameshot
    pkgs.ripgrep-all
    pkgs.tdf
    pkgs.neovim
  ];

  home.file = {
    ".username".text = ''
      ${username}
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";

  };

}

