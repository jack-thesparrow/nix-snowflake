{ config, pkgs, hyprland, ... }:
{
  imports = [
    ../wm/hyprland.nix
  ];
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";
  environment.systemPackages = [
    hyprland.packages.${pkgs.system}.hyprland
  ];
  programs.hyprland.enable = true;
}
