{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "leunamz";
  home.homeDirectory = "/home/leunamz";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  nixpkgs.config.allowUnsupportedSystem = true;

  imports = [
    ../../modules/default.nix
  ];

  module.app = {
    rofi.enable = true;
    zsh.enable = true;
  };
  # users.users.leunamz = {
  #   shell = pkgs.zsh;
  # };

  home.packages = with pkgs; [
    teams-for-linux
    discord
    xorg.xrandr
    arandr
  ];

  # services.autorandr.enable = true;

  # programs.autorandr.enable = true;
  home.file = {
    ".config/awesome" = {
      source = ../../config/awesome;
      recursive = true;
    };
  };
  home.sessionVariables =
    {
    };

  programs.home-manager.enable = true;
}
