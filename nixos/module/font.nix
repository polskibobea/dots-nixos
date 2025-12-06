{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.lilex
    nerd-fonts.fira-code 
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    jetbrains-mono
    font-awesome
  ];
fonts.fontconfig.defaultFonts = {
sansSerif = [ "Lilex Nerd Font" ];
    serif = [ "Lilex Nerd Font" ];
    monospace = [ "Fira Code Nerd Font" ];
    emoji = [ "Noto Color Emoji" ];
};
}
