{ config, pkgs, ... }:

{
  home.username = "anatorini";
  home.homeDirectory = "/home/anatorini";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.delta
    pkgs.bat
    pkgs.zoxide
    pkgs.pyenv
    pkgs.dua
    pkgs.dust
    pkgs.flameshot
    pkgs.ripgrep-all
    pkgs.tdf
    pkgs.neovim
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = { EDITOR = "nvim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
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
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.pyenv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = { enable = true; };

  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    lfs.enable = true;
    signing = {
      format = "openpgp";
      signByDefault = false;
    };
    extraConfig = {
      status = {
        branch = true;
        short = true;
        showStash = true;
      };

      branch = { sort = "-commiterdate"; };
      pull = {
        rebase = true;
        default = "current";
      };
      push = {
        autoSetupRemote = true;
        default = "current";
      };

    };
    ignores = [
      ""
      ".venv/"
      ".mypy_cache/"
      ".pytest_cache/"
      "__pycache__/"
      ".hypothesis/"
      ".ruff_cache/"
      ".ropeproject/"
      ".zig-cache/"
      "zig-out/"
      "build/"
      ".env"
      ".env*"
    ];

  };
  programs.lazygit = { enable = true; };
  programs.lazysql = { enable = true; };
  programs.lsd = {
    enable = true;
    enableZshIntegration = true;
  };
}

