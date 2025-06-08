{pkgs, ...}: {
  imports = [./hardware-configuration.nix];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    xserver.xkb = {
      layout = "pl";
      options = "eurosign:e,caps:escape";
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    openssh.enable = true;
  };

  users.users.bober = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  programs.firefox.enable = true;
  nix.settings.experimental-features = ["flakes" "nix-command"];

  environment.systemPackages = with pkgs; [
    (discord.override {withVencord = true;})
    git
    neofetch
    usbutils
    vim
    wget
  ];

  i18n.defaultLocale = "pl_PL.UTF-8";

  system.stateVersion = "25.11";
}
