{config, pkgs, ... }:
{
  programs.ranger = {
    enable = true;
    settings = {
      editor = "vim";
      pager = "vim";
    };
  };
}
