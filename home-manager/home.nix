{ pkgs, ... }:

let
  platform = "Linux";
  # platform = "Darwin";
in {
  imports = [
    ./tools/default.nix

  ] ++ (if platform == "Darwin" then [ ./os/darwin.nix ] else [ ])
    ++ (if platform == "Linux" then [ ./os/linux.nix ] else [ ]);

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
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";

  };

  programs.home-manager.enable = true;

}

