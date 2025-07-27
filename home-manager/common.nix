{
  username,
  pkgs,
  system,
  zen,
  ...
}:
let
  lspServers = import ./packages/lsp.nix { inherit pkgs; };
in
{
  imports = [
    ./tools/default.nix

  ]
  ++ (if system == "Darwin" then [ ./platforms/darwin.nix ] else [ ])
  ++ (if system == "x86_64-linux" then [ ./platforms/linux.nix ] else [ ]);

  nixpkgs.config.allowUnfree = true;

  home.username = username;

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.stateVersion = "25.05";

  home.packages =
    with pkgs;
    [
      gcc
      nerd-fonts.jetbrains-mono
      delta
      bat
      zoxide
      pyenv
      dua
      dust
      flameshot
      fzf
      ripgrep
      ripgrep-all
      tdf
      neovim
      gimp3
      spotify
      discord
      fd
      obsidian
      cargo
      zen.packages.${pkgs.system}.default
      alsa-utils
      xclip
      tldr
    ]
    ++ lspServers;

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
}
