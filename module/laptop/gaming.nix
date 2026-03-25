{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
    mangohud
    legcord
    gamescope
    prismlauncher
    heroic
  ];
}
