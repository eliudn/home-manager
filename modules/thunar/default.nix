{pkgs, config, lib,...}:
{
   options = {
    module.app.thunar.enable = lib.mkEnableOption "thunar";
  };

  config = lib.mkIf config.module.app.thunar.enable {
    programs.thunar = {
      enable =true;
      plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
    };

  };
}
