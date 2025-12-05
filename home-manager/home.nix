{pkgs, ...}:
{
  home = {
    username = "bober";
    homeDirectory = "/home/bober";
    stateVersion = "25.05";
  };

  imports = [
    ./module
  ];
}
