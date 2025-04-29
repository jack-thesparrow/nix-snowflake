# wayland-protocols-overlay.nix
self: super:

{
  waylandProtocolsCustom = super.stdenv.mkDerivation rec {
    pname = "wayland-protocols";
    version = "1.43";

    src = self.fetchurl {
      url = "https://ftp2.osuosl.org/pub/blfs/conglomeration/wayland-protocols/wayland-protocols-1.43.tar.xz";
      sha256 = "ba3c3425dd27c57b5291e93dba97be12479601e00bcab24d26471948cb643653"; # Your sha256 hash here
    };

    nativeBuildInputs = [ super.pkg-config ];

    meta = with super.meta; {
      description = "Wayland Protocols";
      license = licenses.mit;
    };
  };
}

