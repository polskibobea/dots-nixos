{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.kkts.system) username;
  inherit (lib) getExe; 
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = username;
        command = "${getExe pkgs.greetd.tuigreet} -w 48 -t -r";
      };
    };
  };
}
