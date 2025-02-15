{
  lib,
  config,
  pkgs,
}:
{
  options = {
    module.app.thunar.enable = lib.mkEnableOption "brave";

  };
  config = lib.mkif config.module.app.enable {
    home.packages = with pkgs; [ brave ];
  };
}
