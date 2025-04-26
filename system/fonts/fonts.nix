{ config, pkgs, lib, ... }:
{
  options.snowflake.fonts.enable = lib.mkEnableOption "Enable Fonts";

  config = lib.mkIf config.snowflake.fonts.enable {
    fonts.packages = with pkgs; [
      nerdfonts
    ];
    fonts.fontconfig.enable = true;
  };
}
