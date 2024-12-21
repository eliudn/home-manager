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

    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        # envExtra = ''
        #   export SOMEZSHVARIABLE="something"
        # '';

        shellAliases = {
          nvim = "nix run ~/.config/nix_config/nvim/nix-nvim/";
          cat = "bat";
          sail = "./vendor/bin/sail";
        };
      };

      starship = {
        enable = true;
        settings = {

        };
      };
    };
  };
}
