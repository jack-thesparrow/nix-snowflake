{ config, pkgs, ... }:
{
  imports = [
    ./pciutils.nix
    ./aria2.nix
    ./udisk.nix
  ];
}
