{ pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    #android-udev-tools
  ];
}
