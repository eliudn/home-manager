{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  # cfg = config.modules.firefox;
  ministheticTheme = import ./theme_miniSthetic_firefox.nix { inherit pkgs; };
  potato-theme = import ./theme_potatofox.nix { inherit pkgs; };
  profiles = "leunamzx";
in
{
  # config = mkIf cfg.enable {
  # home.file = {
  #   ".mozilla/firefox/leunamzx/chrome"={
  #     source = "${ministheticTheme}";
  #     recursive = true;
  #   };
  # };
  programs.firefox = {
    enable = true;

    profiles.${profiles} = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        darkreader
        tridactyl
        youtube-shorts-block
        simple-translate
        to-google-translate

        # potato-theme
        sidebery
        userchrome-toggle-extended
        firefox-color
      ];

      settings = {
        # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # "sidebar.verticalTab" = true;
        # "sidebar.verticalTabs" = true;
        # "sidebar.revamp" = true;

        # potato-theme
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.has-selector.enabled" = true;
        "browser.urlbar.suggest.calculator" = true;
        "browser.urlbar.unitConversion.enabled" = true;
        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.trimURLs" = true;
        "browser.profiles.enabled" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "browser.compactmode.show" = true;
        "widget.gtk.ignore-bogus-leave-notify" = 1;
        "browser.tabs.allow_transparent_browser" = true;
        "browser.uidensity" = 1;
        "browser.aboutConfig.showWarning" = false;

      };

      # userChrome = builtins.readFile "${ministheticTheme}/userChrome.css";
    };
  };
  # };
  home.file.".mozilla/firefox/${profiles}/chrome" = {
    source = "${potato-theme}/chrome";
    recursive = true;
  };
  # home.file.".mozilla/firefox/${profiles}" = {
  #     source = "${potato-theme}/user.js";
  #     recursive = true;
  # };
}
