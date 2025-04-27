{ config, pkgs, lib, ... }:
{
  options = {
    snowflake.hyprland.enable = lib.mkEnableOption "Enable Hyprland WM";
  };

  config = lib.mkIf config.snowflake.hyprland.enable {
    environment.systemPackages = with pkgs; [
      hyprland
    ];
    systemd.services.hyprland = {
      description = "Hyprland Window Manager";
      after = [ "graphical.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.hyprland}/bin/hyprland";
        Restart = "always";
        User = "rahul";
      };
    };
  };
}
