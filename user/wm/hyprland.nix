{ config, pkgs, lib, ... }:
let
  cfg = config.hyprland-config;
in
  {
    options = {
      hyprland-config = {
        enable = lib.mkEnableOption "Enable hyprland config";
        layout = lib.mkOption {
          default = "dwindle";
          description = "Hyprland window layout";
        };
      };
    };

    config = lib.mkIf cfg.enable {
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          monitor = ",preferred,auto,auto";

          general = {

            # Main modifier
            "$mainMod" = "SUPER";
            
            # Assign apps
            "$terminal" = "ghostty";
            "$fileManager" = "thunar";
            "$browser" = "firefox";

            layout = cfg.layout;
            border_size = 2;

            gaps_in = 5;
            gaps_out = 20;

            resize_on_border = false;
          };

          decoration = {
            blur.enabled = true;
            shadow.enabled = true;
            
            rounding = 5;
            rounding_power = 4.0;
          };

          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };

          # Keybindings

          bind = [
            # For binding shortcuts
            "$mainMod, Q, killactive"
            "$mainMod, T, exec, $terminal"
            "$mainMod, F, exec, $browser"
            "$mainMod, E, exec, $fileManager"

            # For workspaces
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"
          ];
          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:272, resizewindow"
          ];
          input = {
            kb_layout = "us";
            kb_variant = "";
            kb_model = "";
            kb_options = "caps:swapescape";
            kb_rules = "";

            follow_mouse = 1;

            sensitivity = 0;
            
            touchpad = {
              natural_scroll = true;
            };
          };
          

          misc = {
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
          };
        };
      };
    };
  }
