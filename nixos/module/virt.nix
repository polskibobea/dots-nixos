{...}:
{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["bober"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
