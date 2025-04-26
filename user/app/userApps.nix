{config, pkgs, ... }:
{
  imports = [ 
    ./git/git.nix
    ./vim/vim.nix
    ./ranger/ranger.nix
    ./terminals/kitty.nix
    ./terminals/ghostty.nix
  ];
}
