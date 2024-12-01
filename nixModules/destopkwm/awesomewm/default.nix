{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    module.desktop.awesome.enable = lib.mkEnableOption "awesome";
  };

  config = lib.mkIf config.module.desktop.awesome.enable {
    services.xserver.windowManager.awesome = {
      enable = true;
      # package = pkgs.awesome-git;
    };

  };

}
