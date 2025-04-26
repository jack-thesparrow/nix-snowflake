{ config, pkgs, inputs, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = true;

      font_family = "JetBrainsMono Nerd Font Mono";
      bold_font = "JetBrainsMono Nerd Font Mono Extra Bold";
      italic_font= "JetBrainsMono Nerd Font Mono Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Mono Extra Bold Italic";

      font_size = 8;
    };
  };
}
