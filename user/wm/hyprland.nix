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
          "$mainMod" = "SUPER";

          bind = [
            "$mainMod, Q, killactive"
            "$mainMod, T, exec, ghostty"
            "$mainMod, F, exec, firefox"
            "$mainMod, E, exec, thunar"
          ];
          bindm = [
            "$mainMod, mouse:273, movewindow"
            "$mainMod, mouse:273, resizewindow"
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
