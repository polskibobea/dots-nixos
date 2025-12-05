{pkgs, ...}:
{

fonts.fontconfig.enable = true;

programs.alacritty = {
    enable = true;
    settings = {
    #font = {
    #normal = "Lilex";
    #};
      shell = {
        program = "/etc/profiles/per-user/bober/bin/zsh";
        args = ["-l"];
      };
      window = {
        opacity = 0.95;
        blur = true;
      };
    };
  };
}
