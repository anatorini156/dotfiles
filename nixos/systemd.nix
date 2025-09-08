{ pkgs, ... }:
{
  systemd = {
    user.services.ulauncher = {
      enable = false;
      description = "Ulauncher (user-level)";
      serviceConfig.ExecStart = "${pkgs.ulauncher}/bin/ulauncher";
      wantedBy = [ "default.target" ];
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
