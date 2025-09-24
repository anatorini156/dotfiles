{
  username,
  pkgs,
  pkgs-unstable,
  zen,
  ...
}:
{
  home.packages = with pkgs; [
    spotify
    discord
    gimp3
    flameshot
    zen.packages.${pkgs.system}.default
    tidal-hifi
    pkgs-unstable.idea-community-bin
    jetbrains.clion

    gcc
    chafa
    alsa-utils
    xclip
    zen.packages.${pkgs.system}.default
    reaper
    coolercontrol.coolercontrold
    coolercontrol.coolercontrol-gui
  ];
}
