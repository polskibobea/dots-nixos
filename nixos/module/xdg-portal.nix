{ config, pkgs, ... }:

{
  # Konfiguracja XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
    xdgOpenUsePortal = true;
  };

  # Niezbędne pakiety narzędziowe XDG
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-utils
  ];
}
