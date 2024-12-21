{pkgs,config, lib, ... }:
{
  options = {module.app.apps.enable = lib.mkEnableOption "apps";};
  config = lib.mkIf config.module.app.apps.enable {
    home.packages = with pkgs;[
      bat
      insomnia
      jetbrains.datagrip
    ];
  };
}
