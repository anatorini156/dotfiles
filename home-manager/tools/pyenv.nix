{ settings, ... }:
{
  programs.pyenv = {
    enable = true;
    enableZshIntegration = true;
    rootDirectory =
      if settings.system == "x86_64-linux" then
        "/home/${settings.username}/.pyenv"
      else
        "/Users/${settings.username}/.pyenv";
  };
}
