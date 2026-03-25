{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem.url = "github:feel-co/hjem";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    nixpkgs,
    hjem,
    spicetify-nix,
    nvf,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      commonModules = [
        nvf.nixosModules.default
        hjem.nixosModules.default
        ./common
      ];
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        specialArgs = {inherit inputs;};
        modules = commonModules ++ [
          ./hosts/laptop/configuration.nix
          spicetify-nix.nixosModules.spicetify
        ];
      };
      raspberry = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "aarch64-linux";
          config.allowUnfree = true;
        };
        specialArgs = {inherit inputs;};
        modules = commonModules ++ [
            "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ./hosts/raspberry/configuration.nix
            inputs.nixos-hardware.nixosModules.raspberry-pi-4
        ];
      };
    };
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
