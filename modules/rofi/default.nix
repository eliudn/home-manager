{pkgs, config, lib,...}:
{
   options = {
    module.app.rofi.enable = lib.mkEnableOption "rofi";
  };

  config = lib.mkIf config.module.app.rofi.enable {
    home.packages = [
      pkgs.rofi
    ];
  };
}
