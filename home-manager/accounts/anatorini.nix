{ username, pkgs, ... }:
{
  programs.git = {
    userEmail = "marcin.szymczak156@gmail.com";
    userName = "anatorini";
    signing.key = "673B43A229490888";
  };

  home.packages = with pkgs; [
    qbittorrent
  ];

}
