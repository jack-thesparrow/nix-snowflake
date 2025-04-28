{

  description = "SnowflakeConfig";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    chaotic.inputs.nixpkgs.follows = "nixpkgs";
    # Hyprland from stream
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = {self, nixpkgs, home-manager, chaotic, hyprland, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    username = "rahul";
  
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/personal/configuration.nix
          chaotic.nixosModules.default
          ./system/wm/hyprland.nix
        ];
        specialArgs = {
          inherit chaotic;
          inherit hyprland;
          inherit username;
        };
      };
    };
    homeConfigurations = {
      rahul = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/personal/home.nix
          ./user/wm/wmDefault.nix
        ];
        extraSpecialArgs = {
          inherit username;
        };
      };			
    };

    devShells = {
      ${system} = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            #gcc
            #clang
            dialog
            ncurses
          ];
        };
      };
    };
  };
}

