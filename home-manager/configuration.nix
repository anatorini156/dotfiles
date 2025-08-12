{
  pkgs,
  python_pkgs,
  zen,
  settings,
  ...
}:
let
  common = import ./packages/common.nix { inherit pkgs; };
  languages = import ./packages/languages.nix { inherit pkgs python_pkgs; };
  linux_cli_packages = import ./packages/linux-cli.nix { inherit pkgs; };
  darwin_cli_packages = import ./packages/darwin-cli.nix { inherit pkgs; };
  linux_gui_packages = import ./packages/gui-linux.nix {
    inherit pkgs;
    inherit zen;
  };
  darwin_gui_packages = import ./packages/gui-darwin.nix { inherit pkgs; };

  linux_packages = linux_cli_packages ++ (if settings.guiApps then linux_gui_packages else [ ]);
  darwin_packages = darwin_cli_packages ++ (if settings.guiApps then darwin_gui_packages else [ ]);
in
{
  imports = [
    ./tools/default.nix
  ]
  ++ (if settings.system == "aarch64-darwin" then [ ./platforms/darwin.nix ] else [ ])
  ++ (if settings.system == "x86_64-linux" then [ ./platforms/linux.nix ] else [ ]);

  nixpkgs.config.allowUnfree = true;
  home.username = settings.username;

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.stateVersion = "25.05";

  home.packages =
    with pkgs;
    [
    ]
    ++ common
    ++ languages
    ++ (if settings.system == "aarch64-darwin" then darwin_packages else [ ])
    ++ (if settings.system == "x86_64-linux" then linux_packages else [ ]);

  home.sessionVariables = {
    VIRTUAL_ENV_DISABLE_PROMPT = 1;
  };
  home.file = {
    ".username".text = ''
      ${settings.username}
    '';

    # ".config/discord/settings.json".text = ''
    #   {
    #   "SKIP_HOST_UPDATE": true
    #   }
    # '';
  };
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty";
      startup = [
        { command = "kitty"; }
      ];
    };
  };
}
