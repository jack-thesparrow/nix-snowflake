{ config, pkgs, hyprland, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.displayManager.defaultSession = "hyprland";
  programs.hyprland.enable = true;
}
