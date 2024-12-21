{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    module.app.mysql.enable = lib.mkEnableOption "mysql";
  };

  config = lib.mkIf config.module.app.mysql.enable {
    services.mysql = {
      enable = true;
      packege = pkgs.mariadb;
    };

    initialScript = ''
      CREATE USER 'lucas'@'localhost' IDENTIFIED BY 'password';
      GRANT ALL PRIVILEGES ON *.* TO 'lucas@'localhost';
      FLUSH PRIVILEGES;
      '';
  };
}
