{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Lilex Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "Lilex Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Lilex Nerd Font";
          style = "Italic";
        };
        size = 11.5;
      };
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
}
