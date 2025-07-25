{ username, pkgs, system, ... }:

{
  imports = [
    ./tools/default.nix

  ] ++ (if system == "Darwin" then [ ./platforms/darwin.nix ] else [ ])
    ++ (if system == "x86_64-linux" then [ ./platforms/linux.nix ] else [ ]);

  nixpkgs.config.allowUnfree = true;

  home.username = username;

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    delta
    bat
    zoxide
    pyenv
    dua
    dust
    flameshot
    ripgrep-all
    tdf
    neovim
    gimp3
    spotify
    discord
    fd
    obsidian
  ];

  home.file = {
    ".username".text = ''
      ${username}
    '';

    # ".config/discord/settings.json".text = ''
    #   {
    #   "SKIP_HOST_UPDATE": true
    #   }
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";

  };

}

