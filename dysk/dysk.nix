{
  disko.devices = {
    disk = {
      dyskus = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            cryptroot = {
              size = "50GiB";
              content = {
                type = "luks";
                name = "root";
                luks = {};
                inner = {
                  type = "filesystem";
                  format = "xfs";
                  mountpoint = "/";
                };
              };
            };
            crypthome = {
              size = "100%";
              content = {
                type = "luks";
                name = "home";
                luks = {};
                inner = {
                  type = "filesystem";
                  format = "xfs";
                  mountpoint = "/home";
                };
              };
            };
          };
        };
      };
    };
  };
}

