{ configs,pkgs, ... }:
 
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
      "$mainMod, F, exec, $browser"
      "$mainMod, E, exec, $fileManager"

      # Move between grouped windows
      "$mainMod CTRL, H, changegroupactive, b"
      "$mainMod CTRL, L, changegroupactive, f"

      # Move or change window focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u "
      "$mainMod, down, movefocus, d"
      "Alt, Tab, cyclenext"

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
      "$mainMod+Ctrl,Right,workspace,r+1"
      "$mainMod+Ctrl,Left,workspace,r-1"

      # Move to first empty workspace
      "$mainMod+Ctrl, Down, workspace,empty"

      # Resize windows
      "$mainMod+Shift, Right, resizeactive,30 0"
      "$mainMod+Shift, Left, resizeactive,-30 0"
      "$mainMod+Shift, Up, resizeactive,0 -30"
      "$mainMod+Shift, Down, resizeactive,0 30"

      # Switch workspaces
      "$mainMod+Shift, 1,movetoworkspace, 1"
      "$mainMod+Shift, 2,movetoworkspace, 2"
      "$mainMod+Shift, 3,movetoworkspace, 3"
      "$mainMod+Shift, 4,movetoworkspace, 4"
      "$mainMod+Shift, 5,movetoworkspace, 5"
      "$mainMod+Shift, 6,movetoworkspace, 6"
      "$mainMod+Shift, 7,movetoworkspace, 7"
      "$mainMod+Shift, 8,movetoworkspace, 8"
      "$mainMod+Shift, 9,movetoworkspace, 9"
      "$mainMod+Shift, 0,movetoworkspace, 10"

      # Move focused window to a relative workspace
      "$mainMod+Ctrl+Alt, Right, movetoworkspace, r+1"
      "$mainMod+Ctrl+Alt, Left, movetoworkspace, r-1"

      # Scroll through existing workspaces
      "$mainMod, mouse_down,workspace,e+1"
      "$mainMod, mouse_up, workspace, e-1"
      # Utils Keybind
    ];

    # Keybinds for mouse
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewidow"
      "$mainMod, Z, movewindow"
      "$mainMod, X, resizewindow"
    ];
  };
}
