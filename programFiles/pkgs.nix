{pkgs, ...}: {
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
    jetbrains-mono
    font-awesome
  ];
}
