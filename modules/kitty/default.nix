{
pkgs,
inputs,
config,
lib,
...
}:
with lib;
let

in
  {
  home.packages = with pkgs; [
    kitty
    nerdfonts
  ];

  programs.kitty = mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 5;
      background_opacity = "0.9";
      # background_blur = 8;
      symbol_map =
        let
          mappings = [
            "U+23FB-U+23FE"
            "U+2B58"
            "U+E200-U+E2A9"
            "U+E0A0-U+E0A3"
            "U+E0B0-U+E0BF"
            "U+E0C0-U+E0C8"
            "U+E0CC-U+E0CF"
            "U+E0D0-U+E0D2"
            "U+E0D4"
            "U+E700-U+E7C5"
            "U+F000-U+F2E0"
            "U+2665"
            "U+26A1"
            "U+F400-U+F4A8"
            "U+F67C"
            "U+E000-U+E00A"
            "U+F300-U+F313"
            "U+E5FA-U+E62B"
          ];
        in
          (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";

      background = "#193145";
      foreground = "#a6a6a6";
      selection_background = "#a6a6a6";
      selection_foreground = "#193145";
      url_color = "#7f8992";
      cursor = "#a6a6a6";
      cursor_text_color = "#193145";
      active_border_color = "#5e707f";
      inactive_border_color = "#2b4458";
      active_tab_background = "#193145";
      active_tab_foreground = "#a6a6a6";
      inactive_tab_background = "#2b4458";
      inactive_tab_foreground = "#7f8992";
      tab_bar_background = "#2b4458";
      wayland_titlebar_color = "#193145";
      macos_titlebar_color = "#193145";
      # normal;
      color0 = "#193145";
      color1 = "#df676a";
      color2 = "#66ff66";
      color3 = "#ffff66";
      color4 = "#16d2ce";
      color5 = "#a277e3";
      color6 = "#379d80";
      color7 = "#a6a6a6";
      # bright;
      color8 = "#5e707f";
      color9 = "#df676a";
      color10 = "#66ff66";
      color11 = "#ffff66";
      color12 = "#16d2ce";
      color13 = "#a277e3";
      color14 = "#379d80";
      color15 = "#ffffff";
      # extended base16 colors;
      color16 = "#ff9966";
      color17 = "#dd5bb9";
      color18 = "#2b4458";
      color19 = "#43596c";
      color20 = "#7f8992";
      color21 = "#d2d2d2";
    };
    # themeFile ="Dracula";
    # Base16 Eva Darken - kitty color config
    # Scheme by kjakapat (https://github.com/kjakapat)
  };
}
