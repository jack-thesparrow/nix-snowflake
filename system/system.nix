{ config, pkgs, ...  }:
{
  imports = [
    ./console/console-font.nix
    ./fonts/fonts.nix
    ./hardware/gpu/gpu.nix
    ./hardware/kernel/cachy-kernel.nix
    ./hardware/sound/pipewire.nix
    ./wm/hyprland.nix
    ./wm/wayland.nix
    ./hardware/input/input.nix
    ./apps/waybar/waybar.nix
    ./sysUtils/sysUtils.nix
  ];
}
