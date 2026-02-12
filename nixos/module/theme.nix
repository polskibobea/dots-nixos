{ config, pkgs, lib, ... }:
{
   environment.systemPackages = with pkgs; [
    (catppuccin-gtk.override { accents = ["mauve"]; variant = "mocha"; })
    (catppuccin-kvantum.override { accent = "mauve"; variant = "mocha"; })
        catppuccin-papirus-folders
    libsForQt5.qt5ct
    qt6Packages.qt6ct
  ];
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };
   environment.pathsToLink = [ "/share/Kvantum" ];
   hjem.users.bober.files = {
    # GTK 3
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=catppuccin-mocha-mauve-standard
      gtk-application-prefer-dark-theme=1
    '';

    # GTK 4
    ".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=catppuccin-mocha-mauve-standard
      gtk-application-prefer-dark-theme=1
    '';

    # Kvantum config
    ".config/Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-mocha-mauve
    '';

    # Katalog z motywem Kvantum
    #".config/Kvantum/Catppuccin-Mocha-Mauve".source = 
      #    "${pkgs.catppuccin-kvantum}/share/Kvantum/catppuccin-mocha-mauve";

    # Qt5ct
    ".config/qt5ct/qt5ct.conf".text = ''
      [Appearance]
      style=kvantum
      
      [Interface]
      stylesheets=@Invalid()
    '';
  }; 
 }
