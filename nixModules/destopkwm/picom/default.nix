{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    module.desktop.picom.enable = lib.mkEnableOption "picom";
  };

  config = lib.mkIf config.module.desktop.picom.enable {
    services.picom = {
      enable = true;
      vSync = true;
    };
  };
}
