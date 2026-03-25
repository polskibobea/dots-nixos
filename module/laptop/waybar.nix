{
  pkgs,
  lib,
  ...
}: {
  hjem.users.bober = {
    packages = [pkgs.waybar];
    ".config/waybar" = {
      generator = lib.generators.toJSON;
      value = {
      };
    };
  };
}
