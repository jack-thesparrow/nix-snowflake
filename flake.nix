{

  description = "My first flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    cachy-kernel.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    cachy-kernel.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {self, nixpkgs, home-manager, cachy-kernel, ... }:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Overlay for cachy-kernel
    overlays = [
      (final: prev: {
        linuxPackages = cachy-kernel.packages.${system}.linuxPackages_cachyos;
      })
    ];
    pkgsWithOverlay = import nixpkgs {
      inherit system overlays;
    };

  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/personal/configuration.nix
          ./profiles/personal/modules/kernel/cachy-kernel.nix
        ];
      };
    };
    homeConfigurations = {
      rahul = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
	modules = [./profiles/personal/home.nix];
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

