{pkgs, ...}: {
  environment.systemPackages = with pkgs; [ 
    #   rquickshare
    tidal-hifi
    usbutils
    pciutils 
    lm_sensors
    vlc
    #yt-dlp
    s-tui
    reaper
    stress
  ];
}
