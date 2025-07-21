{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.gamemode.enable = true;
  hardware.xone.enable = true;
  systemd.user.services.steam-gamescope-session = {
    description = "Steam Big Picture with Gamescope";
    wantedBy = ["graphical-session.target"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.gamescope}/bin/gamescope -W 1920 -H 1080 -r 60 -- steam -bigpicture";
    };
  };
}
