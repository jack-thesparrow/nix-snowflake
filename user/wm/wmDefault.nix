{pkgs, ...}:
{
  imports = [
    ./binds.nix
    ./hyprland.nix
    ./monitors.nix
    ./animations-end4.nix
    ./hyprlock.nix
    #./animations-dynamic.nix
  ];
  hyprland-config.enable = true;
  hyprland-config.layout = "dwindle";

}
