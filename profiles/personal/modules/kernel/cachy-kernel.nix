{ config, pkgs, lib, ... }:
{
  options.my.kernel.useCachy = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Use Cachy Kernel instead of the default kernel";
  };
  config = lib.mkIf 
  config.my.kernel.useCachy {
    boot.kernelPackages = pkgs.linuxPackages_cachyos;
  };
}
