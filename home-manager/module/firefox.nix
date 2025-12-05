{pkgs, ...}:
{
  programs.firefox = {
    enable = true;
    profiles.default.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
    ];
  };
}
