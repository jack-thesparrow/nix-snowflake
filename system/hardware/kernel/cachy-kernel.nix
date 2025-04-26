{ config, lib, pkgs, chaotic, ... }:
with lib;
{
  options.snowflake.CachyKernel.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the CachyOS kernel.";
  };
  config = mkIf config.snowflake.CachyKernel.enable {
    boot.kernelPackages = pkgs.linuxPackagesFor 
    chaotic.packages.${pkgs.system}.linux_cachyos;
  };
}
