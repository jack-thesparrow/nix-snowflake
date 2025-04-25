{ config, pkgs, ... }:
let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "cls" = "clear";
    "dot" = "cd && cd .dotfiles";
  };
in
  {
    home.sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
    programs.fish = {
      enable = true;
      shellAliases = myAliases;
    };
    programs.zsh = {
      enable = true;
      shellAliases = myAliases;
    };
    programs.bash = {
      enable = true;
      shellAliases = myAliases;
    };
  }
