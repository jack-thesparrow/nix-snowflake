{ config, pkgs, lib, hyprland, ... }:
{
  options = {
    snowflake.hyprland.enable = lib.mkEnableOption "Enable Hyprland WM";
  };

  config = lib.mkIf config.snowflake.hyprland.enable {
    environment.systemPackages = with pkgs; [
      hyprland
    ];
  };
}
