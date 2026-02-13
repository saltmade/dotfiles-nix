{ pkgs, ... }:

{
  home.username = "salt";
  home.homeDirectory = "/home/salt";
  home.stateVersion = "25.11";
  home.file.".config/hypr".source = ./hypr;

  imports = [
    ./nvim
    ./zen
  ];

  home.packages = with pkgs; [
    fd
    fzf
    ghostty
    ripgrep
    uv
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "salt";
      user.email = "aloha@salt.ac";

      branch.sort = "committerdate";
      commit.verbose = true;
      core.editor = "nvim";
      diff.algorithm = "histogram";
      diff.colorMoved = "default";
      diff.context = 10;
      fetch.prune = true;
      fetch.prunetags = true;
      init.defaultBranch = "trunk";
      log.date = "iso";
      merge.conflictStyle = "zdiff3";
      push.autoSetupRemote = true;
      push.followTags = true;
      rebase.autoSquash = true;
      rerere.enabled = true;
    };

    ignores = [
      "*.DS_STORE"
      "__pycache__"
    ];
  };

  programs.nushell = {
    enable = true;
    envFile.text = ''
      $env.PATH ++= ['~/.local/bin']
    '';
  };

  programs.ssh =
    let
      onePassPath = "~/.1password/agent.sock";
    in
    {
      enable = true;
      extraConfig = ''
        Host *
          IdentityAgent ${onePassPath}
      '';
    };

  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [
          "battery"
          "clock"
        ];
      };
    };
  };

  services.walker.enable = true;
}
