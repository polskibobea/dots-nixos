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
    ../../module/raspberry
  ];
  hjem = {
    users.bober = {
      user = "bober";
      directory = "/home/bober";
    };
    clobberByDefault = true;
    linker = packages.${system}.smfh;
  

  };
}
