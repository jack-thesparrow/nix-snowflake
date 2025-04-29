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
    stylix.url = "github:danth/stylix";
  };
  outputs = {self, nixpkgs, home-manager, chaotic, hyprland, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    username = "rahul";
    waylandProtocolsCustom = pkgs.stdenv.mkDerivation rec {
      pname = "wayland-protocols";
      version = "1.43";

      src = pkgs.fetchurl {
        url = "https://ftp2.osuosl.org/pub/blfs/conglomeration/wayland-protocols/wayland-protocols-1.43.tar.xz";
        sha256 = "ba3c3425dd27c57b5291e93dba97be12479601e00bcab24d26471948cb643653";  # Replace with actual sha256
      };

      nativeBuildInputs = [ pkgs.pkg-config ];

      meta = with pkgs.lib; {
        description = "Wayland Protocols";
        license = licenses.mit;
      };
      # Custom install phase
      installPhase = ''
        mkdir -p $out/include/wayland-protocols
        cp -r * $out/include/wayland-protocols/
      '';
    };  
  in {
    packages.x86_64-linux.waylandProtocolsCustom = waylandProtocolsCustom;
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/personal/configuration.nix
          chaotic.nixosModules.default
          ./system/wm/hyprland.nix
          inputs.stylix.nixosModules.stylix
        ];
        specialArgs = {
          inherit chaotic;
          inherit hyprland;
          inherit username;
          inherit waylandProtocolsCustom;
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
          environment.systemPackages = [ waylandProtocolsCustom ];
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

