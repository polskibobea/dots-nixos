{pkgs, ...}:
{
  hjem.users.bober = {
    packages = [pkgs.firefox];
  
  files = {
  ".mozilla/firefox/profiles.ini".text = ''
    [General]
    StartWithLastProfile=1

    [Profile0]
    Name=bober
    IsRelative=1
    Path=default
    Default=1
  '';
  ".mozilla/firefox/bober/user.js".text = ''
    user_pref("browser.startup.homepage", "https://google.pl");
  '';
  };
  };
}
