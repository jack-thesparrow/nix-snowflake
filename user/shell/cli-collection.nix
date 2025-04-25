{ pkgs, ... }:
{
  home.packages = with pkgs; [
    disfetch lolcat cowsay sl fastfetch
    unzip
    hwinfo
    tree
  ];
}
