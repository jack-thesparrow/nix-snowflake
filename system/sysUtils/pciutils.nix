{pkgs, config, ...}:
{
  environment.systemPackages =  with pkgs; [
    pciutils
  ];
}
