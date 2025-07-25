{ config, pkgs, ... }:

{
  home.username = "anatorini";
  home.homeDirectory = "/home/anatorini";

  programs.git = {
    userEmail = "marcin.szymczak156@gmail.com";
    userName = "anatorini";
  };
}
