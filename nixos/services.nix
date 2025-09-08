{ pkgs, ... }:
let
  ulauncherPkg = pkgs.ulauncher;
in
{

  services = {
    dbus.packages = [
      pkgs.gnome-keyring
      pkgs.gcr
    ];
    fprintd.enable = true;
    fprintd.tod.enable = true;
    gnome.gnome-keyring.enable = true;
    fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "pl";
        variant = "";
      };
    };
    printing = {
      enable = true;
    };
    pulseaudio = {
      enable = false;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    blueman.enable = true;
    power-profiles-daemon.enable = true;
    logind.lidSwitch = "suspend-then-hibernate";
    flatpak.enable = true;
    ulauncher = {
      enable = true;
      description = "Ulauncher application launcher";
      # Optional: run after graphical.target if needed
      after = [ "graphical.target" ];
      wantedBy = [ "default.target" ];

      serviceConfig = {
        ExecStart = "${ulauncherPkg}/bin/ulauncher";
        Restart = "on-failure";
        RestartSec = "5s";
        Type = "simple";
      };

     
      path = [ ulauncherPkg ];
    };
  };

}
