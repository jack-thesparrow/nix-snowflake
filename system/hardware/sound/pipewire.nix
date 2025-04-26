{ config, pkgs, lib, ... }:
{
  options = {
    snowflake.pipewire.enable = lib.mkEnableOption "Enable sound using PipeWire";
  };

  config = lib.mkIf
  config.snowflake.pipewire.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    #sound.enable = true;
    environment .systemPackages = with pkgs; [
      pavucontrol
      wireplumber
      helvum
    ];
  };
}
