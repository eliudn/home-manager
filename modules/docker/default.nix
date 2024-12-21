{pkgs, config, lib, ... }:
{
  options = {
    module.app.docker.enable = lib.mkEnableOption "docker";
  };

  config  = lib.mkIf config.module.app.docker.enable {
    # virtualisation.docker = {
    #   enable = true;
    # };
    home.packages = [
      pkgs.docker
    ];
  };
}
