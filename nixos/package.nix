{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (discord.override {withVencord = true;})
    mangohud
    fastfetch
    exfatprogs
    inter
    veracrypt
    wl-clipboard
    cliphist
    nix-tree
    nix-tree
    vulkan-tools
    pavucontrol
    blueman
    unzip
    qemu
    kdePackages.dolphin
    gamescope
    hyprshot
    hyprpaper
    python3
    icloudpd
    python3Packages.pip
    ifuse
    libimobiledevice
    easyeffects
    prismlauncher
    heroic
    bluetui
    blueman
    vulkan-loader
    hyperfine
    btop
    htop
    usbutils
    wget
    auto-epp
    linuxKernel.packages.linux_zen.cpupower
    xdg-desktop-portal
    brightnessctl
    xdg-desktop-portal-wlr
    mesa

  ];
}
