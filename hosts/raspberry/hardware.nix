{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  #   fileSystems."/" =
  # { device = "/dev/disk/by-uuid/f0abac56-08be-42e2-8726-9baa083e8685";
  #    fsType = "ext4";
  # };
  
  # fileSystems."/boot/firmware" =
  # { device = "/dev/disk/by-uuid/1C94-4EC3";
  #   fsType = "vfat";
  #   options = [ "fmask=0022" "dmask=0022" ];
  # };

  swapDevices = [ ];

  nixpkgs.hostPlatform = "aarch64-linux";
}
