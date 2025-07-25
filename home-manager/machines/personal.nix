{ username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  programs.git = {
    userEmail = "marcin.szymczak156@gmail.com";
    userName = "${username}";
  };

}
