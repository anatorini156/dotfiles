{ pkgs, ... }:
{
  virtualisation = {
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
      guest = {
        enable = false;
        dragAndDrop = true;
      };
    };
  };
  users.extraGroups.vboxusers.members = [ "anatorini" ];
}
