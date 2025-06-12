_:{
  home = {
    username = "bober";
    homeDirectory = "/home/bober";
    stateVersion = "25.11";
  };

  programs.alacritty = {
    enable = true;
    settings = {
    shell = {
      program = "/etc/profiles/per-user/bober/bin/zsh";
      args = ["-l"];
      };
     window = {
      opacity = 0.95;
      blur = true;
      };
    };
 };

  programs.neovim = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      cd1 = "cd ..";
      form = "nix fmt";
      nv = "nvim";
      rebuild = "rm ~/.config/alacritty/alacritty.toml && sudo nixos-rebuild switch --flake ~/dots-nixos && alacritty migrate";
    };
  };
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "bira";
    plugins = ["git" "sudo"];
  };

  programs.htop.enable = true;
  nix.gc = {
    automatic = true;
    frequency = "weekly";
  };
  programs.wofi.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "
    exec-once = waybar
    bind = SUPER, SPACE, exec, alacritty
    bind = SUPER, D, exec, discord
    bind = , Print, exec, hyprshot -m region -o both
    binde =, XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+
    binde =, XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-
    bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    monitor=eDP-1,1920x1080@60,0x0,1
    monitor=HDMI-A-1,1366x768@60,1920x0,1
    bind = SUPER, E, exec, wofi --show drun
    bind = SUPER, Q, killactive
    #workspace
    bind = SUPER, 1, workspace, 1
    bind = SUPER, 1, workspace, 1
    bind = SUPER, 2, workspace, 2
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

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 1;
        modules-left = [
          "hyprland/workspaces"
          "custom/separator"
        ];
        modules-center = [];
        modules-right = [
          "pulseaudio"
          "custom/separator"
          "cpu"
          "custom/separator"
          "memory"
          "custom/separator"
          "battery"
          "custom/separator"
          "clock"
          "custom/separator"
          "tray"
        ];

        "hyprland/window" = {
          format = "{title}";
        };

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "warp-on-scroll" = false;
          "sort-by-name" = true;
          format = "{name}:{icon}";
          "format-icons" = {
            "1" = ""; # Terminal
            "2" = ""; # Firefox
            "3" = ""; # Discord
            "4" = ""; # spotify
            "5" = ""; # Discord
            "6" = ""; # Spotify
            "7" = ""; # Steam
            default = ""; # Circle
          };
        };

        "custom/separator" = {
          format = "|";
        };

        clock = {
          format = " {:%H:%M}";
          "tooltip-format" = "{calendar}";
          calendar = {
            mode = "month";
            "mode-mon-col" = 1;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            format = {
              months = "<span color='#C6A0F6'><b>{}</b></span>";
              days = "<span color='#C6D0F5'><b>{}</b></span>";
              weeks = "<span color='#d20f39'><b>W{}</b></span>";
              weekdays = "<span color='#42c499'><b>{}</b></span>";
              today = "<span color='#42c499'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        cpu = {
          format = " {usage}%";
          tooltip = false;
        };

        memory = {
          format = " {}%";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          "format-charging" = "{icon} {capacity}%";
          "format-plugged" = "{icon} {capacity}%";
          "format-alt" = "{time}{icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        pulseaudio = {
          format = "{icon} {volume:>}% {format_source}";
          "format-bluetooth" = "{volume:>}%{icon} {format_source}";
          "format-bluetooth-muted" = "{icon} {format_source}";
          "format-source" = " {volume:>}%";
          "format-source-muted" = "";
          "format-icons" = {
            headphone = "";
            "hands-free" = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol-qt";
        };

        tray = {
          "icon-size" = 18;
          spacing = 0;
          "show-passive-items" = false;
        };
      };
    };

    style = ''
      @define-color rosewater #F5E0DC;
      @define-color flamingo #F2CDCD;
      @define-color pink #F5C2E7;
      @define-color mauve #C6A0F6;
      @define-color red #F28FAD;
      @define-color maroon #E8A2AF;
      @define-color peach #F8BD96;
      @define-color yellow #FAE3B0;
      @define-color green #ABE9B3;
      @define-color teal #B5E8E0;
      @define-color sky #96CDFB;
      @define-color sapphire #91EAE2;
      @define-color blue #8CAAEE;
      @define-color lavender #BABBF1;
      @define-color text #C6D0F5;
      @define-color subtext1 #BAC2DE;
      @define-color subtext0 #A6ADC8;
      @define-color overlay2 #9399B2;
      @define-color overlay1 #7F849C;
      @define-color overlay0 #6E738D;
      @define-color surface2 #5B6078;
      @define-color surface1 #494D64;
      @define-color surface0 #363A4F;
      @define-color base #24273A;
      @define-color mantle #1F2335;
      @define-color crust #11111B;

      * {
          border: 0;
          border-radius: 0;
          padding: 0 0;
          font-family: "JetBrainsMono NF", "JetBrainsMono NF";
          font-size: 16px;
          margin-right: 2px;
          margin-left: 2px;
      }

      window#waybar {
          background: @crust;
      }

      #workspaces button {
          color: @blue;
          padding-right: 8px;
          margin: 0 0;
      }

      #workspaces button:hover {
          color: @mauve;
      }

      #workspaces button.persistent {
          color: @blue;
      }

      #workspaces button.empty {
          color: @surface0;
      }

      #workspaces button.active {
          background-color: @base;
          color: @sapphire;
      }

      /* Rest of your CSS... */
    '';
  };
}
