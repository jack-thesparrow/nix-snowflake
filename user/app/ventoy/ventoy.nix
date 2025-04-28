{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs;[
    ventoy-full-qt
  ];
}
