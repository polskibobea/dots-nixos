{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.lilex
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    jetbrains-mono
    font-awesome
  ];
}
