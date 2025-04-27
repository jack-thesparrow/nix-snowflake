{config, lib, pkgs, chaotic, ...}:
with lib;

let 
  nixDefault = pkgs.linuxPackages;
  chachyOS = chaotic.packages.${pkgs.system}.linux_cachyos;
  latestStable = pkgs.linuxPackages_latest;
  lts = pkgs.linuxPackages_lts;
  zenKernel = pkgs.linuxPackages_zen;
in
{
  imports = [
    ./cachy-kernel.nix
  ];
  options.snowflake.selectedKernel = lib.mkOption {
    type = lib.types.enum [
      "default"
      "cachy"
      "latest"
      "lts"
      "zen"
    ];
    default = "default";
    description = "choose your kernel version";
  };
  config = {
    snowflake.CachyKernel.enable = config.snowflake.selectedKernel == "cachy";
    boot.kernelPackages =mkIf (config.snowflake.selectedKernel != "cachy") (
      lib.mkMerge [
      (lib.mkIf
      (config.snowflake.selectedKernel == "default") nixDefault)
      (lib.mkIf
      (config.snowflake.selectedKernel == "cachy") {
        config.snowflake.CachyKernel.enable = true;
      })
      (lib.mkIf
      (config.snowflake.selectedKernel == "latest") latestStable)
      (lib.mkIf
      (config.snowflake.selectedKernel == "lts") lts)
      (lib.mkIf
      (config.snowflake.selectedKernel == "zen") zenKernel)
    ]);
  };
} 

