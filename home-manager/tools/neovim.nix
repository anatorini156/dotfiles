{ pkgs,... }: {
  programs.neovim = {
    enable = false;
    defaultEditor = true;
    extraPackages = with pkgs; [
    ];
  };
}
