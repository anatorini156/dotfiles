{pkgs,zen,...}:
with pkgs; [
  spotify
  discord
  gimp3
  flameshot
  zen.packages.${pkgs.system}.default
  tidal-hifi
]

