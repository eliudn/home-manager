{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    module.app.brave.enable = lib.mkEnableOption "brave";

  };
  config = lib.mkIf config.module.app.brave.enable {
    home.packages = with pkgs; [ brave ];
  };
}
