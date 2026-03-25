{...}: {
  networking.firewall.allowedTCPPorts = [43009];
  networking.firewall.allowedUDPPorts = [43009 5353];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true; # To automatycznie otworzy port UDP 5353
    publish = {
      enable = true;
      userServices = true;
      addresses = true;
    };
  };
}
