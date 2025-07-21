{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024;
    }
  ];

  networking = {
    hostName = "bobrowniki";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Warsaw";

  # programs.hyprland.withUWSM = true;
  programs.java.enable = true;
  #programs.virt-manager.enable = true;
  #users.groups.libvirtd.members = ["bober"];
  #virtualisation.libvirtd.enable = true;
  #virtualisation.spiceUSBRedirection.enable = true;

  programs.hyprland.enable = true;
  users.users.bober = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  hardware.graphics = {
    enable = true;
  };

  nix.settings.experimental-features = ["flakes" "nix-command"];
  nix.settings.auto-optimise-store = true;
  boot.loader.systemd-boot.configurationLimit = 5; # lub boot.loader.grub.configurationLimit
  i18n.defaultLocale = "pl_PL.UTF-8";

  system.stateVersion = "25.11";
}
