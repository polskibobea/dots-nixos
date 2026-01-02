{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./package.nix
    ./module
    ./hjem.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  boot.zfs.devNodes = "/dev/disk/by-partuuid";
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
  services.upower.enable = true;
  services.dbus.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    gnome-themes-extra
    adwaita-icon-theme
    glib
    gsettings-desktop-schemas
    dconf 
  ];#tymczasowe
  services.gvfs.enable = true;
  qt = {
    enable = true;
    platformTheme = "gnome"; # Integruje QT z ustawieniami GNOME/GTK
    style = "adwaita-dark";
  };
  environment.variables = {
    GTK_THEME = "Adwaita-dark";
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };
  programs.dconf.enable = true;
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "Adwaita-dark";
          icon-theme = "Adwaita";
        };
      };
    }
  ];


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
