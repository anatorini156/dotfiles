{ username, ... }:

{
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  programs.git = {
    userEmail = "marcin.szymczak@dolby.com";
    userName = "Marcin Szymczak";
  };
}
