{configs, pkgs, ...}:
{
  imports = [
    ./android/android.nix
    ./cc/cc.nix
  ];
}
