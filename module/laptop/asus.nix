{pkgs, ...}: {
  services = {
    power-profiles-daemon.enable = true;
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };
}
