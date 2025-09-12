{ pkgs, ... }:
{
  systemd = {
    user.services.ulauncher = {
      enable = true;
      description = "Ulauncher (user-level)";
      serviceConfig = {
        ExecStart = "${pkgs.ulauncher}/bin/ulauncher";
        Environment = "GDK_BACKEND=x11";
      };
      wantedBy = [ "graphical-session.target" ];
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
