{ config, pkgs, inputs, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = true;

      font_family = "JetBrainsMono Nerd Font";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font= "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";

      font_size = 8;
    };
  };
}
