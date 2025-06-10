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
    shellAliases = {
      cd1 = "cd ..";
      form = "nix fmt";
      nv = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake ~/dots-nixos";
    };
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
  programs.spotify-player.enable = true;
}
