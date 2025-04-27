{ configs, pkgs, ... }:
{
  imports = [
    ./cli-collection.nix
    ./sh.nix
  ];
}
