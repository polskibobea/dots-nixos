_: {
  home = {
    username = "bober";
    homeDirectory = "/home/bober";
    stateVersion = "25.11";
  };

  programs.alacritty = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "bira";
    plugins = ["git" "sudo"];
  };

  programs.htop.enable = true;

  nix.gc = {
    automatic = true;
    frequency = "weekly";
  };
}
