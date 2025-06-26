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
     disko.url = "github:nix-community/disko";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nur,
    nvf,
    disko,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [nur.overlay];
    };
  in {
    packages."x86_64-linux".default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
      }).neovim;
    nixosConfigurations.bobrowniki = nixpkgs.lib.nixosSystem {
      inherit system pkgs;
      specialArgs = {inherit inputs;};
      modules = [
        ./nvim/nvim.nix
	./dysk/dysk.nix
        disko.nixosModules.disko
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.bober = import ./home/bober/home.nix {inherit pkgs inputs;};
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
