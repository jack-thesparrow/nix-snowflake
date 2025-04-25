{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    gnumake
    #clang
    cmake
    autoconf
    automake
    libtool
    ncurses
    dialog
    glibc
    glibc.dev
    man-pages
  ];
}
