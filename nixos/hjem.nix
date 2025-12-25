{
  inputs,
  lib,
  config,
  ...
}: let
  inherit (inputs.hjem) packages;
  inherit (config.nixpkgs.hostPlatform) system;
in {
  imports = [
    ./module
  ];
  hjem = {
    users.bober = {
      user = "bober";
      directory = "/home/bober";
        systemd.enable = false; #wyjeb jak hm nie bedzie
    };
    clobberByDefault = true;
    linker = packages.${system}.smfh;
  

  };
}
