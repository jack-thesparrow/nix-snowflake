{ config, pkgs, lib, hyprland, ... }:
with lib;
{
  options = {
    hyprlandDesktop.enable = lib.mkEnableOption "Enable Hyprland WM and Xe graphics.";
  };
  config = lib.mkIf config.hyprlandDesktop.enable {
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ 
      "modesetting"
    ];
    hardware.opengl.enable = true;
    #hardware.opengl.driSupport = true;
    hardware.opengl.driSupport32Bit = true;
    hardware.opengl.extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      intel-vaapi-driver
      libvdpau-va-gl
    ];
    environment.systemPackages = with pkgs; [
      wayland
      xwayland
      hyprland
      kitty
      ghostty 
      rofi-wayland
      alsa-utils
    ];
    #sound.enable = true;
    #hardware.pulseaudio.enable = true;
    environment.variables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}
