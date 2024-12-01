{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    module.app.zsh.enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf config.module.app.zsh.enable {

    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      # envExtra = ''
      #   export SOMEZSHVARIABLE="something"
      # '';
    };
    programs.starship = {
      enable = true;
      settings = {

      };
    };
    # home.shell = "zsh";
  };
}
