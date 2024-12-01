{pkgs,config, lib, ... }:
{
  options = {module.app.apps.enable = lib.mkEnableOption "apps";};
  config = lib.mkIf config.module.app.apps.enable {
    home.packages = [
      pkgs.bat
    ];
  };
}
