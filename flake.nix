{

  description = "My first flake!";

  inputs = {
<<<<<<< HEAD
    nixpkgs.url = "nixpkgs/nixos-unstable";
=======
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
>>>>>>> 3b09405 (Rebuilt from scratch)
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {self, nixpkgs, home-manager, ... }:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
<<<<<<< HEAD
        modules = [./configuration.nix];
=======
        modules = [./profiles/personal/configuration.nix];
>>>>>>> 3b09405 (Rebuilt from scratch)
      };
    };
    homeConfigurations = {
      rahul = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
<<<<<<< HEAD
	modules = [./home.nix];
=======
	modules = [./profiles/personal/home.nix];
>>>>>>> 3b09405 (Rebuilt from scratch)
      };			
    };
    devShells = {
      ${system} = {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.gcc
            pkgs.clang
            pkgs.dialog
            pkgs.ncurses
          ];
        };
      };
    };
  };
}

