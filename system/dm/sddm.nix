{ config, pkgs, hyprland, ... }:
{
  imports = [
    ../wm/hyprland.nix
  ];
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";
  services.xserver.displayManager.sessionCommands = ''
    xrandr --output eDP-1 --set "scaling mode" "Full aspect"
    '';
  environment.systemPackages = [
    hyprland.packages.${pkgs.system}.hyprland
  ];
  programs.hyprland.enable = true;
}
