{
  username,
  pkgs,
  zen,
  hyprspace,
  ...
}:
{
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
    zen.packages.${pkgs.system}.default
    reaper
    coolercontrol.coolercontrold
    coolercontrol.coolercontrol-gui
    libreoffice-still
    postman
    godot
    blender
    kubectl
    kind
    act
    dracula-theme
    hyprlock
  ];
  wayland.windowManager.hyprland.plugins = [
    hyprspace.packages.${pkgs.system}.Hyprspace
  ];
}
