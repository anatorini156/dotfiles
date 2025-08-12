{ pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    sway = {
      enable = true;
    };
  };
}
