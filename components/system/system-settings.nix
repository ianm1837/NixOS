{
  config,
  pkgs,
  ...
}: {
  system.stateVersion = "23.11"; #no touch

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  networking.wireguard.enable = true;

  services.blueman.enable = true;
  services.passSecretService.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "America/Los_Angeles";

  # theme
  environment.systemPackages = with pkgs; [
    adwaita-qt
  ];

  environment.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita-dark";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
}
