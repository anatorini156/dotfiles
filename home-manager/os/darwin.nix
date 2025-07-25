{ config, pkgs, ... }:

{
  home.username = "mxszym";
  home.homeDirectory = "/Users/mxszym";

  programs.git = {
    userEmail = "marcin.szymczak@dolby.com";
    userName = "Marcin Szymczak";
  };
}
