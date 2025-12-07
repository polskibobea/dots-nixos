{pkgs, lib, ...}:
{
 hjem.users.bober = {
user = "bober";
directory = "/home/bober";
#clobberFiles = {
#"$HOME/dokumenty";
#};
 };
 imports = [
./module
 ];
}

