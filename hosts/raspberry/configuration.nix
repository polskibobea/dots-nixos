{pkgs,lib, ...}: {
  imports = [ 
    ./hardware.nix
    #    ./hardware-configuration.nix # To musi tu być, wygeneruj na malinie!
  ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_rpi4;

  

  #  boot.initrd.includeDefaultModules = lib.mkForce false;

  # 2. Czyścimy listę modułów, które Nix chce tam wrzucić "z automatu"
  #boot.initrd.kernelModules = lib.mkForce [ ];

  # 3. Podajemy TYLKO to, co fizycznie istnieje i jest niezbędne do startu
  # "mmc_block" zazwyczaj wystarcza, żeby Malinka widziała partycję /
  #boot.initrd.availableKernelModules = lib.mkForce [ "mmc_block" ];

  # 4. Wyłączamy mechanizm "skracania" (shrinking), który wywala błędy FATAL
  # Jeśli ta opcja też by nie istniała, po prostu ją usuń, 
  # ale punkty 1-3 powinny wystarczyć.
  # boot.initrd.services.udev.binPackages = [ pkgs.udev ]; # Czasami pomaga



  networking = {
    hostName = "raspberry"; 
    networkmanager.enable = true;
  };
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "pl_PL.UTF-8";
  
  # Wrzucasz to do sekcji 'nixpkgs.overlays' lub bezpośrednio do modułów
  nixpkgs.overlays = [
    (final: prev: {
      # Wyłączamy ZFS dla ARM, żeby Nix przestał go kompilować
      zfs = prev.zfs.overrideAttrs (_: { 
        meta.platforms = []; 
      });
    })
  ];

  # Wymuś, żeby jądro nie ładowało ZFS
  boot.supportedFilesystems = lib.mkForce [ "vfat" "ext4" ];

  hardware.bluetooth.enable = true;
  users.users.bober = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDJqEmSKw6YeE5gnJM/GM9cxnVO/q14ms8FaNsaDix0U bober@laptop"
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

   
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "24.11";
  nixpkgs.hostPlatform = "aarch64-linux";
}
