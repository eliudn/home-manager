{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    module.apps.docker.enable = lib.mkEnableOption "docker";
  };

  config = lib.mkIf config.module.apps.docker.enable {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    users.users.leunamz.extraGroups = ["docker"];
  };
}
