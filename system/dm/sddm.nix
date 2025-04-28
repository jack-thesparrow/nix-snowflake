{ config, pkgs, hyprland, ... }:
{
  imports = [
    ../wm/hyprland.nix
  ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.displayManager.defaultSession = "hyprland";
  environment.systemPackages = [
    hyprland.packages.${pkgs.system}.hyprland
  ];
  programs.hyprland.enable = true;
}
