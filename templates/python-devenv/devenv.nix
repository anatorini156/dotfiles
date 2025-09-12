{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  env = {
    DEV_SHELL = "sandbox/python";
  };
  cachix.enable = false;

  packages = [
    pkgs.pythonManylinuxPackages.manylinux2014Package
  ];

  languages = {
    python = {
      enable = true;
      version = "3.12";
      venv = {
        enable = true;
        requirements = ./requirements.txt;
      };

    };
  };
  enterShell = ''
    exec zsh
  '';
}
