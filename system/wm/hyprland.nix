{ config, pkgs, lib, hyprland, ... }:
{
  options = {
    snowlfake.hyprland.enable = {
      lib.mkEnableOption "Enable Hyprland WM";
    };

    config = lib.mkIf config.snowflake.hyprland.enable {
      environment.systemPackages = with pkgs; [
        hyprland
      ];
      systemd.user.services.hyprland = {
        description = "Hyprland Window Manger";
        wantedBy = [ "default.target" ];
        serviceConfig.ExecStart = "${pkgs.hyprland}/bin/hyprland";
      };
    };
  };
}
