{pkgs, inputs, ...}: {
  hjem.users.bober = {
    packages = [
      pkgs.libnotify
      pkgs.swww
      inputs.ags.packages.${pkgs.system}.default
    ];
    files.".config/ags" = {
      source = ./config;
    };
  };
}
