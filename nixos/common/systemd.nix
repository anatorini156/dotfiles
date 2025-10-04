{ pkgs, ... }:
{
  systemd = {
    user.services.ulauncher = {
      enable = true;
      description = "Ulauncher (user-level)";

      serviceConfig = {
        ExecStart = "${pkgs.ulauncher}/bin/ulauncher --hide-window";
        Environment = "GDK_BACKEND=x11";
      };

      # Make sure it only runs once we have a graphical session + D-Bus
      wantedBy = [ "graphical-session.target" ];
      after = [
        "graphical-session.target"
        "dbus.service"
      ];
    };
    services = {
      fprintd = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig.Type = "simple";
      };
    };

    sleep = {
      extraConfig = ''
        HibernateDelaySec=30m
        SuspendState=mem
      '';
    };
  };
}
