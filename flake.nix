{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem.url = "github:feel-co/hjem";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nur,
    hjem,
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
        hjem.nixosModules.default
        ./home/hjem.nix
        nvf.nixosModules.default 
        ./nixos/configuration.nix
          spicetify-nix.nixosModules.spicetify
        home-manager.nixosModules.home-manager
         {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.bober = import ./home-manager/home.nix
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
