{ ... }:
{
  networking = {
      firewall ={
          allowedTCPPorts = [22];
          };
    hostName = "nixos";
    #wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
     # wifi.backend = "iwd";
    };
  };
}
