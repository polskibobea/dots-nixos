_: {
  home = {
    username = "bober";
    homeDirectory = "/home/bober";
    stateVersion = "25.11";
  };

programs.neovim = {
  enable = true;
 };




programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  oh-my-zsh.theme = "bira";
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  history.size = 10000;
};
}
