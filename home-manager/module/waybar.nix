{pkgs, ...}:
{
  programs.waybar = {
    enable = true;
   settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-bottom = -10;
        spacing = 0;

        modules-left = [
          "hyprland/workspaces"
          "custom/uptime"
          "cpu"
        ];

        modules-center = [ "clock" ];

        modules-right = [
          "custom/pomodoro"
          "bluetooth"
          "network"
          "pulseaudio"
          "backlight"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
            active = "";
            default = "";
          };
        };

        bluetooth = {
          format = "󰂲";
          format-on = "{icon}";
          format-off = "{icon}";
          format-connected = "{icon}";
          format-icons = {
            on = "";
            off = "";
            connected = "";
          };
          on-click = "blueman-manager";
          tooltip-format-connected = "{device_enumerate}";
        };
"custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "playerctl metadata --format='{{ artist }} - {{ title }}'";
          on-click = "playerctl play-pause";
          max-length = 50;
        };

        clock = {
          timezone = "Europe/Warsaw";
          tooltip = false;
          format = "{:%H:%M:%S  -  %A, %d}";
          interval = 1;
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          interval = 5;
          tooltip-format = "{essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };

        cpu = {
          interval = 1;
          format = "  {icon0}{icon1}{icon2}{icon3} {usage:>2}%";
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          on-click = "ghostty -e htop";
        };

        memory = {
          interval = 30;
          format = "  {used:0.1f}G/{total:0.1f}G";
          tooltip-format = "Memory";
        };

        "custom/uptime" = {
          format = "{}";
          format-icon = [ "" ];
          tooltip = false;
          interval = 1600;
          exec = "$HOME/.config/waybar/scripts/uptime.sh";
        };

        backlight = {
          format = "{icon}  {percent}%";
          format-icons = [ "" "" "" "" "" "" "" ];
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "";
          format-icons.default = [ "" "" " " ];
          on-click = "pavucontrol";
        };

        battery = {
          interval = 2;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-full = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
        };

        "custom/lock" = {
          tooltip = false;
          on-click = "sh -c '(sleep 0s; hyprlock)' & disown";
          format = "";
        };

        "custom/pomodoro" = {
          format = "{}";
          return-type = "json";
          exec = "waybar-module-pomodoro --no-work-icons";
          on-click = "waybar-module-pomodoro toggle";
          on-click-right = "waybar-module-pomodoro reset";
        };
      };
    };

style = ''
      * {
        font-family: 'SF Pro Text', 'Inter', 'Segoe UI, NotoSans Nerd Font', sans-serif;
        font-size: 13px;
        min-height: 0;
        padding-right: 0px;
        padding-left: 0px;
        padding-bottom: 0px;
      }

      #waybar {
        background: transparent;
        color: #c6d0f5;
        margin: 0px;
        font-weight: 500;
      }

      #workspaces,
      #custom-uptime,
      #cpu {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 6px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #workspaces {
        padding: 2px;
        margin-left: 7px;
        margin-right: 5px;
      }

      #custom-uptime {
        margin-right: 5px;
      }

      #custom-uptime:hover,
      #cpu:hover {
        background-color: rgb(41, 42, 53);
      }

      #workspaces button {
        color: #babbf1;
        border-radius: 5px;
        padding: 0.3rem 0.6rem;
        background: transparent;
        transition: all 0.2s ease-in-out;
        border: none;
        outline: none;
      }

      #workspaces button.active {
        color: #99d1db;
        background-color: rgba(153, 209, 219, 0.1);
        box-shadow: inset 0 0 0 1px rgba(153, 209, 219, 0.2);
      }

      #workspaces button:hover {
        background: rgb(41, 42, 53);
        color: #c6d0f5;
      }

      #clock {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 6px;
        box-shadow: 0 1px 3px rgba(153, 209, 219, 0.2);
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #clock:hover {
        background-color: rgba(153, 209, 219, 0.1);
      }

      #custom-pomodoro {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 6px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        color: #babbf1;
        font-weight: 600;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out, outline 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
      }

      #custom-pomodoro:hover {
        background-color: rgb(41, 42, 53);
        color: #c6d0f5;
        outline: 1px solid rgba(255, 255, 255, 0.1);
        outline-offset: -1px;
      }

      #custom-pomodoro.work,
      #custom-pomodoro.break {
        color: #99d1db;
        background-color: rgba(153, 209, 219, 0.1);
        box-shadow: inset 0 0 0 1px rgba(153, 209, 219, 0.2);
        outline: none;
      }

      #bluetooth,
      #pulseaudio,
      #backlight,
      #network,
      #custom-lock,
      #battery {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 0;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #bluetooth:hover,
      #pulseaudio:hover,
      #backlight:hover,
      #network:hover,
      #custom-lock:hover,
      #battery:hover {
        background-color: rgb(41, 42, 53);
      }

      #bluetooth {
        margin-left: 0px;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
      }

      #battery {
        border-top-right-radius: 6px;
        border-bottom-right-radius: 6px;
        margin-right: 7px;
      }

      #network.disconnected { color: #e78284; }
      #bluetooth.connected { color: #99d1db; }
      #battery.charging { color: #a6d189; }
      #battery.warning:not(.charging) { color: #e78284; }

      tooltip {
        background-color: #1a1b26;
        color: #dddddd;
        padding: 5px 12px;
        margin: 5px 0px;
        border-radius: 6px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        font-size: 12px;
      }
    '';
  };

}
