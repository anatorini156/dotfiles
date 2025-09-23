{
  username,
  pkgs,
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
    jetbrains.idea-community-bin
    jetbrains.clion

    gcc
    chafa
    alsa-utils
    xclip
    zen.packages.${pkgs.system}.default
    reapaer
  ];
}
