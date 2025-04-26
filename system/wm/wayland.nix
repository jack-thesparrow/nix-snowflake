{ config, pkgs, lib, ... }:
{
  options = {
    snowflake.wayland.enable = lib.mkEnableOption "Enable Wayland";
  };

  config = lib.mkIf config.snowflake.wayland.enable {
    environment.systemPackages = with pkgs; [
      wayland
      xwayland
      libinput
    ];
  };
}
