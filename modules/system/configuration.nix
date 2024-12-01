{ config, pkgs, ... }:

{
  imports = [

    ../../nixModules
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.xserver.enable = true;

  services.xserver.displayManager.sessionCommands = ''
    xrandr --output DVI-D-1 --primary --mode 1680x1050 --pos 1920x15 --rotate normal \
           --output HDMI-1 --off \
           --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal
  '';
  services.displayManager.sddm.enable = true;
  module.desktop.awesome.enable = true;

  module.desktop.picom.enable = true;
  # services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "latam";
    variant = "deadtilde";
  };
  console.keyMap = "la-latin1";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.leunamz = {
    isNormalUser = true;
    description = "leunamz";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [
      # kdePackages.kate
      #  thunderbird
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
