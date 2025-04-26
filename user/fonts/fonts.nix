{ config, pkgs, lib, ... }:
{
  options.snowflake.fonts.enable = lib.mkEnableOption "Enable Fonts";

  config = lib.mkIf config.snowflake.fonts.enable {
    environment.systemPackages = with pkgs; [
      nerd-fonts.droid-sans-mono 
      nerd-fonts.jetbrains-mono
    ];
    fonts.fontconfig.enable = true;
  };
}
