{

  description = "My first flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    chaotic.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {self, nixpkgs, home-manager, chaotic, ... }:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  
    # Overlays to use the Cachy Kernel
   # overlays = [
   #   (final: prev: {
   #     linuxPackages = chaotic.packages.${system}.linuxPackages_cachyos;
   #   })
   # ];
   # pkgsWithOverlay = import nixpkgs {
   #   inherit system overlays;
   # };
      
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/personal/configuration.nix
          chaotic.nixosModules.default
          #./profiles/personal/modules/kernel/cachy-kernel.nix
        ];
        #boot.kernelPackages = chaotic.packages.${system}.linuxPackages_cachyos;
      };
    };
    homeConfigurations = {
      rahul = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        #inherit pkgsWithOverlay;
        modules = [
          ./profiles/personal/home.nix
        ];
      };			
    };
    devShells = {
      ${system} = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gcc
            clang
            dialog
            ncurses
          ];
        };
      };
    };
  };
}

