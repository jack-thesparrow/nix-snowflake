{variables, ...}:
{
  imports = [
    ./binds.nix
    ./hyprland.nix
  ];
  hyprland-config.enable = true;
  hyprland-config.layout = "dwindle";

}
