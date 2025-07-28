{pkgs,zen,...}:
with pkgs; [
  spotify
  discord
  gimp3
  gnome-tweaks
  flameshot
  zen.packages.${pkgs.system}.default
]

