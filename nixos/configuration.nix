{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./services.nix
    ./networking.nix
    ./hardware-tweaks.nix
    ./programs.nix
    ./systemd.nix
    ./packages.nix
    ./users.nix
    ./security.nix
  ];

  system.stateVersion = "25.05";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "anatorini"
      ];
    };
  };

  time = {
    timeZone = "Europe/Warsaw";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pl_PL.UTF-8";
      LC_IDENTIFICATION = "pl_PL.UTF-8";
      LC_MEASUREMENT = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
      LC_NAME = "pl_PL.UTF-8";
      LC_NUMERIC = "pl_PL.UTF-8";
      LC_PAPER = "pl_PL.UTF-8";
      LC_TELEPHONE = "pl_PL.UTF-8";
      LC_TIME = "pl_PL.UTF-8";
    };
  };

  console.keyMap = "pl2";
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    (python312.withPackages (
      ps: with ps; [
        psutil
      ]
    ))
  ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
  virtualisation.vmware.guest.enable = true;

  environment.etc."wireguard" = {
    source = "/home/anatorini/.wg";
  };
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

}
