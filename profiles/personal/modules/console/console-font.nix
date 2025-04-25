{ config, pkgs, lib, ... }:
{
  options.consoleFont.enable = {
    type = lib.types.bool;
    default = true;
    description = "Enable a bigger tty font";
  };
  config = lib.mkIf 
  config.consoleFont.enable {
    fonts.consoleFonts = with pkgs; [
      terminus_font
    ];
    console = {
      font = "Lat2-Terminus32x16";
      useXkbConfig = true;
      };
    };
}
