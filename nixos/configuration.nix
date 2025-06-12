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
    orca.enable = false;
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
  programs.hyprland.withUWSM = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["bober"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;


  programs.hyprland.enable = true;
  users.users.bober = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  hardware.opengl = {
    enable = true;
  };

  programs.firefox.enable = true;
  nix.settings.experimental-features = ["flakes" "nix-command"];
  environment.systemPackages = with pkgs; [
    (discord.override {withVencord = true;})
    git
    fastfetch
    vulkan-tools
    pavucontrol
    spotify
    unzip
    qemu
    hyprshot
    python3
    bluetui
    blueman
    gamescope
    vulkan-loader
    hyperfine
    usbutils
    vim
    wget
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    mesa
    jetbrains-mono
    font-awesome
  ];
  nix.settings.auto-optimise-store = true;
  boot.loader.systemd-boot.configurationLimit = 5; # lub boot.loader.grub.configurationLimit
  i18n.defaultLocale = "pl_PL.UTF-8";

  system.stateVersion = "25.11";
}
