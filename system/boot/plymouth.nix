{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs;[
    plymouth
  ];
  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";
}
