{ config, pkgs, hyprland, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.displayManager.defaultSession = "hyprland";
  environment.systemPackages = with pkgs; [
    hyprland.packages.${pkgs.system}.hyprland
  ];
}
