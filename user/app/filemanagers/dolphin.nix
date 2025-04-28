{pkgs, config, ...}:
{
  home.packages = with pkgs; [
    libsForQt5.dolphin
  ];
}
