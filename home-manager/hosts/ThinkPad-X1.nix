{
  username,
  pkgs,
  zen,
  hyprspace,
  blender-pkgs,
  spotify-pkgs,
  ...
}:
{
  xdg = {
    enable = true;
    configFile = {
      "hypr/plugins.conf" = {
        text = ''
          exec-once = hyprctl plugin load ${pkgs.hyprlandPlugins.hyprspace}/lib/libhyprspace.so
        '';
      };
      "zsh/scripts.sh" = {
        source = ../external/scripts.sh;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "zen-beta.desktop" ];
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      };
    };
  };

  programs.kitty.settings.background_opacity = 0.95;

  services.hypridle.settings = {
    general = {
      after_sleep_cmd = "hyprlock";
      lock_cmd = "hyprlock";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    # Note the different syntax for gtk3 and gtk4
    gtk3.extraConfig = {
      "gtk-cursor-theme-name" = "Bibata-Modern-Classic";
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-cursor-theme-name=Bibata-Modern-Classic
      '';
    };
  };
  home.packages = with pkgs; [
    discord
    gimp3
    flameshot
    zen.packages.${pkgs.system}.default
    tidal-hifi
    unstable.jetbrains.idea-community-bin
    jetbrains.clion
    gcc
    chafa
    alsa-utils
    xclip
    spotify-pkgs.spotify
    zen.packages.${pkgs.system}.default
    reaper
    coolercontrol.coolercontrold
    coolercontrol.coolercontrol-gui
    libreoffice-still
    postman
    godot
    kubectl
    kind
    act
    dracula-theme
    hyprlock
    hyprpaper
    blender
    pavucontrol
    swaynotificationcenter
    swayosd
    wlogout
    nautilus
    nwg-clipman
    nwg-look
    nwg-displays
    hyprshot
    zathura
    playerctl
    vscode
    cheese
    android-studio
  ];
  wayland.windowManager.hyprland.plugins = [
    hyprspace.packages.${pkgs.system}.Hyprspace
  ];

}
