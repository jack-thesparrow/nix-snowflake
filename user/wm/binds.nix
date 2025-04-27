{ configs, variables, pkgs, ... }:
 
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Window/Session actions
      "$mainMod, Delete, exit" #kill hyprland session
      "$mainMod, Q, killactive" # kill acitve window
      "$mainMod, W, togglefloating" # toggle floating window
      "$mainMod, G, togglegroup" # toggle the window between focus and group
      "Alt, Return, fullscreen" # toggle the window between focus and fullscreen

      # Keybinds for applications
      "$mainMod, T, exec, $terminal"
      "$mainMod, F, exec, $firefox"
      "$mainMod, E, exec, $fileManager"

      # Move between grouped windows
      "$mainMod CTRL, H, changegroupactive, b"
      "$mainMod CTRL, L, changegroupactive, f"

      # Move or change window focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u "
      "$mainMod, down, movefocus, d"
      "Alt, Tab, movefocus, d"

      # Switch workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      #Switch workspaces to a relative workspace
      "$mainMod+Ctl,Right,workspace,r+1"
      "$mainMod+Ctl,Left,workspace,r-1"

      # Move to first empty workspace
      "$mainMod+Ctl, Down, workspace,empty"

    ];

    # Keybinds for mouse
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewidow"
    ];
  };
}
