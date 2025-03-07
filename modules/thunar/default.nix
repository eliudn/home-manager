{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    module.app.thunar.enable = lib.mkEnableOption "thunar";
  };

  config = lib.mkIf config.module.app.thunar.enable {
    home.packages = with pkgs.xfce; [
      thunar
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];

    # programs.thunar = {
    #   enable = true;
    #   plugins = with pkgs.xfce; [
    #     thunar-archive-plugin
    #     thunar-volman
    #   ];
    # };

  };
}
