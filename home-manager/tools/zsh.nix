{ pkgs,username, ... }:
{
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
      devsh = "devenv shell";
    };
    dirHashes = {
      dev = "$HOME/Dev/";
      docs = "$HOME/Documents/";
    };
    oh-my-zsh = {
      enable = true;
      theme = "bira";
      custom = "$HOME/.config/omz-custom";
      plugins = [
        "git"
        "colored-man-pages"
        "nvm"
      ];
      extraConfig = ''
        zstyle ':omz:update' mode disabled  
        zstyle ':omz:plugins:nvm' lazy yes


      '';
    };
      initExtra = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '';

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
                pushd ~/.config/home-manager/
                $EDITOR .
                git add .
                git commit -m "Home-manager $(LC_TIME=en_US.UTF-8 date)"
                popd
            }

            ose() {
                pushd ~/.config/nixos/
                $EDITOR .
                git add .
                git commit -m "NixOS $(LC_TIME=en_US.UTF-8 date)"
                popd
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

            setup() {
              template=$(ls ~/.config/templates | fzf)
              cp -i -r "$HOME/.config/templates/$template/"{.,}* .
              git init
            }

            export EDITOR="nvim"
            source <(command fx --init)

    '';

  };
}
