{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./package.nix
    ./module
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
  programs.hyprland.enable = true;
  users.users.bober = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  hardware.graphics = {
    enable = true;
  };
  fonts.fontconfig.enable = true;
  services = {
    displayManager.sddm.wayland.enable = true;
    xserver.enable = true;
    displayManager.sddm.enable = true;
    supergfxd.enable = true;
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

  nix.settings.experimental-features = ["flakes" "nix-command"];
  nix.settings.auto-optimise-store = true;
  boot.loader.systemd-boot.configurationLimit = 5; 
  i18n.defaultLocale = "pl_PL.UTF-8";

  system.stateVersion = "25.11";
}
