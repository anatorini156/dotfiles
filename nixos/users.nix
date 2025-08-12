{ pkgs, ... }:
{
  users = {
    users = {
      anatorini = {
        isNormalUser = true;
        description = "Anatorini";
        linger = true;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = with pkgs; [
          zsh
          git
        ];
        shell = pkgs.zsh;
      };
    };
  };
}
