{ ... }: {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    lfs.enable = true;
    signing = {
      format = "openpgp";
      signByDefault = true;
      key = "673B43A229490888";

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
}
