{
  username,
  pkgs,
  system,
  ...
}:
let
  languages = import ./packages/languages.nix { inherit pkgs; };
  linux_packages = import ./packages/linux.nix { inherit pkgs; };
  darwin_packages = import ./packages/darwin.nix { inherit pkgs; };
in
{
  imports = [
    ./tools/default.nix

  ]
  ++ (if system == "x86_64-darwin" then [ ./platforms/darwin.nix ] else [ ])
  ++ (if system == "x86_64-linux" then [ ./platforms/linux.nix ] else [ ]);

  nixpkgs.config.allowUnfree = true;

  home.username = username;

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.stateVersion = "25.05";

  home.packages =
    with pkgs;
    [
      nerd-fonts.jetbrains-mono
      delta
      bat
      zoxide
      pyenv
      dua
      dust
      fzf
      ripgrep
      ripgrep-all
      tdf
      neovim
      fd
      obsidian
      cargo
      tldr
      kitty
      felix-fm
      fastfetch
    ]
    ++ languages
    ++ (if system == "x86_64-darwin" then darwin_packages else [ ])
    ++ (if system == "x86_64-linux" then linux_packages else [ ]);

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
