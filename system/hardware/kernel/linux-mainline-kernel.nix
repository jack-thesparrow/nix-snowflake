{config,lib,pkgs, ...}:
with lib;
{
  options.snowflake.linux-mainline-kernel.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable Linus Torvalds kernel";
  };
  config = mkIf config.snowflake.linux-mainline-kernel.enable {
    boot.kernelPackages = with pkgs; [
      linuxPackages_latest
    ];
  };
}
