{ username, ... }: {
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
      discord = "discord --no-sandbox";
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

    initContent = ''
      hms() {
          pushd ~/.config/home-manager/
          git add -f .
          home-manager switch --flake .#${username}
          popd
      }

      hmc() {
          pushd ~/.config/home-manager/
          git add -f .
          git commit
          git push
          popd
      }

      hme() {
          $EDITOR ~/.config/home-manager/
      }

      ose() {
          $EDITOR ~/.config/nixos/configuration.nix
      }

      oss() {
          sudo nixos-rebuild switch
      }

      osc() {
          pushd ~/.config/nixos/
          git add -f .
          git commit
          git push
          popd
      }

      port() {
          sudo lsof -i :$1
      }

      nve() {
        $EDITOR ~/.config/nvim/
      }

      export EDITOR="nvim"

    '';

  };
}
