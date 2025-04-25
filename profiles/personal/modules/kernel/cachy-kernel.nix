{ config, lib, pkgs, chaotic, ... }:
with lib;
{
  options.enableCachyKernel = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the CachyOS kernel.";
  };
  config = mkIf config.enableCachyKernel {
    boot.kernelPackages = pkgs.linuxPackagesFor 
    chaotic.packages.${pkgs.system}.linux_cachyos;
  };
}
