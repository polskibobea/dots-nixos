{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nur,
    spicetify-nix,
    nvf,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [nur.overlays.default];
    };
  in {
    nixosConfigurations.bobrowniki = nixpkgs.lib.nixosSystem {
      inherit system pkgs;
      specialArgs = {inherit inputs;};
      modules = [
        nvf.nixosModules.default
        ./nvim/nvim.nix
        ./service/default.nix
        ./programFiles/default.nix
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.bober = import ./home/bober/home.nix
            {inherit system pkgs inputs;};
            extraSpecialArgs = {
              inherit inputs;
              inherit (inputs) nur;
            };
          };
        }
      ];
    };
    formatter.${system} = pkgs.alejandra;
  };
}
