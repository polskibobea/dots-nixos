{pkgs, ...}:
{
services = {
    #displayManager.gdm.enable = true;
    orca.enable = false;
    displayManager.sddm.wayland.enable = true;
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.gnome.enable = true;
   # auto-epp = {
    # enable = true;
     #acState = "performance";
     #batteryState = "power";
  #};
    usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
    };
    xserver.xkb = {
      layout = "pl";
      options = "eurosign:e,caps:escape";
    };

    openssh.enable = true;
  };
  }
