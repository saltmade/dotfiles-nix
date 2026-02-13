{ inputs, pkgs, ... }:

{
  imports = [
    inputs.LazyVim.homeManagerModules.default
  ];

  programs.neovim.enable = true;
  programs.lazyvim = {
    enable = true;
    plugins = [ pkgs.vimPlugins.venv-selector-nvim ];
    extras = {
      lang = {
        markdown.enable = true;
        nix.enable = true;
        python.enable = true;
        typescript.enable = true;
      };
    };
  };
}
