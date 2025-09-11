{ settings, ... }:

{
  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";
}
