{ pkgs, ... }:
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
      displayManager.gdm.enable = false;
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
    openssh = {
    enable = true;
    ports = [22];
        settings = {
            PasswordAuthentication = true;
            AllowUsers = null;
            UseDns = true;
            X11Forwarding = true;
            PermitRootLogin = "no";
        };
    };
  };

}
