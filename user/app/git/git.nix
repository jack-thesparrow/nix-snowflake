{config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "jack-thesparrow";
    userEmail = "rahultudu4705@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
