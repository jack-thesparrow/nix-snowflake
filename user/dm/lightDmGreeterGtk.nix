{ config, pkgs, ... }:
{
  environment.etc."xdg/wayland-sessions/hyprland.desktop".text = ''
   [Desktop Entry]
   Name=Hyprland
   Comment=Hyprland Wayland Compositor
   Exec=Hyprland
   Type=Application
  '';
}
