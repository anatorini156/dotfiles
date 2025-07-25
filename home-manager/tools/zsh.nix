{ ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      cat = "bat --paging=never";
      lv = "lsd -1";
      ff = ''fzf --preview "batcat --color=always  {}"'';
      gs = "git status";
      gp = "git push";
      gu = "git pull";
      gc = "git commit -S -m";
      ga = "git add";
    };
    dirHashes = {
      dev = "$HOME/Dev/";
      docs = "$HOME/Documents/";
    };
    oh-my-zsh = {
      enable = true;
      theme = "bira";
      plugins =
        [ "git" "colored-man-pages" "nvm" "git-auto-fetch" "git-prompt" "fzf" ];
      extraConfig = ''
        zstyle ':omz:update' mode disabled  
        zstyle ':omz:plugins:nvm' lazy yes
      '';
    };
    envExtra = ''
        port() {
        sudo lsof -i :$1
      }
    '';

  };
}
