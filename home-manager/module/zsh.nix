{pkgs, ...}:
{
 programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      cd1 = "cd ..";
      form = "nix fmt";
      nv = "nvim";
      rebuild = "rm ~/.config/alacritty/alacritty.toml && sudo nixos-rebuild switch --flake ~/dots-nixos && alacritty migrate";
    };
  };
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "bira";
    plugins = ["git" "sudo"];
  };
}
