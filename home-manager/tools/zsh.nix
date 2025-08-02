{ username, ... }: {
  programs.zsh = {
    enable = true;
    zprof.enable = false;
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
      lg = "lazygit";
      nv = "nvim .";
    };
    dirHashes = {
      dev = "$HOME/Dev/";
      docs = "$HOME/Documents/";
    };
    oh-my-zsh = {
      enable = true;
      theme = "bira";
      custom = "$HOME/.config/omz-custom";
      plugins =
        [ "git" "colored-man-pages" "nvm" ];
      extraConfig = ''
        zstyle ':omz:update' mode disabled  
        zstyle ':omz:plugins:nvm' lazy yes


      '';
    };

    initContent = ''
      hms() {
          pushd ~/.config/home-manager/
          git add .
          home-manager switch
          popd
      }

      hmc() {
          pushd ~/.config/home-manager/
          git add .
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
      source <(command fx --init)

    '';

  };
}
