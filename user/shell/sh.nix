{ config, pkgs, ... }:
let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "cls" = "clear";
<<<<<<< HEAD
    "dots" = "cd && cd .dotfiles";
=======
    "dot" = "cd && cd .dotfiles";
>>>>>>> 3b09405 (Rebuilt from scratch)
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
