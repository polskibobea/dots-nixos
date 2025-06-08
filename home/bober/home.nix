{ config, pkgs, ... }:

{
  home.username = "bober";
  home.homeDirectory = "/home/bober";

  programs.zsh.enable = true;
}
