{ config, lib, pkgs, chaotic, ... }:
with lib;
{
  options.snowflake.enableCachyKernel = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the CachyOS kernel.";
  };
  config = mkIf config.snowflake.enableCachyKernel {
    boot.kernelPackages = pkgs.linuxPackagesFor 
    chaotic.packages.${pkgs.system}.linux_cachyos;
  };
}
