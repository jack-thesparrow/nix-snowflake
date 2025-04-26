{config, pkgs, lib,...}:
{
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-120b.psf.gz";
    packages = with pkgs; [
      terminus_font
      kbd
    ];
  };
}
