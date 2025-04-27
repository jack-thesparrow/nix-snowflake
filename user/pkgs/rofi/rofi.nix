{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi-wayland
  ];
  programs.rofi =  {
    enable = true;
    theme = "solarized";
    extraConfig = {
      modi =  "drun, run , window";
      show-icons = true;
    };
  };
}
