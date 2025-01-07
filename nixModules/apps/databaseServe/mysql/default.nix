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
      package = pkgs.mariadb;
      # initialScript = ./script/mysql-init.sql;
      # initialRootPassword = "password";
      settings = {
        mysqld = {
          # innodb_buffer_pool_size = "2G";
          max_connections = 500;
          # character-set-server = "utf8mb4";
          # collation-server = "utf8mb4_unicode_ci";
          bind-address = "0.0.0.0"; # Escucha en todas las interfaces (con precaución en entornos de producción)
        };
      };
      dataDir = "/var/lib/mysql"; # Asegúrate de que este directorio tenga los permisos correctos
      # bindAddress = "0.0.0.0"; 
    };

  };
}
