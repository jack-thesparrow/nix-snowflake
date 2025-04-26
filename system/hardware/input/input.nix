{ config, pkgs, libs, ... }:
{
  options = {
    snowflake.input.enable = lib.mkEnableOption "Enable I/O";
  };
  config = lib.mkIf config.snowflake.input.enable {
    services.libinput.enable = true;
  };
}
