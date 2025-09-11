{ username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  programs.pyenv = {
    rootDirectory = "/home/${username}/.pyenv";
  };
}
