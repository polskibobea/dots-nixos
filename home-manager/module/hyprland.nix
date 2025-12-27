{pkgs, ...}:
{
 wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
     systemd.enable = true;
    settings = {
      monitor = [
        "eDP-1,1920x1080@60,0x0,1"
      ];
    };
    extraConfig = "
    bind = SUPER, P, exec, hyprctl dispatch dpms off
    bind = SUPER, L, exec, hyprctl dispatch dpms on
    exec-once = waybar
    exec-once = wl-paste --type text --watch cliphist store
exec-once = wl-paste --type image --watch cliphist store 
    exec-once = wl-paste --watch cliphist store
    exec-once = hyprpaper
    bind=SUPER,F,fullscreen
    bind = SUPER, SPACE, exec, alacritty
    bind = SUPER, D, exec, discord
    bind = , Print, exec, hyprshot -m region -o both
    binde =, XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%+
    binde =, XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%-
    bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bind = SUPER, E, exec, wofi --show drun 
    bind = SUPER, Q, killactive
    bind = SUPER, Y, togglefloating
    bind = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-
    bind = ,XF86MonBrightnessUp, exec, brightnessctl s +10%
    #workspace
    bind = SUPER, 1, workspace, 1
    bind = SUPER, 1, workspace, 1
    bind = SUPER, 2, workspace, 2
    bind = $mainMod SHIFT, right, movewindow, mon:+1
    bind = $mainMod SHIFT, left, movewindow, mon:-1
    bind = SUPER, 3, workspace, 3
    bind = SUPER, 4, workspace, 4
    bind = SUPER, 5, workspace, 5
    bind = SUPER, 6, workspace, 6
    bind = SUPER, 7, workspace, 7
    bind = SUPER, 8, workspace, 8
    bind = SUPER, 9, workspace, 9
    bind = SUPER, 0, workspace, 10
    bind = SUPER SHIFT, 1, movetoworkspace, 1
    bind = SUPER SHIFT, 2, movetoworkspace, 2
    bind = SUPER SHIFT, 3, movetoworkspace, 3
    bind = SUPER SHIFT, 4, movetoworkspace, 4
    bind = SUPER SHIFT, 5, movetoworkspace, 5
    bind = SUPER SHIFT, 6, movetoworkspace, 6
    bind = SUPER SHIFT, 7, movetoworkspace, 7
    bind = SUPER SHIFT, 8, movetoworkspace, 8
    bind = SUPER SHIFT, 9, movetoworkspace, 9
    bind = SUPER SHIFT, 0, movetoworkspace, 10 
    ";
  };

}
