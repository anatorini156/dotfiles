{ username, pkgs, ... }:

{

  programs.git = {
    userEmail = "marcin.szymczak156@gmail.com";
    userName = "${username}";
  };

  home.packages = with pkgs;
    [
      qbittorrent

    ];

}
