{inputs, pkgs, config, ... }:
{
  imports = [
    ./firefox
    ./kitty
    ./git
    ./zsh
    ./rofi
    ./apps
    ./docker
  ];
}
