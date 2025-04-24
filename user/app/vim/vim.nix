{config, pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [vim-airline auto-pairs vim-visual-multi ];
    settings = {ignorecase = true; };
    extraConfig = ''
      set mouse=a
      set number
    '';
  };
}
