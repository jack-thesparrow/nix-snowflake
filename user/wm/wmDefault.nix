{host, ...}:
let
  inherit (import ../../profiles/personal/variables.nix)
  ;
in {
  imports = [
    ./binds.nix
    ./hyprland.nix
  ];
  hyprland-config.enable = true;
  hyprland-config.layout = "dwindle";

}
