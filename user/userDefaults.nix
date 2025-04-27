{ config, pkgs, ... }:
{
  imports = [
    ./app/userApps.nix
    ./lang/lang.nix
    ./pkgs/userPkgs.nix
    ./shell/shellDefaults.nix
    ./wm/hyprland.nix
  ];

  hyprland-config.enable = true;
  hyprland-config.layout = "dwindle";
}
