{ pkgs, ... }:
{
  systemd = {
    services = {
      fprintd = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig.Type = "simple";
      };
    };
    sleep = {
      extraConfig = ''
        HibernateDelaySec=1h
      '';
    };
  };
}
