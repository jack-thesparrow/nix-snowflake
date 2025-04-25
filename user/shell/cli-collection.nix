{ pkgs, ... }:
{
  home.packages = with pkgs; [
    disfetch lolcat cowsay sl fastfetch
    htop
    unzip
    hwinfo
    tree
  ];
}
