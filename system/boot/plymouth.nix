{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs;[
    plymouth
  ];
  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
