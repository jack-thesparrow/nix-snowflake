{ config, pkgs, lib,... }:
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
      systemd.user.targets.hyprland-session.Unit.Wants = [
        "xdg-desktop-autostart.target"
      ];

      wayland.windowManager.hyprland = {
        enable = true;

        systemd = {
          enable = true;
          enableXdgAutostart = true;
          variables = ["--all"];
        };
        xwayland = {
          enable = true;
        };



        settings = {
          general = {

            # Main modifier
            "$mainMod" = "SUPER";
            
            # Assign apps
            "$terminal" = "ghostty";
            "$fileManager" = "dolphin";
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
          cursor = {
            sync_gsettings_theme = true;
            no_hardware_cursors = 2; # change to 1 if want to disable
            enable_hyprcursor = false;
            warp_on_change_workspace = 2;
            no_warps = true;
          };

          misc = {
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
          };
        };
      };
    };
  }
