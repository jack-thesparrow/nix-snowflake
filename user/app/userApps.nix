{config, pkgs, ... }:
{
  imports = [ 
    ./git/git.nix
    ./vim/vim.nix
    ./ranger/ranger.nix
    ./terminals/kitty.nix
    ./terminals/ghostty.nix
    ./browsers/librewolf.nix
    ./browsers/firefox.nix
    ./filemanagers/thunar.nix
    ./filemanagers/dolphin.nix
    ./ventoy/ventoy.nix
  ];
}
