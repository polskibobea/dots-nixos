{
  pkgs,
  lib,
  ...
}: {
  hjem.users.bober = {
  packages = [pkgs.alacritty];
    files = {
      ".config/alacritty/alacritty.toml" = {
        generator = (pkgs.formats.toml {}).generate "alacritty.toml"; 
        value = {
          window = {
            opacity = 0.95;
            blur = true;
          };
          shell = {
            program = "/etc/profiles/per-user/bober/bin/zsh";
            args = ["-l"];
          };
          font = {
            normal = {
              family = "Lilex Nerd Font";
              style = "Regular";
            };
            bold = {
              family = "Lilex Nerd Font";
              style = "Bold";
            };
          };
        };
      };
    };
  };
}
