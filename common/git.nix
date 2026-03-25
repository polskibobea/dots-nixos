{ config, pkgs, ... }:

{
  programs.git = {
  enable = true;
  config = {
    user = {
      name = "bober";
      email = "lubiebobea@gmail.com";
    };
    core = {
      editor = "nvim";
    };
    init = {
      defaultBranch = "main";
    };
    pull = {
      rebase = false;
    };
  };
  };
}
