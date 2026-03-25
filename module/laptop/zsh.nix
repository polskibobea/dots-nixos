{pkgs, ...}:
{
environment.systemPackages = with pkgs; [
    fastfetch
    exfatprogs
    unzip 
    btop
    htop
    usbutils
    brightnessctl
    nix-tree
  ];
programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };

    histSize = 1000;
    histFile = "$HOME/.zsh-history";
     setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "bira";
    };
  };
}


