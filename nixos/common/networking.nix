{ ... }:
{
  networking = {
      firewall ={
          allowedTCPPorts = [22];
          };
    #wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
     # wifi.backend = "iwd";
    };
  };
}
